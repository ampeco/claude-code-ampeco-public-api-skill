# AMPECO Data Model & API Relationships

Understanding the AMPECO data model helps you choose the right API endpoints for your integration.

---

## Entity Hierarchy

```
Operator (tenant scope)
├── Location (physical site)
│   └── ChargePoint (OCPP connection)
│       └── EVSE (charging outlet)
│           ├── Connector (plug type)
│           └── Session (charging event)
│               ├── Authorization
│               └── Transaction (payment)
├── User (EV driver)
│   ├── Session (many)
│   └── PartnerInvite (access to partners)
├── Partner (B2B entity / fleet operator)
│   ├── ChargePoint (owned assets)
│   └── PartnerInvite (user access)
├── Tariff / TariffGroup (pricing)
└── SubscriptionPlan (user subscriptions)
```

---

## Key Relationships

| From | To | Relationship | How to Access via API |
|------|-----|--------------|----------------------|
| Location | ChargePoint | has many | `GET /resources/charge-points/v2.0?filter[locationId]={id}` |
| ChargePoint | EVSE | has many | `GET /resources/charge-points/v2.0/{id}/evses` or `GET /resources/evses/v2.1` |
| ChargePoint | Session | has many (via EVSE) | `GET /resources/sessions/v1.0?filter[chargePointId]={id}` |
| EVSE | Session | has many | `GET /resources/sessions/v1.0?filter[evseId]={id}` |
| Session | User | belongs to | `GET /resources/sessions/v1.0?filter[userId]={id}` |
| Session | Transaction | has many | `GET /resources/transactions/v1.0?filter[sessionId]={id}` |
| User | Session | has many | `GET /resources/sessions/v1.0?filter[userId]={id}` |
| Partner | ChargePoint | owns | `GET /resources/charge-points/v2.0?filter[partnerId]={id}` |
| Partner | User | via PartnerInvite | `GET /resources/partner-invites/v1.0?filter[partnerId]={id}` |
| User | Partner | via PartnerInvite | `GET /resources/partner-invites/v1.0?filter[userId]={id}` |
| EVSE | TariffGroup | assigned | `GET /resources/tariff-groups/v1.0` |

---

## Common Use Case Recipes

### 1. Charge Point Statistics

Get operational data and session history for a charge point.

```
1. Get charge point details:
   GET /resources/charge-points/v2.0/{chargePointId}

2. Get EVSEs at charge point:
   GET /resources/charge-points/v2.0/{chargePointId}/evses

3. Get sessions for charge point:
   GET /resources/sessions/v1.0?filter[chargePointId]={chargePointId}

4. Get consumption stats for a session:
   GET /resources/sessions/v1.0/{sessionId}/consumption-stats

5. Get hardware status history:
   GET /resources/charge-points/v2.0/{chargePointId}/hardware-status-logs
```

### 2. User Billing & Usage History

Get a user's charging history and payment records.

```
1. Get user details:
   GET /resources/users/v1.0/{userId}

2. Get user's sessions:
   GET /resources/sessions/v1.0?filter[userId]={userId}

3. Get user's transactions (payments):
   GET /resources/transactions/v1.0?filter[userId]={userId}

4. Get user's receipts:
   GET /resources/receipts/v2.0?filter[userId]={userId}

5. Get user's subscriptions (if enabled):
   GET /resources/subscriptions/v1.0?filter[userId]={userId}
```

### 3. Fleet Management (Partner Assets)

Manage charge points and users for a B2B partner/fleet.

```
1. Get partner details:
   GET /resources/partners/v2.0/{partnerId}

2. Get partner's charge points:
   GET /resources/charge-points/v2.0?filter[partnerId]={partnerId}

3. Get users with access to partner:
   GET /resources/partner-invites/v1.0?filter[partnerId]={partnerId}

4. Get partner revenue reports:
   GET /resources/partner-revenues/v1.1?filter[partnerId]={partnerId}

5. Get partner expense reports:
   GET /resources/partner-expenses/v1.1?filter[partnerId]={partnerId}
```

### 4. Location Discovery & Charge Point Availability

Find charging locations and check availability.

```
1. List all locations:
   GET /resources/locations/v2.0

2. Get location with charging zones:
   GET /resources/locations/v2.0/{locationId}?include[]=chargingZones

3. Get charge points at location:
   GET /resources/charge-points/v2.0?filter[locationId]={locationId}

4. Get charge point with EVSEs included:
   GET /resources/charge-points/v2.0/{chargePointId}?include[]=evses

5. Check EVSE status (available, charging, faulted, etc.):
   GET /resources/evses/v2.1/{evseId}
```

### 5. Remote Charging Control

Start and stop charging sessions remotely.

```
1. Start a charging session:
   POST /actions/charge-point/v1.0/{chargePointId}/start/{evseId}
   Body: { "userId": 123 }

2. Stop a charging session:
   POST /actions/charge-point/v1.0/{chargePointId}/stop/{sessionId}

3. Monitor session status:
   GET /resources/sessions/v1.0/{sessionId}

4. Get live consumption:
   GET /resources/sessions/v1.0/{sessionId}/consumption-stats
```

### 6. Roaming & CDR Data

Access roaming network data and charge detail records.

```
1. Get CDRs (Charge Detail Records):
   GET /resources/cdrs/v2.0

2. Get roaming connections:
   GET /resources/roaming-connections/v2.0

3. Get roaming operators:
   GET /resources/roaming-operators/v2.0

4. Get roaming tariffs:
   GET /resources/roaming-tariffs/v2.0
```

### 7. Tariff & Pricing Information

Get pricing structure for charging.

```
1. List tariff groups:
   GET /resources/tariff-groups/v1.0

2. Get tariff details:
   GET /resources/tariffs/v1.0/{tariffId}

3. Get tariff snapshots (historical pricing):
   GET /resources/tariff-snapshots/v1.0

4. Get electricity rates (operator costs):
   GET /resources/electricity-rates/v2.0
```

### 8. Hardware & Maintenance

Monitor hardware status and manage maintenance.

```
1. Get firmware versions:
   GET /resources/firmware-versions/v1.0

2. Get vendor error codes:
   GET /resources/vendor-error-codes/v2.0

3. Create downtime period:
   POST /resources/charge-point-downtime-periods/v1.0

4. Get hardware status logs:
   GET /resources/charge-points/v2.0/{chargePointId}/hardware-status-logs

5. Get network status logs:
   GET /resources/charge-points/v2.0/{chargePointId}/network-status-logs
```

---

## Key Concepts

### Session Lifecycle
1. **Authorization** - User requests permission to charge (RFID, app, etc.)
2. **Session** - Active charging event with meter values
3. **Transaction** - Payment record (only `status=finalized` means paid)
4. **Receipt** - Tax-compliant billing document

### Access Types
- **public** - Open to all users
- **private** - Restricted to partner users
- **personal** - Home chargers for specific users

### Multi-Operator Model
- All resources are scoped to the authenticated operator
- Partners are B2B entities within an operator
- Users belong to one operator but can access multiple partners via PartnerInvite

---

## See Also

- `endpoints-index.md` - Complete list of all API endpoints
- `schemas-index.md` - Request/response schema definitions
- `common-patterns.md` - Authentication, pagination, filtering
- `deprecation-map.md` - Deprecated endpoints and replacements
