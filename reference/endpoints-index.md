# Public API Endpoints Index

Auto-generated from AMPECO Public API spec v3.139.0

**Total Endpoints**: 514

---

## action / certificate

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/id-tag/v1.0/{idTag}/reissue-emaid` | Certificate / Reissue an EMAID | No |
| POST | `/public-api/actions/provisioning-certificate/v1.0/{provisioningCertificate}/issue-emaid` | Certificate / Issue an EMAID | No |

## action / charge point

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/change-availability` | Charge Point / Change Availability | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/change-owner` | Charge Point / Change Owner | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/clear-charging-profile` | Charge Point / Clear Charging Profile | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/disconnect` | Charge Point / Disconnect | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/get-diagnostics` | Charge Point / Get Diagnostics | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/get-security-log` | Charge Point / Get Security Log | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/move-evses-to-satellite` | Charge Point / Move EVSEs to Satellite | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/reserve/{evse}` | Charge Point / Reserve | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/reset-security-profile` | Charge Point / Reset Security Profile | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/reset/{type}` | Charge Point / Reset | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/send-data-transfer` | Charge Point / Send Data Transfer | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/set-charging-profile/{evseNetworkId}` | Charge Point / Set Charging Profile | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/start` | Charge Point / Start Charging Session Without EVSE | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/start/{evse}` | Charge Point / Start Charging Session | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/stop/{session}` | Charge Point / Stop Charging Session | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/sync-configuration` | Charge Point / Sync Configuration | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/trigger-message` | Charge Point / Trigger Message Charge Point | No |
| POST | `/public-api/actions/charge-point/v1.0/{chargePoint}/unlock/{evse}` | Charge Point / EVSE / Unlock | No |
| POST | `/public-api/actions/charge-point/v2.0/{chargePoint}/change-sharing-code` | Charge Point / Change sharing code | No |
| POST | `/public-api/actions/charge-point/v2.0/{chargePoint}/delete-certificate` | Charge Point / Delete Certificate | No |
| POST | `/public-api/actions/charge-point/v2.0/{chargePoint}/install-certificate` | Charge Point / Install Certificate | No |
| POST | `/public-api/actions/charge-point/v2.0/{chargePoint}/set-configuration` | Charge Point / Set Configuration | No |
| POST | `/public-api/actions/charge-point/v2.0/{chargePoint}/set-security-profile` | Charge Point / Set Security Profile | No |
| POST | `/public-api/actions/charge-point/v2.0/{chargePoint}/sync-certificates` | Charge Point / Get Installed Certificate IDs | No |
| POST | `/public-api/actions/charge-point/v2.0/{chargePoint}/update-firmware` | Charge Point / Update Firmware | No |

## action / circuit

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/circuit/v2.0/{circuit}/attach-charge-point` | Circuit / Attach Charge Point | No |
| POST | `/public-api/actions/circuit/v2.0/{circuit}/detach-charge-point/{chargePoint}` | Circuit / Detach Charge Point | No |
| POST | `/public-api/actions/circuit/v2.0/{circuit}/set-charge-point-priority/{chargePoint}` | Circuit / Set Charge Point Priority | No |
| POST | `/public-api/actions/circuit/v2.0/{circuit}/set-charge-point-priority/{chargePoint}/evse/{evse}` | Circuit / Set Charge Point EVSE Priority | No |
| POST | `/public-api/actions/circuit/v2.0/{circuit}/set-circuit-soc-priorities` | Circuit / Set Circuit SoC Priority | No |
| POST | `/public-api/actions/circuit/v2.0/{circuit}/set-session-priority/{session}` | Circuit / Set Session Priority | No |

## action / configuration template

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/configuration-template/v1.0/{template}/apply-to-charge-points` | Configuration Template / Apply to Charge Points | No |
| POST | `/public-api/actions/configuration-template/v1.0/{template}/insert-bulk-variables` | Configuration Template / Bulk Create Variables | No |

## action / electricity meter

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/electricity-meter/v1.0/{electricityMeter}/report-consumption` | Electricity Meter / Report Consumption | No |

## action / evse

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/evse/v1.0/bulk-assign-tariff-group` | EVSEs / Bulk Assign Tariff Groups | No |
| POST | `/public-api/actions/evse/v1.0/{evse}/start` | EVSE / Start Charging with EVSE ID | No |
| POST | `/public-api/actions/evse/v1.0/{evse}/trigger-message` | EVSE / Trigger Message | No |

## action / flexibility asset

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/flexibility-asset/v1.0/{flexibilityAsset}/change-status` | Flexibility Asset / Change Status | No |
| POST | `/public-api/actions/flexibility-asset/v1.0/{flexibilityAsset}/create-activation-request` | Flexibility Asset / Create Activation Request | No |

## action / installer job

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/installer-job/v1.0/{installerJob}/assign-charge-points` | Actions / Assign Charge Points | No |
| POST | `/public-api/actions/installer-job/v1.0/{installerJob}/change-status` | Actions / Change Status | No |

## action / invoice

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/invoice/v1.0/{invoice}/update-external-id` | Invoice / Update External ID | No |

## action / location

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/locations/v2.0/{location}/check-booking-availability` | Location / Check Booking Availability | No |

## action / notifications

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/notifications/v1.0/{notification}/resend` | Notifications / Resend Failed | No |

## action / parking space

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/parking-spaces/v1.0/{parkingSpace}/update-occupancy-status` | Parking Space / Update occupancy status | No |

## action / partner settlement report

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/partner-settlement-report/v1.0/{partnerSettlementReport}/update-external-id` | Partner Settlement Report / Update External ID | No |

## action / reservation

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/reservation/v1.0/{reservation}/cancel` | Reservation / Cancel | No |

## action / roaming operator

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/roaming-operator/v2.0/{roamingOperator}/custom-tariff-filter/{customTariffFilter}/set-pricing-data` | Custom Tariff Filters / Set Pricing Data | No |

## action / session

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/session/v1.0/{session}/assign-user` | Session / Assign to user | No |
| POST | `/public-api/actions/session/v1.0/{session}/retry-payment` | Session / Retry Payment | No |

## action / subscription-plan

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/subscription-plans/v1.0/{subscriptionPlan}/replace` | Subscription plan / Replace | No |

## action / tariff

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/tariffs/v2.0/{tariff}/set-tariff-display-information` | Tariff / Set Display Information | No |

## action / transaction

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/transactions/v1.0/{transaction}/issue-invoice` | Transaction / Issue Invoice | No |
| POST | `/public-api/actions/transactions/v1.0/{transaction}/resend-invoice` | Transaction / Resend Invoice | No |
| POST | `/public-api/actions/transactions/v1.0/{transaction}/update-payment-reference` | Transaction / Update Payment Reference | No |

## action / user

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/actions/users/v1.0/{user}/activate-subscription` | User / Activate subscription | No |
| POST | `/public-api/actions/users/v1.0/{user}/add-balance` | User / Add Balance | No |
| POST | `/public-api/actions/users/v1.0/{user}/apply-custom-fee` | User / Apply Custom Fee | No |
| POST | `/public-api/actions/users/v1.0/{user}/cancel-subscription` | User / Cancel subscription | No |
| POST | `/public-api/actions/users/v1.0/{user}/change-status` | User / Change Status | No |
| POST | `/public-api/actions/users/v1.0/{user}/clear-subscription-amount-due` | User / Clear subscription amount due | No |
| GET | `/public-api/actions/users/v2.0/{user}/export-all-private-data` | User / Export All Private Data | No |
| POST | `/public-api/actions/users/v2.0/{user}/redeem-voucher` | User / Redeem Voucher | No |

