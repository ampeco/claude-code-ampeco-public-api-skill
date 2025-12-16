# Request Body Schemas Index

Auto-generated from AMPECO Public API spec v3.110.0

This document contains the request body schemas for POST (CREATE) and PUT/PATCH (UPDATE) endpoints.

---

## POST /public-api/actions/charge-point/v1.0/{chargePoint}/change-availability

**Summary**: Charge Point / Change Availability

**Request Body Schema**:

**Properties**:

- `evseNetworkId` (integer): The id of the connector for which availability needs to change. If missing the availability of the Charge Point and all its connectors needs to change.
- `type` (string): the type of availability change that the Charge Point should perform
* `Inoperative` Charge point is not available for charging.
* `Operative` Charge point is available for charging.


**Required**: type

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/change-owner

**Summary**: Charge Point / Change Owner

**Request Body Schema**:

**Properties**:

- `userId` (integer) (nullable): This User would become the owner of the personal charge point. If left empty - no Owner would be assigned.

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/clear-charging-profile

**Summary**: Charge Point / Clear Charging Profile

**Request Body Schema**:

**Properties**:

- `id` (number): The ID of the charging profile to clear.
- `evseNetworkId` (string): Specifies the ID of the connector for which to clear charging profiles. A connectorId of zero (0) specifies the charging profile for the overall Charge Point. Absence of this parameter means the clearing applies to all charging profiles that match the other criteria in the request.
- `chargingProfilePurpose` (string): Specifies to purpose of the charging profiles that will be cleared, if they meet the other criteria in the request.
- `stackLevel` (number): Specifies the stackLevel for which charging profiles will be cleared, if they meet the other criteria in the request.

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/disconnect

**Summary**: Charge Point / Disconnect

**Request Body Schema**:

**Properties**:

- `reason` (string): Human-readable reason for disconnecting the charge point. Used for audit logging purposes.

**Required**: reason

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/get-diagnostics

**Summary**: Charge Point / Get Diagnostics

**Request Body Schema**:

**Properties**:

- `location` (string): FTP address to upload the diagnostics to
- `start` (string): Only get diagnostics that are created after this date-time
- `stop` (string): Only get diagnostics that are created before that date-time

**Required**: location

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/get-security-log

**Summary**: Charge Point / Get Security Log

**Request Body Schema**:

**Properties**:

- `url` (string): The URL of the location at the remote system where the log should be stored.
- `reason` (string): Reason kept in the action logs for future reference.
- `retries` (integer): This specifies how many times the Charge Point must try to upload the log before giving up. If this field is not present, it is left to Charge Point to decide how many times it wants to retry.
- `interval` (integer): The interval in seconds after which a retry may be attempted. If this field is not present, it is left to Charge Point to decide how long to wait between attempts.
- `startTime` (string): This contains the date and time of the oldest logging information to include in the diagnostics. Please provide the value in the following format `Y-m-d H:i:s`.
- `stopTime` (string): This contains the date and time of the latest logging information to include in the diagnostics. Please provide the value in the following format `Y-m-d H:i:s`.

**Required**: url, reason

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/move-evses-to-satellite

**Summary**: Charge Point / Move EVSEs to Satellite

**Request Body Schema**:

**Properties**:

- `satelliteChargePointId` (integer)
- `evseIds` (array)

**Required**: satelliteChargePointId, evseIds

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/reserve/{evse}

**Summary**: Charge Point / Reserve

**Request Body Schema**:

**Properties**:

- `userId` (integer)
- `reason` (string): In case reason is empty, following text "Activated via API" will be added automatically

**Required**: userId

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/send-data-transfer

**Summary**: Charge Point / Send Data Transfer

**Request Body Schema**:

**Properties**:

- `vendorId` (string): The identifier of the vendor specific implementation.
- `messageId` (string) (nullable): Additional identification field.
- `data` (string) (nullable): Data without specified length or format

**Required**: vendorId

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/set-charging-profile/{evseNetworkId}

**Summary**: Charge Point / Set Charging Profile

**Request Body Schema**:

**Properties**:

- `transactionId` (integer)
- `stackLevel` (integer)
- `chargingProfilePurpose` (string)
- `chargingProfileKind` (string)
- `recurrencyKind` (string)
- `validFrom` (string)
- `validTo` (string)
- `chargingSchedule` (object)
  - `chargingSchedule.id` (number) (nullable)
- `chargingSchedule` (object)
  - `chargingSchedule.duration` (integer)
- `chargingSchedule` (object)
  - `chargingSchedule.startSchedule` (string)
- `chargingSchedule` (object)
  - `chargingSchedule.chargingRateUnit` (string)
- `chargingSchedule` (object)
  - `chargingSchedule.chargingSchedulePeriod` (array)
- `chargingSchedule` (object)
  - `chargingSchedule.minChargingRate` (number)

**Required**: stackLevel, chargingProfilePurpose, chargingProfileKind, chargingSchedule

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/start/{evse}

**Summary**: Charge Point / Start Charging Session

**Request Body Schema**:

**Properties**:

- `userId` (integer)
- `paymentMethodId` (string) (nullable): The ID of the payment method, as returned by the payment method listing (User / Payment Method / Listing). When left empty or null, it would be determined by the system - either "balance" or "subscription" (in case the the user has an active post-paid subscription for home charging sessions and the charge point is a home charger). When it is NOT empty or null, userId is required.
- `externalSessionId` (string) (nullable): Deprecated: This field will be removed in version 2.0. Use `idTag` parameter instead.

Migration: Replace all occurrences of `externalSessionId` with `idTag` in your start session requests.
The `idTag` parameter serves the same purpose and stores the value in the session's `idTag` field.

Backward compatibility: When both `externalSessionId` and `idTag` are provided, `idTag` takes precedence.

- `idTag` (string): Optional identifier tag for the charging session (e.g., RFID UID, authorization token).
This value will be stored in the session's `idTag` field and can be used for filtering sessions.

- `connectorId` (integer) (nullable)
- `bookingId` (integer) (nullable): The ID of the booking to link the session to. Returns a 422 error if the booking does not exist or if its status is not Accepted or Reserved.
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.transactionId` (integer)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.stackLevel` (integer)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingProfilePurpose` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingProfileKind` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.recurrencyKind` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.validFrom` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.validTo` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.id` (number) (nullable)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.duration` (integer)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.startSchedule` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.chargingRateUnit` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.chargingSchedulePeriod` (array)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.minChargingRate` (number)

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/start

**Summary**: Charge Point / Start Charging Session Without EVSE

**Request Body Schema**:

**Properties**:

- `userId` (integer)
- `paymentMethodId` (string) (nullable): The ID of the payment method, as returned by the payment method listing (User / Payment Method / Listing). When left empty or null, it would be determined by the system - either "balance" or "subscription" (in case the the user has an active post-paid subscription for home charging sessions and the charge point is a home charger). When it is NOT empty or null, userId is required.
- `externalSessionId` (string) (nullable): Deprecated: This field will be removed in version 2.0. Use `idTag` parameter instead.

Migration: Replace all occurrences of `externalSessionId` with `idTag` in your start session requests.
The `idTag` parameter serves the same purpose and stores the value in the session's `idTag` field.

Backward compatibility: When both `externalSessionId` and `idTag` are provided, `idTag` takes precedence.

- `idTag` (string): Optional identifier tag for the charging session (e.g., RFID UID, authorization token).
This value will be stored in the session's `idTag` field and can be used for filtering sessions.

- `connectorId` (integer) (nullable)
- `bookingId` (integer) (nullable): The ID of the booking to link the session to. Returns a 422 error if the booking does not exist or if its status is not Accepted or Reserved.

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/stop/{session}

**Summary**: Charge Point / Stop Charging Session

**Request Body Schema**:

**Properties**:

- `force` (boolean): Use force=true when you want to end the session reguardless of the CP response

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/sync-configuration

**Summary**: Charge Point / Sync Configuration

**Request Body Schema**:

**Properties**:

- `keys` (array): List of keys to request a get configuration for. Omit or pass empty array to request all available configuration keys.

---


## POST /public-api/actions/charge-point/v1.0/{chargePoint}/trigger-message

**Summary**: Charge Point / Trigger Message Charge Point

**Request Body Schema**:

**Properties**:

- `type` (string): The type of the message to be triggered. Messages available only for 2.0.1 chargers - LogStatusNotification, PublishFirmwareStatusNotification, SignChargingStationCertificate, SignCombinedCertificate, TransactionEvent

**Required**: type

---


## POST /public-api/actions/charge-point/v2.0/{chargePoint}/change-sharing-code

**Summary**: Charge Point / Change sharing code

**Request Body Schema**:

**Properties**:

- `sharingCode` (string): The sharing code which provides access to the personal charge point for other users aside from the owner. If left empty the current code will be deleted

---


## POST /public-api/actions/charge-point/v2.0/{chargePoint}/delete-certificate

**Summary**: Charge Point / Delete Certificate

**Request Body Schema**:

**Properties**:

- `certificateType` (string): Indicates the type of certificate that is to be installed on the CP.

**Required**: certificateType

---


## POST /public-api/actions/charge-point/v2.0/{chargePoint}/install-certificate

**Summary**: Charge Point / Install Certificate

**Request Body Schema**:

**Properties**:

- `certificateType` (string): Indicates the type of certificate that is to be installed on the CP.

**Required**: certificateType

---


## POST /public-api/actions/charge-point/v2.0/{chargePoint}/set-configuration

**Summary**: Charge Point / Set Configuration

**Request Body Schema**:

**Properties**:

- `value` (string): Value to be assigned to specific configuration key
- `name` (string): Name of the variable of the configuration key
- `instance` (string): Specify instance for OCPP 2.0.1 configuration keys
- `componentName` (string): Required in order to specify component name for OCPP 2.0.1 configuration keys
- `evseId` (integer): ID of the EVSE. Only for OCPP 2.0.1 configuration keys

**Required**: value, name

---


## POST /public-api/actions/charge-point/v2.0/{chargePoint}/set-security-profile

**Summary**: Charge Point / Set Security Profile

**Request Body Schema**:

**Properties**:

- `setSecurityProfile` (integer): Target security profile level:
- 1: Unsecured transport with basic authentication (plain-text authentication)
- 2: TLS with basic authentication (encrypted authentication)

- `reason` (string): Free text reason for changing the security profile

**Required**: setSecurityProfile, reason

---


## POST /public-api/actions/charge-point/v2.0/{chargePoint}/sync-certificates

**Summary**: Charge Point / Get Installed Certificate IDs

**Request Body Schema**:

**Properties**:

- `certificateType` (string) (nullable): Indicates the type of certificates requested. Default value to be empty - the system should interpret the Null/empty value that all certificate types are requested.

---


## POST /public-api/actions/charge-point/v2.0/{chargePoint}/update-firmware

**Summary**: Charge Point / Update Firmware

**Request Body Schema**:

**Properties**:

- `url` (string): Location (URL) from which to retrieve the firmware. Either this or `firmwareVersionId` must be provided.
- `firmwareVersionId` (integer): ID of a Firmware Version. Either this or `url` must be provided.
- `retrieveAfter` (string): Specifies the date and time after which the Charge Point should retrieve the new firmware. If not provided, the current *datetime* will be used.
- `retries` (integer): Specifies how many times the Charge Point must try to retrieve the (new) firmware before giving up.
- `interval` (integer): The interval in seconds between each retry.
- `signed` (boolean): Indicates a Signed Firmware Update.
- `signingCertificate` (string): Required if "signed" is true.
- `signature` (string): Required if "signed" is true.
- `downloadUrlProtocol` (string): Protocol to use for the firmware download URL when using firmware repository. Use HTTP only if the charge point does not support encrypted connections.

**Required**: signed

---


## POST /public-api/actions/circuit/v2.0/{circuit}/attach-charge-point

**Summary**: Circuit / Attach Charge Point

**Request Body Schema**:

**Properties**:

- `chargePointId` (integer)
- `priority` (number)

**Required**: chargePointId

---


## POST /public-api/actions/circuit/v2.0/{circuit}/set-charge-point-priority/{chargePoint}/evse/{evse}

**Summary**: Circuit / Set Charge Point EVSE Priority

**Request Body Schema**:

**Properties**:

- `priority` (number)

**Required**: priority

---


## POST /public-api/actions/circuit/v2.0/{circuit}/set-charge-point-priority/{chargePoint}

**Summary**: Circuit / Set Charge Point Priority

**Request Body Schema**:

**Properties**:

- `priority` (number)

**Required**: priority

---


## POST /public-api/actions/circuit/v2.0/{circuit}/set-circuit-soc-priorities

**Summary**: Circuit / Set Circuit SoC Priority

**Request Body Schema**:

**Properties**:

- `upperThresholdPercent` (number) (nullable): The state of charge (SoC) percentage above which the `highSoCPriority` will be applied. Must have a 5% offset from the `lowerThresholdPercent` (if provided).
For example if `lowerThresholdPercent` is set to 50, this can have a value of 55 or higher.
Setting this to `null` will remove the usage of the `highSoCPriority`.

- `highSoCPriority` (number)
- `lowerThresholdPercent` (number) (nullable): The state of charge (SoC) percentage below which the `lowSoCPriority` will be applied. Must have a 5% offset from the `upperThresholdPercent` (if provided).
For example if `upperThresholdPercent ` is set to 50, this can have a value of 45 or lower.
Setting this to `null` will remove the usage of the `lowSoCPriority`.

- `lowSoCPriority` (number)

---


## POST /public-api/actions/circuit/v2.0/{circuit}/set-session-priority/{session}

**Summary**: Circuit / Set Session Priority

**Request Body Schema**:

**Properties**:

- `priority` (number)

**Required**: priority

---


## POST /public-api/actions/configuration-template/v1.0/{template}/apply-to-charge-points

**Summary**: Configuration Template / Apply to Charge Points

**Request Body Schema**:

**Properties**:

- `chargePointIds` (array): Array of charge point IDs the template will be applied to.
- `shouldPersist` (boolean): Specifies whether the configuration template will be enforced each time the charge point boots.

---


## POST /public-api/actions/configuration-template/v1.0/{template}/insert-bulk-variables

**Summary**: Configuration Template / Bulk Create Variables

**Request Body Schema**:

```json
{"type":"array","items":{"oneOf":[{"title":"Configuration variable for OCPP 1.6","required":["keyName","value"],"type":"object","additionalProperties":false,"properties":{"id":{"type":"integer","readOnly":true},"keyName":{"type":"string"},"value":{"type":"string"},"lastUpdatedAt":{"readOnly":true,"type":"string","format":"date-time","description":"ISO 8601 formatted date"}}},{"title":"Configuration variable for OCPP 2.0.1","required":["value","variableName","component"],"type":"object","description":"Represents a configuration variable based on the OCPP 2.0.1 specification.\nFields such as `variableName`, `variableType`, `variableInstance`, `component`,\n`componentInstance`, `evseId`, and `connectorId` directly correspond to the OCPP 2.0.1 protocol.\n","properties":{"id":{"type":"integer","readOnly":true},"value":{"type":"string"},"variableName":{"type":"string"},"variableType":{"type":"string","enum":["Actual","Target","MinSet","MaxSet"],"nullable":true},"variableInstance":{"type":"string","nullable":true},"component":{"type":"string"},"componentInstance":{"type":"string","nullable":true},"evseId":{"type":"integer","nullable":true},"connectorId":{"type":"integer","nullable":true},"lastUpdatedAt":{"readOnly":true,"type":"string","format":"date-time","description":"ISO 8601 formatted date"}}}]}}
```

---


## POST /public-api/actions/electricity-meter/v1.0/{electricityMeter}/report-consumption

**Summary**: Electricity Meter / Report Consumption

**Request Body Schema**:

**Properties**:

- `timestamp` (string): The timestamp of the measurements. ISO 8601 formatted date.
- `currentL1` (integer): The current on L1 in milliamperes (mA)
- `currentL2` (integer): The current on L2 in milliamperes (mA)
- `currentL3` (integer): The current on L3 in milliamperes (mA)

---


## POST /public-api/actions/evse/v1.0/bulk-assign-tariff-group

**Summary**: EVSEs / Bulk Assign Tariff Groups

**Request Body Schema**:

**Properties**:

- `filters` (object): Optional filters to select EVSEs for bulk update
  - `filters.locationIds` (array): Filter EVSEs by location IDs
- `filters` (object): Optional filters to select EVSEs for bulk update
  - `filters.partnerIds` (array): Filter EVSEs by partner IDs
- `filters` (object): Optional filters to select EVSEs for bulk update
  - `filters.evseIds` (array): Filter EVSEs by EVSE IDs
- `filters` (object): Optional filters to select EVSEs for bulk update
  - `filters.chargePointIds` (array): Filter EVSEs by Charge point IDs
- `filters` (object): Optional filters to select EVSEs for bulk update
  - `filters.tariffGroupIds` (array): Filter EVSEs by tariff group IDs
- `tariffGroupId` (integer) (nullable): The tariff group ID to assign (null to unassign)

**Required**: tariffGroupId

---


## POST /public-api/actions/evse/v1.0/{evse}/start

**Summary**: EVSE / Start Charging with EVSE ID

**Request Body Schema**:

**Properties**:

- `userId` (integer)
- `paymentMethodId` (string) (nullable): The ID of the payment method, as returned by the payment method listing (User / Payment Method / Listing). When left empty or null, it would be determined by the system - either "balance" or "subscription" (in case the the user has an active post-paid subscription for home charging sessions and the charge point is a home charger). When it is NOT empty or null, userId is required.
- `externalSessionId` (string) (nullable): Deprecated: This field will be removed in version 2.0. Use `idTag` parameter instead.

Migration: Replace all occurrences of `externalSessionId` with `idTag` in your start session requests.
The `idTag` parameter serves the same purpose and stores the value in the session's `idTag` field.

Backward compatibility: When both `externalSessionId` and `idTag` are provided, `idTag` takes precedence.

- `idTag` (string): Optional identifier tag for the charging session (e.g., RFID UID, authorization token).
This value will be stored in the session's `idTag` field and can be used for filtering sessions.

- `connectorId` (integer) (nullable)
- `bookingId` (integer) (nullable): The ID of the booking to link the session to. Returns a 422 error if the booking does not exist or if its status is not Accepted or Reserved.
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.transactionId` (integer)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.stackLevel` (integer)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingProfilePurpose` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingProfileKind` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.recurrencyKind` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.validFrom` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.validTo` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.id` (number) (nullable)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.duration` (integer)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.startSchedule` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.chargingRateUnit` (string)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.chargingSchedulePeriod` (array)
- `chargingProfile` (object): the smart charging profile to apply. See the OCPP documentation for further explanation on the fields
  - `chargingProfile.chargingSchedule` (object)
    - `chargingProfile.chargingSchedule.minChargingRate` (number)

---


## POST /public-api/actions/evse/v1.0/{evse}/trigger-message

**Summary**: EVSE / Trigger Message

**Request Body Schema**:

**Properties**:

- `type` (string): The type of the message to be triggered. Messages available only for 2.0.1 chargers - LogStatusNotification, PublishFirmwareStatusNotification, SignChargingStationCertificate, SignCombinedCertificate, TransactionEvent

**Required**: type

---


## POST /public-api/actions/flexibility-asset/v1.0/{flexibilityAsset}/change-status

**Summary**: Flexibility Asset / Change Status

**Request Body Schema**:

**Properties**:

- `status` (string)
- `endsAt` (string): ISO 8601 formatted date. If an end date is set the asset will be automatically disabled at that time. Historical time series and forecasts are not generated after the end date.

**Required**: status

---


## POST /public-api/actions/flexibility-asset/v1.0/{flexibilityAsset}/create-activation-request

**Summary**: Flexibility Asset / Create Activation Request

**Request Body Schema**:

**Properties**:

- `periods` (array)

---


## POST /public-api/actions/installer-job/v1.0/{installerJob}/assign-charge-points

**Summary**: Actions / Assign Charge Points

**Request Body Schema**:

**Properties**:

- `chargePointIds` (array): List of charge point IDs to be assigned to the installer job, if passed chargingZoneId and locationId will be ignored
- `chargingZoneId` (integer): The ID of the charging zone, if passed and chargePointIds are not provided, all the charge points in the specified charging zone will be assigned to the installer job and locationId will be ignored
- `locationId` (integer): The ID of the location, if passed and neither chargePointIds nor chargingZoneId are provided, all charge points in the specified location will be assigned to the installer job

---


## POST /public-api/actions/installer-job/v1.0/{installerJob}/change-status

**Summary**: Actions / Change Status

**Request Body Schema**:

**Properties**:

- `status` (string): The status of the installer job
- `outcomeDetails` (string): The outcome details of the installer job, ignored if the status is not "completed" or "failed"

**Required**: status

---


## POST /public-api/actions/locations/v2.0/{location}/check-booking-availability

**Summary**: Location / Check Booking Availability

**Request Body Schema**:

**Properties**:

- `startAfter` (string): Start of the time frame to check
- `endBefore` (string): End of the time frame to check. Time-frame is limited to 7 days.

**Required**: startAfter, endBefore

---


## POST /public-api/actions/notifications/v1.0/{notification}/resend

**Summary**: Notifications / Resend Failed

**Request Body Schema**:

**Properties**:

- `notifications` (array)
- `startTime` (string): Resend all failed notifications from this date onwards.
- `endTime` (string): Resend all failed notifications up to this date.

**Required**: notifications

---


## POST /public-api/actions/parking-spaces/v1.0/{parkingSpace}/update-occupancy-status

**Summary**: Parking Space / Update occupancy status

**Request Body Schema**:

**Properties**:

- `status` (string)

**Required**: status

---


## POST /public-api/actions/provisioning-certificate/v1.0/{provisioningCertificate}/issue-emaid

**Summary**: Certificate / Issue an EMAID

**Request Body Schema**:

**Properties**:

- `paymentMethod` (string): The payment method that will be associated with the EMAID Tag.
* For **credit/debit cards** the `paymentMethodId` should be provided
* For **Corporate billing** - `corporate:{id}`
* For **last used** the value should be `null`


---


## POST /public-api/actions/reservation/v1.0/{reservation}/cancel

**Summary**: Reservation / Cancel

**Request Body Schema**:

**Properties**:

- `force` (boolean): Use force=true when you want to end the reservation regardless of the CP response
- `reason` (string) (nullable): In case reason is empty, following text "Activated via API" will be added automatically

---


## POST /public-api/actions/roaming-operator/v2.0/{roamingOperator}/custom-tariff-filter/{customTariffFilter}/set-pricing-data

**Summary**: Custom Tariff Filters / Set Pricing Data

**Request Body Schema**:

**Properties**:

- `country_code` (string): ISO-3166 alpha-2 country code of the CPO that owns this Tariff.
- `party_id` (string): ID of the CPO that owns this Tariff (following the ISO-15118 standard).
- `id` (string): Uniquely identifies the tariff within the CPO's platform.
- `currency` (string): ISO 4217 code of the currency of this tariff.
- `type` (string): Type of this tariff.
- `tariff_alt_text` (array): List of multi-language alternative texts for this tariff.
- `tariff_alt_url` (string): URL to a web page that contains an explanation of the tariff information.
- `min_price` (object): Price with VAT excluded and included.
  - `min_price.excl_vat` (number): Price excluding VAT.
- `min_price` (object): Price with VAT excluded and included.
  - `min_price.incl_vat` (number): Price including VAT.
- `max_price` (object): Price with VAT excluded and included.
  - `max_price.excl_vat` (number): Price excluding VAT.
- `max_price` (object): Price with VAT excluded and included.
  - `max_price.incl_vat` (number): Price including VAT.
- `elements` (array): List of Tariff Elements.
- `start_date_time` (string): The time when this tariff becomes active. Format ISO 8601 UTC.
- `end_date_time` (string): The time after which this tariff is no longer valid. Format ISO 8601 UTC.
- `energy_mix` (object): Details about the energy mix.
  - `energy_mix.is_green_energy` (boolean): True if 100% from regenerative sources.
- `energy_mix` (object): Details about the energy mix.
  - `energy_mix.energy_sources` (array): Energy sources of this energy mix.
- `energy_mix` (object): Details about the energy mix.
  - `energy_mix.environ_impact` (array): Environmental impact of this energy mix.
- `energy_mix` (object): Details about the energy mix.
  - `energy_mix.supplier_name` (string): Name of the energy supplier.
- `energy_mix` (object): Details about the energy mix.
  - `energy_mix.energy_product_name` (string): Name of the energy product.
- `last_updated` (string): Timestamp when this Tariff was last updated. Format ISO 8601 UTC.

**Required**: id, currency, elements, last_updated

---


## POST /public-api/actions/session/v1.0/{session}/assign-user

**Summary**: Session / Assign to user

**Request Body Schema**:

**Properties**:

- `userId` (integer)

**Required**: userId

---


## POST /public-api/actions/session/v1.0/{session}/retry-payment

**Summary**: Session / Retry Payment

**Request Body Schema**:

**Properties**:

- `paymentMethodId` (integer) (nullable)

---


## POST /public-api/actions/subscription-plans/v1.0/{subscriptionPlan}/replace

**Summary**: Subscription plan / Replace

**Request Body Schema**:

**Properties**:

- `planId` (integer): The ID of the subscription plan that replaces the current one. The new Subscription plan will be added to the Subscription plans Restrictions for the Tariffs, where the old plan is present. Also it will be added to all Charge points that require the current Subscription plan.
- `replaceAt` (string) (nullable): The date from which the new Subscription Plan replaces the current one. If left empty, it is replaced immediately.
- `reason` (string): Internal note for tracking changes and the reasons for those changes.

**Required**: planId, reason

---


## POST /public-api/actions/tariffs/v2.0/{tariff}/set-tariff-display-information

**Summary**: Tariff / Set Display Information

**Request Body Schema**:

**Properties**:

- `defaultPriceInformation` (string) (nullable): It could be set only for base tariff. The default information that would be shown on the display of the charge point without the user having authorized themselves. The default price information from the base tariff of the first EVSE would be used for the display, when the charge point has more than one EVSE.
- `defaultPriceInformationOffline` (string) (nullable): It could be set only for base tariff. The information that would be shown on the display of the charge point when offline.
- `priceInformation` (string) (nullable): The information that would be shown on the display of the charge point for users that are eligible for this tariff.
- `totalCostInformation` (string) (nullable): Additional information that would be displayed on the charge point when the session ends, along with the total fees for energy, duration and idle.

---


## POST /public-api/actions/transactions/v1.0/{transaction}/issue-invoice

**Summary**: Transaction / Issue Invoice

**Request Body Schema**:

**Properties**:

- `email` (string): Email address to send the invoice
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.invoiceType` (string)
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.individualName` (string)
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.individualPersonalId` (string)
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.individualTaxId` (string)
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.companyName` (string)
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.companyRegNo` (string)
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.companyTaxId` (string)
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.companyTaxAdministrationOfficeName` (string)
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.country` (string)
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.city` (string)
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.postCode` (string)
- `invoiceDetails` (object): Create user invoice details
  - `invoiceDetails.address` (string)

**Required**: email, invoiceDetails

---


## POST /public-api/actions/transactions/v1.0/{transaction}/update-payment-reference

**Summary**: Transaction / Update Payment Reference

**Request Body Schema**:

**Properties**:

- `ref` (string): Reference to the payment processor or payment terminal where more information about the transaction could be checked.

**Required**: ref

---


## POST /public-api/actions/users/v1.0/{user}/activate-subscription

**Summary**: User / Activate subscription

**Request Body Schema**:

**Properties**:

- `planId` (integer)
- `endDate` (string) (nullable): The subscription will be valid until this end date
- `autoRenewal` (boolean): Enable the auto-renewal of the subscription after the end date
- `reason` (string) (nullable): In case reason is empty, following text "Activated via API" will be added automatically

**Required**: planId

---


## POST /public-api/actions/users/v1.0/{user}/add-balance

**Summary**: User / Add Balance

**Request Body Schema**:

**Properties**:

- `amount` (number)
- `reason` (string)
- `app_info` (string)

**Required**: amount, reason

---


## POST /public-api/actions/users/v1.0/{user}/apply-custom-fee

**Summary**: User / Apply Custom Fee

**Request Body Schema**:

**Properties**:

- `amount` (number)
- `description` (string): Shown to the user and also added to the user's bank statement (if the payment method is a bank card).
- `paymentMethodId` (string) (nullable): The ID of the payment method, as returned by the payment method listing (User / Payment Method / Listing). When left empty or null, it would take the balance and if the balance is insufficient, would reject the action. Corporate billing is not supported as a payment method.

**Required**: amount, description

---


## POST /public-api/actions/users/v1.0/{user}/cancel-subscription

**Summary**: User / Cancel subscription

**Request Body Schema**:

**Properties**:

- `reason` (string): The reason for the cancellation. It would be included in the Audit logs.

**Required**: reason

---


## POST /public-api/actions/users/v1.0/{user}/change-status

**Summary**: User / Change Status

**Request Body Schema**:

**Properties**:

- `status` (string): * `enabled` Enabled - the user is allowed to use the system
* `disabled` Disabled - the user is NOT allowed to use the system

- `reason` (string)

**Required**: status, reason

---


## POST /public-api/actions/users/v2.0/{user}/redeem-voucher

**Summary**: User / Redeem Voucher

**Request Body Schema**:

**Properties**:

- `code` (string): The code of the voucher that should be redeemed.

**Required**: code

---


## PUT /public-api/notifications/v1.0/{notification}

**Summary**: Notifications / Update

**Request Body Schema**:

**Properties**:

- `notifications` (array)
- `callbackUrl` (string)

**Required**: callbackUrl, notifications

---


## POST /public-api/notifications/v1.0

**Summary**: Notifications / Subscribe

**Request Body Schema**:

**Properties**:

- `notifications` (array)
- `callbackUrl` (string)

**Required**: callbackUrl, notifications

---


## PUT /public-api/notifications/v2.0/{notification}

**Summary**: Notifications / Update

**Request Body Schema**:

**Properties**:

