#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"
REFERENCE_DIR="$SKILL_DIR/reference"

OPENAPI_INDEX="https://developers.ampeco.com/openapi/"

echo "=== AMPECO Public API Documentation Generator ==="
echo ""

# Check dependencies
command -v curl >/dev/null 2>&1 || { echo "Error: curl is required"; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "Error: jq is required. Install with: brew install jq"; exit 1; }

echo "Fetching AMPECO Public API spec..."

# 1. Get latest spec ID from index page (versions listed oldest→newest, so use tail -1)
SPEC_ID=$(curl -s "$OPENAPI_INDEX" | grep -oE 'href="/openapi/[a-f0-9]+"' | tail -1 | grep -oE '[a-f0-9]{24}')

if [ -z "$SPEC_ID" ]; then
    echo "Error: Could not find latest spec ID"
    exit 1
fi

echo "Found latest spec ID: $SPEC_ID"

# 2. Fetch OpenAPI JSON
SPEC_URL="https://developers.ampeco.com/openapi/$SPEC_ID"
SPEC_JSON=$(curl -s "$SPEC_URL")

# 3. Extract and verify API version
API_VERSION=$(echo "$SPEC_JSON" | jq -r '.info.version')
if [ -z "$API_VERSION" ] || [ "$API_VERSION" = "null" ]; then
    echo "Error: Could not extract API version from spec"
    exit 1
fi
echo "API Version: $API_VERSION"

# 4. Ensure output directories exist
mkdir -p "$REFERENCE_DIR"

# ============================================
# Generate endpoints-index.md
# ============================================
echo "Generating endpoints-index.md..."

cat > "$REFERENCE_DIR/endpoints-index.md" << 'HEADER'
# Public API Endpoints Index

HEADER

echo "Auto-generated from AMPECO Public API spec v$API_VERSION" >> "$REFERENCE_DIR/endpoints-index.md"
echo "" >> "$REFERENCE_DIR/endpoints-index.md"

ENDPOINT_COUNT=$(echo "$SPEC_JSON" | jq '[.paths | to_entries[] | .value | keys[] | select(test("get|post|put|patch|delete"))] | length')
echo "**Total Endpoints**: $ENDPOINT_COUNT" >> "$REFERENCE_DIR/endpoints-index.md"
echo "" >> "$REFERENCE_DIR/endpoints-index.md"
echo "---" >> "$REFERENCE_DIR/endpoints-index.md"
echo "" >> "$REFERENCE_DIR/endpoints-index.md"