## logs / communication

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/logs/communication/v1.0` | Communication logs / Listing | No |
| GET | `/public-api/logs/communication/v1.0/{id}` | Communication log / Read | No |

## notifications

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/notifications/v1.0` | Notifications / Subscribe | Yes |
| GET | `/public-api/notifications/v1.0` | Notifications / Listing | Yes |
| GET | `/public-api/notifications/v1.0/{notification}` | Notifications / Read | Yes |
| PUT | `/public-api/notifications/v1.0/{notification}` | Notifications / Update | Yes |
| DELETE | `/public-api/notifications/v1.0/{notification}` | Notifications / Unsubscribe | Yes |
| POST | `/public-api/notifications/v2.0` | Notifications / Subscribe | No |
| GET | `/public-api/notifications/v2.0` | Notifications / Listing | No |
| GET | `/public-api/notifications/v2.0/{notification}` | Notification / Read | No |
| PUT | `/public-api/notifications/v2.0/{notification}` | Notifications / Update | No |
| DELETE | `/public-api/notifications/v2.0/{notification}` | Notifications / Unsubscribe | No |

## resource / admins

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/admins/v1.0` | Admins / Listing | No |
| GET | `/public-api/resources/admins/v1.0/{admin}` | Admin / Read | No |
| GET | `/public-api/resources/admins/v1.0/{admin}/permissions` | Admin / Permissions | No |

## resource / authorizations

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/authorizations/v1.0/{authorization}` | Authorization / Read | Yes |
| GET | `/public-api/resources/authorizations/v2.0` | Authorizations / Listing | Yes |
| GET | `/public-api/resources/authorizations/v2.0/{authorization}` | Authorization / Read | Yes |
| GET | `/public-api/resources/authorizations/v2.1` | Authorizations / Listing | No |
| GET | `/public-api/resources/authorizations/v2.1/{authorization}` | Authorization / Read | No |

## resource / booking requests

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/booking-requests/v1.0` | Booking Requests / Listing | No |
| POST | `/public-api/resources/booking-requests/v1.0` | Booking Request / Create | No |
| GET | `/public-api/resources/booking-requests/v1.0/{bookingRequest}` | Booking Request / Read | No |

## resource / bookings

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/bookings/v1.0` | Bookings / Listing | No |
| GET | `/public-api/resources/bookings/v1.0/{booking}` | Booking / Read | No |

## resource / cdrs

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/cdrs/v2.0` | CDRs / Listing | No |
| GET | `/public-api/resources/cdrs/v2.0/{cdr}` | CDR / Read | No |

## resource / charge point downtime periods

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/charge-point-downtime-periods/v1.0` | Charge Point Downtime Periods / Listing | No |
| POST | `/public-api/resources/charge-point-downtime-periods/v1.0` | Charge Point Downtime Period / Create | No |
| GET | `/public-api/resources/charge-point-downtime-periods/v1.0/{chargePointDowntimePeriod}` | Charge Point Downtime Period / Read | No |
| PATCH | `/public-api/resources/charge-point-downtime-periods/v1.0/{chargePointDowntimePeriod}` | Charge Point Downtime Period / Update | No |
| DELETE | `/public-api/resources/charge-point-downtime-periods/v1.0/{chargePointDowntimePeriod}` | Charge Point Downtime Period / Delete | No |
| GET | `/public-api/resources/charge-point-downtime-periods/v1.0/{chargePointDowntimePeriod}/status-log` | Charge Point Downtime Period / Status Log | No |

## resource / charge point models

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/charge-point-models/v1.0` | Charge Point Models / Listing | No |
| POST | `/public-api/resources/charge-point-models/v1.0` | Charge Point Model / Create | No |
| GET | `/public-api/resources/charge-point-models/v1.0/{modelId}` | Charge Point Model / Read | No |
| PATCH | `/public-api/resources/charge-point-models/v1.0/{modelId}` | Charge Point Model / Update | No |
| DELETE | `/public-api/resources/charge-point-models/v1.0/{modelId}` | Charge Point Model / Delete | No |
| GET | `/public-api/resources/cp-models/v1.0` | Charge Point Models / Listing | Yes |
| POST | `/public-api/resources/cp-models/v1.0` | Charge Point Model / Create | Yes |
| GET | `/public-api/resources/cp-models/v1.0/{modelId}` | Charge Point Model / Read | Yes |
| PATCH | `/public-api/resources/cp-models/v1.0/{modelId}` | Charge Point Model / Update | Yes |
| DELETE | `/public-api/resources/cp-models/v1.0/{modelId}` | Charge Point Model / Delete | Yes |

## resource / charge point vendors

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/charge-point-vendors/v1.0` | Charge Point Vendors / Listing | No |
| POST | `/public-api/resources/charge-point-vendors/v1.0` | Charge Point Vendor / Create | No |
| GET | `/public-api/resources/charge-point-vendors/v1.0/{vendorId}` | Charge Point Vendor / Read | No |
| PATCH | `/public-api/resources/charge-point-vendors/v1.0/{vendorId}` | Charge Point Vendor / Update | No |
| DELETE | `/public-api/resources/charge-point-vendors/v1.0/{vendorId}` | Charge Point Vendor / Delete | No |
| GET | `/public-api/resources/cp-vendors/v1.0` | Charge Point Vendors / Listing | Yes |
| POST | `/public-api/resources/cp-vendors/v1.0` | Charge Point Vendor / Create | Yes |
| GET | `/public-api/resources/cp-vendors/v1.0/{vendorId}` | Charge Point Vendor / Read | Yes |
| PATCH | `/public-api/resources/cp-vendors/v1.0/{vendorId}` | Charge Point Vendor / Update | Yes |
| DELETE | `/public-api/resources/cp-vendors/v1.0/{vendorId}` | Charge Point Vendor / Delete | Yes |