- `id` (number) (read-only)
- `via` (string)
- `notifications` (array)
- `webhook` (object): Webhook configuration. Only present and required in case via = webhook
  - `webhook.callbackUrl` (string)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.topic` (string)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.brokers` (array)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.compressionCodec` (string)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.securityProtocol` (string)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.saslMechanism` (string) (nullable)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.saslUsername` (string) (nullable)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.saslPassword` (string) (nullable)

**Required**: id, notifications, via

---


## POST /public-api/notifications/v2.0

**Summary**: Notifications / Subscribe

**Request Body Schema**:

**Properties**:

- `id` (number) (read-only)
- `via` (string)
- `notifications` (array)
- `webhook` (object): Webhook configuration. Only present and required in case via = webhook
  - `webhook.callbackUrl` (string)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.topic` (string)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.brokers` (array)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.compressionCodec` (string)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.securityProtocol` (string)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.saslMechanism` (string) (nullable)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.saslUsername` (string) (nullable)
- `kafka` (object): Kafka configuration. Only present and required in case via = kafka
  - `kafka.saslPassword` (string) (nullable)

**Required**: id, notifications, via

---


## POST /public-api/resources/booking-requests/v1.0

**Summary**: Booking Request / Create

**Request Body Schema**:

**Note**: This schema uses `anyOf` (multiple possible structures).

```json
{"anyOf":[{"title":"Create Booking Request Input","description":"Input schema for creating a booking request","allOf":[{"title":"Create Booking Base","description":"Base properties for create booking request (shared between input and response)","allOf":[{"type":"object","properties":{"id":{"type":"integer","description":"System-generated unique identifier","readOnly":true},"type":{"type":"string","description":"Type of booking request"},"status":{"type":"string","enum":["pending","approved","rejected"],"readOnly":true,"description":"Status of booking request:\n- **pending**: Request is awaiting processing\n- **approved**: Request has been approved\n- **rejected**: Request has been rejected\n"},"rejectionReason":{"type":"string","description":"Human-readable reason for rejection.\n\nResponse behavior: Only present when status is \"rejected\". Omitted for \"pending\" and \"approved\" requests.\n","readOnly":true},"createdAt":{"type":"string","format":"date-time","readOnly":true},"lastUpdatedAt":{"type":"string","format":"date-time","readOnly":true}}},{"type":"object","properties":{"type":{"type":"string","enum":["create"],"description":"Type of booking request - must be \"create\""},"userId":{"type":"integer","description":"ID of the user for whom the booking is made"},"locationId":{"type":"integer","description":"ID of the target location"},"externalId":{"type":"string","maxLength":255,"description":"External identifier from roaming partner (e.g., OCPI request_id).\n\nResponse behavior: Only present when an external ID was provided. Omitted when not specified.\n"},"startAt":{"type":"string","format":"date-time","description":"Start time of the booking"},"endAt":{"type":"string","format":"date-time","description":"End time of the booking"},"evseId":{"type":"integer","description":"Specific EVSE ID to book.\n\nResponse behavior: Only present when a specific EVSE was requested. Omitted when EVSE selection was based on criteria or left to the system.\n"},"evseCriteria":{"type":"object","description":"Criteria for automatic EVSE selection based on technical requirements. Ignored when evseId is explicitly provided.\n\nResponse behavior: Only present when EVSE criteria were specified in the request. Omitted when evseId was provided or no criteria were specified.\n","properties":{"currentType":{"type":"string","allOf":[{"type":"string","enum":["ac","dc"],"description":"Type of current available on the EVSE:\n- **ac**: Alternating Current (AC) charging\n- **dc**: Direct Current (DC) fast charging\n"}],"nullable":true,"description":"Required current type (AC or DC). Omitted in response when not specified."},"minPower":{"type":"number","description":"Minimum power requirement in kW. Omitted in response when not specified."},"maxPower":{"type":"number","description":"Maximum power requirement in kW. Omitted in response when not specified."},"connectorType":{"type":"string","allOf":[{"type":"string","enum":["type1","type2","type3","chademo","ccs1","ccs2","schuko","nacs","cee16","cee32","j1772","inductive","nema-5-20","type-e-french","type-g-british","type-j-swiss","avcon","gb-t-ac","gb-t-dc","chaoji","nema-6-30","nema-6-50"],"description":"Type of connector available on the EVSE:\n- **type1**: Type 1 connector (SAE J1772 AC)\n- **type2**: Type 2 connector (IEC 62196-2 AC)\n- **type3**: Type 3 connector (IEC 62196-2 AC)\n- **chademo**: CHAdeMO DC fast charging\n- **ccs1**: Combined Charging System 1 (CCS1/Combo 1)\n- **ccs2**: Combined Charging System 2 (CCS2/Combo 2)\n- **schuko**: Standard European household socket\n- **nacs**: North American Charging Standard (Tesla)\n- **cee16**: CEE 16A industrial connector\n- **cee32**: CEE 32A industrial connector\n- **j1772**: SAE J1772 connector\n- **inductive**: Inductive/wireless charging\n- **nema-5-20**: Domestic M NEMA 5-20 Socket\n- **type-e-french**: French Type E socket\n- **type-g-british**: British Type G socket\n- **type-j-swiss**: Swiss Type J socket\n- **avcon**: AVCON connector (Australian standard)\n- **gb-t-ac**: GB/T AC connector (Chinese standard)\n- **gb-t-dc**: GB/T DC connector (Chinese standard)\n- **chaoji**: ChaoJi (CHAdeMO 3.0)\n- **nema-6-30**: NEMA 6-30\n- **nema-6-50**: NEMA 6-50\n"}],"nullable":true,"description":"Required connector type. Omitted in response when not specified."}}},"parkingSpaceCriteria":{"type":"object","description":"Parking space criteria for selecting EVSE with suitable parking.\n\nResponse behavior: This property is only included in the response when parking criteria were specified in the request. If no criteria were provided, this property is omitted entirely.\n","properties":{"vehicleWeightKg":{"type":"integer","description":"Vehicle weight in kilograms. Omitted in response when not specified.","minimum":1},"vehicleHeightCm":{"type":"integer","description":"Vehicle height in centimeters. Omitted in response when not specified.","minimum":1},"vehicleLengthCm":{"type":"integer","description":"Vehicle length in centimeters. Omitted in response when not specified.","minimum":1},"vehicleWidthCm":{"type":"integer","description":"Vehicle width in centimeters. Omitted in response when not specified.","minimum":1},"vehicleType":{"type":"string","allOf":[{"type":"string","enum":["two_and_three_wheel_vehicles_and_quadricycles","passenger_vehicles","passenger_vehicles_with_trailer","light_duty_vans","heavy_duty_tractor_units_without_trailer","heavy_duty_trucks_without_articulation_point","heavy_duty_trucks_with_trailer_attached","buses_or_motor_coaches"],"description":"Type of vehicle that can use the parking space:\n- **two_and_three_wheel_vehicles_and_quadricycles**: Motorcycles, scooters, and similar\n- **passenger_vehicles**: Standard cars\n- **passenger_vehicles_with_trailer**: Cars with trailers attached\n- **light_duty_vans**: Small commercial vans\n- **heavy_duty_tractor_units_without_trailer**: Heavy trucks without trailer\n- **heavy_duty_trucks_without_articulation_point**: Heavy trucks without articulation\n- **heavy_duty_trucks_with_trailer_attached**: Heavy trucks with trailer\n- **buses_or_motor_coaches**: Buses and coaches\n"}],"nullable":true,"description":"Required vehicle type. Omitted in response when not specified."},"driveThroughRequired":{"type":"boolean","description":"Whether parking space must support drive-through charging. Omitted in response when not specified."},"refrigerationOutletRequired":{"type":"boolean","description":"Whether parking space must have refrigeration outlet. Omitted in response when not specified."},"dangerousGoodsAllowed":{"type":"boolean","description":"Whether parking space must allow dangerous goods vehicles. Omitted in response when not specified."}}}},"required":["type","userId","locationId","startAt","endAt"]}]},{"type":"object","properties":{"authorizedTokenIds":{"type":"array","items":{"type":"integer"},"description":"Array of OCPI token IDs that are authorized for this booking. Multiple tokens allow flexibility for roaming users who may have multiple valid authentication methods (e.g., RFID card and mobile app token). When omitted, the booking will not have specific token authorization."}}}]},{"title":"Update Booking Request Input","description":"Input schema for updating a booking request","allOf":[{"title":"Update Booking Base","description":"Base properties for update booking request (shared between input and response)","allOf":[{"type":"object","properties":{"id":{"type":"integer","description":"System-generated unique identifier","readOnly":true},"type":{"type":"string","description":"Type of booking request"},"status":{"type":"string","enum":["pending","approved","rejected"],"readOnly":true,"description":"Status of booking request:\n- **pending**: Request is awaiting processing\n- **approved**: Request has been approved\n- **rejected**: Request has been rejected\n"},"rejectionReason":{"type":"string","description":"Human-readable reason for rejection.\n\nResponse behavior: Only present when status is \"rejected\". Omitted for \"pending\" and \"approved\" requests.\n","readOnly":true},"createdAt":{"type":"string","format":"date-time","readOnly":true},"lastUpdatedAt":{"type":"string","format":"date-time","readOnly":true}}},{"type":"object","properties":{"type":{"type":"string","enum":["update"],"description":"Type of booking request - must be \"update\""},"bookingId":{"type":"integer","description":"ID of the target booking to update"},"userId":{"type":"integer","description":"ID of the user for whom the booking is made"},"externalId":{"type":"string","maxLength":255,"description":"External identifier from roaming partner (e.g., OCPI request_id).\n\nResponse behavior: Only present when an external ID was provided. Omitted when not specified.\n"},"startAt":{"type":"string","format":"date-time","description":"Updated start time of the booking"},"endAt":{"type":"string","format":"date-time","description":"Updated end time of the booking"}},"required":["type","bookingId"]}]},{"type":"object","properties":{"authorizedTokenIds":{"type":"array","items":{"type":"integer"},"description":"Array of OCPI token IDs that are authorized for this booking. Multiple tokens allow flexibility for roaming users who may have multiple valid authentication methods (e.g., RFID card and mobile app token). When omitted, the booking will not have specific token authorization."}}}]},{"title":"Cancel Booking","allOf":[{"type":"object","properties":{"id":{"type":"integer","description":"System-generated unique identifier","readOnly":true},"type":{"type":"string","description":"Type of booking request"},"status":{"type":"string","enum":["pending","approved","rejected"],"readOnly":true,"description":"Status of booking request:\n- **pending**: Request is awaiting processing\n- **approved**: Request has been approved\n- **rejected**: Request has been rejected\n"},"rejectionReason":{"type":"string","description":"Human-readable reason for rejection.\n\nResponse behavior: Only present when status is \"rejected\". Omitted for \"pending\" and \"approved\" requests.\n","readOnly":true},"createdAt":{"type":"string","format":"date-time","readOnly":true},"lastUpdatedAt":{"type":"string","format":"date-time","readOnly":true}}},{"type":"object","properties":{"type":{"type":"string","enum":["cancel"],"description":"Type of booking request - must be \"cancel\""},"bookingId":{"type":"integer","description":"ID of the target booking to cancel"},"externalId":{"type":"string","maxLength":255,"description":"External identifier from roaming partner (e.g., OCPI request_id).\n\nResponse behavior: Only present when an external ID was provided. Omitted when not specified.\n"}},"required":["type","bookingId"]}]}]}
```

---


## PATCH /public-api/resources/charge-point-downtime-periods/v1.0/{chargePointDowntimePeriod}

**Summary**: Charge Point Downtime Period / Update

**Request Body Schema**:

**Properties**:

- `noticeId` (integer) (nullable)
- `startedAt` (string): Allowed only for downtime period with `type = exempt AND entryMode = manual`
- `endedAt` (string): Allowed only for downtime period with `type = exempt AND entryMode = manual`

---


## POST /public-api/resources/charge-point-downtime-periods/v1.0

**Summary**: Charge Point Downtime Period / Create

**Request Body Schema**:

**Properties**:

- `chargePointId` (integer)
- `noticeId` (integer): Allowed only notice with `type = exempt`!
- `startedAt` (string)
- `endedAt` (string)

**Required**: chargePointId, noticeId, startedAt, endedAt

---


## PATCH /public-api/resources/charge-point-models/v1.0/{modelId}

**Summary**: Charge Point Model / Update

**Request Body Schema**:

**Properties**:

- `name` (string)
- `vendorId` (integer)
- `userManual` (string): A download link for the user manual. Shown in the mobile app for home chargers.
- `installerManual` (string): URL to an externally-hosted installer manual. The system stores this URL reference only (does not download or cache the document) and provides it to installers for viewing/downloading through the installer app interface.

---


## POST /public-api/resources/charge-point-models/v1.0

**Summary**: Charge Point Model / Create

**Request Body Schema**:

**Properties**:

- `name` (string)
- `vendorId` (integer)
- `userManual` (string): A download link for the user manual. Shown in the mobile app for home chargers.
- `installerManual` (string): URL to an externally-hosted installer manual. The system stores this URL reference only (does not download or cache the document) and provides it to installers for viewing/downloading through the installer app interface.

**Required**: name, vendorId

---


## PATCH /public-api/resources/charge-point-vendors/v1.0/{vendorId}

**Summary**: Charge Point Vendor / Update

**Request Body Schema**:

**Properties**:

- `name` (string)

---


## POST /public-api/resources/charge-point-vendors/v1.0

**Summary**: Charge Point Vendor / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)

**Required**: id, name

---


## PATCH /public-api/resources/charge-points/v1.0/{chargePoint}/configurations/{key}

**Summary**: Charge Point / Configuration / Update

**Request Body Schema**:

**Properties**:

- `value` (string)

---


## PATCH /public-api/resources/charge-points/v1.0/{chargePoint}

**Summary**: Charge Point / Update

**Request Body Schema**:

**Properties**:

- `name` (string)
- `networkId` (string) (nullable): OCPP Identifier
- `networkProtocol` (string)
- `networkPassword` (string) (nullable)
- `networkIp` (string) (nullable): required for ocpp 1.5 (SOAP)
- `networkPort` (string) (nullable): required for ocpp 1.5 (SOAP)
- `status` (string)
- `plugAndCharge` (boolean): Enable this flag if you the CP is configured in plug and charge mode, it automatically starts a session when a car is plugged in, and the ID tag should not be authorized
- `locationId` (integer) (nullable): locationId is always a REQUIRED field for commercial public and commercial private charge points. It is NOT a required field only for personal charge points.
- `pin` (string): pin is always a REQUIRED field for personal charge points. It is NOT a required field for commercial public and commercial private charge points.
- `accessType` (string)
- `desiredSecurityProfile` (integer) (nullable): The security profile that the backend will try to force the charge point to use for connecting to the backend. Description of the supported security profiles can be found in the security whitepaper available here - https://www.openchargealliance.org/protocols/ocpp-16/
- `ownerPartnerId` (integer) (nullable)
- `ownerPartnerContractId` (integer) (nullable)
- `partnerCorporateBillingAsDefault` (boolean): For users who have corporate billing with the same Partner as the Partner assigned to the charge point, the default payment method on this charge point will be the respective corporate billing account of the Partner.
- `partnerAccessType` (string): Applicable only to Commercial Private charge points. Further defines the access type and visibility of the charge point.
- `capabilities` (array)
- `managedByOperator` (boolean)
- `uptimeTrackingEnabled` (boolean): When set to true, enables Uptime tracking for the charge point by creating an operational period.
When set to false or omitted, Uptime tracking remains disabled.

**Requirements:**
- Charge point must be commercial type (public or private)
- Operator must have operational availability enabled

**Validation Errors:**
- Returns HTTP 422 if charge point is personal type
- Returns HTTP 422 if operator has operational availability disabled

**Examples:**
```json
{
  "name": "CP-001",
  "accessType": "public",
  "uptimeTrackingEnabled": true
}
```

**Validation Error Examples:**

Personal charge point error:
```json
{
  "message": "The given data was invalid.",
  "errors": {
    "uptimeTrackingEnabled": [
      "Uptime tracking can only be enabled for commercial charge points"
    ]
  }
}
```

Operator settings error:
```json
{
  "message": "The given data was invalid.",
  "errors": {
    "uptimeTrackingEnabled": [
      "Operator must have operational availability enabled to track uptime"
    ]
  }
}
```

- `tags` (array): Tags can be used for filtering and grouping chargers by tag. When doing a PATCH input all tags that should be associated with the charge point. Omitting a tag would remove it from the charge point.
- `evses` (object)
- `externalId` (string) (nullable): The field should have unique value

---


## POST /public-api/resources/charge-points/v1.0

**Summary**: Charge Point / Create

**Request Body Schema**:

**Properties**:

- `name` (string)
- `networkId` (string) (nullable): OCPP Identifier
- `networkProtocol` (string)
- `networkPassword` (string) (nullable)
- `networkIp` (string) (nullable): required for ocpp 1.5 (SOAP)
- `networkPort` (string) (nullable): required for ocpp 1.5 (SOAP)
- `status` (string)
- `plugAndCharge` (boolean): Enable this flag if you the CP is configured in plug and charge mode, it automatically starts a session when a car is plugged in, and the ID tag should not be authorized
- `locationId` (integer) (nullable): locationId is always a REQUIRED field for commercial public and commercial private charge points. It is NOT a required field only for personal charge points.
- `pin` (string): pin is always a REQUIRED field for personal charge points. It is NOT a required field for commercial public and commercial private charge points.
- `accessType` (string)
- `desiredSecurityProfile` (integer) (nullable): The security profile that the backend will try to force the charge point to use for connecting to the backend. Description of the supported security profiles can be found in the security whitepaper available here - https://www.openchargealliance.org/protocols/ocpp-16/
- `ownerPartnerId` (integer) (nullable)
- `ownerPartnerContractId` (integer) (nullable)
- `partnerCorporateBillingAsDefault` (boolean): For users who have corporate billing with the same Partner as the Partner assigned to the charge point, the default payment method on this charge point will be the respective corporate billing account of the Partner.
- `partnerAccessType` (string): Applicable only to Commercial Private charge points. Further defines the access type and visibility of the charge point.
- `capabilities` (array)
- `managedByOperator` (boolean)
- `uptimeTrackingEnabled` (boolean): When set to true, enables Uptime tracking for the charge point by creating an operational period.
When set to false or omitted, Uptime tracking remains disabled.

**Requirements:**
- Charge point must be commercial type (public or private)
- Operator must have operational availability enabled

**Validation Errors:**
- Returns HTTP 422 if charge point is personal type
- Returns HTTP 422 if operator has operational availability disabled

**Examples:**
```json
{
  "name": "CP-001",
  "accessType": "public",
  "uptimeTrackingEnabled": true
}
```

**Validation Error Examples:**

Personal charge point error:
```json
{
  "message": "The given data was invalid.",
  "errors": {
    "uptimeTrackingEnabled": [
      "Uptime tracking can only be enabled for commercial charge points"
    ]
  }
}
```

Operator settings error:
```json
{
  "message": "The given data was invalid.",
  "errors": {
    "uptimeTrackingEnabled": [
      "Operator must have operational availability enabled to track uptime"
    ]
  }
}
```

- `tags` (array): Tags can be used for filtering and grouping chargers by tag. When doing a PATCH input all tags that should be associated with the charge point. Omitting a tag would remove it from the charge point.
- `templateId` (integer)
- `evses` (object)
- `externalId` (string) (nullable): The field should have unique value

**Required**: name, networkId, status, templateId

---


## PATCH /public-api/resources/charge-points/v2.0/{chargePoint}/configurations/{key}

**Summary**: Charge Point / Configuration / Update

**Request Body Schema**:

**Properties**:

- `value` (string): This field is required when the configuration key is one of the standard OCPP keys, as defined in the OCPP documentation under "Standard Configuration Key Names & Values".

---


## PATCH /public-api/resources/charge-points/v2.0/{chargePoint}/evses/{evse}/connectors/{connector}

**Summary**: Charge Points / Evse / Connector / Update

**Request Body Schema**:

**Properties**:

- `type` (string): Type of connector available on the EVSE:
- **type1**: Type 1 connector (SAE J1772 AC)
- **type2**: Type 2 connector (IEC 62196-2 AC)
- **type3**: Type 3 connector (IEC 62196-2 AC)
- **chademo**: CHAdeMO DC fast charging
- **ccs1**: Combined Charging System 1 (CCS1/Combo 1)
- **ccs2**: Combined Charging System 2 (CCS2/Combo 2)
- **schuko**: Standard European household socket
- **nacs**: North American Charging Standard (Tesla)
- **cee16**: CEE 16A industrial connector
- **cee32**: CEE 32A industrial connector
- **j1772**: SAE J1772 connector
- **inductive**: Inductive/wireless charging
- **nema-5-20**: Domestic M NEMA 5-20 Socket
- **type-e-french**: French Type E socket
- **type-g-british**: British Type G socket
- **type-j-swiss**: Swiss Type J socket
- **avcon**: AVCON connector (Australian standard)
- **gb-t-ac**: GB/T AC connector (Chinese standard)
- **gb-t-dc**: GB/T DC connector (Chinese standard)
- **chaoji**: ChaoJi (CHAdeMO 3.0)
- **nema-6-30**: NEMA 6-30
- **nema-6-50**: NEMA 6-50

- `format` (string)
- `status` (string)

---


## POST /public-api/resources/charge-points/v2.0/{chargePoint}/evses/{evse}/connectors

**Summary**: Charge Points / Evse / Connector / Create

**Request Body Schema**:

**Properties**:

- `type` (string): Type of connector available on the EVSE:
- **type1**: Type 1 connector (SAE J1772 AC)
- **type2**: Type 2 connector (IEC 62196-2 AC)
- **type3**: Type 3 connector (IEC 62196-2 AC)
- **chademo**: CHAdeMO DC fast charging
- **ccs1**: Combined Charging System 1 (CCS1/Combo 1)
- **ccs2**: Combined Charging System 2 (CCS2/Combo 2)
- **schuko**: Standard European household socket
- **nacs**: North American Charging Standard (Tesla)
- **cee16**: CEE 16A industrial connector
- **cee32**: CEE 32A industrial connector
- **j1772**: SAE J1772 connector
- **inductive**: Inductive/wireless charging
- **nema-5-20**: Domestic M NEMA 5-20 Socket
- **type-e-french**: French Type E socket
- **type-g-british**: British Type G socket
- **type-j-swiss**: Swiss Type J socket
- **avcon**: AVCON connector (Australian standard)
- **gb-t-ac**: GB/T AC connector (Chinese standard)
- **gb-t-dc**: GB/T DC connector (Chinese standard)
- **chaoji**: ChaoJi (CHAdeMO 3.0)
- **nema-6-30**: NEMA 6-30
- **nema-6-50**: NEMA 6-50

- `format` (string)
- `status` (string)

**Required**: type

---


## PATCH /public-api/resources/charge-points/v2.0/{chargePoint}/evses/{evse}

**Summary**: Charge Point / EVSE / Update

**Request Body Schema**:

**Properties**:

- `physicalReference` (string): The identifier that is presented to the users, so they can identify the EVSE at the location.
- `currentType` (string): Type of current available on the EVSE:
- **ac**: Alternating Current (AC) charging
- **dc**: Direct Current (DC) fast charging

- `label` (string): The EVSE label will be exposed and visualized in the mobile application
- `networkId` (string): The OCPP evse identifier (should be consecutive numbers starting from 1)
- `status` (string): For roaming EVSEs the status can only be updated if the option for manual management of EVSEs is enabled for the roaming CPO.
- `midMeterCertificationEndYear` (integer) (nullable): The mid meter certification end year.
- `tariffGroupId` (integer) (nullable): The ID of the tariff group attached to the EVSE. If the EVSE is not roaming and tariffGroupId is not specified, the default (free) tariff will be assigned. For roaming EVSEs the Tariff Group can only be updated if the option for manual management of EVSEs is enabled for the roaming CPO.
- `allowsReservation` (boolean): Manages whether reservations are allowed on this EVSE. Requires the Reservations to be activated for the system in order to enable for the EVSE.
- `bookingEnabled` (boolean): Indicates if the EVSE can be booked. Requires the Bookings to be activated for the operator and automatically enables allowsReservation when set to true.
- `powerOptions` (object)
  - `powerOptions.maxPower` (integer) (nullable): in Wh
- `powerOptions` (object)
  - `powerOptions.maxVoltage` (string) (nullable): The maxVoltage of a charge point can fluctuate. Hence, when creating a charge point in the system, the maxVoltage is given as a range. For OCPI purposes it maps as follows: 220-240 = 230 110-130 = 120 400 = 400 380 = 380

- `powerOptions` (object)
  - `powerOptions.maxAmperage` (number) (nullable)
- `powerOptions` (object)
  - `powerOptions.phases` (string) (nullable)
- `powerOptions` (object)
  - `powerOptions.phaseRotation` (string) (nullable): `R` stands for `L1`, </br>
`S` - for `L2` </br>
`T` - for `L3` </br>
So for example `RST` = `L1`, `L2`, `L3`, while `RTS` = `L1`, `L3`, `L2`, etc. </br>
We are deriving the connected phase from this property for single phase if connectedPhase is not provided. Please don't rely on this property anymore as this functionality will be turned of in near future. Pass the correct connectedPhase instead. If you pass both properties (connectedPhase and phaseRotation) only connectedPhase will be taken into consideration for determining the phase.

- `powerOptions` (object)
  - `powerOptions.connectedPhase` (string) (nullable): Specifies the active line conductors used in the circuit.
- `L1_L2` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L2_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L1_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L1` - Valid when `phases` = `single_phase` in electrical configuration `star`
- `L2` - Valid when `phases` = `single_phase` in electrical configuration `star`
- `L3` - Valid when `phases` = `single_phase` in electrical configuration `star`

- `externalId` (string)

---


## POST /public-api/resources/charge-points/v2.0/{chargePoint}/evses

**Summary**: Charge Point / EVSE / Create

**Request Body Schema**:

**Properties**:

- `physicalReference` (string): The identifier that is presented to the users, so they can identify the EVSE at the location.
- `currentType` (string): Type of current available on the EVSE:
- **ac**: Alternating Current (AC) charging
- **dc**: Direct Current (DC) fast charging

- `label` (string): The EVSE label will be exposed and visualized in the mobile application
- `networkId` (string): The OCPP evse identifier (should be consecutive numbers starting from 1)
- `status` (string): For roaming EVSEs the status can only be updated if the option for manual management of EVSEs is enabled for the roaming CPO.
- `midMeterCertificationEndYear` (integer) (nullable): The mid meter certification end year.
- `tariffGroupId` (integer) (nullable): The ID of the tariff group attached to the EVSE. If the EVSE is not roaming and tariffGroupId is not specified, the default (free) tariff will be assigned. For roaming EVSEs the Tariff Group can only be updated if the option for manual management of EVSEs is enabled for the roaming CPO.
- `allowsReservation` (boolean): Manages whether reservations are allowed on this EVSE. Requires the Reservations to be activated for the system in order to enable for the EVSE.
- `bookingEnabled` (boolean): Indicates if the EVSE can be booked. Requires the Bookings to be activated for the operator and automatically enables allowsReservation when set to true.
- `powerOptions` (object)
  - `powerOptions.maxPower` (integer) (nullable): in Wh
- `powerOptions` (object)
  - `powerOptions.maxVoltage` (string) (nullable): The maxVoltage of a charge point can fluctuate. Hence, when creating a charge point in the system, the maxVoltage is given as a range. For OCPI purposes it maps as follows: 220-240 = 230 110-130 = 120 400 = 400 380 = 380

- `powerOptions` (object)
  - `powerOptions.maxAmperage` (number) (nullable)
- `powerOptions` (object)
  - `powerOptions.phases` (string) (nullable)
- `powerOptions` (object)
  - `powerOptions.phaseRotation` (string) (nullable): `R` stands for `L1`, </br>
`S` - for `L2` </br>
`T` - for `L3` </br>
So for example `RST` = `L1`, `L2`, `L3`, while `RTS` = `L1`, `L3`, `L2`, etc. </br>
We are deriving the connected phase from this property for single phase if connectedPhase is not provided. Please don't rely on this property anymore as this functionality will be turned of in near future. Pass the correct connectedPhase instead. If you pass both properties (connectedPhase and phaseRotation) only connectedPhase will be taken into consideration for determining the phase.

- `powerOptions` (object)
  - `powerOptions.connectedPhase` (string) (nullable): Specifies the active line conductors used in the circuit.
