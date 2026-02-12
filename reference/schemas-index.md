# Schema Reference Index

Auto-generated from AMPECO Public API spec v3.139.0

**Total Schemas**: 18

---

## Location

**Type**: object

**Properties**: additional_description, address, city, country, description, detailed_description, external_id, geoposition, id, images, lastUpdatedAt, location_image, name, post_code, public_charge_points, public_charge_points_ids, region, status, timezone, working_hours

---

## ChargePoint

**Type**: object

---

## IssueChangedNotification

**Type**: object

**Properties**: action, issueId, notification, status, updatedAt, workflowState

**Required**: notification, issueId, action, updatedAt

---

## Session

**Type**: object

**Properties**: amount, authorization, authorizationId, billingStatus, bookingId, chargePointId, chargePointOperatorRoamingId, chargingPeriods, clockAlignedEnergyConsumption, connectorId, currency, electricityCost, energy, energyConsumption, estimatedSavings, evseId, evsePhysicalReference, extendedBySessionId, extendingSessionId, externalAppData, externalSessionId, id, idTag, idTagLabel, idTagType, lastUpdatedAt, nonBillableEnergy, originalSessionId, paymentMethodId, paymentStatus, paymentStatusUpdatedAt, paymentType, power, powerKw, priceBreakdown, randomisedDelay, reason, receiptId, reimbursementEligibility, roaming, socPercent, startedAt, status, stoppedAt, tariffSnapshotId, tax, terminalId, totalAmount, userId

**Required**: id, status, userId, authorizationId, energy, energyConsumption, chargePointId, evseId, startedAt, billingStatus

---

## TariffGroup

**Type**: object

**Properties**: display, lastUpdatedAt, name, partnerId, tariffIds

**Required**: name

---

## SmartChargingTod

**Type**: object

**Properties**: circuitId, connectedPhase, defaultChargePointMaxCurrent, electricalConfiguration, enableKeepAwake, maxVoltage, minCurrent, mode, periods, phaseRotation, phases, preconditioningTime

**Required**: mode, defaultChargePointMaxCurrent, maxVoltage, phases, phaseRotation

---

## SmartChargingDynamic

**Type**: object

**Properties**: circuitId, connectedPhase, defaultChargePointMaxCurrent, electricalConfiguration, enableKeepAwake, maxVoltage, minCurrent, mode, phaseRotation, phases, preconditioningTime

**Required**: mode, defaultChargePointMaxCurrent, maxVoltage, phases, phaseRotation

---

## SmartChargingUserSchedule

**Type**: object

**Properties**: allowDynamicLoadManagement, circuitId, connectedPhase, defaultChargePointMaxCurrent, electricalConfiguration, enableKeepAwake, maxVoltage, minCurrent, mode, phaseRotation, phases, preconditioningTime

**Required**: mode, defaultChargePointMaxCurrent, minCurrent, enableKeepAwake, maxVoltage, phases, phaseRotation

---

## SmartChargingDisabled

**Type**: object

**Properties**: mode, preconditioningTime

**Required**: mode

---

## PersonalSmartChargingPreferencesUserControlledSchedule

**Type**: object

**Properties**: enabled, preferences, type

**Required**: type, preferences

---

## PersonalSmartChargingPreferencesSolar

**Type**: object

**Properties**: enabled, preferences, type

**Required**: type, preferences

---

## PersonalSmartChargingPreferencesOctopusAgile

**Type**: object

**Properties**: enabled, integrationId, preferences, type

**Required**: type, preferences, integrationId

---

## PersonalSmartChargingPreferencesOctopusGo

**Type**: object

**Properties**: enabled, integrationId, preferences, type

**Required**: type, preferences, integrationId

---

## PersonalSmartChargingPreferencesNordPool

**Type**: object

**Properties**: enabled, integrationId, preferences, type

**Required**: type, preferences, integrationId

---

## PersonalSmartChargingPreferencesChargerElectricityRate

**Type**: object

**Properties**: electricityRateId, enabled, preferences, type

**Required**: type, electricityRateId, preferences

---

## PartnerAdmin-read

**Type**: object

**Properties**: adminType, createdAt, email, id, locale, locationIds, name, roleId, updatedAt, whitelistedIps

---

## PartnerAdmin-create

**Type**: object

**Properties**: adminType, email, locale, locationIds, name, password, passwordConfirmation, roleId, whitelistedIps

**Required**: name, email, password, passwordConfirmation, adminType, roleId

---

## PartnerAdmin-update

**Type**: object

**Properties**: email, locale, locationIds, name, password, passwordConfirmation, roleId, whitelistedIps

---