## resource / charge points

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/charge-points/v1.0` | Charge Points / Listing | Yes |
| POST | `/public-api/resources/charge-points/v1.0` | Charge Point / Create | Yes |
| GET | `/public-api/resources/charge-points/v1.0/{chargePoint}` | Charge Point / Read | Yes |
| PATCH | `/public-api/resources/charge-points/v1.0/{chargePoint}` | Charge Point / Update | Yes |
| DELETE | `/public-api/resources/charge-points/v1.0/{chargePoint}` | Charge Point / Delete | Yes |
| GET | `/public-api/resources/charge-points/v1.0/{chargePoint}/configurations` | Charge Point / Configurations / Listing | Yes |
| GET | `/public-api/resources/charge-points/v1.0/{chargePoint}/configurations/{key}` | Charge Point / Configuration / Read | Yes |
| PATCH | `/public-api/resources/charge-points/v1.0/{chargePoint}/configurations/{key}` | Charge Point / Configuration / Update | Yes |
| GET | `/public-api/resources/charge-points/v1.0/{chargePoint}/status` | Charge Point / Status / Read | No |
| POST | `/public-api/resources/charge-points/v2.0` | Charge Point / Create | No |
| GET | `/public-api/resources/charge-points/v2.0` | Charge Points / Listing | No |
| PATCH | `/public-api/resources/charge-points/v2.0/{chargePoint}` | Charge Point / Update | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}` | Charge Point / Read | No |
| DELETE | `/public-api/resources/charge-points/v2.0/{chargePoint}` | Charge Point / Delete | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/available-personal-smart-charging-modes` | Charge Point / Available personal smart charging modes / Listing | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/configurations` | Charge Point / Configurations / Listing | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/configurations/{key}` | Charge Point / Configuration / Read | No |
| PATCH | `/public-api/resources/charge-points/v2.0/{chargePoint}/configurations/{key}` | Charge Point / Configuration / Update | No |
| POST | `/public-api/resources/charge-points/v2.0/{chargePoint}/evses` | Charge Point / EVSE / Create | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/evses` | Charge Point / EVSEs / Listing | No |
| PATCH | `/public-api/resources/charge-points/v2.0/{chargePoint}/evses/{evse}` | Charge Point / EVSE / Update | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/evses/{evse}` | Charge Point / EVSE / Read | No |
| DELETE | `/public-api/resources/charge-points/v2.0/{chargePoint}/evses/{evse}` | Charge Point / EVSE / Delete | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/evses/{evse}/connectors` | Charge Point / Evse / Connectors / Listing | No |
| POST | `/public-api/resources/charge-points/v2.0/{chargePoint}/evses/{evse}/connectors` | Charge Points / Evse / Connector / Create | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/evses/{evse}/connectors/{connector}` | Charge Points / Evse / Connector / Read | No |
| PATCH | `/public-api/resources/charge-points/v2.0/{chargePoint}/evses/{evse}/connectors/{connector}` | Charge Points / Evse / Connector / Update | No |
| DELETE | `/public-api/resources/charge-points/v2.0/{chargePoint}/evses/{evse}/connectors/{connector}` | Charge Points / Evse / Connector / Delete | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/hardware-status-logs` | Charge Point / Hardware Status Logs / Listing | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/latest-hardware-status-log` | Charge Point / Latest Hardware Status Log | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/latest-network-status-log` | Charge Point / Latest Network Status Log | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/network-status-logs` | Charge Point / Network Status Logs / Listing | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/notes` | Charge Point / Notes / Listing | No |
| POST | `/public-api/resources/charge-points/v2.0/{chargePoint}/notes` | Charge Point / Note / Create | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/notes/{note}` | Charge Point / Note / Read | No |
| PATCH | `/public-api/resources/charge-points/v2.0/{chargePoint}/notes/{note}` | Charge Point / Note / Update | No |
| DELETE | `/public-api/resources/charge-points/v2.0/{chargePoint}/notes/{note}` | Charge Point / Note / Delete | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/personal-smart-charging-preferences` | Charge Point / Personal smart charging preferences / Read | No |
| POST | `/public-api/resources/charge-points/v2.0/{chargePoint}/personal-smart-charging-preferences` | Charge Point / Personal smart charging preferences / Update | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/shared-partners` | Charge Point / Shared Partners / Listing | No |
| PUT | `/public-api/resources/charge-points/v2.0/{chargePoint}/shared-partners` | Charge Point / Shared Partners / Update | No |
| POST | `/public-api/resources/charge-points/v2.0/{chargePoint}/shares` | Charge Point / Share / Create | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/shares` | Charge Point / Shares / Listing | No |
| GET | `/public-api/resources/charge-points/v2.0/{chargePoint}/shares/{share}` | Charge Point / Share / Read | No |
| DELETE | `/public-api/resources/charge-points/v2.0/{chargePoint}/shares/{share}` | Charge Point / Share / Delete | No |
| POST | `/public-api/resources/charge-points/v2.0/{chargePoint}/smart-charging` | Charge Point / Smart Charging / Update | No |

## resource / circuits

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/circuits/v1.0` | Circuits / Listing | Yes |
| POST | `/public-api/resources/circuits/v1.0` | Circuit / Create | Yes |
| GET | `/public-api/resources/circuits/v1.0/{dlmCircuit}` | Circuit / Read | Yes |
| PATCH | `/public-api/resources/circuits/v1.0/{dlmCircuit}` | Circuit / Update | Yes |
| DELETE | `/public-api/resources/circuits/v1.0/{dlmCircuit}` | Circuit / Delete | Yes |
| GET | `/public-api/resources/circuits/v1.0/{dlmCircuit}/consumption` | Circuit / Consumption (all phases) | Yes |
| GET | `/public-api/resources/circuits/v1.0/{dlmCircuit}/consumption/{phase}` | Circuit / Consumption (phase) | Yes |
| GET | `/public-api/resources/circuits/v2.0` | Circuits / Listing | No |
| POST | `/public-api/resources/circuits/v2.0` | Circuit / Create | No |
| GET | `/public-api/resources/circuits/v2.0/{circuit}` | Circuit / Read | No |
| PATCH | `/public-api/resources/circuits/v2.0/{circuit}` | Circuit / Update | No |
| DELETE | `/public-api/resources/circuits/v2.0/{circuit}` | Circuit / Delete | No |
| GET | `/public-api/resources/circuits/v2.0/{circuit}/charge-point-priorities` | Circuit / Charge Point Priorities / Listing | No |
| GET | `/public-api/resources/circuits/v2.0/{circuit}/consumption` | Circuit / Consumption | No |
| GET | `/public-api/resources/circuits/v2.0/{circuit}/soc-priorities` | Circuit / SoC Priorities / Listing | No |
| GET | `/public-api/resources/circuits/v2.0/{circuit}/unmanaged-load` | Circuit / Unmanaged Load / Read | No |
| GET | `/public-api/resources/circuits/v2.0/{circuit}/user-priorities` | Circuits / User Priorities / Listing | No |
| POST | `/public-api/resources/circuits/v2.0/{circuit}/user-priorities` | Circuits / User Priority / Create | No |
| GET | `/public-api/resources/circuits/v2.0/{circuit}/user-priorities/{userPriority}` | Circuits / User Priority / Read | No |
| PATCH | `/public-api/resources/circuits/v2.0/{circuit}/user-priorities/{userPriority}` | Circuits / User Priority / Update | No |
| DELETE | `/public-api/resources/circuits/v2.0/{circuit}/user-priorities/{userPriority}` | Circuits / User Priority / Delete | No |

## resource / configuration templates

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/configuration-templates/v1.0` | Configuration Template / Listing | No |
| POST | `/public-api/resources/configuration-templates/v1.0` | Configuration Template / Create | No |
| PATCH | `/public-api/resources/configuration-templates/v1.0/{template}` | Configuration Template / Update | No |
| GET | `/public-api/resources/configuration-templates/v1.0/{template}` | Configuration Template / Read | No |
| DELETE | `/public-api/resources/configuration-templates/v1.0/{template}` | Configuration Template / Delete | No |
| GET | `/public-api/resources/configuration-templates/v1.0/{template}/variables` | Configuration Template Variable / Listing | No |
| POST | `/public-api/resources/configuration-templates/v1.0/{template}/variables` | Configuration Template Variable / Create | No |
| PATCH | `/public-api/resources/configuration-templates/v1.0/{template}/variables/{variable}` | Configuration Template Variable / Update | No |
| DELETE | `/public-api/resources/configuration-templates/v1.0/{template}/variables/{variable}` | Configuration Template Variable / Delete | No |