- `L1_L2` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L2_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L1_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L1` - Valid when `phases` = `single_phase` in electrical configuration `star`
- `L2` - Valid when `phases` = `single_phase` in electrical configuration `star`
- `L3` - Valid when `phases` = `single_phase` in electrical configuration `star`

- `externalId` (string)

**Required**: physicalReference, currentType, networkId, status

---


## POST /public-api/resources/charge-points/v2.0/{chargePoint}/personal-smart-charging-preferences

**Summary**: Charge Point / Personal smart charging preferences / Update

**Request Body Schema**:

**Note**: This schema uses `oneOf` (multiple possible structures).

```json
{"oneOf":[{"title":"User controlled schedule","type":"object","required":["type","preferences"],"properties":{"enabled":{"type":"boolean","default":true,"description":"Enable or disable the smart charging from owner preferences\n"},"type":{"type":"string","enum":["user_controlled_schedule"]},"preferences":{"type":"object","required":["startTime","endTime"],"properties":{"startTime":{"type":"string","format":"time","description":"Start of preferred charging window which will be applied by default when no week day is chosen. Applicable for schedule mode"},"endTime":{"type":"string","format":"time","description":"End of preferred charging window which will be applied by default when no week day is chosen. Applicable for schedule mode"},"targetCharge":{"type":"object","nullable":true,"properties":{"minTargetChargeKwh":{"type":"number","example":10},"maxTargetChargeKwh":{"type":"number","example":20}}},"trackElectricityCosts":{"type":"object","nullable":true,"properties":{"priceOffPeak":{"type":"number","example":1.3},"pricePeak":{"type":"number","example":0.9}}},"weekDays":{"type":"array","items":{"type":"object","properties":{"days":{"type":"array","items":{"type":"string","enum":["monday","tuesday","wednesday","thursday","friday","saturday","sunday"]},"description":"Specify the day(s) for which the schedule will apply."},"startTime":{"type":"string","format":"time","description":"Start of preferred charging window for chosen day(s).","example":"16:00"},"endTime":{"type":"string","format":"time","description":"End of preferred charging window for chosen day(s).","example":"23:00"}},"required":["days","startTime","endTime"]}}}}}},{"title":"Solar","type":"object","required":["type","preferences"],"properties":{"enabled":{"type":"boolean","default":true,"description":"Enable or disable the smart charging from owner preferences\n"},"type":{"type":"string","enum":["solar"]},"preferences":{"type":"object","required":["maxCurrentFromGrid","solarStableTime"],"properties":{"maxCurrentFromGrid":{"type":"number","description":"The max current that can be taken from grid to ensure a stable charging process.Recommended options to use 0, 6, 8, 10, 12."},"solarStableTime":{"type":"number","description":"Shorter time means more precise solar availability detection but also more frequent charging on/off switching. Recommended options to use 30, 60, 120, 300, 600."}}}}},{"title":"Octopus Agile","type":"object","required":["type","preferences","integrationId"],"properties":{"enabled":{"type":"boolean","default":true,"description":"Enable or disable the smart charging from owner preferences\n"},"type":{"type":"string","enum":["octopus_agile"]},"integrationId":{"type":"integer"},"preferences":{"type":"object","required":["postCode","applicableTaxId","priceThreshold"],"properties":{"applicableTaxId":{"type":"integer","description":"The ID of the applicable tax rate. Used to calculate correctly electricity costs shown to the user."},"targetCharge":{"type":"object","nullable":true,"properties":{"departureTime":{"type":"string","format":"time"},"preconditioningTime":{"type":"integer","description":"The time in minutes before departure when the charging will be performed with full power."},"minTargetChargeKwh":{"type":"number","example":10},"maxTargetChargeKwh":{"type":"number","example":20}}},"postCode":{"type":"string","description":"User's postcode. Used to determine the applicable tariff."},"priceThreshold":{"type":"number","description":"The price per kWh threshold below which charging would commence."}}}}},{"title":"Octopus Go","type":"object","required":["type","preferences","integrationId"],"properties":{"enabled":{"type":"boolean","default":true,"description":"Enable or disable the smart charging from owner preferences\n"},"type":{"type":"string","enum":["octopus_go"]},"integrationId":{"type":"integer"},"preferences":{"type":"object","required":["postCode","applicableTaxId"],"properties":{"applicableTaxId":{"type":"integer","description":"The ID of the applicable tax rate. Used to calculate correctly electricity costs shown to the user."},"targetCharge":{"type":"object","nullable":true,"properties":{"departureTime":{"type":"string","format":"time"},"preconditioningTime":{"type":"integer","description":"The time in minutes before departure when the charging will be performed with full power."},"minTargetChargeKwh":{"type":"number","example":10},"maxTargetChargeKwh":{"type":"number","example":20}}},"postCode":{"type":"string","description":"User's postcode. Used to determine the applicable tariff."},"priceThreshold":{"type":"number","description":"The price per kWh threshold below which charging would commence."}}}}},{"title":"NordPool","type":"object","required":["type"],"properties":{"enabled":{"type":"boolean","default":true,"description":"Enable or disable the smart charging from owner preferences\n"},"type":{"type":"string","enum":["nordpool"]},"integrationId":{"type":"integer"},"preferences":{"type":"object","required":["location","targetCharge"],"properties":{"location":{"type":"string","enum":["GB1"],"description":"The price region based on NordPool prices"},"targetCharge":{"type":"object","required":["targetChargeKwh","departureTime"],"properties":{"departureTime":{"type":"string","format":"time"},"preconditioningTime":{"type":"integer","description":"The time in minutes before departure when the charging will be performed with full power."},"targetChargeKwh":{"type":"number","example":10}}}}}}},{"title":"Electricity rate","type":"object","required":["type","electricityRateId","preferences"],"properties":{"enabled":{"type":"boolean","default":true,"description":"Enable or disable the smart charging from owner preferences\n"},"type":{"type":"string","enum":["charger_electricity_rate"]},"electricityRateId":{"type":"integer"},"preferences":{"type":"object","required":["startTime","endTime","targetCharge"],"properties":{"solar":{"type":"boolean","default":false,"description":"This boolean adds solar mode control for specific brands of chargers that are supported.\nE.g.: Some chargers support special keys in the charging profile which enables solar charging mode.\n"},"startTime":{"type":"string","format":"time","description":"Start of preferred charging window which will be applied by default when no week day is chosen."},"endTime":{"type":"string","format":"time","description":"End of preferred charging window which will be applied by default when no week day is chosen."},"targetCharge":{"type":"object","required":["departureTime","targetChargeKwh"],"properties":{"departureTime":{"type":"string","format":"time"},"preconditioningTime":{"type":"integer","description":"The time in minutes before departure when the charging will be performed with full power."},"targetChargeKwh":{"type":"number","example":10,"description":"The desired charge energy which will be achieved with the most optimal price."}}},"weekDays":{"type":"array","items":{"type":"object","properties":{"days":{"type":"array","items":{"type":"string","enum":["monday","tuesday","wednesday","thursday","friday","saturday","sunday"]},"description":"Specify the day(s) for which the schedule will apply."},"startTime":{"type":"string","format":"time","description":"Start of preferred charging window for chosen day(s).","example":"16:00"},"endTime":{"type":"string","format":"time","description":"End of preferred charging window for chosen day(s).","example":"23:00"}},"required":["days","startTime","endTime"]}}}}}},{"title":"Disabled","type":"object","required":["enabled"],"properties":{"enabled":{"type":"boolean","default":false,"description":"Disable the smart charging from owner preferences\n"}}}]}
```

---


## PUT /public-api/resources/charge-points/v2.0/{chargePoint}/shared-partners

**Summary**: Charge Point / Shared Partners / Update

**Request Body Schema**:

**Properties**:

- `partnerIds` (array)

**Required**: partnerIds

---


## POST /public-api/resources/charge-points/v2.0/{chargePoint}/shares

**Summary**: Charge Point / Share / Create

**Request Body Schema**:

**Properties**:

- `userId` (integer)

**Required**: userId

---


## POST /public-api/resources/charge-points/v2.0/{chargePoint}/smart-charging

**Summary**: Charge Point / Smart Charging / Update

**Request Body Schema**:

**Note**: This schema uses `oneOf` (multiple possible structures).

```json
{"oneOf":[{"type":"object","properties":{"mode":{"type":"string","enum":["tod"],"description":"`tod` - for public and private charge points. The maximum load for a specific time period during the day could be set - the charge point could be part of a dynamic load management circuit.\n"},"defaultChargePointMaxCurrent":{"type":"number","multipleOf":0.1,"description":"In amps. The max current would be used in the algorithm for the smart charging and wherever there is not a max current explicitly set."},"circuitId":{"type":"integer","description":"The ID of the DLM Circuit to which the charge point is added (if any).","nullable":true,"readOnly":true},"periods":{"type":"array","items":{"type":"object","required":["weekDay","elements"],"properties":{"weekDay":{"type":"string","enum":["all","mon","tue","wed","thu","fri","sat","sun"],"description":"Specify the day for which the pricing would be valid."},"elements":{"type":"array","items":{"type":"object","required":["startAt","endAt"],"properties":{"startAt":{"type":"string","format":"time","example":"00:00","description":"The 24-hour format should be used.</br>\nExample `00:00`\n"},"endAt":{"type":"string","format":"time","example":"00:00","description":"The 24-hour format should be used.</br>\nExample `01:00`\n"},"maxCurrent":{"type":"number","nullable":true}}}}}},"description":"The time period must be the same for every single day through the week and should be always 60 min. The `startAt` and `endAt` must comply with this restriction."},"preconditioningTime":{"type":"integer","description":"The time in minutes before departure when the charging will be performed with full power."},"minCurrent":{"type":"number","description":"minCurrent is always REQUIRED for `user_controlled_schedule`","nullable":true},"enableKeepAwake":{"type":"boolean","description":"For personal charge points. Keep the car awake during scheduled periods by continuously charging at a low current / power.","nullable":true},"maxVoltage":{"type":"string","enum":["230","380","400","480","120","208","240","110-130","220-240","277"]},"electricalConfiguration":{"type":"string","enum":["star","delta"],"default":"star","description":"Defines the type of electrical configuration of the charge point. The available options are </br> `star` - TN system - Star (Y) (default)</br> `delta` - IT system - Delta (Δ)</br>"},"phases":{"type":"string","enum":["single_phase","three_phase","split_phase"]},"phaseRotation":{"type":"string","nullable":true,"enum":["RST","RTS","SRT","STR","TRS","TSR"],"description":"`R` stands for `L1`, </br>\n`S` - for `L2` </br>\n`T` - for `L3` </br>\nSo for example `RST` = `L1`, `L2`, `L3`, while `RTS` = `L1`, `L3`, `L2`, etc. </br>\nWe are deriving the connected phase from this property for single phase if connectedPhase is not provided. Please don't rely on this property anymore as this functionality will be turned of in near future. Pass the correct connectedPhase instead. If you pass both properties (connectedPhase and phaseRotation) only connectedPhase will be taken into consideration for determining the phase.\n"},"connectedPhase":{"allOf":[{"type":"string","nullable":true,"enum":["L1","L2","L3","L1_L2","L1_L3","L2_L3"],"description":"Specifies the active line conductors used in the circuit.\n- `L1_L2` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`\n- `L2_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`\n- `L1_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`\n- `L1` - Valid when `phases` = `single_phase` in electrical configuration `star`\n- `L2` - Valid when `phases` = `single_phase` in electrical configuration `star`\n- `L3` - Valid when `phases` = `single_phase` in electrical configuration `star`\n"}]}},"required":["mode","defaultChargePointMaxCurrent","maxVoltage","phases","phaseRotation"]},{"type":"object","properties":{"mode":{"type":"string","enum":["dynamic"],"description":"`dynamic` - for public and private charge points. The charge point could be part of a dynamic load management circuit.\n"},"defaultChargePointMaxCurrent":{"type":"number","multipleOf":0.1,"description":"In amps. The max current would be used in the algorithm for the smart charging and wherever there is not a max current explicitly set."},"preconditioningTime":{"type":"integer","description":"The time in minutes before departure when the charging will be performed with full power."},"circuitId":{"type":"integer","description":"The ID of the DLM Circuit to which the charge point is added (if any).","nullable":true,"readOnly":true},"minCurrent":{"type":"number","description":"minCurrent is always REQUIRED for `user_controlled_schedule`","nullable":true},"enableKeepAwake":{"type":"boolean","description":"For personal charge points. Keep the car awake during scheduled periods by continuously charging at a low current / power.","nullable":true},"maxVoltage":{"type":"string","enum":["230","380","400","480","120","208","240","110-130","220-240","277"]},"electricalConfiguration":{"type":"string","enum":["star","delta"],"default":"star","description":"Defines the type of electrical configuration of the charge point. The available options are </br> `star` - TN system - Star (Y) (default)</br> `delta` - IT system - Delta (Δ)</br>"},"phases":{"type":"string","enum":["single_phase","three_phase","split_phase"]},"phaseRotation":{"type":"string","nullable":true,"enum":["RST","RTS","SRT","STR","TRS","TSR"],"description":"`R` stands for `L1`, </br>\n`S` - for `L2` </br>\n`T` - for `L3` </br>\nSo for example `RST` = `L1`, `L2`, `L3`, while `RTS` = `L1`, `L3`, `L2`, etc. </br>\nWe are deriving the connected phase from this property for single phase if connectedPhase is not provided. Please don't rely on this property anymore as this functionality will be turned of in near future. Pass the correct connectedPhase instead. If you pass both properties (connectedPhase and phaseRotation) only connectedPhase will be taken into consideration for determining the phase.\n"},"connectedPhase":{"allOf":[{"type":"string","nullable":true,"enum":["L1","L2","L3","L1_L2","L1_L3","L2_L3"],"description":"Specifies the active line conductors used in the circuit.\n- `L1_L2` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`\n- `L2_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`\n- `L1_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`\n- `L1` - Valid when `phases` = `single_phase` in electrical configuration `star`\n- `L2` - Valid when `phases` = `single_phase` in electrical configuration `star`\n- `L3` - Valid when `phases` = `single_phase` in electrical configuration `star`\n"}]}},"required":["mode","defaultChargePointMaxCurrent","maxVoltage","phases","phaseRotation"]},{"type":"object","properties":{"mode":{"type":"string","enum":["user_schedule"],"description":"`user_schedule` - for personal charge points. The maximum power load will be defined on the EVSE level. The charge point owner could manually create a charging schedule.\n"},"defaultChargePointMaxCurrent":{"type":"number","multipleOf":0.1,"description":"In amps. The max current would be used in the algorithm for the smart charging and wherever there is not a max current explicitly set."},"preconditioningTime":{"type":"integer","description":"The time in minutes before departure when the charging will be performed with full power."},"circuitId":{"type":"integer","description":"The ID of the DLM Circuit to which the charge point is added (if any).","nullable":true,"readOnly":true},"minCurrent":{"type":"number","description":"minCurrent is always REQUIRED for `user_controlled_schedule`","nullable":true},"enableKeepAwake":{"type":"boolean","description":"For personal charge points. Keep the car awake during scheduled periods by continuously charging at a low current / power.","nullable":true},"maxVoltage":{"type":"string","enum":["230","380","400","480","120","208","240","110-130","220-240","277"]},"electricalConfiguration":{"type":"string","enum":["star","delta"],"default":"star","description":"Defines the type of electrical configuration of the charge point. The available options are </br> `star` - TN system - Star (Y) (default)</br> `delta` - IT system - Delta (Δ)</br>"},"phases":{"type":"string","enum":["single_phase","three_phase","split_phase"]},"phaseRotation":{"type":"string","nullable":true,"enum":["RST","RTS","SRT","STR","TRS","TSR"],"description":"`R` stands for `L1`, </br>\n`S` - for `L2` </br>\n`T` - for `L3` </br>\nSo for example `RST` = `L1`, `L2`, `L3`, while `RTS` = `L1`, `L3`, `L2`, etc. </br>\nWe are deriving the connected phase from this property for single phase if connectedPhase is not provided. Please don't rely on this property anymore as this functionality will be turned of in near future. Pass the correct connectedPhase instead. If you pass both properties (connectedPhase and phaseRotation) only connectedPhase will be taken into consideration for determining the phase.\n"},"allowDynamicLoadManagement":{"type":"boolean","description":"When selected, the Charge Point can be added to a DLM circuit."},"connectedPhase":{"allOf":[{"type":"string","nullable":true,"enum":["L1","L2","L3","L1_L2","L1_L3","L2_L3"],"description":"Specifies the active line conductors used in the circuit.\n- `L1_L2` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`\n- `L2_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`\n- `L1_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`\n- `L1` - Valid when `phases` = `single_phase` in electrical configuration `star`\n- `L2` - Valid when `phases` = `single_phase` in electrical configuration `star`\n- `L3` - Valid when `phases` = `single_phase` in electrical configuration `star`\n"}]}},"required":["mode","defaultChargePointMaxCurrent","minCurrent","enableKeepAwake","maxVoltage","phases","phaseRotation"]},{"type":"object","properties":{"mode":{"type":"string","enum":["disabled"],"description":"`disabled` - no smart charging is available for the charge point\n"},"preconditioningTime":{"type":"integer","description":"The time in minutes before departure when the charging will be performed with full power."}},"required":["mode"]}]}
```

---


## PATCH /public-api/resources/charge-points/v2.0/{chargePoint}

**Summary**: Charge Point / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `type` (string): `public` - a charge point visible on the map to everybody </br>
`private` - by default hidden from the map and for private usage only - company and their employees for example. The visibility of the charge point could be managed in partner object, with the different options for accessType. </br>
`personal` - the charge point could have a single owner only. The owner is set when the user claims the charger or with Actions / Change Owner. </br>

- `pin` (string) (nullable): Required if `accessType` is `personal`. The PIN should be provided in the mobile app when the charge point is claimed by a user. Should contain only numbers.

- `locationId` (integer) (nullable): Required if `accessType` is `public` or `private`. NOT required if `accessType` is `personal`.

- `chargingZoneId` (integer) (nullable)
- `electricityRateId` (integer) (nullable): If there is Electricity rate set to the Charge point the electricity cost for each charging session would be tracked. Dynamic electricity rates could not be selected, only ones created in the resource / electricity-rate.

- `electricityCostReimbursementIntegrationId` (integer) (nullable): The ID of the third-party electricity cost reimbursement integration to use for processing reimbursements for charging sessions at this charge point. Only applicable to personal (home) charge points - ignored for public and private charge points.

- `installationAndMaintenanceCompanyId` (integer) (nullable): The ID of the Installation & Maintenance company associated with this charge point. Must be owned by the same operator.

Validation:
- If provided and not null, must reference a valid I&M company ID that belongs to the operator
- Invalid or cross-operator I&M company IDs return validation error: "The selected installation and maintenance company ID is invalid"
- Can be set to null to remove I&M company assignment

- `subscription` (object): An active subscription could be required for personal (home) charge points in order to use the charge point.
  - `subscription.required` (boolean): Only for personal charge points. Require an active subscription to use the charge point.
- `subscription` (object): An active subscription could be required for personal (home) charge points in order to use the charge point.
  - `subscription.planIds` (array): Only for personal charge points. List of subscription plans for any of which the user should have an active subscription, to be able to use the charge point.
- `networkType` (string)
- `status` (string): Shows the system status of the Charge Point.
  * `enabled` - the charge point is fully operative.
  * `disabled` - the charge point would not be shown on the map if it is a commercial public or commercial private with the relevant option for visibility nor could be claimed or found by ID if it is personal (home). </br>
  * `demo` - acts as a simulator so different setups could be tested.
  * `out of order` - the charge point is visible and shared with users, but a charging session

- `managedByOperator` (boolean): This flag indicates whether the operator can actively manage the charge point. If the flag is set to `false` the charge point can still be shown to users, but they can't request to start a session on it.

Deprecated. Please use `communicationMode` instead. The `communicationMode` can only be set when creating a charge point.

- `externalId` (string) (nullable)
- `network` (object)
  - `network.id` (string) (nullable): OCPP Identifier
- `network` (object)
  - `network.protocol` (string) (nullable)
- `network` (object)
  - `network.password` (string) (nullable)
- `network` (object)
  - `network.ip` (string) (nullable): Required for ocpp 1.5 (SOAP)
- `network` (object)
  - `network.port` (integer) (nullable): Required for ocpp 1.5 (SOAP)
- `capabilities` (array): `remote_start_stop_capable` - whether Remote start/stop is possible for the Charge Point </br>
`meter_values` - whether the Charge Point should send meter updates to the system </br>
`stop_transaction_on_ev_disconnect` - for ongoing sessions, when the cable is unplugged this should stop the session and if it is returned back a new session would be created. </br>
`disregard_the_heartbeats` - only for OCPP 1.5 SOAP. Network status by default is updated based on the heartbeat messages. When enabled, the Charge Point would be always treated as available and its network status would not depend on heartbeat messages. </br>
`display_messages` - charger has a display and it is enabled to display messages. This capability is enabled automatically when the charger reports the corresponding configuration key. When creating a charge point, the capability is ignored as it is automatically detected on boot. </br>

- `autoStartWithoutAuthorization` (boolean): When enabled the system would allow charging sessions initiated </br>
locally by the charge point assuming it is setup to work in auto-start / </br>
plug-and-charge mode. It would also automatically start a </br>
session with a remote start command if one is not already started by the charging stations a  </br>
few seconds after a Preparing status is detected indicating that a vehicle is connected.

- `disableAutoStartEmulation` (boolean): The Auto-start option above does 2 things: (1) it allows charging </br>
sessions started by the charge point assuming that it may be set up locally </br>
to auto-start charging when a vehicle is connected and (2) if the charging </br>
station doesnt start the session within a few seconds after the vehicles is </br>
connected the system sends a remote start command - which is to emulate auto-start </br>
charging. With this checkbox you can disable the emulation and rely </br>
entirely on the charging station to auto-start the charging. </br>

- `security` (object)
  - `security.desiredProfile` (integer): The backend will try to set it 3 times at boot notification. If the charge point does not support it, the backend will use the highest security profile the charge point could use. </br>
The following security profiles are supported: </br>
0: `No Authentication` </br>
1: `Unsecured Trasport with Basic Authentication (Plain-back Authentication)` - It does not include authentication for the CSMS, or measures to set up a secure communication channel. Therefore, it should only be used in trusted networks, for instance in networks where there is a VPN between the CSMS and the Charging Station. For field operation it is highly recommended to use a security profile with TLS. </br>
2: `TLS with Basic Authentication (Encrypted Authentication)` - In the TLS with Basic Authentication profile, the communication channel is secured using Transport Layer Security (TLS). The CSMS authenticates itself using a TLS server certificate. The Charging Stations authenticate themselves using HTTP Basic Authentication. </br>
3: `TLS with client-side certificates profile` </br>

- `security` (object)
  - `security.currentProfile` (integer) (read-only): The security profile that is currenty being used by the charge point. Description of the supported security profiles can be found in the security whitepaper available here - https://www.openchargealliance.org/protocols/ocpp-16/
- `security` (object)
  - `security.hardwareEnabledProfile` (integer) (read-only): The maximum security profile that the charge point hardware supports. Description of the supported security profiles can be found in the security whitepaper available here - https://www.openchargealliance.org/protocols/ocpp-16/
- `security` (object)
  - `security.desiredProfileStatus` (string) (read-only): Whether the last requested desiredSecurityProfile was successfully applied to the charge point.

- `modelId` (integer) (nullable): The ID of the CP Model, if one is associated with the Charge Point. Can be set to null to remove the current CP Model associated with the Charge Point. Mind that on boot the charger reports the hardware model and it is automatically updated.

- `enableAutoFaultRecovery` (boolean)
- `user` (object): Owner information along with owner preferences of the charge point when of type *personal*. If smart charging is enabled, smart charging preferences are also included.
  - `user.id` (integer) (nullable)
- `user` (object): Owner information along with owner preferences of the charge point when of type *personal*. If smart charging is enabled, smart charging preferences are also included.
  - `user.automaticFirmwareUpdatesEnabled` (boolean)
- `partner` (object)
  - `partner.id` (integer) (nullable)
- `partner` (object)
  - `partner.contractId` (integer) (nullable)
- `partner` (object)
  - `partner.contactId` (integer) (nullable)
- `partner` (object)
  - `partner.corporateBillingAsDefault` (boolean): The partner's corporate billing would be used as a payment method by default, when a user who is invited to use the partner's corporate billing starts a session on the charge point.
- `partner` (object)
  - `partner.accessType` (string) (nullable): `private_view_private_use` - only users invited by the partner with the option to access private charge points could view this charge point on the map and use it. </br>
`private_view_public_use` - only users invited by the partner with the option to access private charge points can view this charge point on the map but anyone who scans the QR or enters the ID can use it. </br>
`public_view_private_use` - anyone could see the charge point on the map with a notice but only users invited by the partner with the option to access private charge points could use it.` </br>

- `partner` (object)
  - `partner.notice` (array) (nullable): The notice is only available if the charge point is of type `private` and the accessType is `public_view_private_use`
- `utilityId` (integer) (nullable)
- `tags` (array): Tags can be used for filtering and grouping chargers by tag. When doing a PATCH input all tags that should be associated with the charge point. Omitting a tag would remove it from the charge point.
- `enabledRandomisedDelay` (boolean): Applicable only for personal charge points. For `public` and `private` charge points will be omitted
- `noticeId` (integer) (nullable): If both noticeId and partner.notice object are provided in the request the noticeId will be used to complete the request NOT the partner.notice object!
- `usesRenewableEnergy` (boolean): When enabled, if no electricity rate is assigned to the charge point any roaming session will be marked as using renewable energy.
The actual energy mix can be specified in an electricity rate, which can then be assigned to the charge point. In that case the energy mix will be provided for roaming sessions.
This information can be gathered from the utility provider or third-party platforms that provide this information to the public.

- `integratedAt` (string) (nullable): ISO 8601 formatted date
- `manufacturedAt` (string) (nullable): ISO 8601 formatted date

---


## POST /public-api/resources/charge-points/v2.0

**Summary**: Charge Point / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `type` (string): `public` - a charge point visible on the map to everybody </br>
`private` - by default hidden from the map and for private usage only - company and their employees for example. The visibility of the charge point could be managed in partner object, with the different options for accessType. </br>
`personal` - the charge point could have a single owner only. The owner is set when the user claims the charger or with Actions / Change Owner. </br>

- `pin` (string): Required for personal charge points. The PIN should be provided in the mobile app when the charge point is claimed by a user. Should contain only numbers.

- `locationId` (integer): locationId is always a REQUIRED field for commercial public and commercial private charge points. It is NOT a required field only for personal charge points.

- `chargingZoneId` (integer) (nullable)
- `electricityRateId` (integer): If there is Electricity rate set to the Charge point the electricity cost for each charging session would be tracked. Dynamic electricity rates could not be selected, only ones created in the resource / electricity-rate.

- `subscription` (object): An active subscription could be required for personal (home) charge points in order to use the charge point.
  - `subscription.required` (boolean): Only for personal charge points. Require an active subscription to use the charge point.
- `subscription` (object): An active subscription could be required for personal (home) charge points in order to use the charge point.
  - `subscription.planIds` (array): Only for personal charge points. List of subscription plans for any of which the user should have an active subscription, to be able to use the charge point.
- `networkType` (string)
- `status` (string): Shows the system status of the Charge Point. </br>
`enabled` - the charge point is fully operative.
`disabled` - the charge point would not be shown on the map if it is a commercial public or commercial private with the relevant option for visibility nor could be claimed or found by ID if it is personal (home). </br>
`demo` - acts as a simulator so different setups could be tested. </br>
`out of order` - the charge point is visible and shared with users, but a charging session

- `managedByOperator` (boolean): This flag indicates whether the operator can actively manage the charge point. If the flag is set to `false` the charge point can still be shown to users, but they can't request to start a session on it.

Deprecated. Please use `communicationMode` instead.

- `externalId` (string)
- `network` (object)
  - `network.id` (string) (nullable): OCPP Identifier
- `network` (object)
  - `network.protocol` (string)
- `network` (object)
  - `network.password` (string)
- `network` (object)
  - `network.ip` (string): Required for ocpp 1.5 (SOAP)
- `network` (object)
  - `network.port` (integer): Required for ocpp 1.5 (SOAP)
- `capabilities` (array): `remote_start_stop_capable` - whether Remote start/stop is possible for the Charge Point </br>
`meter_values` - whether the Charge Point should send meter updates to the system </br>
`stop_transaction_on_ev_disconnect` - for ongoing sessions, when the cable is unplugged this should stop the session and if it is returned back a new session would be created. </br>
`disregard_the_heartbeats` - only for OCPP 1.5 SOAP. Network status by default is updated based on the heartbeat messages. When enabled, the Charge Point would be always treated as available and its network status would not depend on heartbeat messages. </br>
`display_messages` - charger has a display and it is enabled to display messages. This capability is enabled automatically when the charger reports the corresponding configuration key. When creating a charge point, the capability is ignored as it is automatically detected on boot. </br>

- `autoStartWithoutAuthorization` (boolean): When enabled the system would allow charging sessions initiated </br>
locally by the charge point assuming it is setup to work in auto-start / </br>
plug-and-charge mode. It would also automatically start a </br>
session with a remote start command if one is not already started by the charging stations a  </br>
few seconds after a Preparing status is detected indicating that a vehicle is connected.

- `disableAutoStartEmulation` (boolean): The Auto-start option above does 2 things: (1) it allows charging </br>
sessions started by the charge point assuming that it may be set up locally </br>
to auto-start charging when a vehicle is connected and (2) if the charging </br>
station doesnt start the session within a few seconds after the vehicles is </br>
connected the system sends a remote start command - which is to emulate auto-start </br>
charging. With this checkbox you can disable the emulation and rely </br>
entirely on the charging station to auto-start the charging. </br>

- `security` (object)
  - `security.desiredProfile` (integer): The backend will try to set it 3 times at boot notification. If the charge point does not support it, the backend will use the highest security profile the charge point could use. </br>
The following security profiles are supported: </br>
0: `No Authentication` </br>
1: `Unsecured Trasport with Basic Authentication (Plain-back Authentication)` - It does not include authentication for the CSMS, or measures to set up a secure communication channel. Therefore, it should only be used in trusted networks, for instance in networks where there is a VPN between the CSMS and the Charging Station. For field operation it is highly recommended to use a security profile with TLS. </br>
2: `TLS with Basic Authentication (Encrypted Authentication)` - In the TLS with Basic Authentication profile, the communication channel is secured using Transport Layer Security (TLS). The CSMS authenticates itself using a TLS server certificate. The Charging Stations authenticate themselves using HTTP Basic Authentication. </br>
3: `TLS with client-side certificates profile` </br>

- `security` (object)
  - `security.currentProfile` (integer) (read-only): The security profile that is currenty being used by the charge point. Description of the supported security profiles can be found in the security whitepaper available here - https://www.openchargealliance.org/protocols/ocpp-16/
- `security` (object)
  - `security.hardwareEnabledProfile` (integer) (read-only): The maximum security profile that the charge point hardware supports. Description of the supported security profiles can be found in the security whitepaper available here - https://www.openchargealliance.org/protocols/ocpp-16/
- `security` (object)
  - `security.desiredProfileStatus` (string) (read-only): Whether the last requested desiredSecurityProfile was successfully applied to the charge point.

- `modelId` (integer) (nullable): The ID of the CP Model, if one is associated with the Charge Point. Can be set to null to remove the current CP Model associated with the Charge Point. Mind that on boot the charger reports the hardware model and it is automatically updated.

- `enableAutoFaultRecovery` (boolean)
- `user` (object): Owner information along with owner preferences of the charge point when of type *personal*. If smart charging is enabled, smart charging preferences are also included.
  - `user.id` (integer) (nullable)
- `user` (object): Owner information along with owner preferences of the charge point when of type *personal*. If smart charging is enabled, smart charging preferences are also included.
  - `user.automaticFirmwareUpdatesEnabled` (boolean)
- `partner` (object)
  - `partner.id` (integer)
- `partner` (object)
  - `partner.contractId` (integer)
- `partner` (object)
  - `partner.contactId` (integer)
- `partner` (object)
  - `partner.corporateBillingAsDefault` (boolean): The partner's corporate billing would be used as a payment method by default, when a user who is invited to use the partner's corporate billing starts a session on the charge point.
- `partner` (object)
  - `partner.accessType` (string): `private_view_private_use` - only users invited by the partner with the option to access private charge points could view this charge point on the map and use it. </br>
