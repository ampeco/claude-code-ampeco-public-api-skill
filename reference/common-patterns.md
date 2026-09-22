# Common API Patterns

Detailed reference for AMPECO Public API patterns and conventions.

## Authentication

Two security schemes are documented; both send the same header at the wire level:

```
Authorization: Bearer {token}
```

### bearerAuth — long-lived admin token

- A UUID token created in the CHARGE admin panel, sent directly with no exchange.
- Each call executes as a concrete admin (the token owner).
- Permissions and audit logs follow the token owner's access.

### oauth2ClientCredentials — short-lived access token

- Exchange `client_id` / `client_secret` at `POST /public-api/oauth/token`
  (RFC 6749 §4.4, Client Credentials Grant); send the returned access token as the bearer.
- Credentials go either in the request body or via HTTP Basic auth.
- The hex-format `client_secret` is **not** a valid bearer token on its own — it must be exchanged.
- `POST /public-api/oauth/revoke` revokes a token (RFC 7009).
- Errors follow the OAuth shape: `{"error": "...", "error_description": "..."}`.

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
    "first": "https://{tenantUrl}/public-api/resources/users/v1.0?per_page=25",
    "last": null,
    "prev": null,
    "next": "https://{tenantUrl}/public-api/resources/users/v1.0?cursor=eyJ...&per_page=25"
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

### Page Pagination (Deprecated — sunset Mon, 01 Jun 2026)

The `page` parameter is marked deprecated in the spec with a sunset date that has already passed.
It still answers where it exists, but no new integration should use it. Endpoints provide it when
`?page=N` is passed.

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
- `cursor` (string): Opaque cursor. Pass empty (`?cursor`) for the first page, then take the value
  from `links.next`. Never construct it by hand.
- `page` (integer, default: 1): **Deprecated**, sunset Mon, 01 Jun 2026. Not used in cursor pagination.
- `per_page` (integer, default: 100, max: 100): Page size for both pagination styles.

---

## Filtering

### Filter Syntax

Use `filter[fieldName]=value` format (camelCase field names):

```
GET /public-api/resources/sessions/v1.0?filter[userId]=123
GET /public-api/resources/charge-points/v2.0?filter[status]=active
GET /public-api/resources/partners/v2.0?filter[operatorId]=456
```

### Timestamp Filters

Use `After`/`Before` suffixes for date range filtering:

```
GET /public-api/resources/sessions/v1.0?filter[startedAfter]=2024-01-01T00:00:00Z
GET /public-api/resources/sessions/v1.0?filter[startedBefore]=2024-12-31T23:59:59Z
```

### Which Filters a Resource Accepts

Every listing endpoint declares a `{Resource}Filter` schema, and only the properties of that
schema are valid filters for it. Look the resource's `filter` parameter up in
`reference/endpoints-index.md` rather than guessing a field name.

---

## Includes (Embedding Related Resources)

Use `include[]` parameter to embed related resources:

```
GET /public-api/resources/charge-points/v2.0?include[]=connectors
GET /public-api/resources/charge-points/v2.0?include[]=connectors&include[]=lastBootNotification
```

**Rules**:
- Low cardinality relations only
- to-one relations: Always available
- to-many relations: Only when cardinality is low
- Each resource enumerates its own valid values in its `include` parameter.
  A value valid on one resource is usually invalid on another.

---

## Error Responses

| Status | Description | Example |
|--------|-------------|---------|
| 401 | Unauthorized | `{"message": "Unauthenticated."}` |
| 403 | Forbidden | `{"message": "This action is unauthorized."}` |
| 404 | Not Found | `{"message": "No query results for model..."}` |
| 409 | Conflict | `{"message": "..."}` |
| 422 | Validation | `{"message": "...", "errors": {...}}` |
| 429 | Rate limited | `{"message": "..."}` — see the `X-RateLimit-*` response headers |

Deprecated endpoints carry `Deprecation` and `Sunset` response headers.

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