## resource / consent-history

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/consent-history/v1.0` | Consent History / Listing | No |

## resource / consents

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/consents/v1.0` | Consents / Listing | No |
| POST | `/public-api/resources/consents/v1.0` | Consents / Create | No |

## resource / contact details

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/contact-details/v2.0` | Contact details / Read | No |
| PUT | `/public-api/resources/contact-details/v2.0` | Contact details / Update | No |
| DELETE | `/public-api/resources/contact-details/v2.0` | Contact details / Delete | No |

## resource / currencies

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/currencies/v2.0` | Currencies / Listing | No |
| POST | `/public-api/resources/currencies/v2.0` | Currency / Create | No |
| GET | `/public-api/resources/currencies/v2.0/{currency}` | Currency / Read | No |
| PATCH | `/public-api/resources/currencies/v2.0/{currency}` | Currency / Update | No |
| DELETE | `/public-api/resources/currencies/v2.0/{currency}` | Currency / Delete | Yes |

## resource / currency rates

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/resources/currency-rates/v1.0` | Currency Rate / Create | No |
| GET | `/public-api/resources/currency-rates/v1.0` | Currency Rate / Listing | No |
| PATCH | `/public-api/resources/currency-rates/v1.0/{currencyRate}` | Currency Rate / Update | No |
| GET | `/public-api/resources/currency-rates/v1.0/{currencyRate}` | Currency Rate / Read | No |
| DELETE | `/public-api/resources/currency-rates/v1.0/{currencyRate}` | Currency Rate / Delete | No |

## resource / custom fees

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/custom-fees/v2.0` | Custom Fees / Listing | No |
| GET | `/public-api/resources/custom-fees/v2.0/{customFee}` | Custom Fee / Read | No |

## resource / downtime period notices

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/downtime-period-notices/v1.0` | Downtime Period Notices / Listing | No |
| POST | `/public-api/resources/downtime-period-notices/v1.0` | Downtime Period Notices / Create | No |
| GET | `/public-api/resources/downtime-period-notices/v1.0/{notice}` | Downtime Period Notices / Read | No |
| PATCH | `/public-api/resources/downtime-period-notices/v1.0/{notice}` | Downtime Period Notices / Update | No |
| DELETE | `/public-api/resources/downtime-period-notices/v1.0/{notice}` | Downtime Period Notices / Delete | No |

## resource / electricity meters

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/electricity-meters/v1.0` | Electricity Meters / Listing | No |
| POST | `/public-api/resources/electricity-meters/v1.0` | Electricity Meter / Create | No |
| GET | `/public-api/resources/electricity-meters/v1.0/{electricityMeter}` | Electricity Meter / Read | No |
| PATCH | `/public-api/resources/electricity-meters/v1.0/{electricityMeter}` | Electricity Meter / Update | No |
| DELETE | `/public-api/resources/electricity-meters/v1.0/{electricityMeter}` | Electricity Meter / Delete | No |

## resource / electricity rates

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/electricity-rates/v1.0` | Electricity rates / Listing | Yes |
| POST | `/public-api/resources/electricity-rates/v1.0` | Electricity rate / Create | Yes |
| GET | `/public-api/resources/electricity-rates/v1.0/{electricityRate}` | Electricity rate / Read | Yes |
| PUT | `/public-api/resources/electricity-rates/v1.0/{electricityRate}` | Electricity rate / Update | Yes |
| DELETE | `/public-api/resources/electricity-rates/v1.0/{electricityRate}` | Electricity rate / Delete | Yes |
| GET | `/public-api/resources/electricity-rates/v2.0` | Electricity rates / Listing | No |
| POST | `/public-api/resources/electricity-rates/v2.0` | Electricity rate / Create | No |
| GET | `/public-api/resources/electricity-rates/v2.0/{electricityRate}` | Electricity rate / Read | No |
| PATCH | `/public-api/resources/electricity-rates/v2.0/{electricityRate}` | Electricity rate / Update | No |
| DELETE | `/public-api/resources/electricity-rates/v2.0/{electricityRate}` | Electricity rate / Delete | No |
| GET | `/public-api/resources/electricity-rates/v2.0/{electricityRate}/energy-mix` | Electricity rate / Energy Mix / Read | No |
| PUT | `/public-api/resources/electricity-rates/v2.0/{electricityRate}/energy-mix` | Electricity rate / Energy Mix / Update | No |
| GET | `/public-api/resources/electricity-rates/v2.0/{electricityRate}/price-periods` | Electricity rate / Price periods / Listing | No |
| GET | `/public-api/resources/electricity-rates/v2.0/{electricityRate}/price-periods/date` | Electricity rate / Price periods / Date / Listing | No |
| GET | `/public-api/resources/electricity-rates/v2.0/{electricityRate}/price-periods/date/{date}` | Electricity rate / Price periods / Date / Read | No |
| PUT | `/public-api/resources/electricity-rates/v2.0/{electricityRate}/price-periods/date/{date}` | Electricity rate / Price periods / Date / Create or update | No |
| DELETE | `/public-api/resources/electricity-rates/v2.0/{electricityRate}/price-periods/date/{date}` | Electricity rate / Price periods / Date / Delete | No |
| GET | `/public-api/resources/electricity-rates/v2.0/{electricityRate}/price-periods/week-day` | Electricity rate / Price periods / Week day / Listing | No |
| GET | `/public-api/resources/electricity-rates/v2.0/{electricityRate}/price-periods/week-day/{weekDay}` | Electricity rate / Price periods / Week day / Read | No |
| PUT | `/public-api/resources/electricity-rates/v2.0/{electricityRate}/price-periods/week-day/{weekDay}` | Electricity rate / Price periods / Week day / Create or update | No |
| DELETE | `/public-api/resources/electricity-rates/v2.0/{electricityRate}/price-periods/week-day/{weekDay}` | Electricity rate / Price periods / Week day / Delete | No |

## resource / evse downtime periods

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/evse-downtime-periods/v1.0` | EVSE Downtime Periods / Listing | No |
| POST | `/public-api/resources/evse-downtime-periods/v1.0` | EVSE Downtime Period / Create | No |
| GET | `/public-api/resources/evse-downtime-periods/v1.0/{evseDowntimePeriod}` | EVSE Downtime Period / Read | No |
| PATCH | `/public-api/resources/evse-downtime-periods/v1.0/{evseDowntimePeriod}` | EVSE Downtime Period / Update | No |
| DELETE | `/public-api/resources/evse-downtime-periods/v1.0/{evseDowntimePeriod}` | EVSE Downtime Period / Delete | No |
| GET | `/public-api/resources/evse-downtime-periods/v1.0/{evseDowntimePeriod}/status-log` | EVSE Downtime Period / Status Log | No |