`private_view_public_use` - only users invited by the partner with the option to access private charge points can view this charge point on the map but anyone who scans the QR or enters the ID can use it. </br>
`public_view_private_use` - anyone could see the charge point on the map with a notice but only users invited by the partner with the option to access private charge points could use it.` </br>

- `partner` (object)
  - `partner.notice` (array): The notice is only available if the charge point is of type `private` and the accessType is `public_view_private_use`
- `utilityId` (integer) (nullable)
- `createdAt` (string) (read-only): ISO 8601 formatted date
- `firstContactAt` (string) (read-only): ISO 8601 formatted date
- `roamingOperatorId` (integer) (read-only): When null, the charge point is a local one. For roaming charge points, the ID of the roaming operator is provided
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.id` (integer)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.minChargingRate` (number) (nullable)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.schedulePeriods` (array) (nullable)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.scheduleStart` (string) (nullable)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.chargingRateUnit` (string)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.stackLevel` (integer)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.chargingProfileKind` (string)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.recurrencyKind` (string) (nullable)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.chargingCompleteAt` (string) (nullable)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.purpose` (string)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.validTo` (string) (nullable)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.validFrom` (string) (nullable)
- `chargingProfile` (object) (nullable) (read-only)
  - `chargingProfile.duration` (integer) (nullable)
- `displayTariffAndCosts` (boolean) (read-only): The charge point has a display and messages could be shown to the user.
- `lastBootNotification` (object) (nullable) (read-only)
  - `lastBootNotification.model` (string)
- `lastBootNotification` (object) (nullable) (read-only)
  - `lastBootNotification.vendor` (string)
- `lastBootNotification` (object) (nullable) (read-only)
  - `lastBootNotification.chargeBoxSerialNumber` (string) (nullable)
- `lastBootNotification` (object) (nullable) (read-only)
  - `lastBootNotification.chargePointSerialNumber` (string) (nullable)
- `lastBootNotification` (object) (nullable) (read-only)
  - `lastBootNotification.firmwareVersion` (string) (nullable)
- `lastBootNotification` (object) (nullable) (read-only)
  - `lastBootNotification.iccid` (string) (nullable)
- `lastBootNotification` (object) (nullable) (read-only)
  - `lastBootNotification.imsi` (string) (nullable)
- `lastBootNotification` (object) (nullable) (read-only)
  - `lastBootNotification.meterSerialNumber` (string) (nullable)
- `lastBootNotification` (object) (nullable) (read-only)
  - `lastBootNotification.meterType` (string) (nullable)
- `lastBootNotification` (object) (nullable) (read-only)
  - `lastBootNotification.lastUpdatedAt` (string) (read-only): ISO 8601 formatted date
- `networkStatus` (string) (read-only): Connection status of the charge point </br>
`never_connected` - the charge point has not yet connected to the CPMS </br>
`available` - connected to the CPMS </br>
`temporarily_unavailable` - disconnected a short while ago </br>
`long-term_unavailable` - disconnected, and some time has passed, so we dont expect the connection will be restores. </br>

- `hardwareStatus` (string) (read-only): When hardware status is null, that means that the charge point has not connected yet or has not reported a hardware status for the charge point in the past.
- `vendorErrorCode` (string) (read-only): This property is shown only when the hardwareStatus is `faulted`
- `tags` (array): Tags can be used for filtering and grouping chargers by tag. When doing a PATCH input all tags that should be associated with the charge point. Omitting a tag would remove it from the charge point.
- `sharingCode` (string)
- `enabledRandomisedDelay` (boolean): Applicable only for personal charge points. For `public` and `private` charge points will be omitted
- `noticeId` (integer) (nullable): If both noticeId and partner.notice object are provided in the request the noticeId will be used to complete the request NOT the partner.notice object!
- `usesRenewableEnergy` (boolean): When enabled, if no electricity rate is assigned to the charge point any roaming session will be marked as using renewable energy.
The actual energy mix can be specified in an electricity rate, which can then be assigned to the charge point. In that case the energy mix will be provided for roaming sessions.
This information can be gathered from the utility provider or third-party platforms that provide this information to the public.

- `integratedAt` (string) (read-only): ISO 8601 formatted date
- `manufacturedAt` (string) (read-only): ISO 8601 formatted date
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date
- `ocppConnectedChargePointId` (integer): The ID of the charge point that is connected to the backend and used by this charge point for OCPP communication. Required when the `communicationMode` is `via_ocpp_connected_charge_point`.

- `communicationMode` (string): This property is required!</br>
It obsoletes the `managedByOperator` property, which can still be used by older implementations, so neither is marked as required.</br>
Indicates how the charge point communicates with the backend.</br>
`none` - the charge point is not connected to the backend. The charge point can be displayed to users with instructions how to use it. An informational notice can be associated with the charge point using the `noticeId` property.</br>
`direct_ocpp` - the charge point is connected through OCPP and is actively being managed by the backend.</br>
`via_ocpp_connected_charge_point` - the charge point is a satellite of another charge point which communicates through OCPP and is identified by `ocppConnectedChargePointId`. The charge point is not actively managed, but inherits most of its properties from its master charge point. When creating this type of charge point, the following fields are not required and will not be used:</br>
  - electricityRateId</br>
  - networkType</br>
  - capabilities</br>
  - network</br>
  - autoStartWithoutAuthorization</br>
  - disableAutoStartEmulation</br>
  - security</br>
  - modelId</br>
  - enableAutoFaultRecovery</br>
  - utilityId</br>
  - usesRenewableEnergy</br>
  - enabledRandomisedDelay</br>
  - integratedAt</br>
  - manufacturedAt</br>

- `electricityCostReimbursementIntegrationId` (integer) (nullable): The ID of the third-party electricity cost reimbursement integration to use for processing reimbursements for charging sessions at this charge point. Only applicable to personal (home) charge points - ignored for public and private charge points.

- `installationAndMaintenanceCompanyId` (integer) (nullable): Optional. The ID of the Installation & Maintenance company associated with this charge point. Must be owned by the same operator.

Validation:
- If provided and not null, must reference a valid I&M company ID that belongs to the operator
- Invalid or cross-operator I&M company IDs return validation error: "The selected installation and maintenance company ID is invalid"
- Can be set to null to remove I&M company assignment


---


## PATCH /public-api/resources/circuits/v1.0/{dlmCircuit}

**Summary**: Circuit / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `phases` (string)
- `maxCurrent` (number): In Amps
- `minChargePointCurrent` (number): In Amps. The minimum
- `setSessionLimitToZeroOnIdle` (boolean): Set charger limit to 0 if an idle period starts
- `chargePoints` (array)
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

---


## POST /public-api/resources/circuits/v1.0

**Summary**: Circuit / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `phases` (string)
- `maxCurrent` (number): In amps
- `minChargePointCurrent` (number): In amps. The minimum
- `setSessionLimitToZeroOnIdle` (boolean): Set charger limit to 0 if an idle period starts
- `chargePoints` (array)
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: name, phases, maxCurrent, chargePoints

---


## PATCH /public-api/resources/circuits/v2.0/{circuit}/user-priorities/{userPriority}

**Summary**: Circuits / User Priority / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `targetId` (integer): The ID of the User Group the user must be part of or the ID of the Partner from which the user must have an invite from, for the set priority apply for the session.
- `type` (string)
- `priority` (number): The priority where 1 is equal to anyone else, 2 is twice as important, 0.5 is half as important.

---


## POST /public-api/resources/circuits/v2.0/{circuit}/user-priorities

**Summary**: Circuits / User Priority / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `targetId` (integer): The ID of the User Group the user must be part of or the ID of the Partner from which the user must have an invite from, for the set priority apply for the session.
- `type` (string)
- `priority` (number): The priority where 1 is equal to anyone else, 2 is twice as important, 0.5 is half as important.

**Required**: targetId, type, priority

---


## PATCH /public-api/resources/circuits/v2.0/{circuit}

**Summary**: Circuit / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `parentCircuitId` (integer) (nullable): Specify parent circuit in Multi-level DLM. Circuits used in flexibility assets or using load balancing integration can not be used in Multi-level DLM.

- `phases` (string)
- `phaseRotation` (string): `R` stands for `L1`, </br>
`S` - for `L2` </br>
`T` - for `L3` </br>
So for example `RST` = `L1`, `L2`, `L3`, while `RTS` = `L1`, `L3`, `L2`, etc. </br>
The field is mandatory for Multi-level DLM when the `phases` value  is `three_phase`.

- `connectedPhase` (string): Specifies the active line conductors used in the circuit. </br>
Single phase values (`phases` = `single_phase`): `L1`, `L2`, `L3` - Valid in `star` electrical configuration </br>
Split phase values (`phases` = `split_phase`): `L1_L2`, `L2_L3`, `L1_L3` - Valid in `star` electrical configuration </br>
This field is mandatory for Multi-level DLM when the `phases` value is `single_phase` or `split_phase`.

- `electricalConfiguration` (string): Defines the type of electrical configuration of the charge point. The available options are </br> `star` - TN system - Star (Y) (default)</br> `delta` - IT system - Delta (Δ)</br>
- `maxVoltage` (string) (nullable)
- `maxCurrent` (number): The current (A) limit for the whole circuit. This would usually be the circuit breaker rated current.
- `minChargePointCurrent` (number) (nullable): Defines what is the lowest current (A) allowed per charge point. New sessions cannot start if any of the existing ones has to be lowered to less than the set minimum rate. This is to ensure that a connected car vehicle actually charge because the vehicles have a minimum charging rate below which they would not accept the charge. If left empty, there is no minimum.
- `setSessionLimitToZeroOnIdle` (boolean): Sets the limit to 0 when the session enters an idle period.
- `electricityMeterId` (number) (nullable): The ID of the Electricity Meter linked to the circuit (if any).
- `offlineReservedCurrent` (number) (nullable): The current (A) reserved for other loads on the circuit (non-managed loads) when the Electricity Meter is offline.
- `loadBalancingIntegration` (object) (nullable): The selected integration enables the system to receive and apply third-party charging limits to the chargers added in the circuit.
  - `loadBalancingIntegration.id` (integer) (nullable): The id of the load balancing integration (can be found in the Ampeco backend). Provide `null` if you want to disable any load balancing integration and revert back to the Ampeco built-in load balancing.
- `loadBalancingIntegration` (object) (nullable): The selected integration enables the system to receive and apply third-party charging limits to the chargers added in the circuit.
  - `loadBalancingIntegration.fields`

---


## POST /public-api/resources/circuits/v2.0

**Summary**: Circuit / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `parentCircuitId` (integer) (nullable): Specify parent circuit in Multi-level DLM. Circuits used in flexibility assets or using load balancing integration can not be used in Multi-level DLM.

- `phases` (string)
- `phaseRotation` (string): `R` stands for `L1`, </br>
`S` - for `L2` </br>
`T` - for `L3` </br>
So for example `RST` = `L1`, `L2`, `L3`, while `RTS` = `L1`, `L3`, `L2`, etc. </br>
The field is mandatory for Multi-level DLM when the `phases` value  is `three_phase`.

- `connectedPhase` (string): Specifies the active line conductors used in the circuit. </br>
Single phase values (`phases` = `single_phase`): `L1`, `L2`, `L3` - Valid in `star` electrical configuration </br>
Split phase values (`phases` = `split_phase`): `L1_L2`, `L2_L3`, `L1_L3` - Valid in `star` electrical configuration </br>
This field is mandatory for Multi-level DLM when the `phases` value is `single_phase` or `split_phase`.

- `electricalConfiguration` (string): Defines the type of electrical configuration of the charge point. The available options are </br> `star` - TN system - Star (Y) (default)</br> `delta` - IT system - Delta (Δ)</br>
- `maxVoltage` (string) (nullable)
- `maxCurrent` (number): The current (A) limit for the whole circuit. This would usually be the circuit breaker rated current.
- `minChargePointCurrent` (number) (nullable): Defines what is the lowest current (A) allowed per charge point. New sessions cannot start if any of the existing ones has to be lowered to less than the set minimum rate. This is to ensure that a connected car vehicle actually charge because the vehicles have a minimum charging rate below which they would not accept the charge. If left empty, there is no minimum.
- `setSessionLimitToZeroOnIdle` (boolean): Sets the limit to 0 when the session enters an idle period.
- `electricityMeterId` (number) (nullable): The ID of the Electricity Meter linked to the circuit (if any).
- `offlineReservedCurrent` (number) (nullable): The current (A) reserved for other loads on the circuit (non-managed loads) when the Electricity Meter is offline.
- `loadBalancingIntegration` (object) (nullable): The selected integration enables the system to receive and apply third-party charging limits to the chargers added in the circuit.
  - `loadBalancingIntegration.id` (integer) (nullable): The id of the load balancing integration (can be found in the Ampeco backend). Provide `null` if you want to disable any load balancing integration and revert back to the Ampeco built-in load balancing.
- `loadBalancingIntegration` (object) (nullable): The selected integration enables the system to receive and apply third-party charging limits to the chargers added in the circuit.
  - `loadBalancingIntegration.fields`

**Required**: name, phases, maxCurrent

---


## PATCH /public-api/resources/configuration-templates/v1.0/{template}/variables/{variable}

**Summary**: Configuration Template Variable / Update

**Request Body Schema**:

**Note**: This schema uses `oneOf` (multiple possible structures).

```json
{"title":"Configuration Template Variable Update","description":"Configuration template variable data for updates - OCPP 1.6 or 2.1","oneOf":[{"title":"Configuration variable for OCPP 1.6","type":"object","additionalProperties":false,"properties":{"id":{"type":"integer","readOnly":true},"keyName":{"type":"string"},"value":{"type":"string"},"lastUpdatedAt":{"readOnly":true,"type":"string","format":"date-time","description":"ISO 8601 formatted date"}}},{"title":"Configuration variable for OCPP 2.0.1","type":"object","description":"Represents a configuration variable based on the OCPP 2.0.1 specification.\nFields such as `variableName`, `variableType`, `variableInstance`, `component`,\n`componentInstance`, `evseId`, and `connectorId` directly correspond to the OCPP 2.0.1 protocol.\n","properties":{"id":{"type":"integer","readOnly":true},"value":{"type":"string"},"variableName":{"type":"string"},"variableType":{"type":"string","enum":["Actual","Target","MinSet","MaxSet"],"nullable":true},"variableInstance":{"type":"string","nullable":true},"component":{"type":"string"},"componentInstance":{"type":"string","nullable":true},"evseId":{"type":"integer","nullable":true},"connectorId":{"type":"integer","nullable":true},"lastUpdatedAt":{"readOnly":true,"type":"string","format":"date-time","description":"ISO 8601 formatted date"}}}]}
```

---


## POST /public-api/resources/configuration-templates/v1.0/{template}/variables

**Summary**: Configuration Template Variable / Create

**Request Body Schema**:

**Note**: This schema uses `oneOf` (multiple possible structures).

```json
{"title":"Configuration Template Variable Create","description":"Configuration template variable data for creation - OCPP 1.6 or 2.1","oneOf":[{"title":"Configuration variable for OCPP 1.6","required":["keyName","value"],"type":"object","additionalProperties":false,"properties":{"id":{"type":"integer","readOnly":true},"keyName":{"type":"string"},"value":{"type":"string"},"lastUpdatedAt":{"readOnly":true,"type":"string","format":"date-time","description":"ISO 8601 formatted date"}}},{"title":"Configuration variable for OCPP 2.0.1","required":["value","variableName","component"],"type":"object","description":"Represents a configuration variable based on the OCPP 2.0.1 specification.\nFields such as `variableName`, `variableType`, `variableInstance`, `component`,\n`componentInstance`, `evseId`, and `connectorId` directly correspond to the OCPP 2.0.1 protocol.\n","properties":{"id":{"type":"integer","readOnly":true},"value":{"type":"string"},"variableName":{"type":"string"},"variableType":{"type":"string","enum":["Actual","Target","MinSet","MaxSet"],"nullable":true},"variableInstance":{"type":"string","nullable":true},"component":{"type":"string"},"componentInstance":{"type":"string","nullable":true},"evseId":{"type":"integer","nullable":true},"connectorId":{"type":"integer","nullable":true},"lastUpdatedAt":{"readOnly":true,"type":"string","format":"date-time","description":"ISO 8601 formatted date"}}}]}
```

---


## PATCH /public-api/resources/configuration-templates/v1.0/{template}

**Summary**: Configuration Template / Update

**Request Body Schema**:

**Properties**:

- `name` (string)

---


## POST /public-api/resources/configuration-templates/v1.0

**Summary**: Configuration Template / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `ocppVersion` (string)
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: name, ocppVersion

---


## POST /public-api/resources/consents/v1.0

**Summary**: Consents / Create

**Request Body Schema**:

**Properties**:

- `userId` (integer): The ID of the user for whom consent is being created
- `termVersionId` (integer): The ID of the specific term version for which consent is being given or rejected
- `status` (string): The consent status:
- agreed: User has agreed to the terms
- rejected: User has explicitly rejected the terms


**Required**: userId, termVersionId, status

---


## PUT /public-api/resources/contact-details/v2.0

**Summary**: Contact details / Update

**Request Body Schema**:

**Properties**:

- `email` (string)
- `phone` (string) (nullable)
- `lastUpdatedAt`

**Required**: email

---


## PATCH /public-api/resources/cp-models/v1.0/{modelId}

**Summary**: Charge Point Model / Update

**Request Body Schema**:

**Properties**:

- `name` (string)
- `vendorId` (integer)
- `userManual` (string): A download link for the user manual. Shown in the mobile app for home chargers.
- `installerManual` (string): URL to an externally-hosted installer manual. The system stores this URL reference only (does not download or cache the document) and provides it to installers for viewing/downloading through the installer app interface.

---


## POST /public-api/resources/cp-models/v1.0

**Summary**: Charge Point Model / Create

**Request Body Schema**:

**Properties**:

- `name` (string)
- `vendorId` (integer)
- `userManual` (string): A download link for the user manual. Shown in the mobile app for home chargers.
- `installerManual` (string): URL to an externally-hosted installer manual. The system stores this URL reference only (does not download or cache the document) and provides it to installers for viewing/downloading through the installer app interface.

**Required**: name, vendorId

---


## PATCH /public-api/resources/cp-vendors/v1.0/{vendorId}

**Summary**: Charge Point Vendor / Update

**Request Body Schema**:

**Properties**:

- `name` (string)

---


## POST /public-api/resources/cp-vendors/v1.0

**Summary**: Charge Point Vendor / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)

**Required**: id, name

---


## PATCH /public-api/resources/currencies/v2.0/{currency}

**Summary**: Currency / Update

**Request Body Schema**:

**Properties**:

- `alphabeticCode` (string): The currency 3-letter code.
- `prefix` (string) (nullable): When displaying amounts in this currency, the prefix is added in front of the amount. This could be symbols, for example $ or £.
- `suffix` (string) (nullable): When displaying amounts in this currency, the suffix is added after the amount.
- `decimal` (integer) (nullable): The actual precision of the currency. This is used when charging a payment method or calculating totals.
- `unitPriceAndCalculationsDecimal` (integer) (nullable): Used when setting price per kWh and per minute in tariffs.
- `enableUseOfMinorCurrencyUnit` (boolean): When enabled, the minor currency unit is used to set electricity price threshold for flexible tariffs and to set electricity cost tracking in the home charging app. The minor currency unit for the US dollar, for example, is the cent.
- `minorUnitSign` (string) (nullable): The sign or letter for the minor currency unit. For US dollar, for example, this could be "¢" or "c" for cents.

**Required**: alphabeticCode

---


## POST /public-api/resources/currencies/v2.0

**Summary**: Currency / Create

**Request Body Schema**:

**Properties**:

- `alphabeticCode` (string): The currency 3-letter code.
- `prefix` (string) (nullable): When displaying amounts in this currency, the prefix is added in front of the amount. This could be symbols, for example $ or £.
- `suffix` (string) (nullable): When displaying amounts in this currency, the suffix is added after the amount.
- `decimal` (integer) (nullable): The actual precision of the currency. This is used when charging a payment method or calculating totals.
- `unitPriceAndCalculationsDecimal` (integer) (nullable): Used when setting price per kWh and per minute in tariffs.
- `enableUseOfMinorCurrencyUnit` (boolean): When enabled, the minor currency unit is used to set electricity price threshold for flexible tariffs and to set electricity cost tracking in the home charging app. The minor currency unit for the US dollar, for example, is the cent.
- `minorUnitSign` (string) (nullable): The sign or letter for the minor currency unit. For US dollar, for example, this could be "¢" or "c" for cents.

**Required**: alphabeticCode

---


## PATCH /public-api/resources/currency-rates/v1.0/{currencyRate}

**Summary**: Currency Rate / Update

**Request Body Schema**:

**Properties**:

- `rate` (number): The exchange rate from base to target currency

**Required**: rate

---


## POST /public-api/resources/currency-rates/v1.0

**Summary**: Currency Rate / Create

**Request Body Schema**:

**Properties**:

- `base` (string): Base currency code (ISO 4217)
- `target` (string): Target currency code (ISO 4217)
- `rate` (number): The exchange rate from base to target currency

**Required**: base, target, rate

---


## PATCH /public-api/resources/downtime-period-notices/v1.0/{notice}

**Summary**: Downtime Period Notices / Update

**Request Body Schema**:

**Properties**:

- `type` (string)
- `notice` (string)
- `description` (string) (nullable)

---


## POST /public-api/resources/downtime-period-notices/v1.0

**Summary**: Downtime Period Notices / Create

**Request Body Schema**:

**Properties**:

- `type` (string)
- `notice` (string)
- `description` (string) (nullable)

**Required**: notice, type

---


## PATCH /public-api/resources/electricity-meters/v1.0/{electricityMeter}

**Summary**: Electricity Meter / Update

**Request Body Schema**:

**Properties**:

- `name` (string)
- `integrationId` (integer)
- `integrationParameters` (object): Electricity meter integration parameters.

---


## POST /public-api/resources/electricity-meters/v1.0

**Summary**: Electricity Meter / Create

**Request Body Schema**:

**Properties**:

- `id` (number) (read-only): Unique ID of the Electricity Meter.
- `name` (string)
- `integrationId` (integer)
- `integrationParameters` (object): Electricity meter integration parameters.

---


## PUT /public-api/resources/electricity-rates/v1.0/{electricityRate}

**Summary**: Electricity rate / Update

**Request Body Schema**:

**Note**: This schema uses `anyOf` (multiple possible structures).

```json
{"anyOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"utilityId":{"type":"integer","nullable":true},"pricingGranularityInMinutes":{"type":"integer","enum":[60,30,15]},"defaultPricePerKwh":{"type":"number","description":"If there is no pricing supplied for a time interval or no time interval at all, this price would be used."},"taxId":{"type":"integer","description":"Deprecated! Please use `taxPercentage` instead! This field is used only to indicate the applied tax. All Electricity Rate prices should be supplied including the tax.","deprecated":true},"taxPercentage":{"type":"number","format":"float","multipleOf":0.001,"minimum":0,"maximum":100,"example":12.532,"description":"This field is used only to indicate the applied tax. All Electricity Rate prices should be supplied including the tax."},"intervalPricing":{"type":"array","items":{"type":"object","properties":{"weekDays":{"type":"array","items":{"type":"string","enum":["monday","tuesday","wednesday","thursday","friday","saturday","sunday"]},"description":"Specify the day for which the pricing would be valid."},"elements":{"type":"array","items":{"type":"object","properties":{"startAt":{"type":"string","pattern":"^\\d{2}:\\d{2}:\\d{2}$","description":"Example 00:00:00","example":"00:00:00"},"endAt":{"type":"string","pattern":"^\\d{2}:\\d{2}:\\d{2}$","description":"Example 01:00:00","example":"01:00:00"},"price":{"type":"number","nullable":true}},"required":["startAt","endAt"]}}},"required":["weekDays"]},"nullable":true,"description":"The time interval must be always the same for every single day through the week and could be either 15 min, 30 min or 60 min. The startAt and endAt must comply with this restriction."},"intervalSpecialPricing":{"type":"array","items":{"type":"object","properties":{"specialPricingName":{"type":"string"},"validOn":{"type":"array","items":{"type":"string","format":"date"},"description":"A list of dates when the special pricing would apply, e.g. holidays, promo days, etc."},"elements":{"type":"array","items":{"type":"object","properties":{"startAt":{"type":"string","pattern":"^\\d{2}:\\d{2}:\\d{2}$","description":"Example 00:00:00","example":"00:00:00"},"endAt":{"type":"string","pattern":"^\\d{2}:\\d{2}:\\d{2}$","description":"Example 01:00:00","example":"01:00:00"},"price":{"type":"number","nullable":true}},"required":["startAt","endAt"]}}},"required":["specialPricingName","validOn"]},"nullable":true,"description":"The same time interval as in intervalPricing must be used. The startAt and endAt must comply with this restriction."}},"required":["name","pricingGranularityInMinutes","defaultPricePerKwh"]}]}
```

---


## POST /public-api/resources/electricity-rates/v1.0

**Summary**: Electricity rate / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `utilityId` (integer) (nullable)
- `pricingGranularityInMinutes` (integer)
- `defaultPricePerKwh` (number): If there is no pricing supplied for a time interval or no time interval at all, this price would be used.
- `taxId` (integer): Deprecated! Please use `taxPercentage` instead! This field is used only to indicate the applied tax. All Electricity Rate prices should be supplied including the tax.
- `taxPercentage` (number): This field is used only to indicate the applied tax. All Electricity Rate prices should be supplied including the tax.
- `intervalPricing` (array) (nullable): The time interval must be always the same for every single day through the week and could be either 15 min, 30 min or 60 min. The startAt and endAt must comply with this restriction.
- `intervalSpecialPricing` (array) (nullable): The same time interval as in intervalPricing must be used. The startAt and endAt must comply with this restriction.

**Required**: name, pricingGranularityInMinutes, defaultPricePerKwh

---


## PUT /public-api/resources/electricity-rates/v2.0/{electricityRate}/energy-mix

**Summary**: Electricity rate / Energy Mix / Update

**Request Body Schema**:

**Properties**:

- `solar` (number): Represents what percent of the energy is generated from solar power.
- `wind` (number): Represents what percent of the energy is generated from wind turbines.
- `hydro` (number): Represents what percent of the energy is generated from hydropower.
- `nuclear` (number): Represents what percent of the energy is generated from nuclear power plants.
- `coal` (number): Represents what percent of the energy is generated from burning coal.
- `naturalGas` (number): Represents what percent of the energy is generated from natural gas.
- `otherRenewable` (number): Represents what percent of the energy is generated from any other type of renewable energy source. This could include any other renewable source not specifically listed.
- `otherNonRenewable` (number): Represents what percent of the energy is generated from any other type of non-renewable energy source. This could include any other non-renewable source not specifically listed.

---


## PUT /public-api/resources/electricity-rates/v2.0/{electricityRate}/price-periods/date/{date}

**Summary**: Electricity rate / Price periods / Date / Create or update

**Request Body Schema**:

**Properties**:

- `periods` (array)

**Required**: periods

---


## PUT /public-api/resources/electricity-rates/v2.0/{electricityRate}/price-periods/week-day/{weekDay}

**Summary**: Electricity rate / Price periods / Week day / Create or update

**Request Body Schema**:

**Properties**:

- `periods` (array)

**Required**: periods

---


## PATCH /public-api/resources/electricity-rates/v2.0/{electricityRate}

**Summary**: Electricity rate / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `utilityId` (integer) (nullable): The id of the utility providing the electricity. Configured in the Ampeco admin panel.
- `defaultPrice` (number): The default price per kWh, which will be applied if there is no pricing supplied for a time interval.
Prices of all electricity rates created through the Public API or tha Ampeco admin panel must include the tax in the price.
Price per kWh.

- `taxPercentage` (number) (nullable): This field is used only to indicate the applied tax. All Electricity Rate prices should be provided with the tax included in the price.

---


## POST /public-api/resources/electricity-rates/v2.0

**Summary**: Electricity rate / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `utilityId` (integer) (nullable): The id of the utility providing the electricity. Configured in the Ampeco admin panel.
- `defaultPrice` (number): The default price per kWh, which will be applied if there is no pricing supplied for a time interval.
Prices of all electricity rates created through the Public API or tha Ampeco admin panel must include the tax in the price.
Price per kWh.

- `taxPercentage` (number) (nullable): This field is used only to indicate the applied tax. All Electricity Rate prices should be provided with the tax included in the price.

**Required**: name, defaultPrice, taxPercentage

---


## PATCH /public-api/resources/evse-downtime-periods/v1.0/{evseDowntimePeriod}

**Summary**: EVSE Downtime Period / Update

**Request Body Schema**:

**Properties**:

- `noticeId` (integer) (nullable)
- `startedAt` (string): Allowed only for downtime period with `type = exempt AND entryMode = manual`
- `endedAt` (string): Allowed only for downtime period with `type = exempt AND entryMode = manual`

---


## POST /public-api/resources/evse-downtime-periods/v1.0

**Summary**: EVSE Downtime Period / Create

**Request Body Schema**:

**Properties**:

- `evseId` (integer)
- `noticeId` (integer): Allowed only notice with `type = exempt`!
- `startedAt` (string)
- `endedAt` (string)

**Required**: evseId, noticeId, startedAt, endedAt

---


## PUT /public-api/resources/evses/v2.0/{evse}

**Summary**: EVSE / Update

**Request Body Schema**:

**Properties**:

- `hardwareStatus` (string) (nullable) (read-only): Status reported by the charge point's EVSE:
 * `available` - When a Connector becomes available for a new user (Operative)
 * `preparing` - When a Connector becomes no longer available for a new user but there is no ongoing Transaction (yet). Typically a Connector is in preparing state when a user presents a tag, inserts a cable or a vehicle occupies the parking bay (Operative)
 * `charging` - When the contactor of a Connector closes, allowing the vehicle to charge (Operative)
 * `suspendedEVSE` - When the EV is connected to the EVSE but the EVSE is not offering energy to the EV, e.g. due to a smart charging restriction, local supply power constraints. (Operative)
 * `suspendedEV` - When the EV is connected to the EVSE and the EVSE is offering energy but the EV is not taking any energy. For example the driver has unlocked the car, and the car has paused charging. (Operative)
 * `finishing` - When a Transaction has stopped at a Connector, but the Connector is not yet available for a new user, e.g. the cable has not been removed or the vehicle has not left the parking bay (Operative)
 * `reserved` - When a EVSE becomes reserved as a result of a Reserve Now command (Operative)
 * `unavailable` - When a EVSE becomes unavailable as the result of a Change Availability command or an event upon which the Charge Point transitions to unavailable at its discretion. Upon receipt of a Change Availability command, the status MAY change immediately or the change MAY be scheduled. When scheduled, the Status Notification shall be send when the availability change becomes effective (Inoperative)
 * `faulted` - When a Charge Point or connector has reported an error and is not available for energy delivery (Inoperative)

When hardware status is null, that means that the charge point has not connected yet or has not reported a hardware status for this evse in the past


---


## PATCH /public-api/resources/evses/v2.1/{evse}

**Summary**: EVSE / Update

**Request Body Schema**:

**Properties**:

- `physicalReference` (string): The identifier that is presented to the users, so they can identify the EVSE at the location.
- `currentType` (string): Type of current available on the EVSE:
- **ac**: Alternating Current (AC) charging
- **dc**: Direct Current (DC) fast charging

- `label` (string): The EVSE label will be exposed and visualized in the mobile application
- `networkId` (string): The OCPP evse identifier (should be consecutive numbers starting from 1)
- `status` (string): For roaming EVSEs the status can only be updated if the option for manual management of EVSEs is enabled for the roaming CPO.
- `midMeterCertificationEndYear` (integer) (nullable): The mid meter certification end year.
- `tariffGroupId` (integer) (nullable): The ID of the tariff group attached to the EVSE. If the EVSE is not roaming and tariffGroupId is not specified, the default (free) tariff will be assigned. For roaming EVSEs the Tariff Group can only be updated if the option for manual management of EVSEs is enabled for the roaming CPO.
- `allowsReservation` (boolean): Manages whether reservations are allowed on this EVSE. Requires the Reservations to be activated for the system in order to enable for the EVSE.
- `bookingEnabled` (boolean): Indicates if the EVSE can be booked. Requires the Bookings to be activated for the operator and automatically enables allowsReservation when set to true.
- `powerOptions` (object)
  - `powerOptions.maxPower` (integer) (nullable): in Wh
- `powerOptions` (object)
  - `powerOptions.maxVoltage` (string) (nullable): The maxVoltage of a charge point can fluctuate. Hence, when creating a charge point in the system, the maxVoltage is given as a range. For OCPI purposes it maps as follows: 220-240 = 230 110-130 = 120 400 = 400 380 = 380

- `powerOptions` (object)
  - `powerOptions.maxAmperage` (number) (nullable)
- `powerOptions` (object)
  - `powerOptions.phases` (string) (nullable)
- `powerOptions` (object)
  - `powerOptions.phaseRotation` (string) (nullable): `R` stands for `L1`, </br>
`S` - for `L2` </br>
`T` - for `L3` </br>
So for example `RST` = `L1`, `L2`, `L3`, while `RTS` = `L1`, `L3`, `L2`, etc. </br>
We are deriving the connected phase from this property for single phase if connectedPhase is not provided. Please don't rely on this property anymore as this functionality will be turned of in near future. Pass the correct connectedPhase instead. If you pass both properties (connectedPhase and phaseRotation) only connectedPhase will be taken into consideration for determining the phase.

- `powerOptions` (object)
  - `powerOptions.connectedPhase` (string) (nullable): Specifies the active line conductors used in the circuit.
- `L1_L2` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L2_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L1_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L1` - Valid when `phases` = `single_phase` in electrical configuration `star`
- `L2` - Valid when `phases` = `single_phase` in electrical configuration `star`
- `L3` - Valid when `phases` = `single_phase` in electrical configuration `star`

- `externalId` (string)

---


## POST /public-api/resources/evses/v2.1

**Summary**: EVSE / Create

**Request Body Schema**:

**Properties**:

- `chargePointId` (integer): The ID of the charge point.
- `physicalReference` (string): The identifier that is presented to the users, so they can identify the EVSE at the location.
- `currentType` (string): Type of current available on the EVSE:
- **ac**: Alternating Current (AC) charging
- **dc**: Direct Current (DC) fast charging

- `label` (string): The EVSE label will be exposed and visualized in the mobile application
- `networkId` (string): The OCPP evse identifier (should be consecutive numbers starting from 1)
- `status` (string): For roaming EVSEs the status can only be updated if the option for manual management of EVSEs is enabled for the roaming CPO.
- `midMeterCertificationEndYear` (integer) (nullable): The mid meter certification end year.
- `tariffGroupId` (integer) (nullable): The ID of the tariff group attached to the EVSE. If the EVSE is not roaming and tariffGroupId is not specified, the default (free) tariff will be assigned. For roaming EVSEs the Tariff Group can only be updated if the option for manual management of EVSEs is enabled for the roaming CPO.
- `allowsReservation` (boolean): Manages whether reservations are allowed on this EVSE. Requires the Reservations to be activated for the system in order to enable for the EVSE.
- `bookingEnabled` (boolean): Indicates if the EVSE can be booked. Requires the Bookings to be activated for the operator and automatically enables allowsReservation when set to true.
- `powerOptions` (object)
  - `powerOptions.maxPower` (integer) (nullable): in Wh
- `powerOptions` (object)
  - `powerOptions.maxVoltage` (string) (nullable): The maxVoltage of a charge point can fluctuate. Hence, when creating a charge point in the system, the maxVoltage is given as a range. For OCPI purposes it maps as follows: 220-240 = 230 110-130 = 120 400 = 400 380 = 380

- `powerOptions` (object)
  - `powerOptions.maxAmperage` (number) (nullable)
- `powerOptions` (object)
  - `powerOptions.phases` (string) (nullable)
- `powerOptions` (object)
  - `powerOptions.phaseRotation` (string) (nullable): `R` stands for `L1`, </br>
`S` - for `L2` </br>
`T` - for `L3` </br>
So for example `RST` = `L1`, `L2`, `L3`, while `RTS` = `L1`, `L3`, `L2`, etc. </br>
We are deriving the connected phase from this property for single phase if connectedPhase is not provided. Please don't rely on this property anymore as this functionality will be turned of in near future. Pass the correct connectedPhase instead. If you pass both properties (connectedPhase and phaseRotation) only connectedPhase will be taken into consideration for determining the phase.

- `powerOptions` (object)
  - `powerOptions.connectedPhase` (string) (nullable): Specifies the active line conductors used in the circuit.
- `L1_L2` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L2_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L1_L3` - Valid when `phases` = `split_phase` in electrical configuration `star` or `phases` = `single_phase` in electrical configuration `delta`
- `L1` - Valid when `phases` = `single_phase` in electrical configuration `star`
- `L2` - Valid when `phases` = `single_phase` in electrical configuration `star`
- `L3` - Valid when `phases` = `single_phase` in electrical configuration `star`

- `externalId` (string)

**Required**: chargePointId, currentType, networkId, physicalReference, status

---


## PATCH /public-api/resources/faqs/v2.0/{faq}

**Summary**: FAQ / Update

**Request Body Schema**:

**Properties**:

- `question` (array)
- `answer` (array)

---


## POST /public-api/resources/faqs/v2.0

**Summary**: FAQ / Create

**Request Body Schema**:

**Properties**:

- `question` (array)
- `answer` (array)

**Required**: question, answer

---


## PATCH /public-api/resources/flexibility-assets/v1.0/{flexibilityAsset}

**Summary**: Flexibility Assets / Update

**Request Body Schema**:

**Properties**:

- `description` (string) (nullable): Short description of the flexibility asset.
- `downwardRegulationLimit` (integer) (read-only): Downward regulation limit in Watts.
- `upwardRegulationLimit` (integer) (read-only): Upward regulation limit in Watts.
- `integrationId` (number): Flexibility integration.
- `integrationParameters` (object): Flexibility integration parameters.

---


## POST /public-api/resources/flexibility-assets/v1.0

**Summary**: Flexibility Assets / Create

**Request Body Schema**:

**Properties**:

- `id` (number) (read-only): Unique ID of the Flexibility Asset.
- `dlmCircuitId` (number) (nullable): ID of the DLM circuit. Only one of dlmCircuitId, chargePointId or evseId can have value.
- `chargePointId` (number) (nullable): ID of the Charge Point. Only one of dlmCircuitId, chargePointId or evseId can have value.
- `evseId` (number) (nullable): ID of the EVSE. Only one of dlmCircuitId, chargePointId or evseId can have value.
- `description` (string) (nullable): Short description of the flexibility asset.
- `downwardRegulationLimit` (integer) (read-only): Downward regulation limit in Watts.
- `upwardRegulationLimit` (integer) (read-only): Upward regulation limit in Watts.
- `integrationId` (number): Flexibility integration.
- `integrationParameters` (object): Flexibility integration parameters.
- `status` (string)
- `endsAt` (string): ISO 8601 formatted date. If an end date is set the asset will be automatically disabled at that time. Historical time series and forecasts are not generated after the end date.

---


## PATCH /public-api/resources/id-tags/v2.0/{idTag}

**Summary**: Id Tag / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `idTagUid` (string): Token used for authorization
- `idLabel` (string) (nullable): Visual or other label that could be associated with the ID Tag
- `expireAt` (string) (nullable)
- `createdAt` (string) (read-only)
- `status` (string): The status of the ID tag. Use it to disable or suspend a tag
* `enabled` The tag is enabled and is accepted as authentication method
* `disabled` The tag is disabled by the admin user and is not acceptable as authorization method
* `suspended` The tag is suspended by the owner of the tag and is not acceptable as authorization method

- `type` (string)
- `vehicleType` (string) (nullable)
- `paymentMethodId` (string) (nullable): The payment method that will be associated with the ID Tag.
* For **credit/debit cards** the `paymentMethodId` should be provided
* For **Corporate billing** - `corporate:{id}`
* For **Auto selection** - use `"auto"` (recommended) or `null` (deprecated)
* The "last used" concept has been replaced with "auto" selection which cycles through available payment methods.

- `userId` (integer) (nullable): Associate the ID tag with a user account. If the user is not presented, the tag will not be authorized! It makes sense to prepare the tags in advance, in case there is another process/entity is going to later assign them!
- `externalId` (string) (nullable)
- `partnerId` (integer) (nullable): The administrator accounts of the selected Partner will be able to edit and delete the specified ID tag
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

---


## POST /public-api/resources/id-tags/v2.0

**Summary**: Id Tag / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `idTagUid` (string): Token used for authorization
- `idLabel` (string) (nullable): Visual or other label that could be associated with the ID Tag
- `expireAt` (string) (nullable)
- `createdAt` (string) (read-only)
- `status` (string): The status of the ID tag. Use it to disable or suspend a tag
* `enabled` The tag is enabled and is accepted as authentication method
* `disabled` The tag is disabled by the admin user and is not acceptable as authorization method
* `suspended` The tag is suspended by the owner of the tag and is not acceptable as authorization method

- `type` (string)
- `vehicleType` (string) (nullable)
- `paymentMethodId` (string) (nullable): The payment method that will be associated with the ID Tag.
* For **credit/debit cards** the `paymentMethodId` should be provided
* For **Corporate billing** - `corporate:{id}`
* For **last used** the value should be `null`

- `userId` (integer) (nullable): Associate the ID tag with a user account. If the user is not presented, the tag will not be authorized! It makes sense to prepare the tags in advance, in case there is another process/entity is going to later assign them!
- `externalId` (string) (nullable)
- `partnerId` (integer): The administrator accounts of the selected Partner will be able to edit and delete the specified ID tag
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: idTagUid, status, type

---


## PATCH /public-api/resources/installer-jobs/v1.0/{installerJob}

**Summary**: Installer Jobs / Update

**Request Body Schema**:

**Properties**:

- `installerAdminId` (integer): The ID of the installer admin if such is assigned to the installer job, if passed pin will be ignored
- `pin` (string): The PIN of the installer job, it is used to verify access rights to execute the installer job, if passed and no installerAdminId is provided, the pin will be assigned to the installer job
- `description` (string)

---


## POST /public-api/resources/installer-jobs/v1.0

**Summary**: Installer Jobs / Create

**Request Body Schema**:

**Properties**:

- `installationAndMaintenanceCompanyId` (integer): The ID of the installation and maintenance company which the installer job is assigned to
- `installerAdminId` (integer): The ID of the installer admin if such is assigned to the installer job, if passed pin will be ignored
- `pin` (string): The PIN of the installer job, it is used to verify access rights to execute the installer job, if passed and no installerAdminId is provided, the pin will be assigned to the installer job
- `description` (string)

**Required**: description, installationAndMaintenanceCompanyId

---


## PATCH /public-api/resources/locations/v1.0/{location}

**Summary**: Location / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `public_charge_points` (integer) (read-only): The number of the charge points in that location that are both public and active
- `public_charge_points_ids` (array) (read-only): The ids of the charge points in that location that are both public and active
- `name` (object): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `status` (string)
- `description` (object): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `detailed_description` (object): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `additional_description` (object): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `geoposition` (object)
  - `geoposition.latitude` (number)
- `geoposition` (object)
  - `geoposition.longitude` (number)
- `address` (object): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `post_code` (string)
- `region`
- `city` (string)
- `country` (string)
- `external_id` (string) (nullable): The field should have unique value
- `timezone` (string) (nullable): A valid timezone in the form of Area/Location, required when `Allow Multiple Time Zones` option is turned on in the Timezone Setting.
- `location_image` (object) (nullable) (read-only)
  - `location_image.original` (string): URL to the original image
- `location_image` (object) (nullable) (read-only)
  - `location_image.thumbnail` (string): URL to a thumbnail image
- `location_image` (object) (nullable) (read-only)
  - `location_image.mimeType` (string)
- `images` (array) (read-only)
- `working_hours` (object)
  - `working_hours.is_always_open` (boolean): Indicates that the location is always open for charging. If set to false, the `hours` field is required, otherwise it should be ignored.

- `working_hours` (object)
  - `working_hours.stop_session_outside_working_hours` (boolean) (nullable): If a User has initiated a charging session during Working hours but it is already outside of the Working hours, the session will be terminated by the system. This is valid only for Users that are not included in one of the User Groups for which the Location is available 24/7.

- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.monday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.tuesday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.wednesday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.thursday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.friday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.saturday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.sunday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.always_open_for_user_group_ids` (array) (nullable)
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

---


## POST /public-api/resources/locations/v1.0

**Summary**: Location / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `public_charge_points` (integer) (read-only): The number of the charge points in that location that are both public and active
- `public_charge_points_ids` (array) (read-only): The ids of the charge points in that location that are both public and active
- `name` (object): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `status` (string)
- `description` (object): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `detailed_description` (object): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `additional_description` (object): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `geoposition` (object)
  - `geoposition.latitude` (number)
- `geoposition` (object)
  - `geoposition.longitude` (number)
- `address` (object): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `post_code` (string)
- `region`
- `city` (string)
- `country` (string)
- `external_id` (string) (nullable): The field should have unique value
- `timezone` (string) (nullable): A valid timezone in the form of Area/Location, required when `Allow Multiple Time Zones` option is turned on in the Timezone Setting.
- `location_image` (object) (nullable) (read-only)
  - `location_image.original` (string): URL to the original image
- `location_image` (object) (nullable) (read-only)
  - `location_image.thumbnail` (string): URL to a thumbnail image
- `location_image` (object) (nullable) (read-only)
  - `location_image.mimeType` (string)
- `images` (array) (read-only)
- `working_hours` (object)
  - `working_hours.is_always_open` (boolean): Indicates that the location is always open for charging. If set to false, the `hours` field is required, otherwise it should be ignored.

- `working_hours` (object)
  - `working_hours.stop_session_outside_working_hours` (boolean) (nullable): If a User has initiated a charging session during Working hours but it is already outside of the Working hours, the session will be terminated by the system. This is valid only for Users that are not included in one of the User Groups for which the Location is available 24/7.

- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.monday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.tuesday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.wednesday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.thursday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.friday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.saturday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any entries, it will be treated as closed for the whole day.

    - `working_hours.hours.sunday` (array): Working hours interval for single day
- `working_hours` (object)
  - `working_hours.always_open_for_user_group_ids` (array) (nullable)
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: city, country, geoposition, name, post_code, region

---


## PATCH /public-api/resources/locations/v2.0/{location}/charging-zones/{chargingZone}

**Summary**: Location / Charging Zones / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string): Internal name of the Charging Zone. This isn't visible to end-users in the app.
- `locationId` (integer) (read-only): The ID of the Location, which the Charging Zone belongs to.
- `status` (string)
- `additionalInfo` (object): Additional information for the charging zone that is shown in the mobile app when the Location is viewed.
  - `additionalInfo.enabled` (boolean)