# Generate endpoints grouped by tag
echo "$SPEC_JSON" | jq -r '
  [.paths | to_entries[] |
   .key as $path |
   .value | to_entries[] |
   select(.key | test("get|post|put|patch|delete")) |
   {
     path: $path,
     method: (.key | ascii_upcase),
     summary: (.value.summary // ""),
     tag: ((.value.tags // ["Other"])[0]),
     deprecated: (.value.deprecated // false)
   }
  ] |
  group_by(.tag) |
  .[] |
  "## " + .[0].tag + "\n\n| Method | Path | Summary | Deprecated |\n|--------|------|---------|------------|\n" +
  ([.[] | "| " + .method + " | `" + .path + "` | " + .summary + " | " + (if .deprecated then "Yes" else "No" end) + " |"] | join("\n")) +
  "\n"
' >> "$REFERENCE_DIR/endpoints-index.md"

# ============================================
# Generate schemas-index.md
# ============================================
echo "Generating schemas-index.md..."

cat > "$REFERENCE_DIR/schemas-index.md" << 'HEADER'
# Schema Reference Index

HEADER

echo "Auto-generated from AMPECO Public API spec v$API_VERSION" >> "$REFERENCE_DIR/schemas-index.md"
echo "" >> "$REFERENCE_DIR/schemas-index.md"

SCHEMA_COUNT=$(echo "$SPEC_JSON" | jq '.components.schemas | keys | length')
echo "**Total Schemas**: $SCHEMA_COUNT" >> "$REFERENCE_DIR/schemas-index.md"
echo "" >> "$REFERENCE_DIR/schemas-index.md"
echo "---" >> "$REFERENCE_DIR/schemas-index.md"
echo "" >> "$REFERENCE_DIR/schemas-index.md"

echo "$SPEC_JSON" | jq -r '
  .components.schemas | to_entries[] |
  "## " + .key + "\n\n" +
  "**Type**: " + (.value.type // "object") + "\n\n" +
  (if (.value.properties // null) != null and ((.value.properties | keys | length) > 0) then
    "**Properties**: " + ([.value.properties | keys[]] | join(", ")) + "\n\n"
  else "" end) +
  (if (.value.required // null) != null and ((.value.required | length) > 0) then
    "**Required**: " + (.value.required | join(", ")) + "\n\n"
  else "" end) +
  "---\n"
' >> "$REFERENCE_DIR/schemas-index.md"

# ============================================
# Generate deprecation-map.md
# ============================================
echo "Generating deprecation-map.md..."

cat > "$REFERENCE_DIR/deprecation-map.md" << 'HEADER'
# Deprecation Map

HEADER

echo "Auto-generated from AMPECO Public API spec v$API_VERSION" >> "$REFERENCE_DIR/deprecation-map.md"
echo "" >> "$REFERENCE_DIR/deprecation-map.md"

DEPRECATED_COUNT=$(echo "$SPEC_JSON" | jq '[.paths | to_entries[] | .key as $path | .value | to_entries[] | select(.key | test("get|post|put|patch|delete")) | select(.value.deprecated == true)] | length')
echo "**Total Deprecated Endpoints**: $DEPRECATED_COUNT" >> "$REFERENCE_DIR/deprecation-map.md"
echo "" >> "$REFERENCE_DIR/deprecation-map.md"

if [ "$DEPRECATED_COUNT" -gt 0 ]; then
    echo "| Method | Deprecated Endpoint |" >> "$REFERENCE_DIR/deprecation-map.md"
    echo "|--------|---------------------|" >> "$REFERENCE_DIR/deprecation-map.md"
    echo "$SPEC_JSON" | jq -r '
      .paths | to_entries[] |
      .key as $path |
      .value | to_entries[] |
      select(.key | test("get|post|put|patch|delete")) |
      select(.value.deprecated == true) |
      "| " + (.key | ascii_upcase) + " | `" + $path + "` |"
    ' >> "$REFERENCE_DIR/deprecation-map.md"
else
    echo "No deprecated endpoints found." >> "$REFERENCE_DIR/deprecation-map.md"
fi

# ============================================
# Update SKILL.md quick index
# ============================================
echo "Updating SKILL.md quick index..."

SKILL_MD="$SKILL_DIR/SKILL.md"
if [ -f "$SKILL_MD" ]; then
    # Generate quick index content
    QUICK_INDEX=$(cat << 'QUICKEOF'
## Endpoint Quick Index

| Resource | Version | Operations |
|----------|---------|------------|
QUICKEOF
)

    # Extract resources from paths and build table
    RESOURCE_TABLE=$(echo "$SPEC_JSON" | jq -r '
      [.paths | to_entries[] |
       .key as $path |
       ($path | capture("/public-api/resources/(?<resource>[^/]+)/v(?<version>[0-9.]+)") // null) as $capture |
       select($capture != null) |
       .value | to_entries[] |
       select(.key | test("get|post|put|patch|delete")) |
       {resource: $capture.resource, version: $capture.version, method: .key}
      ] |
      group_by(.resource) |
      map({
        resource: .[0].resource,
        versions: ([.[].version] | unique | sort | join(", ")),
        methods: ([.[].method] | unique | map(
          if . == "get" then "Read"
          elif . == "post" then "Create"
          elif . == "put" or . == "patch" then "Update"
          elif . == "delete" then "Delete"
          else . end
        ) | unique | join(", "))
      }) |
      sort_by(.resource) |
      .[] |
      "| **" + (.resource | split("-") | map((.[0:1] | ascii_upcase) + .[1:]) | join(" ")) + "** | v" + .versions + " | " + .methods + " |"
    ')

    # Create temporary file with the new quick index content
    TEMP_QUICK_INDEX=$(mktemp)
    cat > "$TEMP_QUICK_INDEX" << 'INDEXEOF'
<!-- BEGIN:QUICK_INDEX -->
INDEXEOF
    echo "$QUICK_INDEX" >> "$TEMP_QUICK_INDEX"
    echo "$RESOURCE_TABLE" >> "$TEMP_QUICK_INDEX"
    cat >> "$TEMP_QUICK_INDEX" << 'INDEXEOF'

*Run `bash scripts/fetch-and-generate.sh` to update this index*

**Actions**: See `reference/endpoints-index.md` for charge point, user, reservation, and notification actions.
<!-- END:QUICK_INDEX -->
INDEXEOF

    # Use awk to replace the block
    awk '
      /<!-- BEGIN:QUICK_INDEX -->/{
        found=1
        while ((getline line < "'"$TEMP_QUICK_INDEX"'") > 0) {
          print line
        }
        close("'"$TEMP_QUICK_INDEX"'")
        next
      }
      /<!-- END:QUICK_INDEX -->/{found=0; next}
      !found{print}
    ' "$SKILL_MD" > "$SKILL_MD.tmp" && mv "$SKILL_MD.tmp" "$SKILL_MD"

    rm "$TEMP_QUICK_INDEX"

    echo "Updated SKILL.md quick index"
fi

echo ""
echo "=== Generation Complete ==="
echo ""
echo "Generated files:"
echo "  - $REFERENCE_DIR/endpoints-index.md ($ENDPOINT_COUNT endpoints)"
echo "  - $REFERENCE_DIR/schemas-index.md ($SCHEMA_COUNT schemas)"
echo "  - $REFERENCE_DIR/deprecation-map.md ($DEPRECATED_COUNT deprecated)"
echo "  - Updated SKILL.md quick index"
echo ""
echo "API Version: $API_VERSION"