## resource / evses

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/evses/v2.0` | EVSEs / Listing | Yes |
| GET | `/public-api/resources/evses/v2.0/{evse}` | EVSE / Read | Yes |
| PUT | `/public-api/resources/evses/v2.0/{evse}` | EVSE / Update | Yes |
| GET | `/public-api/resources/evses/v2.0/{evse}/hardware-status-logs` | EVSE / Hardware Status Logs / Listing | No |
| GET | `/public-api/resources/evses/v2.0/{evse}/latest-hardware-status-log` | EVSE / Latest Hardware Status Log | No |
| GET | `/public-api/resources/evses/v2.0/{evse}/notes` | EVSE / Notes / Listing | No |
| POST | `/public-api/resources/evses/v2.0/{evse}/notes` | EVSE / Note / Create | No |
| GET | `/public-api/resources/evses/v2.0/{evse}/notes/{note}` | EVSE / Note / Read | No |
| PATCH | `/public-api/resources/evses/v2.0/{evse}/notes/{note}` | EVSE / Note / Update | No |
| DELETE | `/public-api/resources/evses/v2.0/{evse}/notes/{note}` | EVSE / Note / Delete | No |
| POST | `/public-api/resources/evses/v2.1` | EVSE / Create | No |
| GET | `/public-api/resources/evses/v2.1` | EVSEs / Listing | No |
| PATCH | `/public-api/resources/evses/v2.1/{evse}` | EVSE / Update | No |
| GET | `/public-api/resources/evses/v2.1/{evse}` | EVSE / Read | No |
| DELETE | `/public-api/resources/evses/v2.1/{evse}` | EVSE / Delete | No |

## resource / faqs

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/faqs/v2.0` | FAQs / Listing | No |
| POST | `/public-api/resources/faqs/v2.0` | FAQ / Create | No |
| GET | `/public-api/resources/faqs/v2.0/{faq}` | FAQ / Read | No |
| PATCH | `/public-api/resources/faqs/v2.0/{faq}` | FAQ / Update | No |
| DELETE | `/public-api/resources/faqs/v2.0/{faq}` | FAQ / Delete | No |

## resource / firmware versions

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/firmware-versions/v1.0` | Firmware Versions / Listing | No |
| GET | `/public-api/resources/firmware-versions/v1.0/{firmwareVersion}` | Firmware Version / Read | No |
| GET | `/public-api/resources/firmware-versions/v1.0/{firmwareVersion}/attached-models` | Firmware Version / Attached Models | No |

## resource / flexibility activation requests

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/flexibility-activation-requests/v1.0` | Flexibility Activation Requests / Listing | No |
| GET | `/public-api/resources/flexibility-activation-requests/v1.0/{flexibilityActivationRequest}` | Flexibility Activation Requests / Read | No |

## resource / flexibility assets

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/resources/flexibility-assets/v1.0` | Flexibility Assets / Create | No |
| GET | `/public-api/resources/flexibility-assets/v1.0` | Flexibility Assets / Listing | No |
| PATCH | `/public-api/resources/flexibility-assets/v1.0/{flexibilityAsset}` | Flexibility Assets / Update | No |
| GET | `/public-api/resources/flexibility-assets/v1.0/{flexibilityAsset}` | Flexibility Assets / Read | No |
| DELETE | `/public-api/resources/flexibility-assets/v1.0/{flexibilityAsset}` | Flexibility Assets / Delete | No |
| GET | `/public-api/resources/flexibility-assets/v1.0/{flexibilityAsset}/historical-time-series` | Flexibility Assets / Historical Time Series | No |
| GET | `/public-api/resources/flexibility-assets/v1.0/{flexibilityAsset}/time-series-forecast` | Flexibility Assets / Time Series Forecast | No |

## resource / id tags

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/id-tags/v2.0` | Id Tags / Listing | No |
| POST | `/public-api/resources/id-tags/v2.0` | Id Tag / Create | No |
| GET | `/public-api/resources/id-tags/v2.0/{idTag}` | Id Tag / Read | No |
| PATCH | `/public-api/resources/id-tags/v2.0/{idTag}` | Id Tag / Update | No |
| DELETE | `/public-api/resources/id-tags/v2.0/{idTag}` | Id Tag / Delete | No |

## resource / installation and maintenance companies

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/installation-and-maintenance-companies/v1.0` | Installation And Maintenance Companies / Listing | No |
| POST | `/public-api/resources/installation-and-maintenance-companies/v1.0` | Installation And Maintenance Companies / Create | No |
| GET | `/public-api/resources/installation-and-maintenance-companies/v1.0/{imCompany}` | Installation And Maintenance Companies / Read | No |
| PATCH | `/public-api/resources/installation-and-maintenance-companies/v1.0/{imCompany}` | Installation And Maintenance Companies / Update | No |
| DELETE | `/public-api/resources/installation-and-maintenance-companies/v1.0/{imCompany}` | Installation And Maintenance Companies / Delete | No |

## resource / installer jobs

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/installer-jobs/v1.0` | InstallerJobs / Listing | No |
| POST | `/public-api/resources/installer-jobs/v1.0` | Installer Jobs / Create | No |
| GET | `/public-api/resources/installer-jobs/v1.0/{installerJob}` | Installer Jobs / Read | No |
| PATCH | `/public-api/resources/installer-jobs/v1.0/{installerJob}` | Installer Jobs / Update | No |
| DELETE | `/public-api/resources/installer-jobs/v1.0/{installerJob}` | Installer Jobs / Delete | No |

## resource / invoices

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/invoices/v1.0` | Invoices / Listing | No |
| GET | `/public-api/resources/invoices/v1.0/{invoice}` | Invoice / Read | No |

## resource / issues

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/issues/v1.0` | Issues / Listing | No |
| POST | `/public-api/resources/issues/v1.0` | Issues / Create | No |
| GET | `/public-api/resources/issues/v1.0/{issue}` | Issue / Read | No |
| PATCH | `/public-api/resources/issues/v1.0/{issue}` | Issue / Update | No |
| DELETE | `/public-api/resources/issues/v1.0/{issue}` | Issue / Delete | No |

## resource / locations

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/locations/v1.0` | Locations / Listing | Yes |
| POST | `/public-api/resources/locations/v1.0` | Location / Create | Yes |
| GET | `/public-api/resources/locations/v1.0/{location}` | Location / Read | Yes |
| PATCH | `/public-api/resources/locations/v1.0/{location}` | Location / Update | Yes |
| DELETE | `/public-api/resources/locations/v1.0/{location}` | Location / Delete | Yes |
| POST | `/public-api/resources/locations/v2.0` | Location / Create | No |
| GET | `/public-api/resources/locations/v2.0` | Locations / Listing | No |
| PATCH | `/public-api/resources/locations/v2.0/{location}` | Location / Update | No |
| GET | `/public-api/resources/locations/v2.0/{location}` | Location / Read | No |
| DELETE | `/public-api/resources/locations/v2.0/{location}` | Location / Delete | No |
| GET | `/public-api/resources/locations/v2.0/{location}/charging-zones` | Location / Charging Zones / Listing | No |
| POST | `/public-api/resources/locations/v2.0/{location}/charging-zones` | Location / Charging Zone / Create | No |
| GET | `/public-api/resources/locations/v2.0/{location}/charging-zones/{chargingZone}` | Location / Charging Zone / Read | No |
| PATCH | `/public-api/resources/locations/v2.0/{location}/charging-zones/{chargingZone}` | Location / Charging Zones / Update | No |
| DELETE | `/public-api/resources/locations/v2.0/{location}/charging-zones/{chargingZone}` | Location / Charging Zone / Delete | No |
| GET | `/public-api/resources/locations/v2.0/{location}/notes` | Location / Notes / Listing | No |
| POST | `/public-api/resources/locations/v2.0/{location}/notes` | Location / Note / Create | No |
| GET | `/public-api/resources/locations/v2.0/{location}/notes/{note}` | Location / Note / Read | No |
| PATCH | `/public-api/resources/locations/v2.0/{location}/notes/{note}` | Location / Note / Update | No |
| DELETE | `/public-api/resources/locations/v2.0/{location}/notes/{note}` | Location / Note / Delete | No |

## resource / parking spaces

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/resources/parking-spaces/v1.0` | Parking Space / Create | No |
| GET | `/public-api/resources/parking-spaces/v1.0` | Parking Space / Listing | No |
| PUT | `/public-api/resources/parking-spaces/v1.0/{parkingSpace}` | Parking Space / Update | Yes |
| PATCH | `/public-api/resources/parking-spaces/v1.0/{parkingSpace}` | Parking Space / Update | No |
| GET | `/public-api/resources/parking-spaces/v1.0/{parkingSpace}` | Parking Space / Read | No |
| DELETE | `/public-api/resources/parking-spaces/v1.0/{parkingSpace}` | Parking Space / Delete | No |
| GET | `/public-api/resources/parking-spaces/v1.0/{parkingSpace}/evses` | Parking Space / EVSEs / Listing | No |
| PUT | `/public-api/resources/parking-spaces/v1.0/{parkingSpace}/evses` | Parking Space / EVSEs / Update | No |