- `additionalInfo` (object): Additional information for the charging zone that is shown in the mobile app when the Location is viewed.
  - `additionalInfo.title` (array)
- `additionalInfo` (object): Additional information for the charging zone that is shown in the mobile app when the Location is viewed.
  - `additionalInfo.description` (array)

---


## POST /public-api/resources/locations/v2.0/{location}/charging-zones

**Summary**: Location / Charging Zone / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string): Internal name of the Charging Zone. This isn't visible to end-users in the app.
- `locationId` (integer) (read-only): The ID of the Location, which the Charging Zone belongs to.
- `status` (string)
- `additionalInfo` (object): Additional information for the charging zone that is shown in the mobile app when the Location is viewed.
  - `additionalInfo.enabled` (boolean)
- `additionalInfo` (object): Additional information for the charging zone that is shown in the mobile app when the Location is viewed.
  - `additionalInfo.title` (array)
- `additionalInfo` (object): Additional information for the charging zone that is shown in the mobile app when the Location is viewed.
  - `additionalInfo.description` (array)

**Required**: name, status

---


## PATCH /public-api/resources/locations/v2.0/{location}

**Summary**: Location / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `externalId` (string) (nullable)
- `name` (array)
- `description` (array)
- `shortDescription` (array)
- `additionalDescription` (array)
- `geoposition` (object)
  - `geoposition.latitude` (number)
- `geoposition` (object)
  - `geoposition.longitude` (number)
- `address` (array): The full address of the location
- `streetAddress` (array): The street address of the location
- `city` (string) (nullable)
- `region` (string) (nullable): When country is not in US, AU, CA, UM or RO, you can provide the region
- `state`: When the selected country is one of US, AU, CA, UM or RO
- `country` (string)
- `postCode` (string) (nullable)
- `timezone` (string) (nullable): A valid timezone in the form of Area/Location, required when `Allow Multiple Time Zones` option is turned on in the Timezone Setting.
- `parkingType` (string) (nullable): Indicates the type of parking available at the charging location. This field helps EV drivers understand the physical parking environment before arrival.

**Valid values:**
- `ALONG_MOTORWAY` - Located along a motorway/highway, typically at rest areas or service stations
- `PARKING_GARAGE` - Multi-level parking garage structure, either above-ground or mixed-use
- `PARKING_LOT` - Surface parking lot, open-air parking area
- `ON_DRIVEWAY` - Located on a private driveway, typically residential or small business
- `ON_STREET` - Street-side parking, curbside charging locations
- `UNDERGROUND_GARAGE` - Underground parking structure, subterranean parking facility

**Request behavior (POST/PATCH):**
- Optional field when creating or updating locations
- Send `null` to clear the parking type
- Omit the field in PATCH requests to leave the existing value unchanged

**Response behavior (GET):**
- Field is omitted from the response when no parking type is configured (null in database)
- When present, returns one of the valid enum values listed above

- `accessMethods` (array) (nullable): Physical access methods available at this location. Multiple methods can be selected if the site supports different access types.

**Request behavior (POST/PATCH):**
- Optional field when creating or updating locations
- Send `null` to clear all access methods
- Send `[]` to store an empty access methods list
- Duplicate values are automatically de-duplicated before storage
- Omit the field in PATCH requests to leave the existing value unchanged

**Response behavior (GET):**
- Field is omitted from the response when no access methods are configured (null in database)
- When access methods are configured but the array is empty, returns an empty array `[]`
- When present, returns an array of valid enum values listed above

**Available methods:**
- `OPEN` - Publicly accessible without restrictions
- `TOKEN` - Access via RFID token or card
- `LICENSE_PLATE` - Access via license plate recognition
- `ACCESS_CODE` - Access via PIN/access code entry
- `INTERCOM` - Access via intercom system
- `PARKING_TICKET` - Access via parking ticket validation

- `facilities` (array) (nullable): Describes amenities and facilities available at or near the charging location. Most values are self-explanatory. Special categories include:
- `RECREATION_AREA` - Parks, playgrounds, or leisure facilities
- `CARPOOL_PARKING` - Dedicated parking for carpooling/ridesharing
- `NATURE` - Natural attractions or green spaces

**Request behavior (POST/PATCH):**
- Optional field when creating or updating locations
- Send `null` to clear all facilities
- Send `[]` to store an empty facilities list
- Duplicate values are automatically de-duplicated before storage
- Omit the field in PATCH requests to leave the existing value unchanged

**Response behavior (GET):**
- Field is omitted from the response when no facilities are configured (null in database)
- When facilities are configured but the array is empty, returns an empty array `[]`
- When present, returns an array of valid enum values listed above

- `locationImage` (object) (nullable) (read-only): If `include[]=locationImage` is provided with the request, the `locationImageId` will be replaced with the `locationImage` object if a location image has been assigned to the Location
  - `locationImage.original` (string): URL to the original image
- `locationImage` (object) (nullable) (read-only): If `include[]=locationImage` is provided with the request, the `locationImageId` will be replaced with the `locationImage` object if a location image has been assigned to the Location
  - `locationImage.thumbnail` (string): URL to a thumbnail image
- `locationImage` (object) (nullable) (read-only): If `include[]=locationImage` is provided with the request, the `locationImageId` will be replaced with the `locationImage` object if a location image has been assigned to the Location
  - `locationImage.mimeType` (string)
- `images` (array) (read-only): If `include[]=images` is provided with the request, this array will contain the properties of all images assigned to the location.
- `workingHours` (object)
  - `workingHours.isAlwaysOpen` (boolean): Indicates that the location is always open for charging. If set to false, the `hours` field is required, otherwise it should be ignored.

- `workingHours` (object)
  - `workingHours.stopSessionOutsideWorkingHours` (boolean) (nullable): If a User has initiated a charging session during Working hours but it is already outside of the Working hours, the session will be terminated by the system. This is valid only for Users that are not included in one of the User Groups for which the Location is available 24/7.

- `workingHours` (object)
  - `workingHours.alwaysOpenForUserGroupIds` (array) (nullable)
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.monday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.tuesday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.wednesday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.thursday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.friday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.saturday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.sunday` (array): Working hours interval for single day
- `chargingZones` (array) (read-only): If `include[]=chargingZones` is provided with the request, the location charging zones will be provided here.
- `roamingOperatorId` (integer): For roaming Locations, the ID of the roaming operator is provided.
- `roaming` (object) (read-only): Contains details about the owner, operator, and suboperator of the location as provided by the CPO partner via OCPI.
  - `roaming.owner` (object)
    - `roaming.owner.name` (string): The name of the location owner.
- `roaming` (object) (read-only): Contains details about the owner, operator, and suboperator of the location as provided by the CPO partner via OCPI.
  - `roaming.operator` (object)
    - `roaming.operator.name` (string): The name of the location operator.
- `roaming` (object) (read-only): Contains details about the owner, operator, and suboperator of the location as provided by the CPO partner via OCPI.
  - `roaming.suboperator` (object)
    - `roaming.suboperator.name` (string): The name of the location suboperator.
- `tags` (array)
- `externalAppData` (object) (nullable): Used to hold any external application data related to the Location.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

---


## POST /public-api/resources/locations/v2.0

**Summary**: Location / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `externalId` (string) (nullable)
- `name` (array)
- `description` (array)
- `shortDescription` (array)
- `additionalDescription` (array)
- `geoposition` (object)
  - `geoposition.latitude` (number)
- `geoposition` (object)
  - `geoposition.longitude` (number)
- `address` (array): The full address of the location
- `streetAddress` (array): The street address of the location
- `city` (string) (nullable)
- `region` (string) (nullable): When country is not in US, AU, CA, UM or RO, you can provide the region
- `state`: When the selected country is one of US, AU, CA, UM or RO
- `country` (string)
- `postCode` (string) (nullable)
- `timezone` (string) (nullable): A valid timezone in the form of Area/Location, required when `Allow Multiple Time Zones` option is turned on in the Timezone Setting.
- `parkingType` (string) (nullable): Indicates the type of parking available at the charging location. This field helps EV drivers understand the physical parking environment before arrival.

**Valid values:**
- `ALONG_MOTORWAY` - Located along a motorway/highway, typically at rest areas or service stations
- `PARKING_GARAGE` - Multi-level parking garage structure, either above-ground or mixed-use
- `PARKING_LOT` - Surface parking lot, open-air parking area
- `ON_DRIVEWAY` - Located on a private driveway, typically residential or small business
- `ON_STREET` - Street-side parking, curbside charging locations
- `UNDERGROUND_GARAGE` - Underground parking structure, subterranean parking facility

**Request behavior (POST/PATCH):**
- Optional field when creating or updating locations
- Send `null` to clear the parking type
- Omit the field in PATCH requests to leave the existing value unchanged

**Response behavior (GET):**
- Field is omitted from the response when no parking type is configured (null in database)
- When present, returns one of the valid enum values listed above

- `accessMethods` (array) (nullable): Physical access methods available at this location. Multiple methods can be selected if the site supports different access types.

**Request behavior (POST/PATCH):**
- Optional field when creating or updating locations
- Send `null` to clear all access methods
- Send `[]` to store an empty access methods list
- Duplicate values are automatically de-duplicated before storage
- Omit the field in PATCH requests to leave the existing value unchanged

**Response behavior (GET):**
- Field is omitted from the response when no access methods are configured (null in database)
- When access methods are configured but the array is empty, returns an empty array `[]`
- When present, returns an array of valid enum values listed above

**Available methods:**
- `OPEN` - Publicly accessible without restrictions
- `TOKEN` - Access via RFID token or card
- `LICENSE_PLATE` - Access via license plate recognition
- `ACCESS_CODE` - Access via PIN/access code entry
- `INTERCOM` - Access via intercom system
- `PARKING_TICKET` - Access via parking ticket validation

- `facilities` (array) (nullable): Describes amenities and facilities available at or near the charging location. Most values are self-explanatory. Special categories include:
- `RECREATION_AREA` - Parks, playgrounds, or leisure facilities
- `CARPOOL_PARKING` - Dedicated parking for carpooling/ridesharing
- `NATURE` - Natural attractions or green spaces

**Request behavior (POST/PATCH):**
- Optional field when creating or updating locations
- Send `null` to clear all facilities
- Send `[]` to store an empty facilities list
- Duplicate values are automatically de-duplicated before storage
- Omit the field in PATCH requests to leave the existing value unchanged

**Response behavior (GET):**
- Field is omitted from the response when no facilities are configured (null in database)
- When facilities are configured but the array is empty, returns an empty array `[]`
- When present, returns an array of valid enum values listed above

- `locationImage` (object) (nullable) (read-only): If `include[]=locationImage` is provided with the request, the `locationImageId` will be replaced with the `locationImage` object if a location image has been assigned to the Location
  - `locationImage.original` (string): URL to the original image
- `locationImage` (object) (nullable) (read-only): If `include[]=locationImage` is provided with the request, the `locationImageId` will be replaced with the `locationImage` object if a location image has been assigned to the Location
  - `locationImage.thumbnail` (string): URL to a thumbnail image
- `locationImage` (object) (nullable) (read-only): If `include[]=locationImage` is provided with the request, the `locationImageId` will be replaced with the `locationImage` object if a location image has been assigned to the Location
  - `locationImage.mimeType` (string)
- `images` (array) (read-only): If `include[]=images` is provided with the request, this array will contain the properties of all images assigned to the location.
- `workingHours` (object)
  - `workingHours.isAlwaysOpen` (boolean): Indicates that the location is always open for charging. If set to false, the `hours` field is required, otherwise it should be ignored.

- `workingHours` (object)
  - `workingHours.stopSessionOutsideWorkingHours` (boolean) (nullable): If a User has initiated a charging session during Working hours but it is already outside of the Working hours, the session will be terminated by the system. This is valid only for Users that are not included in one of the User Groups for which the Location is available 24/7.

- `workingHours` (object)
  - `workingHours.alwaysOpenForUserGroupIds` (array) (nullable)
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.monday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.tuesday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.wednesday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.thursday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.friday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.saturday` (array): Working hours interval for single day
- `workingHours` (object)
  - `workingHours.hours` (object) (nullable): The times should be considered to be in the location/tenant timezone.
If a day does not have any working hour intervals, it will be treated as closed for the whole day.

    - `workingHours.hours.sunday` (array): Working hours interval for single day
- `chargingZones` (array) (read-only): If `include[]=chargingZones` is provided with the request, the location charging zones will be provided here.
- `roamingOperatorId` (integer): For roaming Locations, the ID of the roaming operator is provided.
- `roaming` (object) (read-only): Contains details about the owner, operator, and suboperator of the location as provided by the CPO partner via OCPI.
  - `roaming.owner` (object)
    - `roaming.owner.name` (string): The name of the location owner.
- `roaming` (object) (read-only): Contains details about the owner, operator, and suboperator of the location as provided by the CPO partner via OCPI.
  - `roaming.operator` (object)
    - `roaming.operator.name` (string): The name of the location operator.
- `roaming` (object) (read-only): Contains details about the owner, operator, and suboperator of the location as provided by the CPO partner via OCPI.
  - `roaming.suboperator` (object)
    - `roaming.suboperator.name` (string): The name of the location suboperator.
- `tags` (array)
- `externalAppData` (object) (nullable): Used to hold any external application data related to the Location.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

---


## PUT /public-api/resources/parking-spaces/v1.0/{parkingSpace}

**Summary**: Parking Space / Update

**Request Body Schema**:

**Properties**:

- `label` (string)
- `locationId` (integer)
- `externalId` (string)
- `status` (string)
- `occupancyStatus` (string)
- `disabilitiesAccessible` (boolean)
- `evses` (array): The list of Evses at the same Parking Space. The Evses should belongs to same charging zone.

**Required**: label, locationId

---


## POST /public-api/resources/parking-spaces/v1.0

**Summary**: Parking Space / Create

**Request Body Schema**:

**Properties**:

- `label` (string)
- `locationId` (integer)
- `externalId` (string)
- `status` (string)
- `occupancyStatus` (string)
- `disabilitiesAccessible` (boolean)
- `evses` (array): The list of Evses at the same Parking Space. The Evses should belongs to same charging zone.

**Required**: label, locationId

---


## PUT /public-api/resources/partner-contracts/v1.0/{partnerContract}

**Summary**: Partner Contract / Update

**Request Body Schema**:

**Properties**:

- `title` (string)
- `partnerId` (integer)
- `startDate` (string): The contract is effective from the first of the selected month.
- `endDate` (string) (nullable): The contract expires at the last day of the selected month. If nothing is selected, there is no expiration date.
- `autoRenewal` (boolean)
- `externalId` (string) (nullable): Used to store custom information, usually used for external references or metadata to the resource.
- `accessAndPermissions` (object)
  - `accessAndPermissions.sessionsRemoteControl` (boolean): Allows the partner to start/stop session, unlock connector, trigger message, set a charging profile and get the composite schedule.
- `accessAndPermissions` (object)
  - `accessAndPermissions.startReservation` (boolean): Allows the partner to make reservations.
- `accessAndPermissions` (object)
  - `accessAndPermissions.stopReservation` (boolean): Allows the partner to cancel reservations.
- `accessAndPermissions` (object)
  - `accessAndPermissions.resetChargePoint` (boolean): Allows the partner to reset charge points.
- `accessAndPermissions` (object)
  - `accessAndPermissions.firmwareUpdate` (boolean): Allows the partner to make firmware updates to the charge points.
- `revenueSharing` (object)
  - `revenueSharing.partnerSharePercentageAcEvse` (number)
- `revenueSharing` (object)
  - `revenueSharing.partnerSharePercentageDcEvse` (number)
- `revenueSharing` (object)
  - `revenueSharing.excludeConnectionFee` (boolean): If the tariff has a Connection fee, this fee would not be included in the revenue sharing with the Partner and will remain entirely for the Operator.
- `revenueSharing` (object)
  - `revenueSharing.deductElectricityCost` (boolean): The cost of the electricity would first be deducted from the collected revenue and then the Revenue sharing rules will be applied.
- `revenueSharing` (object)
  - `revenueSharing.reimburseForElectricityCost` (boolean): If set to true, the Partner would receive not only their share of the revenue but also a reimbursement for the cost of the electricity. The formula to calculate the amount to be received by the Partner is (Revenue - Electricity cost) x Partner percentage + Electricity cost. It could be supplied only if deductElectricityCost is set to true.
- `revenueSharing` (object)
  - `revenueSharing.fixedFeePerSessionAc` (number) (nullable): Additional flat fee that is applied for every billed session and subtracted from the Partner's share of the revenue for each session on AC Charging Station. This fee is available only if the feature "Additional Platform Fees" is enabled for the system.
- `revenueSharing` (object)
  - `revenueSharing.fixedFeePerSessionDc` (number) (nullable): Additional flat fee that is applied for every billed session and subtracted from the Partner's share of the revenue for each session on DC Charging Station. This fee is available only if the feature "Additional Platform Fees" is enabled for the system.
- `revenueSharing` (object)
  - `revenueSharing.feePerKwhAc` (number) (nullable): Additional flat fee that is applied for every billed kWh and subtracted from the Partner's share of the revenue for each kWh billed on AC Charging Station.  This fee is available only if the feature "Additional Platform Fees" is enabled for the system.
- `revenueSharing` (object)
  - `revenueSharing.feePerKwhDc` (number) (nullable): Additional flat fee that is applied for every billed kWh and subtracted from the Partner's share of the revenue for each kWh billed on DC Charging Station.  This fee is available only if the feature "Additional Platform Fees" is enabled for the system.
- `revenueSharing` (object)
  - `revenueSharing.handlingFee` (number) (nullable): Additional percentage fee to be applied on the total amount paid by the user for the session. This fee is then subtracted from the Partner's share of the revenue.  This fee is available only if the feature "Additional Platform Fees" is enabled for the system.
- `monthlyPlatformFees` (object)
  - `monthlyPlatformFees.perChargePoint` (number): The provided amount should be excluding VAT.
- `monthlyPlatformFees` (object)
  - `monthlyPlatformFees.perAcEvse` (number): The provided amount should be excluding VAT.
- `monthlyPlatformFees` (object)
  - `monthlyPlatformFees.perDcEvse` (number): The provided amount should be excluding VAT.

**Required**: title, partnerId, startDate

---


## POST /public-api/resources/partner-contracts/v1.0

**Summary**: Partner Contract / Create

**Request Body Schema**:

**Properties**:

- `title` (string)
- `partnerId` (integer)
- `startDate` (string): The contract is effective from the first of the selected month.
- `endDate` (string) (nullable): The contract expires at the last day of the selected month. If nothing is selected, there is no expiration date.
- `autoRenewal` (boolean)
- `externalId` (string) (nullable): Used to store custom information, usually used for external references or metadata to the resource.
- `accessAndPermissions` (object)
  - `accessAndPermissions.sessionsRemoteControl` (boolean): Allows the partner to start/stop session, unlock connector, trigger message, set a charging profile and get the composite schedule.
- `accessAndPermissions` (object)
  - `accessAndPermissions.startReservation` (boolean): Allows the partner to make reservations.
- `accessAndPermissions` (object)
  - `accessAndPermissions.stopReservation` (boolean): Allows the partner to cancel reservations.
- `accessAndPermissions` (object)
  - `accessAndPermissions.resetChargePoint` (boolean): Allows the partner to reset charge points.
- `accessAndPermissions` (object)
  - `accessAndPermissions.firmwareUpdate` (boolean): Allows the partner to make firmware updates to the charge points.
- `revenueSharing` (object)
  - `revenueSharing.partnerSharePercentageAcEvse` (number)
- `revenueSharing` (object)
  - `revenueSharing.partnerSharePercentageDcEvse` (number)
- `revenueSharing` (object)
  - `revenueSharing.excludeConnectionFee` (boolean): If the tariff has a Connection fee, this fee would not be included in the revenue sharing with the Partner and will remain entirely for the Operator.
- `revenueSharing` (object)
  - `revenueSharing.deductElectricityCost` (boolean): The cost of the electricity would first be deducted from the collected revenue and then the Revenue sharing rules will be applied.
- `revenueSharing` (object)
  - `revenueSharing.reimburseForElectricityCost` (boolean): If set to true, the Partner would receive not only their share of the revenue but also a reimbursement for the cost of the electricity. The formula to calculate the amount to be received by the Partner is (Revenue - Electricity cost) x Partner percentage + Electricity cost. It could be supplied only if deductElectricityCost is set to true.
- `revenueSharing` (object)
  - `revenueSharing.fixedFeePerSessionAc` (number) (nullable): Additional flat fee that is applied for every billed session and subtracted from the Partner's share of the revenue for each session on AC Charging Station. This fee is available only if the feature "Additional Platform Fees" is enabled for the system.
- `revenueSharing` (object)
  - `revenueSharing.fixedFeePerSessionDc` (number) (nullable): Additional flat fee that is applied for every billed session and subtracted from the Partner's share of the revenue for each session on DC Charging Station. This fee is available only if the feature "Additional Platform Fees" is enabled for the system.
- `revenueSharing` (object)
  - `revenueSharing.feePerKwhAc` (number) (nullable): Additional flat fee that is applied for every billed kWh and subtracted from the Partner's share of the revenue for each kWh billed on AC Charging Station.  This fee is available only if the feature "Additional Platform Fees" is enabled for the system.
- `revenueSharing` (object)
  - `revenueSharing.feePerKwhDc` (number) (nullable): Additional flat fee that is applied for every billed kWh and subtracted from the Partner's share of the revenue for each kWh billed on DC Charging Station.  This fee is available only if the feature "Additional Platform Fees" is enabled for the system.
- `revenueSharing` (object)
  - `revenueSharing.handlingFee` (number) (nullable): Additional percentage fee to be applied on the total amount paid by the user for the session. This fee is then subtracted from the Partner's share of the revenue.  This fee is available only if the feature "Additional Platform Fees" is enabled for the system.
- `monthlyPlatformFees` (object)
  - `monthlyPlatformFees.perChargePoint` (number): The provided amount should be excluding VAT.
- `monthlyPlatformFees` (object)
  - `monthlyPlatformFees.perAcEvse` (number): The provided amount should be excluding VAT.
- `monthlyPlatformFees` (object)
  - `monthlyPlatformFees.perDcEvse` (number): The provided amount should be excluding VAT.

**Required**: title, partnerId, startDate

---


## PATCH /public-api/resources/partner-invites/v1.0/{partnerInvite}

**Summary**: Partner Invite / Update

**Request Body Schema**:

**Properties**:

- `partnerId` (integer)
- `sendViaEmail` (boolean) (read-only)
- `email` (string) (read-only): Required by default. Prohibited if `sendViaEmail` is false.
- `language` (string) (read-only): The language of the e-mail sent to the invitee. If none selected, the default end-users language will be used. Prohibited if `sendViaEmail` is false.
- `acceptUrl` (string) (read-only): The url is shown only for "Sent" or "Pending" statuses.
- `options` (object)
  - `options.allowCorporateAccountBilling` (boolean)
- `options` (object)
  - `options.limitCorporateAccountBillingToPartnerChargePoints` (boolean): Required if allowCorporateAccountBilling is true
- `options` (object)
  - `options.allowAccessToPrivateChargePoints` (boolean)

---


## POST /public-api/resources/partner-invites/v1.0

**Summary**: Partner Invite / Create

**Request Body Schema**:

**Properties**:

- `partnerId` (integer)
- `sendViaEmail` (boolean)
- `email` (string): Required by default. Prohibited if sendViaEmail is false.
- `language` (string): The language of the e-mail sent to the invitee. If none selected, the default end-users language will be used. Prohibited if `sendViaEmail` is false.
- `acceptUrl` (string) (read-only): The url is shown only for "Sent" or "Pending" statuses.
- `options` (object)
  - `options.allowCorporateAccountBilling` (boolean)
- `options` (object)
  - `options.limitCorporateAccountBillingToPartnerChargePoints` (boolean): Required if allowCorporateAccountBilling is true
- `options` (object)
  - `options.allowAccessToPrivateChargePoints` (boolean)

**Required**: partnerId

---


## PUT /public-api/resources/partner-settlement-reports/v1.0/{partnerSettlementReport}/records/{PartnerSettlementRecord}

**Summary**: Partner Settlement Report / Partner Settlement Record / Update

**Request Body Schema**:

**Properties**:

- `date` (string)
- `paidAmount` (number)
- `note` (string)

**Required**: date, paidAmount, note

---


## POST /public-api/resources/partner-settlement-reports/v1.0/{partnerSettlementReport}/records

**Summary**: Partner Settlement Report / Partner Settlement Record / Create

**Request Body Schema**:

**Properties**:

- `date` (string)
- `paidAmount` (number)
- `note` (string)

**Required**: date, paidAmount, note

---


## PATCH /public-api/resources/partners/v1.0/{partner}

**Summary**: Partner / Update

**Request Body Schema**:

**Note**: This schema uses `anyOf` (multiple possible structures).

```json
{"anyOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"regNo":{"type":"string","nullable":true},"vatNo":{"type":"string","nullable":true},"country":{"nullable":true,"type":"string","enum":["AF","AX","AL","DZ","AS","AD","AO","AI","AQ","AG","AR","AM","AW","AU","AT","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","BV","BR","IO","BN","BG","BF","BI","KH","CM","CA","CV","KY","CF","TD","CL","CN","CX","CC","CO","KM","CG","CD","CK","CR","CI","HR","CU","CW","CY","CZ","DK","DJ","DM","DO","EC","EG","SV","GQ","ER","EE","ET","FK","FO","FJ","FI","FR","GF","PF","TF","GA","GM","GE","DE","GH","GI","GR","GL","GD","GP","GU","GT","GG","GN","GW","GY","HT","HM","VA","HN","HK","HU","IS","IN","ID","IR","IQ","IE","IM","IL","IT","JM","JP","JE","JO","KZ","KE","KI","KP","KR","XK","KW","KG","LA","LV","LB","LS","LR","LY","LI","LT","LU","MO","MK","MG","MW","MY","MV","ML","MT","MH","MQ","MR","MU","YT","MX","FM","MD","MC","MN","ME","MS","MA","MZ","MM","NA","NR","NP","NL","NC","NZ","NI","NE","NG","NU","NF","MP","NO","OM","PK","PW","PS","PA","PG","PY","PE","PH","PN","PL","PT","PR","QA","RE","RO","RU","RW","BL","SH","KN","LC","MF","PM","VC","WS","SM","ST","SA","SN","RS","SC","SL","SG","SX","SK","SI","SB","SO","ZA","GS","SS","ES","LK","SD","SR","SJ","SZ","SE","CH","SY","TW","TJ","TZ","TH","TL","TG","TK","TO","TT","TN","TR","TM","TC","TV","UG","UA","AE","GB","US","UM","UY","UZ","VU","VE","VN","VG","VI","WF","EH","YE","ZM","ZW",null]},"city":{"type":"string","nullable":true},"postcode":{"type":"string","nullable":true},"address":{"type":"string","nullable":true},"contactPerson":{"type":"string","nullable":true},"email":{"type":"string","format":"email","nullable":true},"phone":{"type":"string","nullable":true},"faultNotificationsEmail":{"type":"string","format":"email","nullable":true},"monthlyPlatformFee":{"type":"number","format":"decimal","nullable":true},"options":{"type":"object","properties":{"createUsers":{"type":"boolean","default":false},"addUserBalance":{"type":"boolean","default":false},"supplierOnReceipts":{"type":"boolean","default":false},"allowToControlTariffs":{"description":"Allows the Partner to update the tariff pricing.","type":"boolean","default":false},"allowToControlTariffGroups":{"description":"In addition to `allowToControlTariffs`, the Partner would also be able to manage Tariff Groups - attach and remove Tariffs, change Tariffs order in the Tariff Group.","type":"boolean","default":false}}},"corporateBilling":{"type":"object","properties":{"enabled":{"type":"boolean","default":false},"monthlyLimit":{"type":"number","format":"decimal","nullable":true},"discount":{"type":"number","format":"decimal","nullable":true}}},"externalId":{"type":"string","nullable":true,"description":"Third party identifier of the partner"},"lastUpdatedAt":{"type":"string","format":"date-time","description":"ISO 8601 formatted date","readOnly":true}},"required":["name"]}]}
```

---


## POST /public-api/resources/partners/v1.0

**Summary**: Partner / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `regNo` (string) (nullable)
- `vatNo` (string) (nullable)
- `country` (string) (nullable)
- `city` (string) (nullable)
- `postcode` (string) (nullable)
- `address` (string) (nullable)
- `contactPerson` (string) (nullable)
- `email` (string) (nullable)
- `phone` (string) (nullable)
- `faultNotificationsEmail` (string) (nullable)
- `monthlyPlatformFee` (number) (nullable)
- `options` (object)
  - `options.createUsers` (boolean)
- `options` (object)
  - `options.addUserBalance` (boolean)
- `options` (object)
  - `options.supplierOnReceipts` (boolean)
- `options` (object)
  - `options.allowToControlTariffs` (boolean): Allows the Partner to update the tariff pricing.
- `options` (object)
  - `options.allowToControlTariffGroups` (boolean): In addition to `allowToControlTariffs`, the Partner would also be able to manage Tariff Groups - attach and remove Tariffs, change Tariffs order in the Tariff Group.
- `corporateBilling` (object)
  - `corporateBilling.enabled` (boolean)
- `corporateBilling` (object)
  - `corporateBilling.monthlyLimit` (number) (nullable)
- `corporateBilling` (object)
  - `corporateBilling.discount` (number) (nullable)
- `externalId` (string) (nullable): Third party identifier of the partner
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: name

---


## PATCH /public-api/resources/partners/v2.0/{partner}

**Summary**: Partner / Update

**Request Body Schema**:

**Note**: This schema uses `anyOf` (multiple possible structures).

