# Common API Patterns

Detailed reference for AMPECO Public API patterns and conventions.

## Authentication

**Type**: Bearer Token (API Key)

**Header**:
```
Authorization: Bearer {your-api-token}
```

**Notes**:
- API tokens are created in the CHARGE admin panel
- Each API call is executed as a concrete admin (token owner)
- All permissions and audit logs are maintained based on token owner's access

---

## Pagination

### Cursor Pagination (Default, Recommended)

All NEW endpoints use cursor pagination via `paginationForDataCollection()`.

**Request**:
```
GET /public-api/resources/{resource}/v1.0?per_page=25
```

**First Page Response**:
```json
{
  "data": [...],
  "links": {
    "first": "https://tenant.charge.ampeco.tech/public-api/resources/users/v1.0?per_page=25",
    "last": null,
    "prev": null,
    "next": "https://tenant.charge.ampeco.tech/public-api/resources/users/v1.0?cursor=eyJ...&per_page=25"
  },
  "meta": {
    "cursor": "eyJ...",
    "per_page": 25
  }
}
```

**Next Page Request**:
```
GET /public-api/resources/{resource}/v1.0?cursor={cursor_from_meta}&per_page=25
```

### Page Pagination (Legacy Support)

Legacy endpoints support page-based pagination when `?page=N` is provided.

**Request**:
```
GET /public-api/resources/{resource}/v1.0?page=1&per_page=25
```

**Response**:
```json
{
  "data": [...],
  "links": {
    "first": "...?page=1",
    "last": "...?page=10",
    "prev": null,
    "next": "...?page=2"
  },
  "meta": {
    "current_page": 1,
    "from": 1,
    "last_page": 10,
    "per_page": 25,
    "to": 25,
    "total": 250
  }
}
```

**Parameters**:
- `page` (integer, default: 1): Page number
- `per_page` (integer, default: 100, max: 100): Items per page

---

## Filtering

### Filter Syntax

Use `filter[fieldName]=value` format (camelCase field names):

```
GET /public-api/resources/sessions/v1.0?filter[userId]=123
GET /public-api/resources/charge-points/v1.0?filter[status]=active
GET /public-api/resources/partners/v1.0?filter[operatorId]=456
```

### Timestamp Filters

Use `After`/`Before` suffixes for date range filtering:

```
GET /public-api/resources/sessions/v1.0?filter[startedAfter]=2024-01-01T00:00:00Z
GET /public-api/resources/sessions/v1.0?filter[startedBefore]=2024-12-31T23:59:59Z
```

### Sub-object Filters

Use dot notation for filtering on sub-objects:

```
GET /public-api/resources/charge-points/v1.0?filter[security.desiredLevel]=2
```

---

## Includes (Embedding Related Resources)

Use `include[]` parameter to embed related resources:

```
GET /public-api/resources/charge-points/v1.0?include[]=evses
GET /public-api/resources/charge-points/v1.0?include[]=evses&include[]=location
```

**Rules**:
- Low cardinality relations only
- to-one relations: Always available
- to-many relations: Only when cardinality is low

---

## Error Responses

| Status | Description | Example |
|--------|-------------|---------|
| 401 | Unauthorized | `{"message": "Unauthenticated."}` |
| 403 | Forbidden | `{"message": "This action is unauthorized."}` |
| 404 | Not Found | `{"message": "No query results for model..."}` |
| 422 | Validation | `{"message": "...", "errors": {...}}` |

---

## Naming Conventions

- **Properties**: camelCase (`userId`, `startedAt`)
- **Paths**: kebab-case (`/charge-points/`, `/user-groups/`)
- **Timestamps**: `At` suffix, ISO 8601 format
- **IDs**: System (database) IDs; `externalId` for external references

---

## Live Documentation

For complete API documentation and interactive examples, visit:
https://developers.ampeco.com
