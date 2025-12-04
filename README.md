# AMPECO Public API Plugin for Claude Code

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A Claude Code plugin that helps developers integrate with the [AMPECO EV Charging Platform](https://ampeco.com) Public API.

## Features

- **API Exploration**: Browse 449+ API endpoints organized by resource type
- **Schema Reference**: View request/response schemas with properties and types
- **Deprecation Tracking**: Identify deprecated endpoints and their replacements
- **Common Patterns**: Learn authentication, pagination, filtering, and error handling
- **Auto-Update**: Regenerate documentation from the latest OpenAPI spec

## Installation

```bash
claude plugin add AmpecoPlatform/claude-code-public-api-plugin
```

Or clone locally:
```bash
git clone https://github.com/AmpecoPlatform/claude-code-public-api-plugin.git
claude plugin add ./claude-code-public-api-plugin
```

## Prerequisites

The update script requires:

- **curl**: For fetching the OpenAPI spec
- **jq**: For JSON processing

Install jq:
```bash
# macOS
brew install jq

# Ubuntu/Debian
apt-get install jq

# Windows (with Chocolatey)
choco install jq
```

## Usage

Once installed, use natural language to interact with the AMPECO Public API skill:

**Example Prompts**:
- "What AMPECO API endpoints are available for charge points?"
- "How do I authenticate with the AMPECO Public API?"
- "Show me the pagination patterns for AMPECO API"
- "List all deprecated AMPECO API endpoints"
- "What schemas are available in the AMPECO API?"

The skill will automatically:
1. Suggest running the update script if docs are outdated
2. Load relevant reference files
3. Provide accurate API information

## Updating API Documentation

To fetch the latest OpenAPI spec and regenerate documentation:

```bash
cd /path/to/claude-code-public-api-plugin
bash skills/ampeco-public-api/scripts/fetch-and-generate.sh
```

This will:
- Fetch the latest spec from https://developers.ampeco.com/openapi/
- Regenerate `endpoints-index.md`, `schemas-index.md`, and `deprecation-map.md`
- Update the quick index in `SKILL.md`

## Reference Files

After running the update script, these files are available:

| File | Description |
|------|-------------|
| `reference/endpoints-index.md` | Complete list of all endpoints (449+) |
| `reference/schemas-index.md` | Schema definitions with properties |
| `reference/deprecation-map.md` | Deprecated endpoints (67+) |
| `reference/common-patterns.md` | Authentication, pagination, filtering, errors |

## Getting API Access

To use the AMPECO Public API:

1. Contact your AMPECO Customer Success Manager, or
2. Generate an API token in: **Back Office → API Access Tokens**

## Base URL

```
https://{tenant}.charge.ampeco.tech/public-api/
```

Replace `{tenant}` with your organization's tenant identifier.

## Live Documentation

For interactive API documentation, visit:
**https://developers.ampeco.com**

## Support

- **Documentation**: https://developers.ampeco.com
- **Support**: support@ampeco.com
- **Issues**: [GitHub Issues](https://github.com/AmpecoPlatform/claude-code-public-api-plugin/issues)

## License

MIT License - see [LICENSE](LICENSE) for details.