```json
{"title":"Partner Update","description":"Partner update data","anyOf":[{"allOf":[{"type":"object","properties":{"businessName":{"type":"string","description":"The Partner's business name is used when showing the name of the Partner to EV drivers and admin users."}}},{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string","description":"Company name of the Partner"},"regNo":{"type":"string","nullable":true},"vatNo":{"type":"string","nullable":true},"address":{"type":"string","nullable":true},"postcode":{"type":"string","nullable":true},"city":{"type":"string","nullable":true},"country":{"type":"string","enum":["AF","AX","AL","DZ","AS","AD","AO","AI","AQ","AG","AR","AM","AW","AU","AT","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","BV","BR","IO","BN","BG","BF","BI","KH","CM","CA","CV","KY","CF","TD","CL","CN","CX","CC","CO","KM","CG","CD","CK","CR","CI","HR","CU","CW","CY","CZ","DK","DJ","DM","DO","EC","EG","SV","GQ","ER","EE","ET","FK","FO","FJ","FI","FR","GF","PF","TF","GA","GM","GE","DE","GH","GI","GR","GL","GD","GP","GU","GT","GG","GN","GW","GY","HT","HM","VA","HN","HK","HU","IS","IN","ID","IR","IQ","IE","IM","IL","IT","JM","JP","JE","JO","KZ","KE","KI","KP","KR","XK","KW","KG","LA","LV","LB","LS","LR","LY","LI","LT","LU","MO","MK","MG","MW","MY","MV","ML","MT","MH","MQ","MR","MU","YT","MX","FM","MD","MC","MN","ME","MS","MA","MZ","MM","NA","NR","NP","NL","NC","NZ","NI","NE","NG","NU","NF","MP","NO","OM","PK","PW","PS","PA","PG","PY","PE","PH","PN","PL","PT","PR","QA","RE","RO","RU","RW","BL","SH","KN","LC","MF","PM","VC","WS","SM","ST","SA","SN","RS","SC","SL","SG","SX","SK","SI","SB","SO","ZA","GS","SS","ES","LK","SD","SR","SJ","SZ","SE","CH","SY","TW","TJ","TZ","TH","TL","TG","TK","TO","TT","TN","TR","TM","TC","TV","UG","UA","AE","GB","US","UM","UY","UZ","VU","VE","VN","VG","VI","WF","EH","YE","ZM","ZW"],"nullable":true},"region":{"type":"string","nullable":true,"description":"When country is not in US, AU, CA, UM or RO, you can provide the region"},"state":{"description":"When the selected country is one of US, AU, CA, UM or RO","anyOf":[{"title":"US State","description":"When the country is US.","type":"string","enum":["AL","AK","AS","AZ","AR","CA","CO","CT","DE","DC","FM","FL","GA","GU","HI","ID","IL","IN","IA","KS","KY","LA","ME","MH","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","MP","OH","OK","OR","PW","PA","PR","RI","SC","SD","TN","TX","UT","VT","VI","VA","WA","WV","WI","WY"]},{"title":"Australian State","description":"When the country is AU.","type":"string","enum":["NSW","VIC","QLD","WA","SA","TAS","ACT","NT","JBT","CX","NF","CC","AQ","CSI","ACI","HM"]},{"title":"Canadian Province","description":"When the country is CA.","type":"string","enum":["AB","BC","MB","NB","NL","NT","NS","NU","ON","PE","QC","SK","YT"]},{"title":"US Minor Outlying Islands Territory","description":"When the country is UM.","type":"string","enum":["81","84","85","67","89","71","76","95","79"]},{"title":"Romanian County","description":"When the country is RO.","type":"string","enum":["AB","AR","AG","BC","BH","BN","BT","BV","BR","B","BZ","CL","CS","CT","CV","DB","DJ","GL","GR","GJ","HR","HD","IL","IS","IF","MM","MH","MS","NT","OT","PH","SM","SJ","SB","SV","TR","TM","TL","VS","VL","VN"]}]},"contactDetails":{"type":"object","nullable":true,"properties":{"administrative":{"type":"object","nullable":true,"properties":{"contactPerson":{"type":"string","nullable":true},"email":{"type":"string","format":"email","nullable":true},"phone":{"type":"string","nullable":true}}},"technical":{"type":"object","nullable":true,"properties":{"contactPerson":{"type":"string","nullable":true},"email":{"type":"string","format":"email","nullable":true},"phone":{"type":"string","nullable":true}}},"billing":{"type":"object","nullable":true,"properties":{"contactPerson":{"type":"string","nullable":true},"email":{"type":"string","format":"email","nullable":true},"phone":{"type":"string","nullable":true}}}}},"notifications":{"type":"object","properties":{"technical":{"type":"object","properties":{"chargePointFaults":{"type":"boolean","default":false}}},"billing":{"type":"object","properties":{"settlementReports":{"type":"boolean","default":false}}}}},"monthlyPlatformFee":{"type":"number","format":"decimal","nullable":true},"options":{"type":"object","properties":{"createUsers":{"type":"boolean","default":false},"addUserBalance":{"type":"boolean","default":false,"description":"When set to false the API tokens related to this partner would not receive the users' balance in the response."},"supplierOnReceipts":{"type":"boolean","default":false},"allowToControlTariffs":{"description":"Allows the Partner to update the tariff pricing.","type":"boolean","default":false},"allowToControlTariffGroups":{"description":"In addition to `allowToControlTariffs`, the Partner would also be able to manage Tariff Groups - attach and remove Tariffs, change Tariffs order in the Tariff Group.","type":"boolean","default":false}}},"corporateBilling":{"type":"object","properties":{"enabled":{"type":"boolean","default":false},"monthlyLimit":{"type":"number","format":"decimal","nullable":true},"discount":{"type":"number","format":"decimal","nullable":true}}},"externalId":{"type":"string","nullable":true,"description":"Third party identifier of the partner"},"bankDetails":{"type":"object","properties":{"bankIban":{"type":"string","nullable":true,"description":"IBAN that is provided for the partner."},"bankName":{"type":"string","nullable":true,"description":"Name of the Bank for which the partner has provided IBAN."},"bankAddress":{"type":"string","nullable":true,"description":"Address of the partner's Bank."},"bankCode":{"type":"string","nullable":true,"description":"Bank code assigned by a central bank, a bank supervisory body or a Bankers Association in the country."},"bankAccountNumber":{"type":"string","nullable":true,"description":"Bank account ID provided by the partner."},"bankAccountType":{"type":"string","nullable":true,"description":"Type of account the Partner has provided."}}},"lastUpdatedAt":{"type":"string","format":"date-time","description":"ISO 8601 formatted date","readOnly":true}}}]}]}
```

---


## POST /public-api/resources/partners/v2.0

**Summary**: Partner / Create

**Request Body Schema**:

**Properties**:

- `businessName` (string): The Partner's business name is used when showing the name of the Partner to EV drivers and admin users. If not provided, the `name` will be used instead.
- `id` (integer) (read-only)
- `name` (string): Company name of the Partner
- `regNo` (string) (nullable)
- `vatNo` (string) (nullable)
- `address` (string) (nullable)
- `postcode` (string) (nullable)
- `city` (string) (nullable)
- `country` (string) (nullable)
- `region` (string) (nullable): When country is not in US, AU, CA, UM or RO, you can provide the region
- `state`: When the selected country is one of US, AU, CA, UM or RO
- `contactDetails` (object) (nullable)
  - `contactDetails.administrative` (object) (nullable)
    - `contactDetails.administrative.contactPerson` (string) (nullable)
- `contactDetails` (object) (nullable)
  - `contactDetails.administrative` (object) (nullable)
    - `contactDetails.administrative.email` (string) (nullable)
- `contactDetails` (object) (nullable)
  - `contactDetails.administrative` (object) (nullable)
    - `contactDetails.administrative.phone` (string) (nullable)
- `contactDetails` (object) (nullable)
  - `contactDetails.technical` (object) (nullable)
    - `contactDetails.technical.contactPerson` (string) (nullable)
- `contactDetails` (object) (nullable)
  - `contactDetails.technical` (object) (nullable)
    - `contactDetails.technical.email` (string) (nullable)
- `contactDetails` (object) (nullable)
  - `contactDetails.technical` (object) (nullable)
    - `contactDetails.technical.phone` (string) (nullable)
- `contactDetails` (object) (nullable)
  - `contactDetails.billing` (object) (nullable)
    - `contactDetails.billing.contactPerson` (string) (nullable)
- `contactDetails` (object) (nullable)
  - `contactDetails.billing` (object) (nullable)
    - `contactDetails.billing.email` (string) (nullable)
- `contactDetails` (object) (nullable)
  - `contactDetails.billing` (object) (nullable)
    - `contactDetails.billing.phone` (string) (nullable)
- `notifications` (object)
  - `notifications.technical` (object)
    - `notifications.technical.chargePointFaults` (boolean)
- `notifications` (object)
  - `notifications.billing` (object)
    - `notifications.billing.settlementReports` (boolean)
- `monthlyPlatformFee` (number) (nullable)
- `options` (object)
  - `options.createUsers` (boolean)
- `options` (object)
  - `options.addUserBalance` (boolean): When set to false the API tokens related to this partner would not receive the users' balance in the response.
- `options` (object)
  - `options.supplierOnReceipts` (boolean)
- `options` (object)
  - `options.allowToControlTariffs` (boolean): Allows the Partner to update the tariff pricing.
- `options` (object)
  - `options.allowToControlTariffGroups` (boolean): In addition to `allowToControlTariffs`, the Partner would also be able to manage Tariff Groups - attach and remove Tariffs, change Tariffs order in the Tariff Group.
- `corporateBilling` (object)
  - `corporateBilling.enabled` (boolean)
- `corporateBilling` (object)
  - `corporateBilling.monthlyLimit` (number) (nullable)
- `corporateBilling` (object)
  - `corporateBilling.discount` (number) (nullable)
- `externalId` (string) (nullable): Third party identifier of the partner
- `bankDetails` (object)
  - `bankDetails.bankIban` (string) (nullable): IBAN that is provided for the partner.
- `bankDetails` (object)
  - `bankDetails.bankName` (string) (nullable): Name of the Bank for which the partner has provided IBAN.
- `bankDetails` (object)
  - `bankDetails.bankAddress` (string) (nullable): Address of the partner's Bank.
- `bankDetails` (object)
  - `bankDetails.bankCode` (string) (nullable): Bank code assigned by a central bank, a bank supervisory body or a Bankers Association in the country.
- `bankDetails` (object)
  - `bankDetails.bankAccountNumber` (string) (nullable): Bank account ID provided by the partner.
- `bankDetails` (object)
  - `bankDetails.bankAccountType` (string) (nullable): Type of account the Partner has provided.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

---


## PATCH /public-api/resources/payment-terminals/v1.0/{paymentTerminal}

**Summary**: Payment Terminals / Update

**Request Body Schema**:

**Note**: This schema uses `oneOf` (multiple possible structures).

```json
{"oneOf":[{"title":"Payter","allOf":[{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"},"serialNumber":{"type":"string"},"defaultLanguage":{"type":"string"},"displayTextTimeout":{"type":"integer"},"displayText":{"type":"string"},"operatorId":{"type":"integer"},"externalId":{"type":"string"}}},{"oneOf":[{"title":"Payter on CP","type":"object","properties":{"preauthorizeAmount":{"type":"number","description":"Provide a Pre-authorize amount when the terminal is linked to a single charger"},"currencyId":{"type":"integer","readOnly":true},"valueAddedTaxId":{"type":"integer","readOnly":true}}},{"title":"Payter on Location","type":"object","properties":{"transactionTimeout":{"type":"integer","description":"Provide a transaction timeout when the terminal is linked to a Location"}}}]}]}]},{"title":"Valina","allOf":[{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"adminToken":{"type":"string","readOnly":true,"description":"Specific token, linked to each terminal that can be used for access to the API. The token is created automatically when a new payment terminal is created."},"isOnline":{"type":"boolean","readOnly":true,"deprecated":true,"description":"Use `networkStatus` instead"},"networkStatus":{"type":"string","enum":["online","offline","unknown"]},"phone":{"type":"string"},"defaultLanguage":{"type":"string"},"presentCardOnStopSession":{"type":"boolean","default":false},"info":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}}},"serialNumber":{"type":"string"},"externalId":{"type":"string"},"supportedLanguages":{"type":"array","items":{"type":"string"},"nullable":true,"readOnly":true}}}]},{"title":"Crane","allOf":[{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}]},{"title":"Ampeco","allOf":[{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"adminToken":{"type":"string","readOnly":true,"description":"Specific token, linked to each terminal that can be used for access to the API. The token is created automatically when a new payment terminal is created."},"webhookUrl":{"type":"string"},"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}]},{"title":"Nayax","allOf":[{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"terminalId":{"type":"string","description":"This is the Device Number of the relevant Nayax terminal that is set up in the Nayax system. Please be careful to add the correct Device number on the relevant terminal."},"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}]},{"title":"Embedded","allOf":[{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}]},{"title":"Pax","allOf":[{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"verificationCode":{"type":"string"},"defaultLanguage":{"type":"string"},"presentCardOnStopSession":{"type":"boolean","default":false},"info":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}}},"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}]},{"title":"Windcave","allOf":[{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}]},{"title":"Web portal","type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"title":"AdyenCastles","allOf":[{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"adminToken":{"type":"string","readOnly":true,"description":"Specific token, linked to each terminal that can be used for access to the API. The token is created automatically when a new payment terminal is created."},"networkStatus":{"type":"string","enum":["online","offline","unknown"]},"phone":{"type":"string"},"defaultLanguage":{"type":"string"},"presentCardOnStopSession":{"type":"boolean","default":false},"info":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}}},"serialNumber":{"type":"string"},"externalId":{"type":"string"},"merchantAccount":{"type":"string","description":"Unique identifier of the merchant in Adyen's portal"},"adyenApiKey":{"type":"string","description":"API key to authenticate requests to Adyen"},"supportedLanguages":{"type":"array","items":{"type":"string"},"readOnly":true},"networkStatusMonitoringEnabled":{"type":"boolean","readOnly":true}}}]},{"title":"Printec Castles","allOf":[{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"adminToken":{"type":"string","readOnly":true,"description":"Specific token, linked to each terminal that can be used for access to the API. The token is created automatically when a new payment terminal is created."},"networkStatus":{"type":"string","enum":["online","offline","unknown"]},"phone":{"type":"string"},"defaultLanguage":{"type":"string"},"presentCardOnStopSession":{"type":"boolean","default":false},"info":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}}},"serialNumber":{"type":"string"},"externalId":{"type":"string"},"supportedLanguages":{"type":"array","items":{"type":"string"},"readOnly":true},"networkStatusMonitoringEnabled":{"type":"boolean","readOnly":true}}}]},{"title":"Cardlink Castles","allOf":[{"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"adminToken":{"type":"string","readOnly":true,"description":"Specific token, linked to each terminal that can be used for access to the API. The token is created automatically when a new payment terminal is created."},"isOnline":{"type":"boolean","readOnly":true,"deprecated":true,"description":"Use `networkStatus` instead"},"networkStatus":{"type":"string","enum":["online","offline","unknown"]},"phone":{"type":"string"},"defaultLanguage":{"type":"string"},"presentCardOnStopSession":{"type":"boolean","default":false},"info":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}}},"serialNumber":{"type":"string"},"externalId":{"type":"string"},"supportedLanguages":{"type":"array","items":{"type":"string"},"nullable":true,"readOnly":true}}}]}]}
```

---


## POST /public-api/resources/payment-terminals/v1.0

**Summary**: Payment Terminals / Create

**Request Body Schema**:

**Note**: This schema uses `oneOf` (multiple possible structures).

```json
{"oneOf":[{"title":"Payter","oneOf":[{"required":["preauthorizeAmount"],"title":"Payter on CP","type":"object","properties":{"preauthorizeAmount":{"type":"number","description":"Provide a Pre-authorize amount when the terminal is linked to a single charger"},"currencyId":{"type":"integer","readOnly":true},"valueAddedTaxId":{"type":"integer","readOnly":true}}},{"required":["transactionTimeout"],"title":"Payter on Location","type":"object","properties":{"transactionTimeout":{"type":"integer","description":"Provide a transaction timeout when the terminal is linked to a Location"}}}],"required":["name","integrationId","terminalType","serialNumber","defaultLanguage","operatorId"],"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"},"serialNumber":{"type":"string"},"defaultLanguage":{"type":"string"},"displayTextTimeout":{"type":"integer"},"displayText":{"type":"string"},"operatorId":{"type":"integer"},"externalId":{"type":"string"}}},{"title":"Valina","allOf":[{"required":["name","integrationId","terminalType","operatorId"],"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"adminToken":{"type":"string","readOnly":true,"description":"Specific token, linked to each terminal that can be used for access to the API. The token is created automatically when a new payment terminal is created."},"isOnline":{"type":"boolean","readOnly":true,"deprecated":true,"description":"Use `networkStatus` instead"},"networkStatus":{"type":"string","enum":["online","offline","unknown"]},"phone":{"type":"string"},"defaultLanguage":{"type":"string"},"presentCardOnStopSession":{"type":"boolean","default":false},"info":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}}},"currencyCode":{"type":"string","readOnly":true},"serialNumber":{"type":"string"},"externalId":{"type":"string"},"supportedLanguages":{"type":"array","items":{"type":"string"},"nullable":true,"readOnly":true},"bundle":{"type":"object","readOnly":true,"properties":{"version":{"type":"string","example":["1.0.0","1.0.1","2.1.0"],"description":"Desired version of the terminal android bundle. This field should be used to detect version difference between the actual one running on the terminal and the configured on the server, in order to detect if an OTA update is required."},"downloadUrl":{"type":"string","description":"Download link to the archived (zip) bundle version. Can be used to download the bundle and initiate the OTA update on the terminal."}}},"networkStatusMonitoringEnabled":{"type":"boolean","readOnly":true},"kioskModeEnabled":{"type":"boolean","readOnly":true,"description":"Indicates whether kiosk mode is enabled for this terminal. When true, the terminal forces connector selection even in single charge point setups. Only applicable for Single Charge Point terminals; omitted for Location terminals."}}}],"required":["phone","defaultLanguage","info","bundle"]},{"title":"Crane","allOf":[{"required":["name","integrationId","terminalType","operatorId"],"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}],"required":["serialNumber"]},{"title":"Ampeco","allOf":[{"required":["name","integrationId","terminalType","operatorId"],"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"adminToken":{"type":"string","readOnly":true,"description":"Specific token, linked to each terminal that can be used for access to the API. The token is created automatically when a new payment terminal is created."},"webhookUrl":{"type":"string","readOnly":true},"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}]},{"title":"Nayax","allOf":[{"required":["name","integrationId","terminalType","operatorId"],"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"terminalId":{"type":"string","description":"This is the Device Number of the relevant Nayax terminal that is set up in the Nayax system. Please be careful to add the correct Device number on the relevant terminal."},"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}],"required":["terminalId"]},{"title":"Embedded","allOf":[{"required":["name","integrationId","terminalType","operatorId"],"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}]},{"title":"Pax","allOf":[{"required":["name","integrationId","terminalType","operatorId"],"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"verificationCode":{"type":"string"},"defaultLanguage":{"type":"string"},"presentCardOnStopSession":{"type":"boolean","default":false},"info":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}}},"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}],"required":["verificationCode","defaultLanguage","info"]},{"title":"Windcave","allOf":[{"required":["name","integrationId","terminalType","operatorId"],"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"serialNumber":{"type":"string"},"externalId":{"type":"string"}}}]},{"title":"Web portal","allOf":[{"required":["name","integrationId","terminalType","operatorId"],"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"invoiceFields":{"type":"array","readOnly":true,"description":"Invoice field configurations for ad-hoc invoicing. Only included when ad-hoc invoicing is enabled for this terminal.","items":{"type":"object","properties":{"field":{"type":"string","description":"Field identifier (e.g., email, name, taxId, country)"},"required":{"type":"boolean","description":"Whether this field is required or optional"},"type":{"type":"string","enum":["individual","company"],"description":"The invoice type this field belongs to (individual or company)"}},"required":["field","required","type"]}}}}]},{"title":"AdyenCastles","allOf":[{"required":["name","integrationId","terminalType","operatorId"],"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"adminToken":{"type":"string","readOnly":true,"description":"Specific token, linked to each terminal that can be used for access to the API. The token is created automatically when a new payment terminal is created."},"networkStatus":{"type":"string","enum":["online","offline","unknown"]},"phone":{"type":"string"},"defaultLanguage":{"type":"string"},"presentCardOnStopSession":{"type":"boolean","default":false},"info":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}}},"currencyCode":{"type":"string","readOnly":true},"serialNumber":{"type":"string"},"externalId":{"type":"string"},"merchantAccount":{"type":"string","description":"Unique identifier of the merchant in Adyen's portal"},"adyenApiKey":{"type":"string","description":"API key to authenticate requests to Adyen"},"supportedLanguages":{"type":"array","items":{"type":"string"},"nullable":true,"readOnly":true},"networkStatusMonitoringEnabled":{"type":"boolean","readOnly":true},"kioskModeEnabled":{"type":"boolean","readOnly":true,"description":"Indicates whether kiosk mode is enabled for this terminal. When true, the terminal forces connector selection even in single charge point setups. Only applicable for Single Charge Point terminals; omitted for Location terminals."}}}],"required":["phone","defaultLanguage","info","merchantAccount","adyenApiKey"]},{"title":"Printec Castles","allOf":[{"required":["name","integrationId","terminalType","operatorId"],"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"adminToken":{"type":"string","readOnly":true,"description":"Specific token, linked to each terminal that can be used for access to the API. The token is created automatically when a new payment terminal is created."},"networkStatus":{"type":"string","enum":["online","offline","unknown"]},"phone":{"type":"string"},"defaultLanguage":{"type":"string"},"presentCardOnStopSession":{"type":"boolean","default":false},"info":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}}},"currencyCode":{"type":"string","readOnly":true},"countryCode":{"type":"string","description":"ISO 3166-1 alpha-2 country code","readOnly":true},"serialNumber":{"type":"string"},"externalId":{"type":"string"},"supportedLanguages":{"type":"array","items":{"type":"string"},"nullable":true,"readOnly":true},"bundle":{"type":"object","readOnly":true,"properties":{"version":{"type":"string","example":["1.0.0","1.0.1","2.1.0"],"description":"Desired version of the terminal android bundle. This field should be used to detect version difference between the actual one running on the terminal and the configured on the server, in order to detect if an OTA update is required."},"downloadUrl":{"type":"string","description":"Download link to the archived (zip) bundle version. Can be used to download the bundle and initiate the OTA update on the terminal."}}},"networkStatusMonitoringEnabled":{"type":"boolean","readOnly":true},"kioskModeEnabled":{"type":"boolean","readOnly":true,"description":"Indicates whether kiosk mode is enabled for this terminal. When true, the terminal forces connector selection even in single charge point setups. Only applicable for Single Charge Point terminals; omitted for Location terminals."}}}],"required":["phone","defaultLanguage","info","bundle"]},{"title":"Cardlink Castles","allOf":[{"required":["name","integrationId","terminalType","operatorId"],"allOf":[{"type":"object","properties":{"id":{"type":"integer","readOnly":true},"name":{"type":"string"},"integrationId":{"type":"integer"},"terminalType":{"type":"string","enum":["Payter","Valina","Crane","Ampeco","Nayax","Embedded","Pax","Windcave","Web portal","AdyenCastles","Printec Castles","Cardlink Castles"]},"operatorId":{"type":"integer"}}},{"type":"object","properties":{"chargingZoneId":{"type":"integer","description":"The charging zone the terminal belongs to. Note that either the `chargePointId` OR this attribute should be provided;"},"chargePointId":{"type":"integer","description":"The Charge point the terminal belongs to. Note that either the `chargingZoneId` OR this attribute should be provided;"}}}]},{"type":"object","properties":{"adminToken":{"type":"string","readOnly":true,"description":"Specific token, linked to each terminal that can be used for access to the API. The token is created automatically when a new payment terminal is created."},"isOnline":{"type":"boolean","readOnly":true,"deprecated":true,"description":"Use `networkStatus` instead"},"networkStatus":{"type":"string","enum":["online","offline","unknown"]},"phone":{"type":"string"},"defaultLanguage":{"type":"string"},"presentCardOnStopSession":{"type":"boolean","default":false},"info":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}}},"currencyCode":{"type":"string","readOnly":true},"serialNumber":{"type":"string"},"externalId":{"type":"string"},"supportedLanguages":{"type":"array","items":{"type":"string"},"nullable":true,"readOnly":true},"bundle":{"type":"object","readOnly":true,"properties":{"version":{"type":"string","example":["1.0.0","1.0.1","2.1.0"],"description":"Desired version of the terminal android bundle. This field should be used to detect version difference between the actual one running on the terminal and the configured on the server, in order to detect if an OTA update is required."},"downloadUrl":{"type":"string","description":"Download link to the archived (zip) bundle version. Can be used to download the bundle and initiate the OTA update on the terminal."}}},"networkStatusMonitoringEnabled":{"type":"boolean","readOnly":true},"kioskModeEnabled":{"type":"boolean","readOnly":true,"description":"Indicates whether kiosk mode is enabled for this terminal. When true, the terminal forces connector selection even in single charge point setups. Only applicable for Single Charge Point terminals; omitted for Location terminals."}}}],"required":["phone","defaultLanguage","info","bundle"]}]}
```

---


## PATCH /public-api/resources/provisioning-certificates/v2.0/{provisioningCertificate}

**Summary**: Provisioning Certificate / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `pcId` (string)
- `name` (string)
- `vehicleType` (string)
- `userId` (integer)
- `idTags` (array)

---


## POST /public-api/resources/provisioning-certificates/v2.0

**Summary**: Provisioning Certificate / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `pcId` (string)
- `name` (string)
- `vehicleType` (string)
- `userId` (integer)
- `idTags` (array)

**Required**: pcId, name, vehicleType, userId

---


## PATCH /public-api/resources/rfid-tags/v1.0/{rfidTag}

**Summary**: RFID Tag / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `rfidTagUid` (string): Token used for authorization
- `rfidLabel` (string) (nullable): Visual label on the card
- `expireAt` (string) (nullable)
- `createdAt` (string) (read-only)
- `status` (string): The status of the RFID tag. Use it to disable or suspend a tag
* `enabled` The tag is enabled and is accepted as authentication method
* `disabled` The tag is disabled by the admin user and is not acceptable as authorization method
* `suspended` The tag is suspended by the owner of the tag and is not acceptable as authorization method

- `userId` (integer) (nullable): Associate the RFID tag with a user account. If the user is not presented, the tag will not be authorized! It makes sense to prepare the tags in advance, in case there is another process/entity is going to later assign them!
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: rfidTagUid, status

---


## POST /public-api/resources/rfid-tags/v1.0

**Summary**: RFID Tag / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `rfidTagUid` (string): Token used for authorization
- `rfidLabel` (string) (nullable): Visual label on the card
- `expireAt` (string) (nullable)
- `createdAt` (string) (read-only)
- `status` (string): The status of the RFID tag. Use it to disable or suspend a tag
* `enabled` The tag is enabled and is accepted as authentication method
* `disabled` The tag is disabled by the admin user and is not acceptable as authorization method
* `suspended` The tag is suspended by the owner of the tag and is not acceptable as authorization method

- `userId` (integer) (nullable): Associate the RFID tag with a user account. If the user is not presented, the tag will not be authorized! It makes sense to prepare the tags in advance, in case there is another process/entity is going to later assign them!
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: rfidTagUid, status

---


## PUT /public-api/resources/roaming-operators/v2.0/{roamingOperator}/custom-tariff-filters/reorder

**Summary**: Roaming Operators / Custom Tariff Filters / Reorder

**Request Body Schema**:

**Properties**:

- `filters` (array): Array of custom tariff filter IDs with their new positions. Only include filters that need to be moved - others will maintain their relative positions.

**Required**: filters

---


## PATCH /public-api/resources/roaming-operators/v2.0/{roamingOperator}/custom-tariff-filters/{customTariffFilter}

**Summary**: Roaming Operators / Custom Tariff Filters / Update

**Request Body Schema**:

**Properties**:

- `name` (string)
- `status` (string)
- `countryCode` (string) (nullable): ISO 3166-1 alpha-2 country code
- `applicableCurrentTypes` (array): Array of current types (AC, DC) that this filter applies to
- `powerBelowKw` (number) (nullable): Filter EVSEs with power below specified kW value
- `evseIdPrefix` (string) (nullable): Filter EVSEs whose IDs start with specified prefix(es). Multiple prefixes separated by newlines
- `order` (integer): Position of the tariff filter in the ordering sequence. If an already existing order number is provided, it will reorder the other tariff filters to take their place in the sequence.

---


## POST /public-api/resources/roaming-operators/v2.0/{roamingOperator}/custom-tariff-filters

