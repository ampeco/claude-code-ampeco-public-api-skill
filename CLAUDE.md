# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Type**: Claude Code Plugin
**Purpose**: Help developers integrate with the AMPECO EV Charging Platform Public API

This plugin provides a skill (`ampeco-public-api`) that enables Claude Code to explore and explain AMPECO's Public API endpoints, schemas, and integration patterns.

## Repository Structure

```
claude-code-public-api-plugin/
├── .claude-plugin/plugin.json    # Plugin manifest
├── skills/ampeco-public-api/
│   ├── SKILL.md                  # Skill definition and quick reference
│   ├── scripts/
│   │   └── fetch-and-generate.sh # Updates reference docs from OpenAPI spec
│   └── reference/
│       ├── endpoints-index.md    # All 449+ API endpoints by resource
│       ├── schemas-index.md      # Schema definitions with properties
│       ├── deprecation-map.md    # Deprecated endpoints (67+)
│       └── common-patterns.md    # Auth, pagination, filtering, errors
```

## Commands

### Update API Documentation

Fetch latest OpenAPI spec and regenerate all reference files:

```bash
bash skills/ampeco-public-api/scripts/fetch-and-generate.sh
```

**Prerequisites**: `curl` and `jq` must be installed

This script:
1. Fetches latest spec from https://developers.ampeco.com/openapi/
2. Regenerates `endpoints-index.md`, `schemas-index.md`, `deprecation-map.md`
3. Updates the quick index table in `SKILL.md`

## Key Concepts

### Plugin Architecture

- **plugin.json**: Defines plugin metadata and skill references
- **SKILL.md**: Contains skill frontmatter (name, description, allowed-tools) and user-facing documentation
- **Reference files**: Auto-generated from OpenAPI spec, provide detailed API documentation

### SKILL.md Structure

The skill file has two parts:
1. **Frontmatter** (YAML between `---`): Defines skill name, description, trigger keywords, and allowed tools
2. **Content**: Quick reference and usage instructions that get expanded when skill is invoked

### Quick Index Block

The `<!-- BEGIN:QUICK_INDEX -->` / `<!-- END:QUICK_INDEX -->` markers in SKILL.md define a block that gets replaced by the update script. Do not edit content between these markers manually.

## AMPECO Public API Patterns

When helping users with AMPECO API integration:

- **Base URL**: `https://{tenantUrl}/public-api/`
- **Auth**: Bearer token via `Authorization: Bearer {token}`
- **Path patterns**:
  - Resources: `/public-api/resources/{resource-name}/v{X.Y}/`
  - Actions: `/public-api/actions/{target}/v{X.Y}/{id}/{action}`
- **Response format**: JSON with `data` wrapper, pagination via `links`/`meta`
- **Filtering**: `filter[fieldName]=value` (camelCase fields)
- **Includes**: `include[]=relationName` for related resources