## resource / partner contracts

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/partner-contracts/v1.0` | Partner Contracts / Listing | No |
| POST | `/public-api/resources/partner-contracts/v1.0` | Partner Contract / Create | No |
| GET | `/public-api/resources/partner-contracts/v1.0/{partnerContract}` | Partner Contract / Read | No |
| PUT | `/public-api/resources/partner-contracts/v1.0/{partnerContract}` | Partner Contract / Update | No |
| DELETE | `/public-api/resources/partner-contracts/v1.0/{partnerContract}` | Partner Contract / Delete | No |

## resource / partner invites

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/partner-invites/v1.0` | Partner Invites / Listing | No |
| POST | `/public-api/resources/partner-invites/v1.0` | Partner Invite / Create | No |
| GET | `/public-api/resources/partner-invites/v1.0/{partnerInvite}` | Partner Invite / Read | No |
| PATCH | `/public-api/resources/partner-invites/v1.0/{partnerInvite}` | Partner Invite / Update | No |
| DELETE | `/public-api/resources/partner-invites/v1.0/{partnerInvite}` | Partner Invite / Delete | No |

## resource / partner settlement reports

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/partner-settlement-reports/v1.0` | Partner Settlement Reports / Listing | No |
| GET | `/public-api/resources/partner-settlement-reports/v1.0/{partnerSettlementReport}` | Partner Settlement Report / Read | No |
| GET | `/public-api/resources/partner-settlement-reports/v1.0/{partnerSettlementReport}/records` | Partner Settlement Report / Partner Settlement Records / Listing | No |
| POST | `/public-api/resources/partner-settlement-reports/v1.0/{partnerSettlementReport}/records` | Partner Settlement Report / Partner Settlement Record / Create | No |
| GET | `/public-api/resources/partner-settlement-reports/v1.0/{partnerSettlementReport}/records/{PartnerSettlementRecord}` | Partner Settlement Report / Partner Settlement Record / Read | No |
| PUT | `/public-api/resources/partner-settlement-reports/v1.0/{partnerSettlementReport}/records/{PartnerSettlementRecord}` | Partner Settlement Report / Partner Settlement Record / Update | No |
| DELETE | `/public-api/resources/partner-settlement-reports/v1.0/{partnerSettlementReport}/records/{PartnerSettlementRecord}` | Partner Settlement Report / Partner Settlement Record / Delete | No |

## resource / partners

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/partners/v1.0` | Partners / Listing | Yes |
| POST | `/public-api/resources/partners/v1.0` | Partner / Create | Yes |
| GET | `/public-api/resources/partners/v1.0/{partner}` | Partner / Read | Yes |
| PATCH | `/public-api/resources/partners/v1.0/{partner}` | Partner / Update | Yes |
| DELETE | `/public-api/resources/partners/v1.0/{partner}` | Partner / Delete | Yes |
| GET | `/public-api/resources/partners/v2.0` | Partners / Listing | No |
| POST | `/public-api/resources/partners/v2.0` | Partner / Create | No |
| GET | `/public-api/resources/partners/v2.0/{partner}` | Partner / Read | No |
| PATCH | `/public-api/resources/partners/v2.0/{partner}` | Partner / Update | No |
| DELETE | `/public-api/resources/partners/v2.0/{partner}` | Partner / Delete | No |
| GET | `/public-api/resources/partners/v2.0/{partner}/admins` | Partner / Admins / Listing | No |
| POST | `/public-api/resources/partners/v2.0/{partner}/admins` | Partner / Admin / Create | No |
| PATCH | `/public-api/resources/partners/v2.0/{partner}/admins/{admin}` | Partner / Admin / Update | No |
| DELETE | `/public-api/resources/partners/v2.0/{partner}/admins/{admin}` | Partner / Admin / Delete | No |
| GET | `/public-api/resources/partners/v2.0/{partner}/notes` | Partner / Notes / Listing | No |
| POST | `/public-api/resources/partners/v2.0/{partner}/notes` | Partner / Note / Create | No |
| GET | `/public-api/resources/partners/v2.0/{partner}/notes/{note}` | Partner / Note / Read | No |
| PATCH | `/public-api/resources/partners/v2.0/{partner}/notes/{note}` | Partner / Note / Update | No |
| DELETE | `/public-api/resources/partners/v2.0/{partner}/notes/{note}` | Partner / Note / Delete | No |

## resource / payment terminals

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/payment-terminals/v1.0` | Payment Terminals / Listing | Yes |
| POST | `/public-api/resources/payment-terminals/v1.0` | Payment Terminals / Create | Yes |
| GET | `/public-api/resources/payment-terminals/v1.0/{paymentTerminal}` | Payment Terminals / Read | Yes |
| PATCH | `/public-api/resources/payment-terminals/v1.0/{paymentTerminal}` | Payment Terminals / Update | Yes |
| DELETE | `/public-api/resources/payment-terminals/v1.0/{paymentTerminal}` | Payment Terminals / Delete | Yes |
| GET | `/public-api/resources/payment-terminals/v1.1` | Payment Terminals / Listing | No |
| POST | `/public-api/resources/payment-terminals/v1.1` | Payment Terminals / Create | No |
| GET | `/public-api/resources/payment-terminals/v1.1/{paymentTerminal}` | Payment Terminals / Read | No |
| PATCH | `/public-api/resources/payment-terminals/v1.1/{paymentTerminal}` | Payment Terminals / Update | No |
| DELETE | `/public-api/resources/payment-terminals/v1.1/{paymentTerminal}` | Payment Terminals / Delete | No |

## resource / provisioning certificate

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| POST | `/public-api/resources/provisioning-certificates/v2.0` | Provisioning Certificate / Create | No |
| GET | `/public-api/resources/provisioning-certificates/v2.0` | Provisioning Certificate / Listing | No |
| PATCH | `/public-api/resources/provisioning-certificates/v2.0/{provisioningCertificate}` | Provisioning Certificate / Update | No |
| GET | `/public-api/resources/provisioning-certificates/v2.0/{provisioningCertificate}` | Provisioning Certificate / Read | No |
| DELETE | `/public-api/resources/provisioning-certificates/v2.0/{provisioningCertificate}` | Provisioning Certificates / Delete | No |

## resource / receipts

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/receipts/v2.0` | Receipts / Listing | No |
| GET | `/public-api/resources/receipts/v2.0/{receipt}` | Receipt / Read | No |