**Summary**: Roaming Operators / Custom Tariff Filters / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only): Unique identifier of the tariff filter
- `name` (string)
- `status` (string)
- `countryCode` (string): ISO 3166-1 alpha-2 country code
- `applicableCurrentTypes` (array): Array of current types (AC, DC) that this filter applies to, pass an empty array to clear all current type restrictions.
- `powerBelowKw` (number): Filter EVSEs with power below specified kW value
- `evseIdPrefix` (string): Filter EVSEs whose IDs start with specified prefix(es). Multiple prefixes separated by newlines
- `order` (integer): Position of the tariff filter in the ordering sequence. When not provided during creation, it will go last. If an already existing order number is provided, it will reorder the other tariff filters to take their place in the sequence.
- `createdAt` (string) (read-only): ISO 8601 formatted date
- `updatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: name, status

---


## PATCH /public-api/resources/roaming-operators/v2.0/{roamingOperator}

**Summary**: Roaming Operator / Update

**Request Body Schema**:

**Properties**:

- `businessName` (string) (nullable)
- `partnerId` (integer) (nullable): If a non-null value is provided, it will set enabled to true. If null is provided, it will set enabled to false.
- `enabled` (boolean)
- `cpoSettings` (object) (nullable)

---


## PATCH /public-api/resources/roaming-providers/v2.0/{roamingProvider}

**Summary**: Roaming Provider / Update

**Request Body Schema**:

**Note**: This schema uses `anyOf` (multiple possible structures).

```json
{"anyOf":[{"title":"Hubject","allOf":[{"type":"object","properties":{"businessName":{"type":"string","nullable":true},"platformId":{"type":"integer"},"partnerId":{"type":"integer","nullable":true}}},{"type":"object","properties":{"hubjectId":{"type":"string","nullable":true}}}]},{"title":"OCPI or Gireve 2.2.1","type":"object","allOf":[{"type":"object","properties":{"businessName":{"type":"string","nullable":true},"platformId":{"type":"integer"},"partnerId":{"type":"integer","nullable":true}}},{"type":"object","properties":{"countryCode":{"type":"string","description":"The code provided during the token exchange process","nullable":true},"partyId":{"type":"string","description":"ID of the Operator or Provider of roaming"}}}]}]}
```

---


## POST /public-api/resources/roaming-providers/v2.0

**Summary**: Roaming Provider / Create

**Request Body Schema**:

**Note**: This schema uses `oneOf` (multiple possible structures).

```json
{"oneOf":[{"title":"Hubject","allOf":[{"type":"object","properties":{"businessName":{"type":"string","nullable":true},"platformId":{"type":"integer"},"partnerId":{"type":"integer","nullable":true}}},{"type":"object","properties":{"hubjectId":{"type":"string","nullable":true}}},{"required":["platformId"],"type":"object","properties":{"businessName":{"type":"string","nullable":true},"platformId":{"type":"integer"},"partnerId":{"type":"integer","nullable":true}}}]},{"title":"OCPI or Gireve 2.2.1","allOf":[{"type":"object","properties":{"businessName":{"type":"string","nullable":true},"platformId":{"type":"integer"},"partnerId":{"type":"integer","nullable":true}}},{"type":"object","properties":{"countryCode":{"type":"string","description":"The code provided during the token exchange process","nullable":true},"partyId":{"type":"string","description":"ID of the Operator or Provider of roaming"}}},{"required":["platformId"],"type":"object","properties":{"businessName":{"type":"string","nullable":true},"platformId":{"type":"integer"},"partnerId":{"type":"integer","nullable":true}}}]}]}
```

---


## PATCH /public-api/resources/roaming-tariffs/v2.0/{roamingTariff}

**Summary**: Roaming Tariff / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `roamingIds` (array) (read-only)
- `roamingTariffHumanReadable` (string) (read-only): This is the human readable roaming tariff as extracted from the tariff(s) shared by the CPO.
- `rawRoamingTariffs` (array) (read-only): The original roaming tariffs as provided by the CPO in the respective roaming protocol format.
- `operatorId` (integer) (read-only)
- `tariffGroupId` (integer) (nullable): The ID of the local Tariff Group assigned to the EVSEs with this roaming tariff(s).

---


## PATCH /public-api/resources/subscription-plans/v2.0/{subscriptionPlan}

**Summary**: Subscription plan / Update

**Request Body Schema**:

**Note**: This schema uses `anyOf` (multiple possible structures).

```json
{"anyOf":[{"type":"object","properties":{"name":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}},"description":"Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep."},"description":{"type":"array","items":{"type":"object","properties":{"locale":{"type":"string","description":"valid locale"},"translation":{"type":"string"}}},"description":"Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep."},"renewalCycle":{"type":"string","enum":["monthly","annually"]},"freeRenewalPeriods":{"type":"integer","nullable":true,"description":"The number of renewal periods that are free of charge. This is only applicable for pre-paid plans."},"type":{"type":"string","enum":["pre-paid","post-paid"],"description":"Required when Post-paid Subscription plans has been enabled for the system."},"baseFee":{"type":"number","format":"float","nullable":true,"description":"For pre-paid plans this is the price, for post-paid plans this is the base fee."},"feePerEachPersonalChargePoint":{"type":"number","format":"float","nullable":true,"description":"Applies separately per each personal charge point owned by the subscriber that requires this Subscription plan. These fees are added to the Base fee of the Subscription plan, if any."},"postPaidChargingSessionsAccumulation":{"type":"string","enum":["none","personal","personal_commercial"],"default":"none","description":"Indicates if charging sessions at personal, commercial+personal charge points are included in the post-paid subscription and would be billed at the end of the billing cycle or when a threshold is met, if there is such."},"billingUsageThreshold":{"type":"integer","format":"decimal","nullable":true,"description":"If this threshold is reached, the amount due for the subscription would be billed immediately instead of waiting for the end of the billing period."},"billingType":{"type":"string","enum":["default","internal","external"],"description":"Applicable only for post-paid subscription plans when external billing is enabled. Controls the billing method used for this subscription plan."},"status":{"type":"string","description":"A change from disabled to enabled is only possible for Subscription plans that are not replaced with another plan.","enum":["enabled","disabled"]},"allowance":{"type":"object","properties":{"resetCycle":{"type":"string","enum":["as_renewal_cycle","after_each_session","after_24_hours","after_each_week","after_each_month","after_each_year"]},"type":{"type":"string","enum":["none","combined","separate"]},"homeChargersOnly":{"type":"boolean","default":false,"description":"When true the allowance can only be used on the home charge points owned by the user. In that case all other allowance restrictions have no effect ."},"includedCountries":{"type":"array","items":{"type":"string","enum":["AF","AX","AL","DZ","AS","AD","AO","AI","AQ","AG","AR","AM","AW","AU","AT","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","BV","BR","IO","BN","BG","BF","BI","KH","CM","CA","CV","KY","CF","TD","CL","CN","CX","CC","CO","KM","CG","CD","CK","CR","CI","HR","CU","CW","CY","CZ","DK","DJ","DM","DO","EC","EG","SV","GQ","ER","EE","ET","FK","FO","FJ","FI","FR","GF","PF","TF","GA","GM","GE","DE","GH","GI","GR","GL","GD","GP","GU","GT","GG","GN","GW","GY","HT","HM","VA","HN","HK","HU","IS","IN","ID","IR","IQ","IE","IM","IL","IT","JM","JP","JE","JO","KZ","KE","KI","KP","KR","XK","KW","KG","LA","LV","LB","LS","LR","LY","LI","LT","LU","MO","MK","MG","MW","MY","MV","ML","MT","MH","MQ","MR","MU","YT","MX","FM","MD","MC","MN","ME","MS","MA","MZ","MM","NA","NR","NP","NL","NC","NZ","NI","NE","NG","NU","NF","MP","NO","OM","PK","PW","PS","PA","PG","PY","PE","PH","PN","PL","PT","PR","QA","RE","RO","RU","RW","BL","SH","KN","LC","MF","PM","VC","WS","SM","ST","SA","SN","RS","SC","SL","SG","SX","SK","SI","SB","SO","ZA","GS","SS","ES","LK","SD","SR","SJ","SZ","SE","CH","SY","TW","TJ","TZ","TH","TL","TG","TK","TO","TT","TN","TR","TM","TC","TV","UG","UA","AE","GB","US","UM","UY","UZ","VU","VE","VN","VG","VI","WF","EH","YE","ZM","ZW"]},"description":"The allowance can only be used on charge points in countries in this list. When empty the allowance is valid for charge points in all countries, except the ones explicitly listed in the excludedCountries."},"excludedCountries":{"type":"array","items":{"type":"string","enum":["AF","AX","AL","DZ","AS","AD","AO","AI","AQ","AG","AR","AM","AW","AU","AT","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","BV","BR","IO","BN","BG","BF","BI","KH","CM","CA","CV","KY","CF","TD","CL","CN","CX","CC","CO","KM","CG","CD","CK","CR","CI","HR","CU","CW","CY","CZ","DK","DJ","DM","DO","EC","EG","SV","GQ","ER","EE","ET","FK","FO","FJ","FI","FR","GF","PF","TF","GA","GM","GE","DE","GH","GI","GR","GL","GD","GP","GU","GT","GG","GN","GW","GY","HT","HM","VA","HN","HK","HU","IS","IN","ID","IR","IQ","IE","IM","IL","IT","JM","JP","JE","JO","KZ","KE","KI","KP","KR","XK","KW","KG","LA","LV","LB","LS","LR","LY","LI","LT","LU","MO","MK","MG","MW","MY","MV","ML","MT","MH","MQ","MR","MU","YT","MX","FM","MD","MC","MN","ME","MS","MA","MZ","MM","NA","NR","NP","NL","NC","NZ","NI","NE","NG","NU","NF","MP","NO","OM","PK","PW","PS","PA","PG","PY","PE","PH","PN","PL","PT","PR","QA","RE","RO","RU","RW","BL","SH","KN","LC","MF","PM","VC","WS","SM","ST","SA","SN","RS","SC","SL","SG","SX","SK","SI","SB","SO","ZA","GS","SS","ES","LK","SD","SR","SJ","SZ","SE","CH","SY","TW","TJ","TZ","TH","TL","TG","TK","TO","TT","TN","TR","TM","TC","TV","UG","UA","AE","GB","US","UM","UY","UZ","VU","VE","VN","VG","VI","WF","EH","YE","ZM","ZW"]},"description":"The allowance cannot be used on charge points in the countries in this list."},"excludeRoaming":{"type":"boolean","default":false,"description":"When true the allowance cannot be used on roaming charge points."},"includedPartnerChargePoints":{"type":"array","items":{"type":"integer"},"description":"An array of Partner IDs. The allowance can only be used on charge points of Partners in this list. When empty the allowance is valid for charge points of any Partner, except the ones explicitly listed in the excludedPartnerChargePoints."},"excludedPartnerChargePoints":{"type":"array","items":{"type":"integer"},"description":"An array of Partner IDs. The allowance cannot be used on charge points of Partners in this list."},"combined":{"description":"The amount of kWh included - combined for AC and DC, should be provided if the type is combined.","type":"integer","nullable":true,"minimum":0,"maximum":4000000},"ac":{"description":"The amount of kWh included for AC, should be provided if the type is separate.","type":"integer","nullable":true,"minimum":0,"maximum":4000000},"dc":{"description":"The amount of kWh included for DC, should be provided if the type is separate.","type":"integer","nullable":true,"minimum":0,"maximum":4000000}}},"visibilityRestrictions":{"type":"object","description":"Defines which users can view and subscribe to the plan via the app","properties":{"includedPartnerUsers":{"type":"array","items":{"type":"integer"},"description":"An array of Partner IDs. The Subscription plan is available only to users invited (and accepted) or created by one of the Partners in this list. When empty the plan is available to all users, except the ones of Partners listed in excludedPartnerUsers."},"excludedPartnerUsers":{"type":"array","items":{"type":"integer"},"description":"An array of Partner IDs. The Subscription plan is not available to users of the Partners in this list."},"includedUserGroups":{"type":"array","items":{"type":"integer"},"description":"An array of User Group IDs. The Subscription plan is available only to users with a User Group that is in this list. When empty the plan is available to all users, except the ones with a User Group listed in excludedUserGroups."},"excludedUserGroups":{"type":"array","items":{"type":"integer"},"description":"An array of User Group IDs. The Subscription plan is not available to users with a User Group that is in this list."}}},"lastUpdatedAt":{"type":"string","format":"date-time","description":"ISO 8601 formatted date","readOnly":true}}}]}
```

---


## POST /public-api/resources/subscription-plans/v2.0

**Summary**: Subscription plan / Create

**Request Body Schema**:

**Properties**:

- `name` (array): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `description` (array): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `renewalCycle` (string)
- `freeRenewalPeriods` (integer) (nullable): The number of renewal periods that are free of charge. This is only applicable for pre-paid plans.
- `type` (string)
- `baseFee` (number) (nullable): For pre-paid plans this is the price, for post-paid plans this is the base fee.
- `baseFeeAppliesPerEachHomeCharger` (boolean) (nullable): Makes the base fee apply per each home charger owned by the subscriber.
- `postPaidChargingSessionsAccumulation` (string): Indicates if charging sessions at personal, commercial+personal charge points are included in the post-paid subscription and would be billed at the end of the billing cycle or when a threshold is met, if there is such.
- `billingUsageThreshold` (integer) (nullable): If this threshold is reached, the amount due for the subscription would be billed immediately instead of waiting for the end of the billing period.
- `billingType` (string): Applicable only for post-paid subscription plans when external billing is enabled. Controls the billing method used for this subscription plan.
- `status` (string)
- `allowance` (object)
  - `allowance.resetCycle` (string)
- `allowance` (object)
  - `allowance.type` (string)
- `allowance` (object)
  - `allowance.homeChargersOnly` (boolean): When true the allowance can only be used on the home charge points owned by the user. In that case all other allowance restrictions have no effect .
- `allowance` (object)
  - `allowance.includedCountries` (array): The allowance can only be used on charge points in countries in this list. When empty the allowance is valid for charge points in all countries, except the ones explicitly listed in the excludedCountries.
- `allowance` (object)
  - `allowance.excludedCountries` (array): The allowance cannot be used on charge points in the countries in this list.
- `allowance` (object)
  - `allowance.excludeRoaming` (boolean): When true the allowance cannot be used on roaming charge points.
- `allowance` (object)
  - `allowance.includedPartnerChargePoints` (array): An array of Partner IDs. The allowance can only be used on charge points of Partners in this list. When empty the allowance is valid for charge points of any Partner, except the ones explicitly listed in the excludedPartnerChargePoints.
- `allowance` (object)
  - `allowance.excludedPartnerChargePoints` (array): An array of Partner IDs. The allowance cannot be used on charge points of Partners in this list.
- `allowance` (object)
  - `allowance.combined` (integer) (nullable): The amount of kWh included - combined for AC and DC, should be provided if the type is combined.
- `allowance` (object)
  - `allowance.ac` (integer) (nullable): The amount of kWh included for AC, should be provided if the type is separate.
- `allowance` (object)
  - `allowance.dc` (integer) (nullable): The amount of kWh included for DC, should be provided if the type is separate.
- `visibilityRestrictions` (object): Defines which users can view and subscribe to the plan via the app
  - `visibilityRestrictions.includedPartnerUsers` (array): An array of Partner IDs. The Subscription plan is available only to users invited (and accepted) or created by one of the Partners in this list. When empty the plan is available to all users, except the ones of Partners listed in excludedPartnerUsers.
- `visibilityRestrictions` (object): Defines which users can view and subscribe to the plan via the app
  - `visibilityRestrictions.excludedPartnerUsers` (array): An array of Partner IDs. The Subscription plan is not available to users of the Partners in this list.
- `visibilityRestrictions` (object): Defines which users can view and subscribe to the plan via the app
  - `visibilityRestrictions.includedUserGroups` (array): An array of User Group IDs. The Subscription plan is available only to users with a User Group that is in this list. When empty the plan is available to all users, except the ones with a User Group listed in excludedUserGroups.
- `visibilityRestrictions` (object): Defines which users can view and subscribe to the plan via the app
  - `visibilityRestrictions.excludedUserGroups` (array): An array of User Group IDs. The Subscription plan is not available to users with a User Group that is in this list.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: name, description, renewalCycle, type, status

---


## PUT /public-api/resources/tariff-groups/v1.0/{tariffGroup}

**Summary**: Tariff Group / Update

**Request Body Schema**:

**Properties**:

- `name` (string)
- `tariffIds` (array): Ordered list of tariff ids in the group. Please note that the order is checked from bottom to top, meaning that the tariff with the largest index in that list (in other words that is the lowest in the list), that matches the requirements will apply
- `partnerId` (integer) (nullable): The assigned Partner will have access to make changes to the tariff group.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: name

---


## POST /public-api/resources/tariff-groups/v1.0

**Summary**: Tariff Group / Create

**Request Body Schema**:

**Properties**:

- `name` (string)
- `tariffIds` (array): Ordered list of tariff ids in the group. Please note that the order is checked from bottom to top, meaning that the tariff with the largest index in that list (in other words that is the lowest in the list), that matches the requirements will apply
- `partnerId` (integer) (nullable): The assigned Partner will have access to make changes to the tariff group.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: name

---


## PUT /public-api/resources/tariffs/v1.0/{tariff}

**Summary**: Tariff / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `type` (string): Setting the type to `charging not allowed` or `free` is enough for creating the particular type of tariff
- `description` (object) (nullable): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `additionalInformation` (object) (nullable): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `learnMoreUrl` (object) (nullable): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `dayTariffStart` (string): A time when the day begins
- `nightTariffStart` (string): A time when the night begins
- `pricing` (object)
  - `pricing.pricePerSession` (number) (nullable): Price per session. Only applicable with flat rate tariffs. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.connectionFee` (number) (nullable): Connection fee. A fixed fee that is applied at the start of the charging session. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.pricePerKwh` (number) (nullable): Price per kWh. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.dayPricePerKwh` (number) (nullable): Price per kWh during the day. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.nightPricePerKwh` (number) (nullable): Price per kWh during the night. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.pricePeriodInMinutes` (integer) (nullable): Charging period. In minutes. It defines the time-period for charging a fee. Example: If you select 15min then the EV-driver will be charged at the start of every 15min of EV-charging. Applicable for duration+energy and duration+energy time of day
- `pricing` (object)
  - `pricing.pricePerPeriod` (number) (nullable): Charging fee per period. Applicable for duration+energy. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.durationFeeLimit` (number) (nullable): Duration fee limit for the whole session if fee is applied.
- `pricing` (object)
  - `pricing.dayPricePerPeriod` (number) (nullable): Charging fee per period during the day. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.nightPricePerPeriod` (number) (nullable): Charging fee per period during the night. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.dayIdleFeePerMinute` (number) (nullable): Charging fee per minute during the day. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.nightIdleFeePerMinute` (number) (nullable): Charging fee per minute during the night. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.idleFeePerMinute` (number) (nullable): Idle fee per minute. A fee per minute that is applied during idle period (no charging). Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.idleFeeGracePeriodMinutes` (number) (nullable): Idle fee grace period (min). Optional. When idle period (no charging) is detected during a session the user is given this grace period to remove the vehicle, before idle fee starts applying. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.idlePricingPeriodInMinutes` (number) (nullable): Idle fee per minute. A fee per minute that is applied during idle period (no charging).
- `pricing` (object)
  - `pricing.idleFeePeriodStart` (string) (nullable): Defined start time for the application of idle fee.
- `pricing` (object)
  - `pricing.idleFeePeriodEnd` (string) (nullable): Defined end time for the application of idle fee.
- `pricing` (object)
  - `pricing.idleFeeLimit` (number) (nullable): Idle fee limit for the whole session if fee is applied.
- `pricing` (object)
  - `pricing.connectionFeeMinimumSessionDuration` (integer) (nullable): Connection Fee Minimum Session Duration (min). Optional.
- `pricing` (object)
  - `pricing.connectionFeeMinimumSessionEnergy` (number) (nullable): Connection Fee Minimum Session Energy (kWh). Optional. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.durationFeeGracePeriod` (integer) (nullable): Duration Fee Grace Period (min). Optional.
- `pricing` (object)
  - `pricing.minPrice` (number) (nullable): Min. price. Sets a minimum total amount per session. This is helpful in the case your payment service provider has a minimum transaction size or high transaction fees and you want to make sure to have a positive ROI per transaction. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.preAuthorizeAmount` (number) (nullable): Pre-authorize amount. The amount to pre-authorize before starting a session. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.taxID` (integer) (nullable): If Multi-tax Support has been enabled in the Ampeco.CHARGE settings, you can provide the taxId for the tariff here. If you do not provide a value or provide `null`, the Default tax will be used.

If Multi-tax Support has not been enabled, any provided value will be ignored.

- `pricing` (object)
  - `pricing.chargePointElectricityRate` (boolean): Use the Electricity Rate of the Charge Point that is already attached and aims to track the electricity costs.
- `pricing` (object)
  - `pricing.fallbackElectricityRateId` (integer) (nullable): When ChargePointElectricityRate is set to *false*, the Electricity Rate ID MUST be supplied in order the electricity rates for the tariff to be known.
- `pricing` (object)
  - `pricing.markupPercentagePerKwh` (number) (nullable)
- `pricing` (object)
  - `pricing.markupFixedFeePerKwh` (number) (nullable)
- `pricing` (object)
  - `pricing.flexibleMarkUpAsFixedPerKwh` (object) (nullable): Set a different fixed markup for different time slots along the day. Applicable for `energy tou` only.
    - `pricing.flexibleMarkUpAsFixedPerKwh.defaultPrice` (number): Set price for the intervals not specified in `intervalPricing` field.
- `pricing` (object)
  - `pricing.flexibleMarkUpAsFixedPerKwh` (object) (nullable): Set a different fixed markup for different time slots along the day. Applicable for `energy tou` only.
    - `pricing.flexibleMarkUpAsFixedPerKwh.intervalPricing` (array): The time interval must be always the same and should not exceed the 24-hour mark. It could be either 15 min, 30 min or 60 min. The startAt and endAt must comply with this restriction.
- `pricing` (object)
  - `pricing.multiPricePerKwh` (array): 
Create the price levels according to the kWh. <br />
The first level must have zero value for **firstKwh**. <br />
The last level must have an infinity value for **lastKwh**. <br />
The **fisrtKwh** value on the current level must be equal to the **lastKwh** value on the previous one. <br />
Instead of using a price per kWh there is the option for a flat fee per level.

An example of price levels for kWh is given in the table below.

| First kWh  | Last kWh   | Fee per kWh | Flat Fee    |
| --------- | ------------| ------------|------------ |
| 0         | 5.00        | 0.00        | 2.00        |
| 5.00      | 10.00       | 0.35        | 0.00        |
| 10.00     | null        | 0.40        | 0.00        |

Applicable for standard tariff.

- `pricing` (object)
  - `pricing.multiPricePerDuration` (array): 
Create the price levels according to the duration of the session from the time the charging started.  <br />
The first level must have zero value for **firstUnit**. <br />
The last level must have an infinity value for **lastUnit**.  <br />
The **firstUnit** value on the current level must be greater with one unit from the **lastUnit** value on the previous level. <br />
The Unit is created in the **pricePeriodInMinutes** property, the default one is 15 min.  <br />
There is the option of applying a flat fee per each level separately.  <br />

An example of price levels for duration is given in the table below.

| First Unit  | Last Unit   | Fee per Unit | Flat Fee    |
| ----------- | ------------| -------------|------------ |
| 0           | 8           | 0.50         | 0.00        |
| 9           | 24          | 0.55         | 0.00        |
| 25          | null        | 0.00         | 10.00       |

Applicable for standard tariff.

- `pricing` (object)
  - `pricing.multiIdleFee` (array): 
Different price levels could be created depending on the duration of the idle period. <br />
The first level must have zero value for **firstUnit**. <br />
The last level must have an infinity value for **lastUnit**.  <br />
The **firstUnit** value on the current level must be greater with one unit from the **lastUnit** value on the previous level. <br />
The Unit is created in the **pricePeriodInMinutes** property, the default one is 15 min. <br />
There is the option of applying a flat fee per each level separately. <br />

An example of price levels for idle periods is given in the table below.

| First Unit  | Last Unit   | Fee per Unit | Flat Fee    |
| ----------- | ------------| -------------|------------ |
| 0           | 2           | 0.30         | 0.00        |
| 3           | 6           | 0.40         | 0.00        |
| 7           | null        | 0.00         | 0.00        |

Applicable for standard tariff.

- `pricing` (object)
  - `pricing.regularUsePeriod` (number) (nullable): In minutes. Only for the Peak power level tariff.
- `pricing` (object)
  - `pricing.averagePowerLevels` (array)
- `pricing` (object)
  - `pricing.peakPowerLevels` (array)
- `pricing` (object)
  - `pricing.timePeriods` (array)
- `pricing` (object)
  - `pricing.pricePeriods` (object)
    - `pricing.pricePeriods.connectionFeePeriods` (object)
      - `pricing.pricePeriods.connectionFeePeriods.fee` (array)
- `pricing` (object)
  - `pricing.pricePeriods` (object)
    - `pricing.pricePeriods.energyFeePeriods` (object)
      - `pricing.pricePeriods.energyFeePeriods.fee` (array)
- `pricing` (object)
  - `pricing.pricePeriods` (object)
    - `pricing.pricePeriods.durationFeePeriods` (object)
      - `pricing.pricePeriods.durationFeePeriods.fee` (array)
- `pricing` (object)
  - `pricing.pricePeriods` (object)
    - `pricing.pricePeriods.idleFeePeriods` (object)
      - `pricing.pricePeriods.idleFeePeriods.fee` (array)
- `pricing` (object)
  - `pricing.daysWhenApplied` (array): When left empty, this means that this is the standard pricing that would be applied in general without taking into consideration the day.
- `pricing` (object)
  - `pricing.thresholdPriceForEnergy` (number) (nullable): Price for kWh to be considered by Optimised charging for setting the charging periods.
- `pricing` (object)
  - `pricing.priceForEnergyWhenOptimized` (number) (nullable)
- `pricing` (object)
  - `pricing.optimisedLabel` (string) (nullable)
- `pricing` (object)
  - `pricing.durationFeeFrom` (string) (nullable): Defined start time for the application of duration fees.
- `pricing` (object)
  - `pricing.durationFeeTo` (string) (nullable): Defined end time for the application of duration fees.
- `pricing` (object)
  - `pricing.subsidyIntegrationId` (integer) (nullable): The subsidy integration id that should be applied for this tariff. Only valid for Energy ToU tariffs. Please use the AMPECO.CHARGE backend for the specific integration id. Optional.
- `pricing` (object)
  - `pricing.lockPriceOnSessionStart` (boolean): When enabled the tariff of the charger will be saved using the pricing interval when the user starts the charging session. This ensures that the price for the user will remain constant for the duration of their session.
Applicable only for:
  - `duration+energy time of day` - it locks duration and energy price components
  - `energy tou` - it locks energy component only

- `pricing` (object)
  - `pricing.lockEnergyPriceOnSessionStart` (boolean): When enabled the tariff of the charger will be saved using the pricing interval when the user starts the charging session. This ensures that the price for the user will remain constant for the duration of their session.
Applicable only for `standard_tod tariff`.

- `pricing` (object)
  - `pricing.lockDurationPriceOnSessionStart` (boolean): When enabled, the energy fee component of the tariff will be saved using the pricing interval when the user starts the charging session. This ensures that the price for the user will remain constant for the duration of their session.
Applicable only for `standard_tod tariff`.

- `pricing` (object)
  - `pricing.lockIdlePriceOnSessionStart` (boolean): When enabled, the duration fee component of the tariff will be saved using the pricing interval when the user starts the charging session. This ensures that the price for the user will remain constant for the whole duration of their session.
Applicable only for `standard_tod tariff`

- `pricing` (object)
  - `pricing.stateOfChargeIdleThreshold` (integer) (nullable): Switches the session to idle when the SoC (%) exceeds the selected value. Leave empty to use the system wide setting.
This option will take effect only if `Allow custom SoC (%) threshold per Tariff` is set in `Idle period detection` setting.
This only applies to local charge points, it does not affect sessions on roaming charge points. Leave empty to use the system wide setting.

- `pricing` (object)
  - `pricing.averagePowerIdleThreshold` (number) (nullable): Sets the session to idle state when the average kW for the past 5 minutes is below the set threshold.
This option will take effect only if `Allow custom power threshold per Tariff` is set in `Idle period detection` setting.

- `currency` (string) (read-only): ISO 4217 currency code
- `stopSession` (object)
  - `stopSession.timeLimitMinutes` (number) (nullable): Session max time. The maximum minutes a session is allowed to run. Skip for no time limit.
- `stopSession` (object)
  - `stopSession.stopWhenEnergyExceedsKwh` (number) (nullable): The maximum energy (kWh) allowed per session. Skip for no limit.
- `restrictions` (object)
  - `restrictions.applyToUsersOfChargePointOwner` (boolean): Makes the tariff apply to users of the partner, who is set as owner of the charge point
- `restrictions` (object)
  - `restrictions.applyToUsersOfChargePointPartner` (boolean): Makes the tariff apply to users of the partner, who is set as owner of the charge point
- `restrictions` (object)
  - `restrictions.applyToUsersOfAllRoamingEmsps` (boolean): Makes the tariff apply to users of all eMSPs, which are roaming partners
- `restrictions` (object)
  - `restrictions.applyToAdHocUsers` (boolean): Makes the tariff valid for non-registered users(ad-hoc charging)
- `restrictions` (object)
  - `restrictions.adHocPreAuthorizeAmount` (number) (nullable): Sets the amount that would be blocked on the user's card at the start of the session. Required if applyToAdHocUsers is true and one of the following billing strategies is chosen: `Require payment method and authorize certain amount before starting session` or `Require payment method OR minimum amount in balance`.
- `restrictions` (object)
  - `restrictions.adHocStopWhenPreAuthorizedAmountFallsBelow` (number): Set the minimum pre-authorized amount threshold. When the remaining ad hoc pre-authorized amount falls below this value, the charging session will automatically stop to prevent revenue loss.

- `restrictions` (object)
  - `restrictions.applyToUsersOfPartners` (array): Users of specific Partners. Provide a list of partner IDs. Matches if the user is a invited to at least one of the partners.
- `restrictions` (object)
  - `restrictions.applyToUsersWithGroups` (array): Users with a specific group. Provide a list of user groups. Matches if the user is a member of at least one of the groups. Note: Due to improvements in the user groups, this property could be used with some limitations: 
 1) The value(s) should exactly match the name(s) of the user groups. 
 2) It would not be possible to create a user group from here anymore. 
 3) If there are duplicates, the value would not be accepted.
- `restrictions` (object)
  - `restrictions.applyToUserGroupIds` (array): An array of user group IDs. Users with a specific group. Provide a list of user group IDs. This restriction applies if the user is a member of at least one of the groups.
- `restrictions` (object)
  - `restrictions.applyToUsersWithSubscriptions` (array): Users with a specific subscription plan. Provide a list of subscription plan IDs. Matches if the user has active one of the subscription plans.
- `restrictions` (object)
  - `restrictions.startDate` (string) (nullable): The date from which the tariff becomes valid.
- `restrictions` (object)
  - `restrictions.endDate` (string) (nullable): The expiry date of the tariff. The tariff is valid until this date inclusive.
- `partner` (object)
  - `partner.id` (integer) (nullable): The assigned Partner will have access to make changes to the tariff.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date
- `display` (object)
  - `display.defaultPriceInformation` (string) (nullable): The default information that would be shown on the display of the charge point without the user having authorized themselves. The default price information from the base tariff of the first EVSE would be used for the display, when the charge point has more than one EVSE.
- `display` (object)
  - `display.defaultPriceInformationOffline` (string) (nullable): The information that would be shown on the display of the charge point when offline.
- `display` (object)
  - `display.priceInformation` (string) (nullable): The information that would be shown on the display of the charge point for users that are eligible for this tariff.
- `display` (object)
  - `display.totalCostInformation` (string) (nullable): Additional information that would be displayed on the charge point when the session ends, along with the total fees for energy, duration and idle.
- `integrationId` (integer) (nullable): References the internal integration configuration that enables this tariff type
- `externalId` (string) (nullable): Used to store custom information, usually used for external references or metadata to the resource.

**Required**: id, name, type

---


## POST /public-api/resources/tariffs/v1.0

**Summary**: Tariff / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `name` (string)
- `type` (string): Setting the type to `charging not allowed` or `free` is enough for creating the particular type of tariff
- `description` (object) (nullable): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `additionalInformation` (object) (nullable): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `learnMoreUrl` (object) (nullable): Locales that have been created and are not provided on an update will be deleted. Please provide values in all locales that you wish to keep.
- `dayTariffStart` (string): A time when the day begins
- `nightTariffStart` (string): A time when the night begins
- `pricing` (object)
  - `pricing.pricePerSession` (number) (nullable): Price per session. Only applicable with flat rate tariffs. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.connectionFee` (number) (nullable): Connection fee. A fixed fee that is applied at the start of the charging session. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.pricePerKwh` (number) (nullable): Price per kWh. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.dayPricePerKwh` (number) (nullable): Price per kWh during the day. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.nightPricePerKwh` (number) (nullable): Price per kWh during the night. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.pricePeriodInMinutes` (integer) (nullable): Charging period. In minutes. It defines the time-period for charging a fee. Example: If you select 15min then the EV-driver will be charged at the start of every 15min of EV-charging. Applicable for duration+energy and duration+energy time of day
- `pricing` (object)
  - `pricing.pricePerPeriod` (number) (nullable): Charging fee per period. Applicable for duration+energy. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.durationFeeLimit` (number) (nullable): Duration fee limit for the whole session if fee is applied.
- `pricing` (object)
  - `pricing.dayPricePerPeriod` (number) (nullable): Charging fee per period during the day. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.nightPricePerPeriod` (number) (nullable): Charging fee per period during the night. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.dayIdleFeePerMinute` (number) (nullable): Charging fee per minute during the day. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.nightIdleFeePerMinute` (number) (nullable): Charging fee per minute during the night. Applicable for duration+energy time of day. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.idleFeePerMinute` (number) (nullable): Idle fee per minute. A fee per minute that is applied during idle period (no charging). Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.idleFeeGracePeriodMinutes` (number) (nullable): Idle fee grace period (min). Optional. When idle period (no charging) is detected during a session the user is given this grace period to remove the vehicle, before idle fee starts applying. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.idlePricingPeriodInMinutes` (number) (nullable): Idle fee per minute. A fee per minute that is applied during idle period (no charging).
- `pricing` (object)
  - `pricing.idleFeePeriodStart` (string) (nullable): Defined start time for the application of idle fee.
- `pricing` (object)
  - `pricing.idleFeePeriodEnd` (string) (nullable): Defined end time for the application of idle fee.
- `pricing` (object)
  - `pricing.idleFeeLimit` (number) (nullable): Idle fee limit for the whole session if fee is applied.
- `pricing` (object)
  - `pricing.connectionFeeMinimumSessionDuration` (integer) (nullable): Connection Fee Minimum Session Duration (min). Optional.
- `pricing` (object)
  - `pricing.connectionFeeMinimumSessionEnergy` (number) (nullable): Connection Fee Minimum Session Energy (kWh). Optional. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.durationFeeGracePeriod` (integer) (nullable): Duration Fee Grace Period (min). Optional.
- `pricing` (object)
  - `pricing.minPrice` (number) (nullable): Min. price. Sets a minimum total amount per session. This is helpful in the case your payment service provider has a minimum transaction size or high transaction fees and you want to make sure to have a positive ROI per transaction. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.preAuthorizeAmount` (number) (nullable): Pre-authorize amount. The amount to pre-authorize before starting a session. Up to 5 digits after the decimal point depending on the currency precision.
- `pricing` (object)
  - `pricing.taxID` (integer) (nullable): If Multi-tax Support has been enabled in the Ampeco.CHARGE settings, you can provide the taxId for the tariff here. If you do not provide a value or provide `null`, the Default tax will be used.

If Multi-tax Support has not been enabled, any provided value will be ignored.

- `pricing` (object)
  - `pricing.chargePointElectricityRate` (boolean): Use the Electricity Rate of the Charge Point that is already attached and aims to track the electricity costs.
- `pricing` (object)
  - `pricing.fallbackElectricityRateId` (integer) (nullable): When ChargePointElectricityRate is set to *false*, the Electricity Rate ID MUST be supplied in order the electricity rates for the tariff to be known.
- `pricing` (object)
  - `pricing.markupPercentagePerKwh` (number) (nullable)
- `pricing` (object)
  - `pricing.markupFixedFeePerKwh` (number) (nullable)
- `pricing` (object)
  - `pricing.flexibleMarkUpAsFixedPerKwh` (object) (nullable): Set a different fixed markup for different time slots along the day. Applicable for `energy tou` only.
    - `pricing.flexibleMarkUpAsFixedPerKwh.defaultPrice` (number): Set price for the intervals not specified in `intervalPricing` field.
- `pricing` (object)
  - `pricing.flexibleMarkUpAsFixedPerKwh` (object) (nullable): Set a different fixed markup for different time slots along the day. Applicable for `energy tou` only.
    - `pricing.flexibleMarkUpAsFixedPerKwh.intervalPricing` (array): The time interval must be always the same and should not exceed the 24-hour mark. It could be either 15 min, 30 min or 60 min. The startAt and endAt must comply with this restriction.
- `pricing` (object)
  - `pricing.multiPricePerKwh` (array): 
Create the price levels according to the kWh. <br />
The first level must have zero value for **firstKwh**. <br />
The last level must have an infinity value for **lastKwh**. <br />
The **fisrtKwh** value on the current level must be equal to the **lastKwh** value on the previous one. <br />
Instead of using a price per kWh there is the option for a flat fee per level.

An example of price levels for kWh is given in the table below.

| First kWh  | Last kWh   | Fee per kWh | Flat Fee    |
| --------- | ------------| ------------|------------ |
| 0         | 5.00        | 0.00        | 2.00        |
| 5.00      | 10.00       | 0.35        | 0.00        |
| 10.00     | null        | 0.40        | 0.00        |

Applicable for standard tariff.

- `pricing` (object)
  - `pricing.multiPricePerDuration` (array): 
Create the price levels according to the duration of the session from the time the charging started.  <br />
The first level must have zero value for **firstUnit**. <br />
The last level must have an infinity value for **lastUnit**.  <br />
The **firstUnit** value on the current level must be greater with one unit from the **lastUnit** value on the previous level. <br />
The Unit is created in the **pricePeriodInMinutes** property, the default one is 15 min.  <br />
There is the option of applying a flat fee per each level separately.  <br />

An example of price levels for duration is given in the table below.

| First Unit  | Last Unit   | Fee per Unit | Flat Fee    |
| ----------- | ------------| -------------|------------ |
| 0           | 8           | 0.50         | 0.00        |
| 9           | 24          | 0.55         | 0.00        |
| 25          | null        | 0.00         | 10.00       |

Applicable for standard tariff.

- `pricing` (object)
  - `pricing.multiIdleFee` (array): 
Different price levels could be created depending on the duration of the idle period. <br />
The first level must have zero value for **firstUnit**. <br />
The last level must have an infinity value for **lastUnit**.  <br />
The **firstUnit** value on the current level must be greater with one unit from the **lastUnit** value on the previous level. <br />
The Unit is created in the **pricePeriodInMinutes** property, the default one is 15 min. <br />
There is the option of applying a flat fee per each level separately. <br />

An example of price levels for idle periods is given in the table below.

