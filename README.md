# AMPECO Public API Skill for Claude Code

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A standalone Claude Code skill that helps developers integrate with the [AMPECO EV Charging Platform](https://ampeco.com) Public API.

## Features

- **API Exploration**: Browse 449+ API endpoints organized by resource type
- **Schema Reference**: View request/response schemas with properties and types
- **Deprecation Tracking**: Identify deprecated endpoints and their replacements
- **Common Patterns**: Learn authentication, pagination, filtering, and error handling
- **Auto-Update**: Regenerate documentation from the latest OpenAPI spec

## Installation

### Option 1: Personal Skill (available in all your projects)

```bash
# Clone into your personal skills directory
git clone https://github.com/ampeco/claude-code-public-api-skill.git ~/.claude/skills/ampeco-public-api
```

### Option 2: Project Skill (shared with your team)

```bash
# Clone into your project's skills directory
git clone https://github.com/ampeco/claude-code-public-api-skill.git .claude/skills/ampeco-public-api

# Or add as a git submodule
git submodule add https://github.com/ampeco/claude-code-public-api-skill.git .claude/skills/ampeco-public-api
```

After installation, restart Claude Code for the skill to become available.

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
# From the skill directory
cd ~/.claude/skills/ampeco-public-api  # or .claude/skills/ampeco-public-api
bash scripts/fetch-and-generate.sh
```

This will:
- Fetch the latest spec from https://developers.ampeco.com/openapi/
- Regenerate `endpoints-index.md`, `schemas-index.md`, and `deprecation-map.md`
- Update the quick index in `SKILL.md`

## Repository Structure

```
ampeco-public-api/
├── SKILL.md                      # Skill definition and quick reference
├── scripts/
│   └── fetch-and-generate.sh     # Updates reference docs from OpenAPI spec
└── reference/
    ├── endpoints-index.md        # All 449+ API endpoints by resource
    ├── schemas-index.md          # Schema definitions with properties
    ├── deprecation-map.md        # Deprecated endpoints (67+)
    ├── common-patterns.md        # Auth, pagination, filtering, errors
    └── data-model.md             # Entity relationships and use cases
```

## Getting API Access

To use the AMPECO Public API:

1. Contact your AMPECO Customer Success Manager, or
2. Generate an API token in: **Back Office → API Access Tokens**

## Base URL

```
https://{tenantUrl}/public-api/
```

Replace `{tenantUrl}` with your organization's tenant URL.

## Live Documentation

For interactive API documentation, visit:
**https://developers.ampeco.com**

## Support

- **Documentation**: https://developers.ampeco.com
- **Issues**: [GitHub Issues](https://github.com/ampeco/claude-code-public-api-skill/issues)

## License

MIT License - see [LICENSE](LICENSE) for details.