## resource / reservations

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/reservations/v1.0` | Reservations / Listing | No |
| GET | `/public-api/resources/reservations/v1.0/{reservation}` | Reservation / Read | No |

## resource / revenues & expenses

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/partner-expenses/v1.0` | Expenses / Listing | Yes |
| GET | `/public-api/resources/partner-expenses/v1.1` | Expenses / Listing | No |
| GET | `/public-api/resources/partner-revenues/v1.0` | Revenues / Listing | Yes |
| GET | `/public-api/resources/partner-revenues/v1.1` | Revenues / Listing | No |

## resource / rfids

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/rfid-tags/v1.0` | RFID Tags / Listing | Yes |
| POST | `/public-api/resources/rfid-tags/v1.0` | RFID Tag / Create | Yes |
| GET | `/public-api/resources/rfid-tags/v1.0/{rfidTag}` | RFID Tag / Read | Yes |
| PATCH | `/public-api/resources/rfid-tags/v1.0/{rfidTag}` | RFID Tag / Update | Yes |
| DELETE | `/public-api/resources/rfid-tags/v1.0/{rfidTag}` | RFID Tag / Delete | Yes |

## resource / roaming connections

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/roaming-connections/v2.0` | Roaming Connections / Listing | No |
| GET | `/public-api/resources/roaming-connections/v2.0/{roamingConnection}` | Roaming Connections / Read | No |

## resource / roaming operators

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/roaming-operators/v2.0` | Roaming Operators / Listing | No |
| GET | `/public-api/resources/roaming-operators/v2.0/{roamingOperator}` | Roaming Operator / Read | No |
| PATCH | `/public-api/resources/roaming-operators/v2.0/{roamingOperator}` | Roaming Operator / Update | No |
| GET | `/public-api/resources/roaming-operators/v2.0/{roamingOperator}/custom-tariff-filters` | Roaming Operators / Custom Tariff Filters / Listing | No |
| POST | `/public-api/resources/roaming-operators/v2.0/{roamingOperator}/custom-tariff-filters` | Roaming Operators / Custom Tariff Filters / Create | No |
| PUT | `/public-api/resources/roaming-operators/v2.0/{roamingOperator}/custom-tariff-filters/reorder` | Roaming Operators / Custom Tariff Filters / Reorder | No |
| GET | `/public-api/resources/roaming-operators/v2.0/{roamingOperator}/custom-tariff-filters/{customTariffFilter}` | Roaming Operators / Custom Tariff Filters / Read | No |
| PATCH | `/public-api/resources/roaming-operators/v2.0/{roamingOperator}/custom-tariff-filters/{customTariffFilter}` | Roaming Operators / Custom Tariff Filters / Update | No |
| DELETE | `/public-api/resources/roaming-operators/v2.0/{roamingOperator}/custom-tariff-filters/{customTariffFilter}` | Roaming Operators / Custom Tariff Filters / Delete | No |

## resource / roaming platforms

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/roaming-platforms/v1.0` | Roaming Platforms / Listing | Yes |
| GET | `/public-api/resources/roaming-platforms/v1.0/{roamingPlatform}` | Roaming Platform / Read | Yes |

## resource / roaming providers

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/roaming-providers/v2.0` | Roaming Providers / Listing | No |
| POST | `/public-api/resources/roaming-providers/v2.0` | Roaming Provider / Create | No |
| GET | `/public-api/resources/roaming-providers/v2.0/{roamingProvider}` | Roaming Provider / Read | No |
| PATCH | `/public-api/resources/roaming-providers/v2.0/{roamingProvider}` | Roaming Provider / Update | No |
| DELETE | `/public-api/resources/roaming-providers/v2.0/{roamingProvider}` | Roaming Provider / Delete | No |

## resource / roaming tariffs

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/roaming-tariffs/v2.0` | Roaming Tariffs / Listing | No |
| GET | `/public-api/resources/roaming-tariffs/v2.0/{roamingTariff}` | Roaming Tariff / Read | No |
| PATCH | `/public-api/resources/roaming-tariffs/v2.0/{roamingTariff}` | Roaming Tariff / Update | No |

## resource / security event logs

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/security-events-log/v2.0` | Security Events Logs / Listing | Yes |
| GET | `/public-api/resources/security-events-log/v2.0/{securityEventLog}` | Security Event Log / Read | Yes |

## resource / security events

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/security-events/v2.0` | Security Events / Listing | No |
| GET | `/public-api/resources/security-events/v2.0/{securityEvent}` | Security Event / Read | No |

## resource / sessions

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/sessions/v1.0` | Sessions / Listing | No |
| GET | `/public-api/resources/sessions/v1.0/{session}` | Session / Read | No |
| GET | `/public-api/resources/sessions/v1.0/{session}/consumption-stats` | Sessions / Consumption Stats / Read | No |

## resource / settings

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/settings/v1.0` | Settings / Listing | No |

## resource / sub operators

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/sub-operators/v1.0` | Sub operators / Listing | No |
| GET | `/public-api/resources/sub-operators/v1.0/{subOperator}` | Sub operator / Read | No |
| GET | `/public-api/resources/sub-operators/v2.0/{subOperator}/notes` | Sub Operator / Notes / Listing | No |
| POST | `/public-api/resources/sub-operators/v2.0/{subOperator}/notes` | Sub Operator / Note / Create | No |
| GET | `/public-api/resources/sub-operators/v2.0/{subOperator}/notes/{note}` | Sub Operator / Note / Read | No |
| PATCH | `/public-api/resources/sub-operators/v2.0/{subOperator}/notes/{note}` | Sub Operator / Note / Update | No |
| DELETE | `/public-api/resources/sub-operators/v2.0/{subOperator}/notes/{note}` | Sub Operator / Note / Delete | No |

## resource / subscription-plans

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/subscription-plans/v1.0` | Subscription Plans / Listing | Yes |
| GET | `/public-api/resources/subscription-plans/v2.0` | Subscription plans / Listing | No |
| POST | `/public-api/resources/subscription-plans/v2.0` | Subscription plan / Create | No |
| GET | `/public-api/resources/subscription-plans/v2.0/{subscriptionPlan}` | Subscription plan / Read | No |
| PATCH | `/public-api/resources/subscription-plans/v2.0/{subscriptionPlan}` | Subscription plan / Update | No |
| DELETE | `/public-api/resources/subscription-plans/v2.0/{subscriptionPlan}` | Subscription plan / Delete | No |

## resource / subscriptions

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/subscriptions/v1.0` | Subscriptions / Listing | No |
| GET | `/public-api/resources/subscriptions/v1.0/{subscription}` | Subscription / Read | No |

## resource / tariffs

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/tariff-groups/v1.0` | Tariff Groups / Listing | No |
| POST | `/public-api/resources/tariff-groups/v1.0` | Tariff Group / Create | No |
| GET | `/public-api/resources/tariff-groups/v1.0/{tariffGroup}` | Tariff Group / Read | No |
| PUT | `/public-api/resources/tariff-groups/v1.0/{tariffGroup}` | Tariff Group / Update | No |
| DELETE | `/public-api/resources/tariff-groups/v1.0/{tariffGroup}` | Tariff Group / Delete | No |
| GET | `/public-api/resources/tariff-snapshots/v1.0/{tariffSnapshot}` | Tariff Snapshot / Read | No |
| GET | `/public-api/resources/tariffs/v1.0` | Tariffs / Listing | No |
| POST | `/public-api/resources/tariffs/v1.0` | Tariff / Create | No |
| GET | `/public-api/resources/tariffs/v1.0/{tariff}` | Tariff / Read | No |
| PUT | `/public-api/resources/tariffs/v1.0/{tariff}` | Tariff / Update | No |
| DELETE | `/public-api/resources/tariffs/v1.0/{tariff}` | Tariff / Delete | No |