| First Unit  | Last Unit   | Fee per Unit | Flat Fee    |
| ----------- | ------------| -------------|------------ |
| 0           | 2           | 0.30         | 0.00        |
| 3           | 6           | 0.40         | 0.00        |
| 7           | null        | 0.00         | 0.00        |

Applicable for standard tariff.

- `pricing` (object)
  - `pricing.regularUsePeriod` (number) (nullable): In minutes. Only for the Peak power level tariff.
- `pricing` (object)
  - `pricing.averagePowerLevels` (array)
- `pricing` (object)
  - `pricing.peakPowerLevels` (array)
- `pricing` (object)
  - `pricing.timePeriods` (array)
- `pricing` (object)
  - `pricing.pricePeriods` (object)
    - `pricing.pricePeriods.connectionFeePeriods` (object)
      - `pricing.pricePeriods.connectionFeePeriods.fee` (array)
- `pricing` (object)
  - `pricing.pricePeriods` (object)
    - `pricing.pricePeriods.energyFeePeriods` (object)
      - `pricing.pricePeriods.energyFeePeriods.fee` (array)
- `pricing` (object)
  - `pricing.pricePeriods` (object)
    - `pricing.pricePeriods.durationFeePeriods` (object)
      - `pricing.pricePeriods.durationFeePeriods.fee` (array)
- `pricing` (object)
  - `pricing.pricePeriods` (object)
    - `pricing.pricePeriods.idleFeePeriods` (object)
      - `pricing.pricePeriods.idleFeePeriods.fee` (array)
- `pricing` (object)
  - `pricing.daysWhenApplied` (array): When left empty, this means that this is the standard pricing that would be applied in general without taking into consideration the day.
- `pricing` (object)
  - `pricing.thresholdPriceForEnergy` (number) (nullable): Price for kWh to be considered by Optimised charging for setting the charging periods.
- `pricing` (object)
  - `pricing.priceForEnergyWhenOptimized` (number) (nullable)
- `pricing` (object)
  - `pricing.optimisedLabel` (string) (nullable)
- `pricing` (object)
  - `pricing.durationFeeFrom` (string) (nullable): Defined start time for the application of duration fees.
- `pricing` (object)
  - `pricing.durationFeeTo` (string) (nullable): Defined end time for the application of duration fees.
- `pricing` (object)
  - `pricing.subsidyIntegrationId` (integer) (nullable): The subsidy integration id that should be applied for this tariff. Only valid for Energy ToU tariffs. Please use the AMPECO.CHARGE backend for the specific integration id. Optional.
- `pricing` (object)
  - `pricing.lockPriceOnSessionStart` (boolean): When enabled the tariff of the charger will be saved using the pricing interval when the user starts the charging session. This ensures that the price for the user will remain constant for the duration of their session.
Applicable only for:
  - `duration+energy time of day` - it locks duration and energy price components
  - `energy tou` - it locks energy component only

- `pricing` (object)
  - `pricing.lockEnergyPriceOnSessionStart` (boolean): When enabled the tariff of the charger will be saved using the pricing interval when the user starts the charging session. This ensures that the price for the user will remain constant for the duration of their session.
Applicable only for `standard_tod tariff`.

- `pricing` (object)
  - `pricing.lockDurationPriceOnSessionStart` (boolean): When enabled, the energy fee component of the tariff will be saved using the pricing interval when the user starts the charging session. This ensures that the price for the user will remain constant for the duration of their session.
Applicable only for `standard_tod tariff`.

- `pricing` (object)
  - `pricing.lockIdlePriceOnSessionStart` (boolean): When enabled, the duration fee component of the tariff will be saved using the pricing interval when the user starts the charging session. This ensures that the price for the user will remain constant for the whole duration of their session.
Applicable only for `standard_tod tariff`

- `pricing` (object)
  - `pricing.stateOfChargeIdleThreshold` (integer) (nullable): Switches the session to idle when the SoC (%) exceeds the selected value. Leave empty to use the system wide setting.
This option will take effect only if `Allow custom SoC (%) threshold per Tariff` is set in `Idle period detection` setting.
This only applies to local charge points, it does not affect sessions on roaming charge points. Leave empty to use the system wide setting.

- `pricing` (object)
  - `pricing.averagePowerIdleThreshold` (number) (nullable): Sets the session to idle state when the average kW for the past 5 minutes is below the set threshold.
This option will take effect only if `Allow custom power threshold per Tariff` is set in `Idle period detection` setting.

- `currency` (string) (read-only): ISO 4217 currency code
- `stopSession` (object)
  - `stopSession.timeLimitMinutes` (number) (nullable): Session max time. The maximum minutes a session is allowed to run. Skip for no time limit.
- `stopSession` (object)
  - `stopSession.stopWhenEnergyExceedsKwh` (number) (nullable): The maximum energy (kWh) allowed per session. Skip for no limit.
- `restrictions` (object)
  - `restrictions.applyToUsersOfChargePointOwner` (boolean): Makes the tariff apply to users of the partner, who is set as owner of the charge point
- `restrictions` (object)
  - `restrictions.applyToUsersOfChargePointPartner` (boolean): Makes the tariff apply to users of the partner, who is set as owner of the charge point
- `restrictions` (object)
  - `restrictions.applyToUsersOfAllRoamingEmsps` (boolean): Makes the tariff apply to users of all eMSPs, which are roaming partners
- `restrictions` (object)
  - `restrictions.applyToAdHocUsers` (boolean): Makes the tariff valid for non-registered users(ad-hoc charging)
- `restrictions` (object)
  - `restrictions.adHocPreAuthorizeAmount` (number) (nullable): Sets the amount that would be blocked on the user's card at the start of the session. Required if applyToAdHocUsers is true and one of the following billing strategies is chosen: `Require payment method and authorize certain amount before starting session` or `Require payment method OR minimum amount in balance`.
- `restrictions` (object)
  - `restrictions.adHocStopWhenPreAuthorizedAmountFallsBelow` (number): Set the minimum pre-authorized amount threshold. When the remaining ad hoc pre-authorized amount falls below this value, the charging session will automatically stop to prevent revenue loss.

- `restrictions` (object)
  - `restrictions.applyToUsersOfPartners` (array): Users of specific Partners. Provide a list of partner IDs. Matches if the user is a invited to at least one of the partners.
- `restrictions` (object)
  - `restrictions.applyToUsersWithGroups` (array): Users with a specific group. Provide a list of user groups. Matches if the user is a member of at least one of the groups. Note: Due to improvements in the user groups, this property could be used with some limitations: 
 1) The value(s) should exactly match the name(s) of the user groups. 
 2) It would not be possible to create a user group from here anymore. 
 3) If there are duplicates, the value would not be accepted.
- `restrictions` (object)
  - `restrictions.applyToUserGroupIds` (array): An array of user group IDs. Users with a specific group. Provide a list of user group IDs. This restriction applies if the user is a member of at least one of the groups.
- `restrictions` (object)
  - `restrictions.applyToUsersWithSubscriptions` (array): Users with a specific subscription plan. Provide a list of subscription plan IDs. Matches if the user has active one of the subscription plans.
- `restrictions` (object)
  - `restrictions.startDate` (string) (nullable): The date from which the tariff becomes valid.
- `restrictions` (object)
  - `restrictions.endDate` (string) (nullable): The expiry date of the tariff. The tariff is valid until this date inclusive.
- `partner` (object)
  - `partner.id` (integer) (nullable): The assigned Partner will have access to make changes to the tariff.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date
- `display` (object)
  - `display.defaultPriceInformation` (string) (nullable): The default information that would be shown on the display of the charge point without the user having authorized themselves. The default price information from the base tariff of the first EVSE would be used for the display, when the charge point has more than one EVSE.
- `display` (object)
  - `display.defaultPriceInformationOffline` (string) (nullable): The information that would be shown on the display of the charge point when offline.
- `display` (object)
  - `display.priceInformation` (string) (nullable): The information that would be shown on the display of the charge point for users that are eligible for this tariff.
- `display` (object)
  - `display.totalCostInformation` (string) (nullable): Additional information that would be displayed on the charge point when the session ends, along with the total fees for energy, duration and idle.
- `integrationId` (integer) (nullable): References the internal integration configuration that enables this tariff type
- `externalId` (string) (nullable): Used to store custom information, usually used for external references or metadata to the resource.

**Required**: id, name, type

---


## PATCH /public-api/resources/tax-identification-numbers/v2.0/{taxIdentificationNumber}

**Summary**: Tax Identification Number / Update

**Request Body Schema**:

**Properties**:

- `name` (string)

---


## POST /public-api/resources/tax-identification-numbers/v2.0

**Summary**: Tax Identification Number / Create

**Request Body Schema**:

**Properties**:

- `name` (string)

**Required**: name

---


## PATCH /public-api/resources/taxes/v2.0/{tax}

**Summary**: Tax / Update

**Request Body Schema**:

**Properties**:

- `name` (string)
- `displayName` (array) (nullable)
- `percentage` (number)
- `taxIdentificationNumberId` (integer) (nullable)

---


## POST /public-api/resources/taxes/v2.0

**Summary**: Tax / Create

**Request Body Schema**:

**Properties**:

- `name` (string)
- `displayName` (array) (nullable)
- `percentage` (number)
- `taxIdentificationNumberId` (integer) (nullable)

**Required**: name, percentage

---


## PATCH /public-api/resources/top-up-packages/v2.0/{topUpPackage}

**Summary**: Top-Up Package / Update

**Request Body Schema**:

**Properties**:

- `price` (number)
- `bonus` (number)
- `enabled` (boolean) (nullable)

---


## POST /public-api/resources/top-up-packages/v2.0

**Summary**: Top-Up Package / Create

**Request Body Schema**:

**Properties**:

- `price` (number)
- `bonus` (number)
- `enabled` (boolean) (nullable): By default is set to `false`.

**Required**: price, bonus

---


## PATCH /public-api/resources/transactions/v1.0/{transaction}

**Summary**: Transaction / Update

**Request Body Schema**:

**Properties**:

- `paymentMethod` (object)
  - `paymentMethod.methodType` (string)
- `paymentMethod` (object)
  - `paymentMethod.cardNetwork` (string): Required when `methodType` is `card`
- `paymentMethod` (object)
  - `paymentMethod.bankTransferType` (string): Required when `methodType` is `bank_transfer`
- `paymentMethod` (object)
  - `paymentMethod.type` (string): Deprecated, please use `methodType` and `cardNetwork` instead.
- `paymentMethod` (object)
  - `paymentMethod.last4` (string)
- `paymentMethod` (object)
  - `paymentMethod.expMonth` (string)
- `paymentMethod` (object)
  - `paymentMethod.expYear` (string)
- `status` (string)
- `totalAmount` (number)
- `ref` (string)
- `failureReason` (string)
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: status, totalAmount

---


## POST /public-api/resources/transactions/v1.0

**Summary**: Transactions / Create

**Request Body Schema**:

**Properties**:

- `sessionId` (integer)
- `paymentMethod` (object)
  - `paymentMethod.methodType` (string)
- `paymentMethod` (object)
  - `paymentMethod.cardNetwork` (string): Required when `methodType` is `card`
- `paymentMethod` (object)
  - `paymentMethod.bankTransferType` (string): Required when `methodType` is `bank_transfer`
- `paymentMethod` (object)
  - `paymentMethod.walletType` (string): Required when `methodType` is `wallet`
- `paymentMethod` (object)
  - `paymentMethod.type` (string): Deprecated, please use `methodType` and `cardNetwork` instead.
- `paymentMethod` (object)
  - `paymentMethod.last4` (string)
- `paymentMethod` (object)
  - `paymentMethod.expMonth` (string)
- `paymentMethod` (object)
  - `paymentMethod.expYear` (string)
- `totalAmount` (number)
- `status` (string)
- `ref` (string)
- `failureReason` (string)
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: totalAmount, status

---


## PATCH /public-api/resources/user-groups/v1.0/{userGroup}

**Summary**: User Group / Update

**Request Body Schema**:

**Properties**:

- `name` (string)
- `partnerId` (integer) (nullable): The partnerId can be updated only if there are no users added to the user group
- `description` (string) (nullable)
- `externalId` (string) (nullable): Used to store custom information, usually used for external references or metadata to the resource.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: name

---


## POST /public-api/resources/user-groups/v1.0

**Summary**: User Group / Create

**Request Body Schema**:

**Properties**:

- `name` (string)
- `partnerId` (integer) (nullable): The partnerId can be updated only if there are no users added to the user group
- `description` (string) (nullable)
- `externalId` (string) (nullable): Used to store custom information, usually used for external references or metadata to the resource.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date

**Required**: name

---


## POST /public-api/resources/users/v1.0/{user}/invoice-details

**Summary**: Invoice details / Create or update

**Request Body Schema**:

**Note**: This schema uses `oneOf` (multiple possible structures).

```json
{"oneOf":[{"type":"object","title":"Ampeco Invoice Manager","description":"Invoice processor - Ampeco","properties":{"requireInvoice":{"type":"boolean","default":false,"description":"Whether invoice is required for this user. Note: If the operator has 'Always collect Invoice Details' enabled in their invoice integration settings, this field will always be true regardless of the request payload value."},"invoiceType":{"type":"string","enum":["individual","company"],"nullable":true},"individualName":{"type":"string","nullable":true},"individualPersonalId":{"type":"string","nullable":true},"individualTaxId":{"type":"string","nullable":true},"companyName":{"type":"string","nullable":true},"companyRegNo":{"type":"string","nullable":true},"companyTaxId":{"type":"string","nullable":true},"companyTaxAdministrationOfficeName":{"type":"string","nullable":true},"country":{"type":"string","enum":["AF","AX","AL","DZ","AS","AD","AO","AI","AQ","AG","AR","AM","AW","AU","AT","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","BV","BR","IO","BN","BG","BF","BI","KH","CM","CA","CV","KY","CF","TD","CL","CN","CX","CC","CO","KM","CG","CD","CK","CR","CI","HR","CU","CW","CY","CZ","DK","DJ","DM","DO","EC","EG","SV","GQ","ER","EE","ET","FK","FO","FJ","FI","FR","GF","PF","TF","GA","GM","GE","DE","GH","GI","GR","GL","GD","GP","GU","GT","GG","GN","GW","GY","HT","HM","VA","HN","HK","HU","IS","IN","ID","IR","IQ","IE","IM","IL","IT","JM","JP","JE","JO","KZ","KE","KI","KP","KR","XK","KW","KG","LA","LV","LB","LS","LR","LY","LI","LT","LU","MO","MK","MG","MW","MY","MV","ML","MT","MH","MQ","MR","MU","YT","MX","FM","MD","MC","MN","ME","MS","MA","MZ","MM","NA","NR","NP","NL","NC","NZ","NI","NE","NG","NU","NF","MP","NO","OM","PK","PW","PS","PA","PG","PY","PE","PH","PN","PL","PT","PR","QA","RE","RO","RU","RW","BL","SH","KN","LC","MF","PM","VC","WS","SM","ST","SA","SN","RS","SC","SL","SG","SX","SK","SI","SB","SO","ZA","GS","SS","ES","LK","SD","SR","SJ","SZ","SE","CH","SY","TW","TJ","TZ","TH","TL","TG","TK","TO","TT","TN","TR","TM","TC","TV","UG","UA","AE","GB","US","UM","UY","UZ","VU","VE","VN","VG","VI","WF","EH","YE","ZM","ZW"],"nullable":true},"region":{"type":"string","nullable":true,"description":"When country is not in US, AU, CA, UM or RO, you can provide the region"},"state":{"description":"When the selected country is one of US, AU, CA, UM or RO","anyOf":[{"title":"US State","description":"When the country is US.","type":"string","enum":["AL","AK","AS","AZ","AR","CA","CO","CT","DE","DC","FM","FL","GA","GU","HI","ID","IL","IN","IA","KS","KY","LA","ME","MH","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","MP","OH","OK","OR","PW","PA","PR","RI","SC","SD","TN","TX","UT","VT","VI","VA","WA","WV","WI","WY"]},{"title":"Australian State","description":"When the country is AU.","type":"string","enum":["NSW","VIC","QLD","WA","SA","TAS","ACT","NT","JBT","CX","NF","CC","AQ","CSI","ACI","HM"]},{"title":"Canadian Province","description":"When the country is CA.","type":"string","enum":["AB","BC","MB","NB","NL","NT","NS","NU","ON","PE","QC","SK","YT"]},{"title":"US Minor Outlying Islands Territory","description":"When the country is UM.","type":"string","enum":["81","84","85","67","89","71","76","95","79"]},{"title":"Romanian County","description":"When the country is RO.","type":"string","enum":["AB","AR","AG","BC","BH","BN","BT","BV","BR","B","BZ","CL","CS","CT","CV","DB","DJ","GL","GR","GJ","HR","HD","IL","IS","IF","MM","MH","MS","NT","OT","PH","SM","SJ","SB","SV","TR","TM","TL","VS","VL","VN"]}]},"city":{"type":"string","nullable":true},"postCode":{"type":"string","nullable":true},"address":{"type":"string","nullable":true}},"required":["requireInvoice","invoiceType"]},{"type":"object","title":"Cardcom Invoice Manager","description":"Invoice processor - Cardcom","properties":{"invoiceRequired":{"type":"boolean","default":false},"clientType":{"type":"string","enum":["individual","company"],"nullable":true},"name":{"type":"string","nullable":true},"email":{"type":"string","nullable":true},"mobilePhoneNumber":{"type":"string","nullable":true},"landlinePhoneNumber":{"type":"string","nullable":true},"taxId":{"type":"string","nullable":true},"country":{"type":"string","enum":["AF","AX","AL","DZ","AS","AD","AO","AI","AQ","AG","AR","AM","AW","AU","AT","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","BV","BR","IO","BN","BG","BF","BI","KH","CM","CA","CV","KY","CF","TD","CL","CN","CX","CC","CO","KM","CG","CD","CK","CR","CI","HR","CU","CW","CY","CZ","DK","DJ","DM","DO","EC","EG","SV","GQ","ER","EE","ET","FK","FO","FJ","FI","FR","GF","PF","TF","GA","GM","GE","DE","GH","GI","GR","GL","GD","GP","GU","GT","GG","GN","GW","GY","HT","HM","VA","HN","HK","HU","IS","IN","ID","IR","IQ","IE","IM","IL","IT","JM","JP","JE","JO","KZ","KE","KI","KP","KR","XK","KW","KG","LA","LV","LB","LS","LR","LY","LI","LT","LU","MO","MK","MG","MW","MY","MV","ML","MT","MH","MQ","MR","MU","YT","MX","FM","MD","MC","MN","ME","MS","MA","MZ","MM","NA","NR","NP","NL","NC","NZ","NI","NE","NG","NU","NF","MP","NO","OM","PK","PW","PS","PA","PG","PY","PE","PH","PN","PL","PT","PR","QA","RE","RO","RU","RW","BL","SH","KN","LC","MF","PM","VC","WS","SM","ST","SA","SN","RS","SC","SL","SG","SX","SK","SI","SB","SO","ZA","GS","SS","ES","LK","SD","SR","SJ","SZ","SE","CH","SY","TW","TJ","TZ","TH","TL","TG","TK","TO","TT","TN","TR","TM","TC","TV","UG","UA","AE","GB","US","UM","UY","UZ","VU","VE","VN","VG","VI","WF","EH","YE","ZM","ZW"],"nullable":true},"city":{"type":"string","nullable":true},"postcode":{"type":"string","nullable":true},"address":{"type":"string","nullable":true}},"required":["invoiceRequired","clientType"]},{"type":"object","title":"SoftOne Invoice Manager","description":"Invoice processor - SoftOne","properties":{"firstName":{"type":"string","nullable":false},"lastName":{"type":"string","nullable":false},"email":{"type":"string","nullable":false},"phone":{"type":"string","nullable":true},"country":{"type":"string","enum":["AF","AX","AL","DZ","AS","AD","AO","AI","AQ","AG","AR","AM","AW","AU","AT","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","BV","BR","IO","BN","BG","BF","BI","KH","CM","CA","CV","KY","CF","TD","CL","CN","CX","CC","CO","KM","CG","CD","CK","CR","CI","HR","CU","CW","CY","CZ","DK","DJ","DM","DO","EC","EG","SV","GQ","ER","EE","ET","FK","FO","FJ","FI","FR","GF","PF","TF","GA","GM","GE","DE","GH","GI","GR","GL","GD","GP","GU","GT","GG","GN","GW","GY","HT","HM","VA","HN","HK","HU","IS","IN","ID","IR","IQ","IE","IM","IL","IT","JM","JP","JE","JO","KZ","KE","KI","KP","KR","XK","KW","KG","LA","LV","LB","LS","LR","LY","LI","LT","LU","MO","MK","MG","MW","MY","MV","ML","MT","MH","MQ","MR","MU","YT","MX","FM","MD","MC","MN","ME","MS","MA","MZ","MM","NA","NR","NP","NL","NC","NZ","NI","NE","NG","NU","NF","MP","NO","OM","PK","PW","PS","PA","PG","PY","PE","PH","PN","PL","PT","PR","QA","RE","RO","RU","RW","BL","SH","KN","LC","MF","PM","VC","WS","SM","ST","SA","SN","RS","SC","SL","SG","SX","SK","SI","SB","SO","ZA","GS","SS","ES","LK","SD","SR","SJ","SZ","SE","CH","SY","TW","TJ","TZ","TH","TL","TG","TK","TO","TT","TN","TR","TM","TC","TV","UG","UA","AE","GB","US","UM","UY","UZ","VU","VE","VN","VG","VI","WF","EH","YE","ZM","ZW"],"nullable":true},"city":{"type":"string","nullable":true},"postcode":{"type":"string","nullable":true},"address":{"type":"string","nullable":true}},"required":["firstName","lastName","email"]},{"type":"object","title":"Ecpay Invoice Manager","description":"Invoice processor - Ecpay","properties":{"invoiceType":{"type":"string","enum":["EInvoice","Company","Donation"]},"carrierType":{"type":"string","enum":["Mobile","Citizen","GreenWorld"],"nullable":true},"loveCode":{"type":"string","nullable":true},"mobileBarCode":{"type":"string","nullable":true},"citizenId":{"type":"string","nullable":true},"companyId":{"type":"string","nullable":true},"name":{"type":"string","nullable":true},"email":{"type":"string","nullable":true},"phone":{"type":"string","nullable":true},"country":{"type":"string","enum":["AF","AX","AL","DZ","AS","AD","AO","AI","AQ","AG","AR","AM","AW","AU","AT","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","BV","BR","IO","BN","BG","BF","BI","KH","CM","CA","CV","KY","CF","TD","CL","CN","CX","CC","CO","KM","CG","CD","CK","CR","CI","HR","CU","CW","CY","CZ","DK","DJ","DM","DO","EC","EG","SV","GQ","ER","EE","ET","FK","FO","FJ","FI","FR","GF","PF","TF","GA","GM","GE","DE","GH","GI","GR","GL","GD","GP","GU","GT","GG","GN","GW","GY","HT","HM","VA","HN","HK","HU","IS","IN","ID","IR","IQ","IE","IM","IL","IT","JM","JP","JE","JO","KZ","KE","KI","KP","KR","XK","KW","KG","LA","LV","LB","LS","LR","LY","LI","LT","LU","MO","MK","MG","MW","MY","MV","ML","MT","MH","MQ","MR","MU","YT","MX","FM","MD","MC","MN","ME","MS","MA","MZ","MM","NA","NR","NP","NL","NC","NZ","NI","NE","NG","NU","NF","MP","NO","OM","PK","PW","PS","PA","PG","PY","PE","PH","PN","PL","PT","PR","QA","RE","RO","RU","RW","BL","SH","KN","LC","MF","PM","VC","WS","SM","ST","SA","SN","RS","SC","SL","SG","SX","SK","SI","SB","SO","ZA","GS","SS","ES","LK","SD","SR","SJ","SZ","SE","CH","SY","TW","TJ","TZ","TH","TL","TG","TK","TO","TT","TN","TR","TM","TC","TV","UG","UA","AE","GB","US","UM","UY","UZ","VU","VE","VN","VG","VI","WF","EH","YE","ZM","ZW"],"nullable":true},"city":{"type":"string","nullable":true},"postcode":{"type":"string","nullable":true},"address":{"type":"string","nullable":true}},"required":["invoiceType","name","email","phone"]}]}
```

---


## PATCH /public-api/resources/users/v1.0/{user}/payment-methods/{paymentMethodId}

**Summary**: Payment Method / Update

**Request Body Schema**:

**Properties**:

- `default` (boolean)

---


## POST /public-api/resources/users/v1.0/{user}/payment-methods

**Summary**: Payment Method / Create

**Request Body Schema**:

**Properties**:

- `tokenizedType` (string): The type of the tokenized payment method. If not provided - defaults to card
- `bankTransferType` (string): The type of the bank transfer. Required if `tokenizedType` is `bank_transfer`
- `transactionId` (number) (nullable): The ID of the Transaction object, created when you initiated the request.

---


## PATCH /public-api/resources/users/v1.0/{user}

**Summary**: User / Update

**Request Body Schema**:

**Properties**:

- `email` (string)
- `emailVerified` (string) (nullable): ISO 8601 formatted date
- `password` (string)
- `requirePasswordReset` (boolean): Sets a requirement for the user to set a new password when they next open the app. After a new password is set, this option resets automatically.
- `first_name` (string)
- `middle_name` (string)
- `last_name` (string)
- `phone` (string)
- `country` (string)
- `state` (string) (nullable): The field will be considered only if the provided country is `US` or `AU`
- `city` (string)
- `post_code` (string)
- `address` (string)
- `vehicle_no` (string)
- `userGroupIds` (array)
- `externalId` (string) (nullable): Third party identifier of the user
- `options` (object)
  - `options.sessionsAllowed` (string): Determine the number of sessions a user could start - single or multiple simultaneous sessions, or whether the user could start simultaneous sessions with several Id Tags.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date
- `receiveNewsAndPromotions` (boolean): Updates the user's preference for receiving news and promotions. To change their preference, update this field to 'true' to opt in, or 'false' to opt out.
- `bankDetails` (object)
  - `bankDetails.bankIban` (string) (nullable): IBAN that is provided for the user.
- `bankDetails` (object)
  - `bankDetails.bankName` (string) (nullable): Name of the Bank for which the user has provided IBAN.
- `bankDetails` (object)
  - `bankDetails.bankAddress` (string) (nullable): Address of the user's Bank.
- `bankDetails` (object)
  - `bankDetails.bankCode` (string) (nullable): Bank code assigned by a central bank, a bank supervisory body or a Bankers Association in the country.
- `bankDetails` (object)
  - `bankDetails.bankAccountNumber` (string) (nullable): Bank account ID provided by the user.
- `bankDetails` (object)
  - `bankDetails.bankAccountType` (string) (nullable): Type of account the user has provided.
- `externalAppData` (object) (nullable): The externalAppData field is an object designed to hold additional data related to external integrations.
This object can contain the following keys, which are currently supported:

- `externalCustomerId`: A string representing the customer ID of the user in an external payment provider integration. This ID is used to link the user's account within the system to their corresponding account in the external payment provider.

If no information is available, the externalAppData object will be null. It's a part of the response only if request is called with `include.externalAppData` query parameter.


---


## POST /public-api/resources/users/v1.0

**Summary**: User / Create

**Request Body Schema**:

**Properties**:

- `email` (string)
- `emailVerified` (string) (nullable): ISO 8601 formatted date
- `password` (string)
- `requirePasswordReset` (boolean): Sets a requirement for the user to set a new password when they next open the app. After a new password is set, this option resets automatically.
- `first_name` (string)
- `middle_name` (string)
- `last_name` (string)
- `phone` (string)
- `country` (string)
- `state` (string) (nullable): The field will be considered only if the provided country is `US` or `AU`
- `city` (string)
- `post_code` (string)
- `address` (string)
- `vehicle_no` (string)
- `personal_id` (string)
- `locale` (string) (nullable): The language and regional settings to use in the app.

**Only available** if the option to update the user locale has been enabled for the operator.

- `userGroupIds` (array)
- `externalId` (string) (nullable): Third party identifier of the user
- `options` (object)
  - `options.sessionsAllowed` (string): Determine the number of sessions a user could start - single or multiple simultaneous sessions, or whether the user could start simultaneous sessions with several Id Tags.
- `lastUpdatedAt` (string) (read-only): ISO 8601 formatted date
- `receiveNewsAndPromotions` (boolean): Indicates whether the user has opted into receiving news and promotions. To opt in, set this field to 'true'; otherwise, set it to 'false'.
- `bankDetails` (object)
  - `bankDetails.bankIban` (string) (nullable): IBAN that is provided for the user.
- `bankDetails` (object)
  - `bankDetails.bankName` (string) (nullable): Name of the Bank for which the user has provided IBAN.
- `bankDetails` (object)
  - `bankDetails.bankAddress` (string) (nullable): Address of the user's Bank.
- `bankDetails` (object)
  - `bankDetails.bankCode` (string) (nullable): Bank code assigned by a central bank, a bank supervisory body or a Bankers Association in the country.
- `bankDetails` (object)
  - `bankDetails.bankAccountNumber` (string) (nullable): Bank account ID provided by the user.
- `bankDetails` (object)
  - `bankDetails.bankAccountType` (string) (nullable): Type of account the user has provided.
- `externalAppData` (object) (nullable): The externalAppData field is an object designed to hold additional data related to external integrations.
This object can contain the following keys, which are currently supported:

- `externalCustomerId`: A string representing the customer ID of the user in an external payment provider integration. This ID is used to link the user's account within the system to their corresponding account in the external payment provider.

If no information is available, the externalAppData object will be null."

- `nonce` (string): A optional unique string that is used to prevent replay attacks. It's generated by the server, the client should pass it if the user is being created from an external sign up embedded web app and needs to automatically log in the user in the mobile app after creation.

**Required**: email, password

---


## PUT /public-api/resources/utilities/v1.0/{utility}

**Summary**: Utilities / Update

**Request Body Schema**:

**Properties**:

- `name` (string)

**Required**: name

---


## POST /public-api/resources/utilities/v1.0

**Summary**: Utilities / Create

**Request Body Schema**:

**Properties**:

- `name` (string)

**Required**: name

---


## PATCH /public-api/resources/vendor-error-codes/v2.0/{vendorErrorCode}

**Summary**: Vendor Error Code / Update

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `vendorId` (string): Unique identifier of the Vendor, reported from the Charge point
- `errorCode` (string): The code reported from the charge point when the hardwareStatus is faulted
- `errorCodeDescription` (string) (nullable): Description of the error provided by the vendor
- `errorCodeCustomerAction` (string) (nullable): Recommended actions by the customer when this error occurs

**Required**: vendorId, errorCode

---


## POST /public-api/resources/vendor-error-codes/v2.0

**Summary**: Vendor Error Code / Create

**Request Body Schema**:

**Properties**:

- `id` (integer) (read-only)
- `vendorId` (string): Unique identifier of the Vendor, reported from the Charge point
- `errorCode` (string): The code reported from the charge point when the hardwareStatus is faulted
- `errorCodeDescription` (string) (nullable): Description of the error provided by the vendor
- `errorCodeCustomerAction` (string) (nullable): Recommended actions by the customer when this error occurs

**Required**: vendorId, errorCode

---


## PATCH /public-api/resources/vouchers/v2.0/{voucher}

**Summary**: Voucher / Update

**Request Body Schema**:

**Properties**:

- `status` (string)
- `expireDate` (string) (nullable): RFC 3339 formatted date
- `amount` (number)

**Required**: amount

---


## POST /public-api/resources/vouchers/v2.0

**Summary**: Voucher / Create

**Request Body Schema**:

**Properties**:

- `amount` (number)
- `expireDate` (string) (nullable): RFC 3339 formatted date
- `description` (string)

**Required**: amount

---


## PATCH /public-api/resources/vouchers/v2.1/{voucher}

**Summary**: Voucher / Update

**Request Body Schema**:

**Properties**:

- `status` (string)
- `expireDate` (string) (nullable): RFC 3339 formatted date. Defines the date on which the voucher expires. The field can be calculated based on the `redeemedAt` timestamp and the `validityPeriod` field if the `validityPeriod` is set and the `expireDate` is not.
- `validityPeriod` (string) (nullable): Defines the validity period for the voucher. When a user redeems the voucher, this period is added to the `redeemedAt` timestamp to calculate the voucher's `expireDate`. This field is only used when `expireDate` is not already set - if `expireDate` has a value, this period is ignored and the defined `expireDate` is used instead.
- `assignBeforeDate` (string): The date before which the voucher should be assigned to user in order to be valid. RFC 3339 formatted date
- `amount` (number)
- `prefix` (string): The prefix of the voucher's code.
- `title` (array): The title of the voucher.

**Required**: amount

---


## POST /public-api/resources/vouchers/v2.1

**Summary**: Voucher / Create

**Request Body Schema**:

**Properties**:

- `amount` (number)
- `expireDate` (string) (nullable): RFC 3339 formatted date. Defines the date on which the voucher expires. The field can be calculated based on the `redeemedAt` timestamp and the `validityPeriod` field if the `validityPeriod` is set and the `expireDate` is not.
- `validityPeriod` (string) (nullable): Defines the validity period for the voucher. When a user redeems the voucher, this period is added to the `redeemedAt` timestamp to calculate the voucher's `expireDate`. This field is only used when `expireDate` is not already set - if `expireDate` has a value, this period is ignored and the defined `expireDate` is used instead.
- `assignBeforeDate` (string) (nullable): The date before which the voucher should be assigned to user in order to be valid. RFC 3339 formatted date
- `description` (string)
- `prefix` (string): The prefix of the voucher's code.
- `title` (array): The title of the voucher.

**Required**: amount

---