## resource / tax identification numbers

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/tax-identification-numbers/v2.0` | Tax Identification Numbers / Listing | No |
| POST | `/public-api/resources/tax-identification-numbers/v2.0` | Tax Identification Number / Create | No |
| GET | `/public-api/resources/tax-identification-numbers/v2.0/{taxIdentificationNumber}` | Tax Identification Number / Read | No |
| PATCH | `/public-api/resources/tax-identification-numbers/v2.0/{taxIdentificationNumber}` | Tax Identification Number / Update | No |
| DELETE | `/public-api/resources/tax-identification-numbers/v2.0/{taxIdentificationNumber}` | Tax Identification Number / Delete | No |

## resource / taxes

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/taxes/v2.0` | Taxes / Listing | No |
| POST | `/public-api/resources/taxes/v2.0` | Tax / Create | No |
| GET | `/public-api/resources/taxes/v2.0/{tax}` | Tax / Read | No |
| PATCH | `/public-api/resources/taxes/v2.0/{tax}` | Tax / Update | No |
| DELETE | `/public-api/resources/taxes/v2.0/{tax}` | Tax / Delete | No |

## resource / templates

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/templates/v1.0` | Templates / Listing | No |

## resource / terms and policies

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/terms-and-policies/v2.0` | Terms and policies / Listing | No |
| GET | `/public-api/resources/terms-and-policies/v2.0/{termVersion}` | Terms and policies / Read | No |

## resource / top-up packages

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/top-up-packages/v2.0` | Top-Up Packages / Listing | No |
| POST | `/public-api/resources/top-up-packages/v2.0` | Top-Up Package / Create | No |
| GET | `/public-api/resources/top-up-packages/v2.0/{topUpPackage}` | Top-Up Package / Read | No |
| PATCH | `/public-api/resources/top-up-packages/v2.0/{topUpPackage}` | Top-Up Package / Update | No |
| DELETE | `/public-api/resources/top-up-packages/v2.0/{topUpPackage}` | Top-Up Package / Delete | No |

## resource / transactions

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/transactions/v1.0` | Transactions / Listing | No |
| POST | `/public-api/resources/transactions/v1.0` | Transactions / Create | No |
| GET | `/public-api/resources/transactions/v1.0/{transaction}` | Transaction / Read | No |
| PATCH | `/public-api/resources/transactions/v1.0/{transaction}` | Transaction / Update | No |

## resource / user-groups

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/user-groups/v1.0` | User Groups / Listing | No |
| POST | `/public-api/resources/user-groups/v1.0` | User Group / Create | No |
| GET | `/public-api/resources/user-groups/v1.0/{userGroup}` | User Group / Read | No |
| PATCH | `/public-api/resources/user-groups/v1.0/{userGroup}` | User Group / Update | No |
| DELETE | `/public-api/resources/user-groups/v1.0/{userGroup}` | User Group / Delete | No |

## resource / users

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/users/v1.0` | Users / Listing | Yes |
| POST | `/public-api/resources/users/v1.0` | User / Create | Yes |
| GET | `/public-api/resources/users/v1.0/{user}` | User / Read | Yes |
| PATCH | `/public-api/resources/users/v1.0/{user}` | User / Update | Yes |
| DELETE | `/public-api/resources/users/v1.0/{user}` | User / Delete | Yes |
| GET | `/public-api/resources/users/v1.0/{user}/invoice-details` | Invoice details / Read | No |
| POST | `/public-api/resources/users/v1.0/{user}/invoice-details` | Invoice details / Create or update | No |
| GET | `/public-api/resources/users/v1.0/{user}/payment-methods` | Payment Methods / Listing | No |
| POST | `/public-api/resources/users/v1.0/{user}/payment-methods` | Payment Method / Create | No |
| GET | `/public-api/resources/users/v1.0/{user}/payment-methods/{paymentMethodId}` | Payment Method / Read | No |
| PATCH | `/public-api/resources/users/v1.0/{user}/payment-methods/{paymentMethodId}` | Payment Method / Update | No |
| DELETE | `/public-api/resources/users/v1.0/{user}/payment-methods/{paymentMethodId}` | Payment Method / Delete | No |
| GET | `/public-api/resources/users/v1.1` | Users / Listing | No |
| POST | `/public-api/resources/users/v1.1` | User / Create | No |
| GET | `/public-api/resources/users/v1.1/{user}` | User / Read | No |
| PATCH | `/public-api/resources/users/v1.1/{user}` | User / Update | No |
| DELETE | `/public-api/resources/users/v1.1/{user}` | User / Delete | No |

## resource / utilities

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/utilities/v1.0` | Utilities / Listing | No |
| POST | `/public-api/resources/utilities/v1.0` | Utilities / Create | No |
| GET | `/public-api/resources/utilities/v1.0/{utility}` | Utilities / Read | No |
| PUT | `/public-api/resources/utilities/v1.0/{utility}` | Utilities / Update | No |
| DELETE | `/public-api/resources/utilities/v1.0/{utility}` | Utilities / Delete | No |

## resource / vendor error codes

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/vendor-error-codes/v2.0` | Vendor Error Codes / Listing | No |
| POST | `/public-api/resources/vendor-error-codes/v2.0` | Vendor Error Code / Create | No |
| GET | `/public-api/resources/vendor-error-codes/v2.0/{vendorErrorCode}` | Vendor Error Code / Read | No |
| PATCH | `/public-api/resources/vendor-error-codes/v2.0/{vendorErrorCode}` | Vendor Error Code / Update | No |
| DELETE | `/public-api/resources/vendor-error-codes/v2.0/{vendorErrorCode}` | Vendor Error Code / Delete | No |

## resource / vouchers

| Method | Path | Summary | Deprecated |
|--------|------|---------|------------|
| GET | `/public-api/resources/vouchers/v2.0` | Vouchers / Listing | Yes |
| POST | `/public-api/resources/vouchers/v2.0` | Voucher / Create | Yes |
| GET | `/public-api/resources/vouchers/v2.0/{voucher}` | Voucher / Read | Yes |
| PATCH | `/public-api/resources/vouchers/v2.0/{voucher}` | Voucher / Update | Yes |
| DELETE | `/public-api/resources/vouchers/v2.0/{voucher}` | Voucher / Delete | Yes |
| GET | `/public-api/resources/vouchers/v2.1` | Vouchers / Listing | No |
| POST | `/public-api/resources/vouchers/v2.1` | Voucher / Create | No |
| GET | `/public-api/resources/vouchers/v2.1/{voucher}` | Voucher / Read | No |
| PATCH | `/public-api/resources/vouchers/v2.1/{voucher}` | Voucher / Update | No |
| DELETE | `/public-api/resources/vouchers/v2.1/{voucher}` | Voucher / Delete | No |

