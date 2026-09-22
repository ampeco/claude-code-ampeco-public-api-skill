# Schema Reference Index

Auto-generated from AMPECO Public API spec v3.251.8

**Total Schemas**: 971

---

## 1

**Type**: object

**Properties**: adminToken, bundle, currencyCode, defaultLanguage, externalId, info, invoiceDetailsMandatory, invoiceFields, isOnline, kioskModeEnabled, networkStatus, networkStatusMonitoringEnabled, phone, presentCardOnStopSession, screensaverLogoUrl, screensaverPaymentMethods, screensaverWelcomeMessage, serialNumber, showTermsAndConditions, simplifiedJourneyMode, supportedLanguages, termVersionId

---

## 2

**Type**: object

**Properties**: defaultLanguage, displayText, displayTextTimeout, externalId, isOnline, networkStatus, serialNumber

**Required**: id, name, defaultLanguage, serialNumber, integrationId, terminalType, operatorId

---

## validation-error

**Type**: object

**Properties**: errors, message

**Required**: message

---

## SmartChargingProfile

**Type**: object

**Properties**: chargingProfileKind, chargingProfilePurpose, chargingSchedule, recurrencyKind, stackLevel, transactionId, validFrom, validTo

**Required**: stackLevel, chargingProfilePurpose, chargingProfileKind, chargingSchedule

---

## SessionStopConditions

**Type**: object

**Properties**: maxAmount, maxDurationMinutes, maxEnergyKwh, maxSocPercent

---

## StartSession

**Type**: object

**Properties**: bookingId, connectorId, externalSessionId, idTag, paymentMethodId, stopConditions, userId

---

## configuration-key

**Type**: string

---

## ChargePointConfigurationReportBase

**Type**: string

---

## Priority

**Type**: object

**Properties**: priority

**Required**: priority

---

## threshold

**Type**: number

---

## upper

**Type**: object

---

## priority

**Type**: number

---

## lower

**Type**: object

---

## write

**Type**: object

**Properties**: highSoCPriority, lowSoCPriority, lowerThresholdPercent, upperThresholdPercent

---

## Boost

**Type**: object

**Properties**: enabled

**Required**: enabled

---

## readonly-timestamp

**Type**: string

---

## configurationVariableBase16

**Type**: object

**Properties**: id, keyName, lastUpdatedAt, value

---

## configurationVariableWrite16

**Type**: object

**Required**: keyName, value

---

## configurationVariableBase21

**Type**: object

**Properties**: component, componentInstance, connectorId, evseId, id, lastUpdatedAt, value, variableInstance, variableName, variableType

---

## configurationVariableWrite21

**Type**: object

**Required**: value, variableName, component

---

## EnergyCouponRedeemRequest

**Type**: object

**Properties**: code, userId

**Required**: code, userId

---

## EnergyCouponType

**Type**: string

---

## EnergyCouponStatus

**Type**: string

---

## EnergyCouponEvseType

**Type**: string

---

## date

**Type**: string

---

## external-id

**Type**: string

---

## country

**Type**: string

---

## EnergyCouponRestrictions

**Type**: object

**Properties**: countryRestriction, evseType, locationRestriction, locationTagRestriction, maxSessionEnergyWh, minSessionEnergyWh, partnerRestriction, personalChargePointsOnly, userGroupRestriction

---

## EnergyCoupon-read

**Type**: object

**Properties**: code, createdAt, energyWh, evseType, externalId, id, operatorId, remainingEnergyWh, restrictions, status, type, userId, validFrom, validTo

**Required**: id, operatorId, code, type, status, energyWh, remainingEnergyWh, evseType, restrictions, createdAt

---

## base

**Type**: object

**Properties**: endTime, startTime

---

## create

**Type**: object

**Properties**: energy, maxPower

---

## FlexibilityActivationRequestPeriodCreate

**Type**: object

**Required**: startTime, endTime

---

## get

**Type**: object

**Properties**: energy, maxPower

---

## FlexibilityActivationRequestPeriod

**Type**: object

---

## FlexibilityActivationRequest

**Type**: object

**Properties**: assetId, id, periods, timestamp

**Required**: id, assetId, timestamp, periods

---

## installer-job-status

**Type**: string

---

## region

**Type**: string

---

## US

**Type**: string

---

## AU

**Type**: string

---

## CA

**Type**: string

---

## UM

**Type**: string

---

## RO

**Type**: string

---

## state

**Type**: object

---

## InvoiceFiscalizationStatus

**Type**: string

---

## Invoice

**Type**: object

**Properties**: client, date, downloadUrl, externalId, fiscalization, id, lastUpdatedAt, number, operatorId, partnerId, paymentStatus, periodFrom, periodTo, quantity, service, subtotal, taxAmount, taxRate, totalAmount, totalEnergy, type, unitPrice, userId

**Required**: id, operatorId, type, number, date, totalAmount, taxRate, taxAmount, service, quantity, unitPrice, subtotal

---

## notifications-options

**Type**: string

---

## PartnerInvoiceDocumentType

**Type**: string

---

## PartnerInvoicePartyType

**Type**: string

---

## PartnerInvoicePaymentStatus

**Type**: string

---

## currency

**Type**: string

---

## totalAmount

**Type**: object

**Properties**: withTax, withoutTax

**Required**: withoutTax, withTax

---

## readListing

**Type**: object

**Properties**: buyerType, currencyCode, dueOn, externalId, id, issuedOn, number, operatorId, partnerId, paymentStatus, paymentTermsDays, periodEndsOn, periodStartsOn, referenceId, sellerType, settlementReportId, totalAmount, totalTax, type

**Required**: id, operatorId, partnerId, settlementReportId, number, type, sellerType, buyerType, issuedOn, dueOn, paymentTermsDays, paymentStatus, currencyCode, totalAmount

---

## party

**Type**: object

**Properties**: address, city, contactPerson, country, email, name, phone, postCode, regNo, region, taxId, type

**Required**: type, name

---

## BankDetailsFields

**Type**: object

**Properties**: bankAccountHolder, bankAccountNumber, bankAccountType, bankAddress, bankBic, bankCode, bankIban, bankName

---

## sellerParty

**Type**: object

---

## amount

**Type**: object

**Properties**: withTax, withoutTax

**Required**: withTax

---

## PartnerInvoiceLineItemOrigin

**Type**: string

---

## lineItem

**Type**: object

**Properties**: displayOrder, id, lineTotal, originType, quantity, service, taxPercentage, unit, unitPrice

**Required**: id, service, unit, quantity, unitPrice, lineTotal, displayOrder, originType

---

## PartnerInvoiceFiscalizationStatus

**Type**: string

---

## fiscalization

**Type**: object

**Properties**: referenceNumber, status

**Required**: status

---

## readDetails

**Type**: object

---

## nullable-external-id

**Type**: string

---

## updateExternalIdRequest

**Type**: object

**Properties**: externalId

**Required**: externalId

---

## PartnerSettlementReportParticipantBasicResponseSchema

**Type**: object

**Properties**: address, city, contactPerson, country, email, name, phone, postCode, regNo, region, taxId, type

**Required**: type, name, contactPerson, country, region, city, postCode, address, regNo, taxId, phone, email

---

## PartnerSettlementReportBankDetailsResponseSchema

**Type**: object

---

## PartnerSettlementReportDeductedFeesResponseSchema

**Type**: object

**Properties**: feePerKwhAc, feePerKwhDc, feePerSessionAc, feePerSessionDc, handlingFee

**Required**: feePerSessionAc, feePerSessionDc, feePerKwhAc, feePerKwhDc, handlingFee

---

## PartnerSettlementReportResponseSchema

**Type**: object

**Properties**: currencyCode, customer, date, deductedFees, downloadUrl, externalId, id, number, partnerId, partnerInvoiceId, periodEnd, periodStart, supplier, totalAmount, totalAwaitedRevenue, totalCollectedRevenue, totalCollectedRevenueFromPreviousPeriod, totalEnergyCpoWh, totalEnergyEmspWh, totalExpenses, totalRevenue

**Required**: id, partnerId, number, date, periodStart, periodEnd, currencyCode, totalAmount, totalExpenses, totalRevenue, totalAwaitedRevenue, totalCollectedRevenue, totalCollectedRevenueFromPreviousPeriod, totalEnergyCpoWh, totalEnergyEmspWh, supplier, customer, downloadUrl

---

## CustomFields

**Type**: object

---

## PartnerSettlementReportWithCustomFields

**Type**: object

---

## UpdatePartnerSettlementReportExternalIdRequestSchema

**Type**: object

**Properties**: externalId

**Required**: externalId

---

## translated-v2

**Type**: array

---

## nullable-country

**Type**: string

---

## Language

**Type**: string

---

## user-visibility

**Type**: string

---

## SettlementReportBreakdown

**Type**: string

---

## ReimbursementPayoutMode

**Type**: string

---

## Reimbursement-common

**Type**: object

**Properties**: enabled, payoutMode

---

## ReimbursementCycle

**Type**: string

---

## Reimbursement-read

**Type**: object

---

## BankDetailsCommonFields

**Type**: object

**Properties**: bankAccountNumber, bankAccountType, bankBic, bankCode, bankIban

---

## BankDetailsDeprecatedTranslatableReadFields

**Type**: object

**Properties**: bankAccountHolder, bankAddress, bankName

---

## PartnerBankDetailsRead

**Type**: object

---

## NoteRead

**Type**: object

**Properties**: createdAt, createdByAdminId, details, id, pinned, summary, updatedAt, updatedByAdminId

**Required**: id, summary, pinned, createdAt, updatedAt

---

## Partner-read

**Type**: object

**Properties**: address, bankDetails, businessName, city, contactDetails, corporateBilling, country, customFields, externalId, id, invoiceNumberPrefix, lastUpdatedAt, monthlyPlatformFee, name, notes, notifications, operatorId, options, postcode, receiptsPrefix, receiptsStartingNumber, regNo, region, reimbursement, startingInvoiceNumber, state, tags, translatedAddress, translatedCity, translatedName, translatedRegion, vatNo

**Required**: id, operatorId, name, translatedName, translatedAddress, translatedCity

---

## TerminalTypeV1_1

**Type**: string

---

## CommonPropertiesMinimalV1_1

**Type**: object

**Properties**: id, integrationId, name, operatorId, terminalType

---

## CommonPropertiesBaseV1_1

**Type**: object

---

## PayterPropertiesForUpdateV1_1

**Type**: object

**Properties**: chargePointId, chargingZoneId, defaultLanguage, displayText, displayTextTimeout, externalId, id, integrationId, name, serialNumber, terminalType

---

## PreauthorizeAmount

**Type**: object

**Properties**: currencyId, preauthorizeAmount, valueAddedTaxId

---

## TransactionTimeout

**Type**: object

**Properties**: transactionTimeout

---

## PaymentTerminalTypePayter

**Type**: string

---

## PayterReadV1_1

**Type**: object

---

## RequiredCommonPropertiesV1_1

**Type**: object

**Required**: name, integrationId, terminalType, operatorId

---

## AdminToken

**Type**: string

---

## KioskModeEnabled

**Type**: boolean

---

## SimplifiedJourneyMode

**Type**: string

---

## ScreensaverPaymentMethod

**Type**: string

---

## InvoiceFieldItem

**Type**: object

**Properties**: field, label, required, type

**Required**: field, required, type, label

---

## InvoiceFields

**Type**: array

---

## ReportedTerminalMetadata

**Type**: object

**Properties**: currentBundleVersion, lastCertifiedAppVersion, terminalId, terminalModel

---

## TerminalAppThemeBranding

**Type**: object

**Properties**: darkThemeLogoUrl, darkThemePrimaryColor, darkThemeSecondaryColor, darkThemeTertiaryColor, lightThemeLogoUrl, lightThemePrimaryColor, lightThemeSecondaryColor, lightThemeTertiaryColor, themeMode

**Required**: darkThemePrimaryColor, darkThemeSecondaryColor, darkThemeTertiaryColor, lightThemePrimaryColor, lightThemeSecondaryColor, lightThemeTertiaryColor

---

## ValinaReadV1_1

**Type**: object

---

## CraneBaseV1_1

**Type**: object

**Required**: serialNumber

---

## CraneReadV1_1

**Type**: object

---

## GenericReadV1_1

**Type**: object

---

## NayaxTerminalId

**Type**: string

---

## NayaxBaseV1_1

**Type**: object

**Required**: terminalId

---

## NayaxReadV1_1

**Type**: object

---

## EmbeddedBaseV1_1

**Type**: object

---

## EmbeddedReadV1_1

**Type**: object

---

## PaxBaseV1_1

**Type**: object

**Required**: verificationCode, defaultLanguage, info

---

## PaxReadV1_1

**Type**: object

---

## WindcaveBaseV1_1

**Type**: object

---

## WindcaveReadV1_1

**Type**: object

---

## WebPortalBaseV1_1

**Type**: object

**Required**: name, integrationId, terminalType, operatorId

---

## WebPortalReadV1_1

**Type**: object

---

## AdyenCastlesBaseV1_1

**Type**: object

**Required**: phone, defaultLanguage, info, merchantAccount, adyenApiKey

---

## AdyenCastlesResponsePropertiesV1_1

**Type**: object

---

## AdyenCastlesReadV1_1

**Type**: object

---

## allOf-1

**Type**: object

**Properties**: adminToken, bundle, countryCode, currencyCode, defaultLanguage, externalId, info, invoiceDetailsMandatory, invoiceFields, kioskModeEnabled, networkStatus, networkStatusMonitoringEnabled, phone, presentCardOnStopSession, serialNumber, showTermsAndConditions, supportedLanguages, termVersionId

---

## PrintecCastlesReadV1_1

**Type**: object

---

## CardlinkCastlesBaseV1_1-allOf-1

**Type**: object

**Properties**: adminToken, bundle, currencyCode, defaultLanguage, externalId, info, invoiceDetailsMandatory, invoiceFields, isOnline, kioskModeEnabled, networkStatus, networkStatusMonitoringEnabled, phone, presentCardOnStopSession, serialNumber, showTermsAndConditions, supportedLanguages, termVersionId

---

## CardlinkCastlesReadV1_1

**Type**: object

---

## PaymentTerminalActionReadV1_1

**Type**: object

---

## default-payment-option

**Type**: string

---

## Beneficiary

**Type**: object

**Properties**: userId

---

## Payer

**Type**: object

**Properties**: operatorId, partnerContractId, partnerId

---

## ReimbursementElectricityRateSource

**Type**: string

---

## ReimbursementTaxBasis

**Type**: string

---

## Credit

**Type**: object

**Properties**: reason, reimbursementRecordId

---

## ReimbursementRecord

**Type**: object

**Properties**: amount, authUserId, beneficiary, createdAt, credit, creditedByReimbursementRecordId, currency, effectiveUserId, electricityRateSource, energy, id, operatorId, payer, periodEndsOn, periodStartsOn, rate, reimbursementPolicyId, sessionId, taxBasis, taxPercentage, updatedAt

**Required**: id, operatorId, sessionId, energy, taxBasis, amount, periodStartsOn, periodEndsOn, createdAt, updatedAt

---

## RoamingEmspPartnerAssignment_write

**Type**: object

**Properties**: operatorId, partnerId

**Required**: partnerId

---

## read

**Type**: object

**Properties**: lastUpdatedAt, operatorId, partnerId

**Required**: operatorId, partnerId, lastUpdatedAt

---

## Price

**Type**: object

**Properties**: excl_vat, incl_vat

---

## PriceComponent

**Type**: object

**Properties**: price, step_size, type, vat

**Required**: type, price, step_size

---

## TariffRestrictions

**Type**: object

**Properties**: day_of_week, end_date, end_time, max_current, max_duration, max_kwh, max_power, min_current, min_duration, min_kwh, min_power, reservation, start_date, start_time

---

## TariffElement

**Type**: object

**Properties**: price_components, restrictions

**Required**: price_components

---

## EnergyMix

**Type**: object

**Properties**: energy_product_name, energy_sources, environ_impact, is_green_energy, supplier_name

---

## Pricing

**Type**: object

**Properties**: country_code, currency, elements, end_date_time, energy_mix, id, last_updated, max_price, min_price, party_id, start_date_time, tariff_alt_text, tariff_alt_url, type

**Required**: id, currency, elements, last_updated

---

## ChargingSessionStatus

**Type**: string

---

## session-unsuccess-reason

**Type**: string

---

## CurrentType

**Type**: string

---

## CorporateBillingPolicyChargerTypeCoverageType

**Type**: string

---

## CorporateBillingRestrictionCause

**Type**: string

---

## CorporateBillingTariffComponent

**Type**: string

---

## CorporateBillingBreakdown

**Type**: object

**Properties**: componentType, corporateAmount, driverAmount

**Required**: componentType, corporateAmount, driverAmount

---

## CorporateBilling

**Type**: object

**Properties**: blendedCostPerKwh, breakdown, chargerType, chargerTypeCoverageType, corporateAmount, driverAmount, isOverallCostCapApplied, policySnapshotId, restrictionCause

**Required**: policySnapshotId

---

## DiscountType

**Type**: string

---

## Discount

**Type**: object

**Properties**: amount, type

**Required**: type, amount

---

## Authorization

**Type**: object

**Properties**: createdAt, createdAtLocal, id, lastUpdatedAt, method, operatorId, rejectionReason, rfidTagUid, roaming, source, status, userId

**Required**: id, method, source, createdAt, status, rejectionReason, userId, rfidTagUid, lastUpdatedAt

---

## PricingDetails

**Type**: object

**Properties**: chargingType, day, dayPeriod, endHour, initialDurationPrice, initialEnergyPrice, markup, price, pricingMethod, startHour

---

## PriceBreakdown

**Type**: object

**Properties**: currency, price, pricePerUnit, quantity, taxPercentage, type, unit

**Required**: type, currency, price, quantity, pricePerUnit, unit

---

## ChargingPeriodPriceBreakdown

**Type**: object

---

## ChargingPeriod

**Type**: object

**Properties**: amount, chargingState, energy, energyPrecise, graceTimeEndAt, id, priceBreakdown, pricingDetails, startedAt, state, stoppedAt, totalAmount

**Required**: id, energy, startedAt, state

---

## SessionPriceBreakdown

**Type**: object

---

## externalAppDataField

**Type**: object

---

## ClockAlignedEnergyConsumption

**Type**: object

**Properties**: end, energyConsumed, energyConsumption, start, totalCost

**Required**: start, end, energyConsumed, energyConsumption

---

## Session

**Type**: object

**Properties**: amount, authorization, authorizationId, billingCompletedAt, billingStatus, bookingId, chargePointId, chargePointOperatorRoamingId, chargingPeriods, clockAlignedEnergyConsumption, connectorId, corporateBilling, currency, discounts, electricityCost, energy, energyConsumption, estimatedSavings, evseId, evsePhysicalReference, extendedBySessionId, extendingSessionId, externalAppData, externalSessionId, id, idTag, idTagLabel, idTagType, incrementalPreAuthorizationEnabled, lastUpdatedAt, nonBillableEnergy, operatorId, originalSessionId, paymentMethodId, paymentStatus, paymentStatusUpdatedAt, paymentType, power, powerKw, preAuthorizedAmount, priceBreakdown, randomisedDelay, reason, receiptId, reimbursementEligibility, roaming, socPercent, startedAt, startedOffline, status, stoppedAt, tariffSnapshotId, tax, terminalId, totalAmount, userId, vehicleId

**Required**: id, operatorId, status, userId, authorizationId, energy, energyConsumption, chargePointId, evseId, startedAt, billingStatus, incrementalPreAuthorizationEnabled

---

## SessionWithCustomFields

**Type**: object

---

## translated

**Type**: object

---

## CreatePreAuthorizationRequestWorldline

**Type**: object

**Properties**: locale, paymentProductFilters, paymentProductId, processor, returnUrl

**Required**: processor, returnUrl

---

## CreatePreAuthorizationRequestStripe

**Type**: object

**Properties**: processor

**Required**: processor

---

## CreatePreAuthorizationRequestAdyen

**Type**: object

**Properties**: locale, processor, returnUrl

**Required**: processor, returnUrl

---

## CreatePreAuthorizationRequest

**Type**: object

---

## CreatePreAuthorizationResponseWorldline

**Type**: object

**Properties**: processor, redirectUrl, reference

**Required**: processor, redirectUrl, reference

---

## CreatePreAuthorizationResponseStripe

**Type**: object

**Properties**: clientSecret, paymentIntentId, processor

**Required**: processor, clientSecret, paymentIntentId

---

## CreatePreAuthorizationResponseAdyen

**Type**: object

**Properties**: processor, redirectUrl, reference

**Required**: processor, redirectUrl, reference

---

## CreatePreAuthorizationResponse

**Type**: object

---

## recipientCode

**Type**: string

---

## recipientCertifiedEmail

**Type**: string

---

## UserEligibleCouponEnergy

**Type**: object

**Properties**: couponCount, totalRemainingWh

**Required**: totalRemainingWh, couponCount

---

## CommunicationLogDirection

**Type**: string

---

## CommunicationLogFilter

**Type**: object

**Properties**: chargePointId, command, createdAfter, createdBefore, direction, evseId, locationId, partnerId, sessionId

---

## CommunicationLogCommand

**Type**: string

---

## CommunicationLog

**Type**: object

**Properties**: chargePointId, command, commandParameters, communicationError, createdAt, direction, evseId, id, locationId, responseBody, sessionId

**Required**: id, createdAt, chargePointId, direction, command, commandParameters

---

## links

**Type**: object

**Properties**: first, last, next, prev

---

## meta

**Type**: object

**Properties**: next_cursor, path, per_page, prev_cursor

---

## OcpiDirection

**Type**: string

---

## OcpiModule

**Type**: string

---

## HttpMethod

**Type**: string

---

## OcpiLogFilter

**Type**: object

**Properties**: createdAfter, createdBefore, direction, evseId, locationId, method, module, roamingConnectionId, sessionId

---

## OcpiStatus

**Type**: string

---

## OcpiLogError

**Type**: string

---

## OcpiLogEntry

**Type**: object

**Properties**: createdAt, direction, errorType, evseId, httpStatusCode, id, locationId, method, module, ocpiStatus, requestBody, requestUrl, responseBody, roamingConnectionId, sessionId

**Required**: id, createdAt, roamingConnectionId, direction, module, method, requestUrl, ocpiStatus

---

## Notification

**Type**: object

**Properties**: callbackUrl, includeTimestampInSignature, notifications, webhookId

**Required**: webhookId, notifications, callbackUrl

---

## pagination-links

**Type**: object

**Properties**: first, last, next, prev

**Required**: first, last

---

## pagination-meta

**Type**: object

**Properties**: current_page, from, last_page, links, path, per_page, to, total

---

## BootNotification

**Type**: object

**Properties**: charge_box_serial_number, charge_point_serial_number, firmware_version, iccid, imsi, meter_serial_number, meter_type, model, reason, vendor

---

## ChargingProfile-read

**Type**: object

**Properties**: charging_complete_at, charging_profile_kind, charging_rate_unit, duration, id, min_charging_rate, purpose, recurrency_kind, schedule_periods, schedule_start, stack_level, valid_from, valid_to

---

## Connector-read

**Type**: object

**Properties**: id

---

## EVSE-read

**Type**: object

**Properties**: chargingProfile, connectors, externalId, id, roaming

**Required**: id

---

## ConnectorTypeV1

**Type**: string

---

## Connector-write

**Type**: object

**Properties**: format, status, type

---

## EVSE-write

**Type**: object

**Properties**: allowsReservation, connectors, currentType, maxAmperage, maxPower, maxVoltage, midMeterCertificationEndYear, networkId, physicalReference, status, tariffGroupId

**Required**: networkId

---

## EvseHardwareStatus

**Type**: string

---

## EVSE-status

**Type**: object

**Properties**: hardwareStatus

---

## Connector

**Type**: object

---

## EVSE

**Type**: object

---

## ChargePointTags

**Type**: array

---

## write-2

**Type**: object

**Properties**: accessType, autoFaultRecovery, autoRecoveryEnabled, capabilities, desiredSecurityProfile, locationId, managedByOperator, monitoringEnabled, name, networkId, networkIp, networkPassword, networkPort, networkProtocol, ownerPartnerContractId, ownerPartnerId, partnerAccessType, partnerCorporateBillingAsDefault, pin, plugAndCharge, status, tags, uptimeTrackingEnabled

---

## network-status

**Type**: string

---

## ChargePointHardwareStatus

**Type**: string

---

## status

**Type**: object

**Properties**: evses, hardwareStatus, lastUpdatedAt, networkStatus

**Required**: networkStatus

---

## ChargePoint

**Type**: object

---

## ChargePointSyncConfigurationStatus

**Type**: string

---

## ChargePointConfiguration

**Type**: object

**Properties**: key, lastUpdatedAt, readonly, required, timestamp, value

---

## CircuitConsumption

**Type**: object

**Properties**: consumption, lastUpdatedAt, phase

**Required**: phase

---

## FirmwareStatusNotificationBase

**Type**: object

**Properties**: chargePointId, externalId, firmwareUpdateExecutionId, lastUpdatedAt, notification

**Required**: notification, chargePointId, protocol, firmwareStatus, lastUpdatedAt

---

## FirmwareStatusNotificationOCPP15

**Type**: object

---

## FirmwareStatusNotificationOCPP16

**Type**: object

---

## FirmwareStatusNotificationOCPP201

**Type**: object

---

## ImageCategory

**Type**: string

---

## image

**Type**: object

**Properties**: category, mimeType, original, thumbnail

**Required**: original, mimeType

---

## WorkingHoursInterval

**Type**: object

**Properties**: end, start

**Required**: start, end

---

## WorkingHours

**Type**: array

---

## Location

**Type**: object

**Properties**: additional_description, address, city, country, description, detailed_description, external_id, geoposition, id, images, lastUpdatedAt, location_image, name, post_code, public_charge_points, public_charge_points_ids, region, status, timezone, working_hours

---

## MeterValue

**Type**: object

**Properties**: location, measurand, timestamp, unit, value

---

## user-rfid-sessions

**Type**: object

**Properties**: sessionsAllowed

---

## corporate-billing-limit

**Type**: number

---

## PartnerInvite_read

**Type**: object

**Properties**: acceptUrl, acceptedAt, createdAt, email, id, language, lastUpdatedAt, options, partnerId, sendViaEmail, status, userId

**Required**: id, partnerId, status, createdAt

---

## InvoiceDetailsAmpecoIntegrationResponseSchema

**Type**: object

**Properties**: address, city, companyName, companyRegNo, companyTaxAdministrationOfficeName, companyTaxId, country, individualName, individualPersonalId, individualTaxId, invoiceType, lastUpdatedAt, originalRequestValue, postCode, region, requireInvoice, requireInvoiceEnforcedBy, requireInvoiceLastUpdatedAt, state

**Required**: requireInvoice, invoiceType

---

## InvoiceDetailsCardcomIntegrationResponseSchema

**Type**: object

**Properties**: clientType, company, individual, invoiceRequired, lastUpdatedAt

**Required**: invoiceRequired, clientType, individual, company

---

## InvoiceDetailsSoftOneIntegrationResponseSchema

**Type**: object

**Properties**: address, city, country, email, firstName, lastName, lastUpdatedAt, phone, postcode

---

## InvoiceDetailsEcpayIntegrationResponseSchema

**Type**: object

**Properties**: address, carrierType, citizenId, city, companyId, country, email, invoiceType, lastUpdatedAt, loveCode, mobileBarCode, name, phone, postcode

---

## ItalianSdiBuyerFieldsRead

**Type**: object

**Properties**: recipientCertifiedEmail, recipientCode

---

## InvoiceDetailsAvalaraIntegrationResponseSchema

**Type**: object

**Required**: requireInvoice, invoiceType

---

## User-read

**Type**: object

**Properties**: address, balance, bankDetails, city, companyName, country, createdAt, createdBy, email, emailVerified, externalAppData, externalId, firstName, id, invoiceDetails, lastActivityAt, lastActivitySource, lastName, lastUpdatedAt, locale, middleName, operatorId, options, partnerInvites, password, personalId, phone, postCode, receiveNewsAndPromotions, requirePasswordReset, skipPreAuthorization, skipUnpaidSessionCheck, state, status, subscriptionId, userGroupIds, vehicleNo

**Required**: id, operatorId

---

## User-id

**Type**: object

**Properties**: id

---

## SubOperatorId

**Type**: object

**Properties**: id

---

## pricePeriod

**Type**: object

**Properties**: endsAt, price, startsAt

**Required**: startsAt, endsAt, price

---

## pricing

**Type**: object

**Properties**: averagePowerIdleThreshold, averagePowerLevels, chargePointElectricityRate, connectionFee, connectionFeeMinimumSessionDuration, connectionFeeMinimumSessionEnergy, dayIdleFeePerMinute, dayPricePerKwh, dayPricePerPeriod, daysWhenApplied, durationFeeCapMinutes, durationFeeFrom, durationFeeGracePeriod, durationFeeLimit, durationFeeTo, fallbackElectricityRateId, flexibleMarkUpAsFixedPerKwh, idleFeeCapMinutes, idleFeeGracePeriodMinutes, idleFeeGracePeriodMode, idleFeeLimit, idleFeePerMinute, idleFeePeriodEnd, idleFeePeriodStart, idlePricingPeriodInMinutes, incrementalPreAuthorizationAmount, lockDurationPriceOnSessionStart, lockEnergyPriceOnSessionStart, lockIdlePriceOnSessionStart, lockPriceOnSessionStart, markupFixedFeePerKwh, markupPercentagePerKwh, minPrice, multiIdleFee, multiPricePerDuration, multiPricePerKwh, nightIdleFeePerMinute, nightPricePerKwh, nightPricePerPeriod, optimisedLabel, peakPowerLevels, preAuthorizeAmount, priceForEnergyWhenOptimized, pricePerKwh, pricePerPeriod, pricePerSession, pricePeriodInMinutes, pricePeriods, regularUsePeriod, stateOfChargeIdleThreshold, subsidy, subsidyIntegrationId, taxID, thresholdPriceForEnergy, timePeriods

---

## discountTariffSettings

**Type**: object

**Properties**: discountElements, discountMode, discountPercentage, discountReferenceType, discountType, discountValue, referencedTariffId

---

## stopSessionCommon

**Type**: object

**Properties**: stopWhenEnergyExceedsKwh, stopWhenSocExceedsPercent, timeLimitMinutes

---

## stopSession

**Type**: object

---

## startSessionRestrictions

**Type**: object

**Properties**: minimumBalance

---

## restrictions

**Type**: object

**Properties**: adHocIncrementalPreAuthorizationAmount, adHocPreAuthorizeAmount, adHocStopWhenPreAuthorizedAmountFallsBelow, applyToAdHocOperatorIds, applyToAdHocUsers, applyToAuthorizationMethods, applyToHomeChargingOwner, applyToHomeChargingSharedUsers, applyToUserGroupIds, applyToUsersOfAllRoamingEmsps, applyToUsersOfChargePointOwner, applyToUsersOfChargePointPartner, applyToUsersOfPartners, applyToUsersWithGroups, applyToUsersWithSubscriptions, endDate, startDate

---

## partner

**Type**: object

**Properties**: id

---

## display

**Type**: object

**Properties**: defaultPriceInformation, defaultPriceInformationOffline, plainTextModeEnabled, priceInformation, priceInformationLocalized, totalCostInformation, totalCostInformationLocalized

---

## TariffCommon_read

**Type**: object

**Properties**: additionalInformation, currency, dayTariffStart, description, discountTariffSettings, display, externalId, id, integrationId, lastUpdatedAt, learnMoreUrl, name, nightTariffStart, operatorId, partner, pricing, restrictions, startSessionRestrictions, stopSession, type

**Required**: id, operatorId, name, type

---

## TariffGroup_read

**Type**: object

**Properties**: display, id, lastUpdatedAt, name, offlineTariffId, operatorId, partnerId, tariffIds

**Required**: id, operatorId, name

---

## CorporateBillingPolicyCoverageType

**Type**: string

---

## CorporateBillingLimitPeriod

**Type**: string

---

## CorporateBillingPartnerRestrictionMode

**Type**: string

---

## CorporateBillingRestrictionMode

**Type**: string

---

## CorporateBillingRoamingRestrictionMode

**Type**: string

---

## Restrictions

**Type**: object

**Properties**: country, location, locationTag, partner, roaming

**Required**: partner, country, location, locationTag, roaming

---

## TariffThreshold

**Type**: object

**Properties**: enabled, maxAmount, maxQuantity, maxUnitPrice

**Required**: enabled

---

## TariffThresholds

**Type**: object

**Properties**: chargingTime, connection, energy, idleTime

---

## OverallCostCap

**Type**: object

**Properties**: enabled, maxCostPerKwh

**Required**: enabled

---

## ChargerType

**Type**: object

**Properties**: coverageType, overallCostCap, tariffThresholds

**Required**: coverageType

---

## ChargerTypeConfig

**Type**: object

**Properties**: ac, dc

**Required**: ac, dc

---

## PartnerInviteCorporateBillingPolicy-read

**Type**: object

**Properties**: chargerTypeConfig, coverageType, createdAt, externalId, id, individualSpendingLimit, isActive, latestSnapshotId, name, overallCostCap, partnerId, period, restrictions, tariffThresholds, updatedAt

**Required**: id, partnerId, name, isActive, coverageType, period, createdAt, updatedAt

---

## ChargingProfile

**Type**: object

**Properties**: chargingCompleteAt, chargingProfileKind, chargingRateUnit, duration, id, minChargingRate, purpose, recurrencyKind, schedulePeriods, scheduleStart, stackLevel, validFrom, validTo

---

## InstallerJob-read

**Type**: object

**Properties**: createdAt, description, id, installationAndMaintenanceCompanyId, installerAdminId, lastUpdatedAt, locationId, outcomeDetails, pin, status

**Required**: id, status, installationAndMaintenanceCompanyId, description, createdAt, lastUpdatedAt

---

## ChargePoint-2

**Type**: object

**Properties**: id

---

## InstallerJob-chargePoints

**Type**: array

---

## IssueStatus

**Type**: string

---

## IssueWorkflowState

**Type**: string

---

## IssueCategory

**Type**: string

---

## IssueSeverity

**Type**: string

---

## IssuePriority

**Type**: string

---

## IssueResourceType

**Type**: string

---

## ResourceReference

**Type**: object

**Properties**: id, resourceType

**Required**: resourceType, id

---

## Issue

**Type**: object

**Properties**: assigneeAdminId, category, createdAt, description, externalId, id, keyResource, operatorId, partnerId, priority, resolutionDetails, severity, status, title, updatedAt, workflowState

**Required**: id, operatorId, title, status, workflowState, category, severity, priority, createdAt, updatedAt

---

## IssueDetail

**Type**: object

---

## IssueChangedNotification

**Type**: object

**Properties**: action, issue, issueId, notification, status, updatedAt, workflowState

**Required**: notification, issueId, action, updatedAt

---

## NotificationV2

**Type**: object

**Properties**: id, includeTimestampInSignature, kafka, notifications, skipRoamingInfrastructure, suppressSelfNotifications, via, webhook

**Required**: id, notifications, via

---

## TokenRevocationRequest

**Type**: object

**Properties**: client_id, client_secret, token

**Required**: token

---

## OAuthErrorCode

**Type**: string

---

## ErrorResponse

**Type**: object

**Properties**: error, error_description

**Required**: error

---

## OAuthGrantType

**Type**: string

---

## TokenRequest

**Type**: object

**Properties**: client_id, client_secret, grant_type

**Required**: grant_type

---

## TokenResponse

**Type**: object

**Properties**: access_token, expires_in, token_type

**Required**: access_token, token_type, expires_in

---

## operatorId

**Type**: object

---

## AdminInclude

**Type**: array

---

## Admin-read

**Type**: object

**Properties**: email, externalSsoId, id, installationAndMaintenanceCompanyId, name, operatorId, partnerId, permissions, roleId, subOperatorId

**Required**: id, operatorId, email, name, roleId

---

## Authorization-2

**Type**: object

**Properties**: createdAt, createdAtLocal, id, lastUpdatedAt, method, operatorId, rejectionReason, rfidTagUid, roaming, source, status, userId

**Required**: id, method, source, createdAt, status, rejectionReason, userId, rfidTagUid, lastUpdatedAt

---

## AuthorizationFilter

**Type**: object

**Properties**: createdAfter, createdBefore, lastUpdatedAfter, lastUpdatedBefore, method, operatorId, partnerId, status

---

## AuthorizationV2

**Type**: object

**Properties**: chargePointId, createdAt, evseId, id, idTagUid, lastUpdatedAt, method, rejectionReason, roaming, sessionIds, source, status, userId

**Required**: id, method, source, createdAt, status, rejectionReason, chargePointId, sessionIds

---

## meta-basic

**Type**: object

**Properties**: current_page, from, last_page, links, path, per_page, to, total

---

## meta-cursor

**Type**: object

**Properties**: next_cursor, path, per_page, prev_cursor

---

## AuthorizationV2_1

**Type**: object

**Properties**: chargePointId, createdAt, evseId, id, idTagUid, lastUpdatedAt, method, operatorId, rejectionReason, roaming, sessionIds, source, status, userId

**Required**: id, method, source, createdAt, status, userId, idTagUid, sessionIds, lastUpdatedAt

---

## BaseProperties

**Type**: object

**Properties**: createdAt, id, lastUpdatedAt, rejectionReason, status, type

---

## ConnectorTypeV2

**Type**: string

---

## VehicleType

**Type**: string

---

## CreateBookingRequestBase

**Type**: object

---

## AuthorizedToken

**Type**: object

**Properties**: contractId, emspCountryCode, emspPartyId, id, type, uid

**Required**: id, uid, type, emspCountryCode, emspPartyId

---

## CreateBookingRequestResponse

**Type**: object

---

## UpdateBookingRequestBase

**Type**: object

---

## UpdateBookingRequestResponse

**Type**: object

---

## CancelBookingRequest

**Type**: object

---

## CancelBookingRequestResponse

**Type**: object

---

## BookingRequestResponse

**Type**: object

---

## CreateBookingRequest

**Type**: object

---

## UpdateBookingRequest

**Type**: object

---

## BookingRequest

**Type**: object

---

## BookingList

**Type**: object

**Properties**: accessMethods, authorizedTokens, createdAt, endAt, id, lastUpdatedAt, locationId, sessionId, startAt, status, userId

**Required**: id, locationId, startAt, endAt, status, createdAt, lastUpdatedAt

---

## BookingDetail

**Type**: object

---

## FiltersV2

**Type**: object

**Properties**: credit, deliveryResponse, endDateTimeFrom, endDateTimeTo, externalId, isLocal, operatorId, platformId, receivedAfter, receivedBefore, roamingId, sentAfter, sentBefore, sessionId, startDateTimeFrom, startDateTimeTo

---

## OcpiData

**Type**: object

**Properties**: authMethod, authorizationReference, cdrLocation, cdrToken, chargingPeriods, currency, invoiceReferenceId, signedData, totalCost, totalEnergy, totalEnergyCost, totalFixedCost, totalParkingCost, totalParkingTime, totalTime, totalTimeCost, version

**Required**: version

---

## PlugAndChargeIdentification

**Type**: object

**Properties**: evcoId

**Required**: evcoId

---

## LegacyHashedData

**Type**: object

**Properties**: function, salt, value

**Required**: function

---

## HashedPin

**Type**: object

**Properties**: function, legacyHashedData, pin, value

**Required**: value, function

---

## QRCodeIdentification

**Type**: object

**Properties**: evcoID, hashedPin, pin

**Required**: evcoID

---

## RFIDIdentification

**Type**: object

**Properties**: evcoId, expiryDate, printedNumber, rfid, uid

**Required**: uid, rfid

---

## RFIDMifareFamilyIdentification

**Type**: object

**Properties**: uid

**Required**: uid

---

## RemoteIdentification

**Type**: object

**Properties**: evcoId

**Required**: evcoId

---

## SignedMeteringValues

**Type**: object

**Properties**: meteringStatus, signedMeteringValue

---

## CalibrationLawVerificationInfo

**Type**: object

**Properties**: calibrationLawCertificateId, meteringSignatureEncodingFormat, meteringSignatureUrl, publicKey, signedMeteringValuesVerificationInstruction

---

## OicpData

**Type**: object

**Properties**: calibrationLawVerificationInfo, chargingEnd, chargingStart, consumedEnergy, cpoPartnerSessionId, empPartnerSessionId, evseId, hubOperatorId, hubProviderId, identification, meterValueEnd, meterValueInBetween, meterValueStart, meteringSignature, operatorId, partnerProductId, sessionEnd, sessionId, sessionStart, signedMeteringValues, version

**Required**: sessionId, version, evseId, identification, sessionStart, sessionEnd

---

## CdrV2

**Type**: object

**Properties**: credit, creditReferenceId, deliveryResponse, endTime, externalAppData, externalId, id, isLocal, lastUpdatedAt, ocpiData, oicpData, operatorId, platformId, protocolType, receivedAt, roamingId, roamingSessionId, sentAt, sessionId, startTime

**Required**: id, operatorId, platformId, protocolType, startTime, isLocal, endTime, receivedAt

---

## system-status

**Type**: string

---

## DowntimePeriodBaseResponseSchema

**Type**: object

**Properties**: entryMode, id, locationId, noticeId, statuses, type

---

## StatusLogResponse

**Type**: object

**Properties**: errorCode, errorCodeCustomerAction, errorCodeDescription, id, info, status, timestamp, vendorErrorCode, vendorId

**Required**: id, timestamp, status

---

## ChargePointDowntimePeriodResponseSchema_read

**Type**: object

**Properties**: chargePointId, endedAt, startedAt, statusLog

**Required**: id, chargePointId, locationId, entryMode, type, statuses, startedAt, endedAt

---

## DowntimePeriodRequestBodySchema_create

**Type**: object

**Properties**: endedAt, noticeId, startedAt

---

## update

**Type**: object

**Properties**: endedAt, noticeId, startedAt

---

## ModelFilters

**Type**: object

**Properties**: vendorId

---

## ModelRead

**Type**: object

**Properties**: defaultPhoto, id, installerManual, name, userManual, vendorId

**Required**: id, name, vendorId, defaultPhoto, userManual

---

## ModelCreate

**Type**: object

**Properties**: installerManual, name, userManual, vendorId

**Required**: name, vendorId

---

## ModelUpdate

**Type**: object

**Properties**: installerManual, name, userManual, vendorId

---

## Vendor

**Type**: object

**Properties**: id, name

**Required**: id, name

---

## VendorRead

**Type**: object

**Properties**: name

---

## ChargePointFilter

**Type**: object

**Properties**: accessType, chargePointBootNotificationSerialNumber, chargePointNetworkId, desiredSecurityProfileStatus, evseExternalId, evseId, evsePhysicalReference, externalId, locationId, managedByOperator, name, partnerId, physicalReference, roaming, subOperatorId, tag, userId

---

## EVSE-write-with-template

**Type**: object

---

## write-with-template

**Type**: object

---

## write-with-evses

**Type**: object

---

## Filter

**Type**: object

**Properties**: bootNotificationSerialNumber, chargingZoneId, circuitId, countryStationId, createdAfter, createdBefore, desiredSecurityProfileStatus, evsePhysicalReference, externalId, lastNetworkStatusUpdateAfter, lastNetworkStatusUpdateBefore, lastUpdatedAfter, lastUpdatedBefore, locationId, managedByOperator, modelId, name, networkId, networkStatus, operatorId, partnerContractId, partnerId, roaming, roamingOperatorIds, sharingCode, subOperatorId, tag, type, userId, utilityId, vendorId

---

## Include

**Type**: array

---

## UserInfo

**Type**: object

**Properties**: automaticFirmwareUpdatesEnabled, id

---

## noticeId

**Type**: integer

---

## renewableEnergy

**Type**: boolean

---

## publicSharingBase

**Type**: object

**Properties**: enabled, reimbursementPolicyId, roamingPublishEnabled

---

## chargePointV2ReadBase

**Type**: object

**Properties**: autoRecoveryEnabled, autoStartWithoutAuthorization, capabilities, chargingProfile, chargingZoneId, createdAt, disableAutoStartEmulation, displayTariffAndCosts, electricityRateId, enableAutoFaultRecovery, enabledRandomisedDelay, externalId, firstContactAt, hardwareStatus, id, integratedAt, lastBootNotification, lastHardwareStatusUpdateAt, lastNetworkStatusUpdateAt, lastUpdatedAt, locationId, managedByOperator, manufacturedAt, modelId, monitoringEnabled, name, network, networkStatus, networkType, notes, notice, noticeId, ocppConnectedChargePointId, operatorId, partner, pin, publicSharing, roamingOperatorId, security, sharingBillingRule, sharingCode, status, subscription, tags, tariffDisplayMessages, type, uptimeTrackingActivatedAt, uptimeTrackingEnabled, user, usesRenewableEnergy, utilityId, vendorErrorCode

---

## communicationModeReadOnly

**Type**: string

---

## chargePointV2Read

**Type**: object

**Required**: id, operatorId, name, type, status, network, security, networkStatus, autoStartWithoutAuthorization, disableAutoStartEmulation, monitoringEnabled, autoRecoveryEnabled, enableAutoFaultRecovery, communicationMode, lastUpdatedAt

---

## chargePointV2WriteBase

**Type**: object

**Properties**: autoRecoveryEnabled, autoStartWithoutAuthorization, capabilities, chargingZoneId, disableAutoStartEmulation, electricityRateId, enableAutoFaultRecovery, enabledRandomisedDelay, externalId, id, integratedAt, locationId, managedByOperator, manufacturedAt, modelId, monitoringEnabled, name, network, networkType, noticeId, ocppConnectedChargePointId, operatorId, partner, pin, security, sharingCode, status, subscription, tags, type, uptimeTrackingEnabled, user, usesRenewableEnergy, utilityId

---

## communicationModeWriteOnly

**Type**: string

---

## chargePointV2Write

**Type**: object

**Required**: name, type, status

---

## chargePointV2Patch

**Type**: object

**Properties**: autoRecoveryEnabled, autoStartWithoutAuthorization, calibrationLawDataAvailability, capabilities, chargingZoneId, countryStationId, disableAutoStartEmulation, electricityCostReimbursementIntegrationId, electricityRateId, enableAutoFaultRecovery, enabledRandomisedDelay, externalId, id, installationAndMaintenanceCompanyId, integratedAt, locationId, managedByOperator, manufacturedAt, modelId, monitoringEnabled, name, network, networkType, noticeId, partner, pin, publicSharing, security, status, subscription, tags, tariffDisplayMessages, type, uptimeTrackingEnabled, user, usesRenewableEnergy, utilityId

---

## availableModeScheduled

**Type**: object

**Properties**: defaults, integrationId, name, type

---

## availableModeAgileOctopus

**Type**: object

**Properties**: defaults, integrationId, name, type

---

## availableModeOctopusGo

**Type**: object

**Properties**: defaults, integrationId, name, type

---

## availableModeNordpool

**Type**: object

**Properties**: defaults, integrationId, locations, name, type

---

## response

**Type**: object

---

## ConfigurationFilter

**Type**: object

**Properties**: componentInstance, componentName, connectorId, evseId, instance, name

---

## ChargePointConfigurationKeyV2

**Type**: object

**Properties**: componentInstance, componentName, connectorId, evseId, instance, maxLimit, name, value

**Required**: name, value

---

## ChargePointConfigurationV2

**Type**: object

**Properties**: key, lastUpdatedAt, persistentConfigurationTemplateId, readonly, required, timestamp

---

## IncludeEvse

**Type**: array

---

## MaxVoltage

**Type**: string

---

## PhaseRotation

**Type**: string

---

## ConnectedPhase

**Type**: string

---

## powerOptionRead

**Type**: object

**Properties**: connectedPhase, maxAmperage, maxOutputVoltage, maxPower, maxVoltage, phaseRotation, phases

---

## EvseCapabilityOverrideValue

**Type**: string

---

## EvseCapabilityOverrides

**Type**: object

**Properties**: chargingPreferencesCapable, chargingProfileCapable, chipCardSupport, contactlessCardSupport, creditCardPayable, debitCardPayable, pedTerminal, remoteStartStop, reservable, rfidReader, startSessionConnectorRequired, tokenGroupCapable, unlockCapable

---

## connectorV2Read

**Type**: object

**Properties**: externalId, format, id, networkId, ocpiMaxAmperage, ocpiMaxElectricPower, ocpiMaxVoltage, status, type

**Required**: id, networkId, type

---

## evseV2Read

**Type**: object

**Properties**: allowsReservation, bookingEnabled, capabilityOverrides, chargingProfile, connectors, createdAt, currentType, emi3Id, externalAppData, externalId, hardwareStatus, id, label, lastHardwareStatusUpdateAt, lastUpdatedAt, midMeterCertificationEndYear, monitoringEnabled, networkId, operatorId, physicalReference, powerOptions, roaming, roamingOperatorId, status, tariffGroupId

**Required**: id, operatorId, physicalReference, currentType, networkId, status, hardwareStatus, roamingOperatorId, createdAt, lastUpdatedAt

---

## powerOptionWrite

**Type**: object

**Properties**: connectedPhase, maxAmperage, maxOutputVoltage, maxPower, maxVoltage, phaseRotation, phases

---

## EvseCapabilityOverridesWrite

**Type**: object

**Properties**: chargingPreferencesCapable, chargingProfileCapable, chipCardSupport, contactlessCardSupport, creditCardPayable, debitCardPayable, pedTerminal, remoteStartStop, reservable, rfidReader, startSessionConnectorRequired, tokenGroupCapable, unlockCapable

---

## evseV2Write

**Type**: object

**Properties**: allowsReservation, bookingEnabled, capabilityOverrides, currentType, externalId, label, midMeterCertificationEndYear, monitoringEnabled, networkId, physicalReference, powerOptions, status, tariffGroupId

---

## evseV2Create

**Type**: object

**Required**: physicalReference, currentType, networkId, status

---

## IncludeEvseDetails

**Type**: array

---

## EvsePosition

**Type**: string

---

## parkingSpaceEvseRelation

**Type**: object

**Properties**: evseId, isPrimary, parkingSpaceId, position

**Required**: parkingSpaceId, evseId, position, isPrimary

---

## evseV2ReadSingle

**Type**: object

---

## ConnectorFilterV2

**Type**: object

**Properties**: externalId

---

## connectorV2Write

**Type**: object

**Properties**: format, status, type

---

## connectorV2Create

**Type**: object

**Required**: type

---

## dateTimeFilter

**Type**: string

---

## HardwareStatusLogEntry

**Type**: object

**Properties**: errorCode, errorCodeCustomerAction, errorCodeDescription, info, status, timestamp, vendorErrorCode, vendorId

**Required**: status, timestamp, errorCode

---

## NetworkStatusLogEntry

**Type**: object

**Properties**: status, timestamp

**Required**: status, timestamp

---

## NoteFilter

**Type**: object

**Properties**: createdAfter, createdBefore, pinned, updatedAfter, updatedBefore

---

## NoteCreate

**Type**: object

**Properties**: details, pinned, summary

**Required**: summary

---

## NoteUpdate

**Type**: object

**Properties**: details, pinned, summary

---

## WeekDays

**Type**: array

---

## personalModeUserControlledSchedule

**Type**: object

**Properties**: enabled, preferences, type

**Required**: type, preferences

---

## personalModeSolar

**Type**: object

**Properties**: enabled, preferences, type

**Required**: type, preferences

---

## personalModeOctopusAgile

**Type**: object

**Properties**: enabled, integrationId, preferences, type

**Required**: type, preferences, integrationId

---

## personalModeOctopusGo

**Type**: object

**Properties**: enabled, integrationId, preferences, type

**Required**: type, preferences, integrationId

---

## personalModeNordPool

**Type**: object

**Properties**: enabled, integrationId, preferences, type

**Required**: type, preferences, integrationId

---

## personalChargerElectricityRate

**Type**: object

**Properties**: electricityRateId, enabled, preferences, type

**Required**: type, electricityRateId, preferences

---

## PersonalSmartChargingPreferences_read

**Type**: object

---

## personalModeDisabled

**Type**: object

**Properties**: enabled

**Required**: enabled

---

## write-response

**Type**: object

---

## sharesRead

**Type**: object

**Properties**: id, sharedAt

**Required**: id, sharedAt

---

## sharesCreate

**Type**: object

**Properties**: partnerIds

**Required**: partnerIds

---

## ChargePointShares_sharesRead

**Type**: object

**Properties**: id, sharedOn, userId

**Required**: id, userId, sharedOn

---

## ChargePointShares_sharesCreate

**Type**: object

**Properties**: userId

**Required**: userId

---

## sharesUpdate

**Type**: object

---

## defaultChargePointMaxCurrent

**Type**: number

---

## circuitId

**Type**: integer

---

## preconditioningTime

**Type**: integer

---

## minCurrent

**Type**: number

---

## enableKeepAwake

**Type**: boolean

---

## ElectricalConfiguration

**Type**: string

---

## phases

**Type**: string

---

## todBase

**Type**: object

**Properties**: circuitId, connectedPhase, defaultChargePointMaxCurrent, electricalConfiguration, enableKeepAwake, maxVoltage, minCurrent, mode, periods, phaseRotation, phases, preconditioningTime

**Required**: mode, defaultChargePointMaxCurrent, maxVoltage, phases, phaseRotation

---

## PowerManagementMode

**Type**: string

---

## DcPowerSharingPatch

**Type**: object

**Properties**: enabled, managementMode, moduleSizeKw, totalCabinetPowerKw

---

## tod

**Type**: object

---

## dynamicBase

**Type**: object

**Properties**: circuitId, connectedPhase, defaultChargePointMaxCurrent, electricalConfiguration, enableKeepAwake, maxVoltage, minCurrent, mode, phaseRotation, phases, preconditioningTime

**Required**: mode, defaultChargePointMaxCurrent, maxVoltage, phases, phaseRotation

---

## dynamic

**Type**: object

---

## userScheduleBase

**Type**: object

**Properties**: allowDynamicLoadManagement, circuitId, connectedPhase, defaultChargePointMaxCurrent, electricalConfiguration, enableKeepAwake, maxVoltage, minCurrent, mode, phaseRotation, phases, preconditioningTime

**Required**: mode, defaultChargePointMaxCurrent, minCurrent, enableKeepAwake, maxVoltage, phases, phaseRotation

---

## userSchedule

**Type**: object

---

## disabledBase

**Type**: object

**Properties**: mode, preconditioningTime

**Required**: mode

---

## disabled

**Type**: object

---

## request

**Type**: object

---

## DcPowerSharingRead

**Type**: object

**Properties**: enabled, managementMode, moduleSizeKw, totalCabinetPowerKw

**Required**: enabled

---

## todResponse

**Type**: object

---

## dynamicResponse

**Type**: object

---

## userScheduleResponse

**Type**: object

---

## disabledResponse

**Type**: object

---

## SmartCharging_response

**Type**: object

---

## Circuit-post

**Type**: object

**Properties**: chargePoints, id, lastUpdatedAt, maxCurrent, minChargePointCurrent, name, phases, setSessionLimitToZeroOnIdle

**Required**: id, name, phases, maxCurrent, chargePoints

---

## Circuit-update

**Type**: object

**Properties**: chargePoints, id, lastUpdatedAt, maxCurrent, minChargePointCurrent, name, phases, setSessionLimitToZeroOnIdle

---

## Include-2

**Type**: array

---

## Filter-2

**Type**: object

**Properties**: createdAfter, createdBefore, lastUpdatedAfter, lastUpdatedBefore, operatorId

---

## parentCircuitId

**Type**: integer

---

## phaseRotation

**Type**: string

---

## connectedPhase

**Type**: string

---

## dreevIntegrationFields

**Type**: object

**Properties**: startDate

---

## zaptecIntegrationFields

**Type**: object

**Properties**: installationId

**Required**: installationId

---

## readBase

**Type**: object

**Properties**: applyFcfsLoadManagementStrategy, applyMinimumCurrentOnSessionStart, connectedPhase, electricalConfiguration, electricityMeterId, id, loadBalancingIntegration, maxCurrent, maxVoltage, minChargePointCurrent, name, offlineReservedCurrent, operatorId, parentCircuitId, phaseRotation, phases, setSessionLimitToZeroOnIdle

---

## ChargePointPriorities

**Type**: object

**Properties**: evses, id, priority

---

## UserPriority_base

**Type**: object

**Properties**: id, priority, targetId, type

---

## SoCPriority_read

**Type**: object

**Properties**: highSoCPriority, lowSoCPriority, lowerThresholdPercent, upperThresholdPercent

---

## UnmanagedLoad

**Type**: object

**Properties**: consumption, lastUpdatedAt, phase

**Required**: phase

---

## CircuitV2_get

**Type**: object

**Required**: id, operatorId

---

## writeBase

**Type**: object

**Properties**: applyFcfsLoadManagementStrategy, applyMinimumCurrentOnSessionStart, connectedPhase, electricalConfiguration, electricityMeterId, id, loadBalancingIntegration, maxCurrent, maxVoltage, minChargePointCurrent, name, offlineReservedCurrent, operatorId, parentCircuitId, phaseRotation, phases, setSessionLimitToZeroOnIdle

---

## post

**Type**: object

**Required**: name, phases, maxCurrent

---

## IncludeSingle

**Type**: array

---

## DlmCircuitScheduleType

**Type**: string

---

## SchedulePeriod

**Type**: object

**Properties**: end, maxCurrent, start

**Required**: start, end, maxCurrent

---

## DailySchedule

**Type**: array

---

## WeeklySchedule

**Type**: object

**Properties**: friday, monday, saturday, sunday, thursday, tuesday, wednesday

**Required**: monday, tuesday, wednesday, thursday, friday, saturday, sunday

---

## DlmCircuitScheduleLimitUnit

**Type**: string

---

## CircuitSchedule

**Type**: object

**Properties**: schedule, scheduleLimitUnit, scheduleType

**Required**: scheduleType, schedule

---

## getSingle

**Type**: object

---

## single-post

**Type**: object

**Required**: targetId, type, priority

---

## ocppVersion

**Type**: string

---

## configurationTemplateBase

**Type**: object

**Properties**: id, lastUpdatedAt, name, ocppVersion, operatorId

---

## configurationTemplateRead

**Type**: object

**Required**: id, operatorId

---

## configurationTemplateCreate

**Type**: object

**Properties**: name, ocppVersion, operatorId

**Required**: name, ocppVersion

---

## configurationTemplatePatch

**Type**: object

**Properties**: name

---

## configurationVariableRead16

**Type**: object

**Required**: id, keyName, value, lastUpdatedAt

---

## configurationVariableRead21

**Type**: object

**Required**: id, value, variableName, variableType, variableInstance, component, componentInstance, evseId, connectorId, lastUpdatedAt

---

## configurationVariablePatch16

**Type**: object

---

## configurationVariablePatch21

**Type**: object

---

## ConsentHistoryFilter

**Type**: object

**Properties**: action, after, before, termType, userId

---

## TermType

**Type**: string

---

## ConsentHistoryAction

**Type**: string

---

## ConsentHistory-read

**Type**: object

**Properties**: action, actionAt, termType, termVersionId, userId

**Required**: userId, termVersionId, termType, action, actionAt

---

## ConsentFilter

**Type**: object

**Properties**: agreedAfter, agreedBefore, rejectedAfter, rejectedBefore, status, termType, userId

---

## ConsentStatus

**Type**: string

---

## ConsentCollection

**Type**: string

---

## ConsentSource

**Type**: string

---

## Consent-read

**Type**: object

**Properties**: agreedAt, collection, rejectedAt, source, status, termType, termVersionId, termVersionIsActive, userId

**Required**: userId, termVersionId, termType, status, collection, source, termVersionIsActive

---

## Consent-create

**Type**: object

**Properties**: status, termVersionId, userId

**Required**: userId, termVersionId, status

---

## ContactDetails

**Type**: object

**Properties**: email, lastUpdatedAt, phone

**Required**: email

---

## Currency_get

**Type**: object

**Properties**: alphabeticCode, decimal, enableUseOfMinorCurrencyUnit, id, minorUnitSign, name, numericCode, prefix, suffix, unitPriceAndCalculationsDecimal

**Required**: alphabeticCode

---

## Currency_post

**Type**: object

**Properties**: alphabeticCode, decimal, enableUseOfMinorCurrencyUnit, minorUnitSign, prefix, suffix, unitPriceAndCalculationsDecimal

**Required**: alphabeticCode

---

## Filter-3

**Type**: object

**Properties**: base, target, updatedAfter, updatedBefore

---

## currencyRateRead

**Type**: object

**Properties**: base, id, rate, target, updatedAt

**Required**: id, base, target, rate, updatedAt

---

## currencyRateCreate

**Type**: object

**Properties**: base, rate, target

**Required**: base, target, rate

---

## currencyRateUpdate

**Type**: object

**Properties**: rate

**Required**: rate

---

## CustomFeeFilter

**Type**: object

**Properties**: createdAfter, createdBefore, operatorId

---

## CustomFee

**Type**: object

**Properties**: amount, bankMessage, createdAt, createdByAdminId, currency, id, lastUpdatedAt, operatorId, transactionId

**Required**: id, operatorId, createdAt, transactionId, amount, currency, bankMessage, lastUpdatedAt

---

## DowntimePeriodNoticeResponseSchema

**Type**: object

**Properties**: createdAt, description, id, lastUpdatedAt, notice, operatorId, type

**Required**: id, operatorId, type, notice, createdAt, lastUpdatedAt

---

## DowntimePeriodNoticeRequestBodySchema_base

**Type**: object

**Properties**: description, notice, type

---

## DowntimePeriodNoticeRequestBodySchema_create

**Type**: object

---

## ElectricityMeterFilter

**Type**: object

**Properties**: lastUpdatedAfter, lastUpdatedBefore, operatorId

---

## id

**Type**: object

**Properties**: id, operatorId

---

## ElectricityMeter_base

**Type**: object

**Properties**: integrationId, integrationParameters, name, operatorId

---

## getAndPost

**Type**: object

**Required**: id, operatorId

---

## ElectricityMeter_post

**Type**: object

**Required**: name, integrationId

---

## patchBase

**Type**: object

**Properties**: integrationId, integrationParameters, name

---

## patch

**Type**: object

---

## ElectricityRateFilter

**Type**: object

**Properties**: utilityId

---

## pricing-interval

**Type**: object

**Properties**: elements, weekDays

**Required**: weekDays

---

## special-pricing-interval

**Type**: object

**Properties**: elements, specialPricingName, validOn

**Required**: specialPricingName, validOn

---

## ElectricityRate-read

**Type**: object

**Properties**: defaultPricePerKwh, id, intervalPricing, intervalSpecialPricing, name, pricingGranularityInMinutes, taxId, taxPercentage, utilityId

**Required**: id, name, pricingGranularityInMinutes, defaultPricePerKwh

---

## electricityRateType

**Type**: string

---

## filter

**Type**: object

**Properties**: operatorId, type, utilityId

---

## resource_read

**Type**: object

**Properties**: defaultPrice, id, name, operatorId, taxPercentage, type, utilityId

**Required**: id, operatorId, name, type, defaultPrice, taxPercentage

---

## resource_writeBase

**Type**: object

**Properties**: defaultPrice, name, taxPercentage, utilityId

---

## resource_create

**Type**: object

**Required**: name, defaultPrice, taxPercentage

---

## ElectricityRateEnergyMix

**Type**: object

**Properties**: coal, hydro, naturalGas, nuclear, otherNonRenewable, otherRenewable, solar, wind

---

## week-day

**Type**: string

---

## weekDayBase

**Type**: object

**Properties**: periods, weekDay

---

## weekDayReadOrCreate

**Type**: object

**Required**: weekDay, periods

---

## helpers_date

**Type**: string

---

## dateBase

**Type**: object

**Properties**: date, periods

---

## dateReadOrCreate

**Type**: object

**Required**: date, periods

---

## weekDayOrDateUpdate

**Type**: object

**Properties**: periods

**Required**: periods

---

## EnergyCouponTemplateStatus

**Type**: string

---

## EnergyCouponTemplateFilter

**Type**: object

**Properties**: code, createdAfter, createdBefore, externalId, status, templateValidFrom, templateValidTo

---

## EnergyCouponTemplateValidityType

**Type**: string

---

## EnergyCouponTemplateRedemptionRules

**Type**: object

**Properties**: newUsersOnly, oncePerDevice, oncePerEmail, oncePerPhoneNumber, oncePerUser

---

## Base

**Type**: object

**Properties**: code, couponValidFrom, couponValidTo, energyWh, externalId, maxRedemptionCount, name, redemptionRules, restrictions, tags, templateValidFrom, templateValidTo, validityDurationDays, validityType

---

## Read

**Type**: object

---

## Create

**Type**: object

---

## Update

**Type**: object

**Properties**: maxRedemptionCount, name, redemptionRules, restrictions, tags, templateValidTo

---

## EnergyCouponFilter

**Type**: object

**Properties**: createdAfter, createdBefore, energyCouponTemplateId, externalId, operatorId, status, type, userId

---

## EnergyCoupon-create

**Type**: object

**Properties**: energyWh, evseType, externalId, operatorId, restrictions, type, userId, validFrom, validTo

**Required**: energyWh, type

---

## EnergyCouponInclude

**Type**: array

---

## EnergyCouponSessionConsumptionRecord

**Type**: object

**Properties**: consumedEnergyWh, couponId, sessionId

**Required**: sessionId, couponId, consumedEnergyWh

---

## EvseDowntimePeriodResponseSchema_read

**Type**: object

**Properties**: chargePointId, endedAt, evseId, startedAt, statusLog

**Required**: id, evseId, chargePointId, locationId, entryMode, type, statuses, startedAt, endedAt

---

## EVSEFilter

**Type**: object

**Properties**: chargePointId, connectorId, evseStatus, evseType, hardwareStatus, partnerId, physicalReference, roamingPlatformId, tariffGroupId

---

## EVSE-status-2

**Type**: object

**Properties**: hardwareStatus

---

## Connector-2

**Type**: object

**Properties**: format, id, ocpiMaxAmperage, ocpiMaxElectricPower, ocpiMaxVoltage, status, type

---

## EVSE-2

**Type**: object

**Properties**: allowsReservation, chargePointId, chargingProfile, connectors, externalId, id, maxAmperage, maxPowerKw, maxVoltage, midMeterCertificationEndYear, networkId, notes, phaseRotation, phases, physicalReference, roaming, status, tariffGroupId, type

**Required**: physicalReference, type, maxVoltage, phases, networkId, status, allowsReservation

---

## FilterV2.1

**Type**: object

**Properties**: chargePointId, currentType, externalId, hasRoamingTariffIds, hasTariffGroup, lastUpdatedAfter, lastUpdatedBefore, operatorId, parkingSpaceId, physicalReference, roaming, roamingOperatorIds

---

## ChargePointId

**Type**: object

**Properties**: chargePointId

**Required**: chargePointId

---

## evseV21Read

**Type**: object

---

## evseV21Create

**Type**: object

---

## evseV21ReadSingle

**Type**: object

---

## FAQ_read

**Type**: object

**Properties**: answer, id, lastUpdatedAt, operatorId, question

**Required**: id, operatorId, question, answer, lastUpdatedAt

---

## FAQ_write

**Type**: object

**Properties**: answer, operatorId, question

**Required**: question, answer

---

## FAQ_patch

**Type**: object

**Properties**: answer, question

---

## FirmwareVersion

**Type**: object

**Properties**: chargePointVendorId, createdAt, details, fileUrl, firmwareVersion, id, models, signature, signingCertificate, updatedAt

**Required**: id, firmwareVersion, chargePointVendorId, createdAt, updatedAt

---

## FlexibilityAsset_readBase

**Type**: object

**Properties**: description, dlmCircuitId, downwardRegulationLimit, id, operatorId, upwardRegulationLimit

---

## integration

**Type**: object

**Properties**: integrationId, integrationParameters

---

## FlexibilityAsset_status

**Type**: object

**Properties**: endsAt, status

---

## FlexibilityAsset_get

**Type**: object

**Required**: id, operatorId

---

## FlexibilityAsset_writeBase

**Type**: object

**Properties**: description, dlmCircuitId, downwardRegulationLimit, id, operatorId, upwardRegulationLimit

---

## FlexibilityAsset_post

**Type**: object

**Required**: dlmCircuitId, status, integrationId

---

## FlexibilityAsset_patchBase

**Type**: object

**Properties**: description, dlmCircuitId, downwardRegulationLimit, id, upwardRegulationLimit

---

## FlexibilityAsset_patch

**Type**: object

---

## TimeSeriesData

**Type**: object

**Properties**: assetId, endTime, energy, id, startTime

**Required**: assetId, startTime, endTime, energy

---

## TimeSeriesForecastData

**Type**: object

**Properties**: assetId, downwardRegulationPotential, endTime, energy, id, startTime, upwardRegulationPotential

**Required**: assetId, startTime, endTime, energy, downwardRegulationPotential, upwardRegulationPotential

---

## RfidStandard

**Type**: string

---

## IdTagsFilter

**Type**: object

**Properties**: expireAt, idLabel, idTagUid, isHomeChargingOnly, lastUpdatedAfter, lastUpdatedBefore, operatorId, partnerId, rfidStandard, status, type, userId, vehicleId

---

## VehicleType-2

**Type**: string

---

## HomeChargingOnly

**Type**: boolean

---

## IdTags_read

**Type**: object

**Properties**: createdAt, defaultPaymentOption, expireAt, externalId, id, idLabel, idTagUid, isHomeChargingOnly, lastUpdatedAt, operatorId, partnerId, paymentMethodId, rfidStandard, status, type, userId, userLabel, vehicleId, vehicleType

**Required**: id, operatorId, defaultPaymentOption

---

## IdTags_create

**Type**: object

**Properties**: createdAt, defaultPaymentOption, expireAt, externalId, id, idLabel, idTagUid, isHomeChargingOnly, lastUpdatedAt, operatorId, partnerId, paymentMethodId, rfidStandard, status, type, userId, vehicleId, vehicleType

---

## IdTags_update

**Type**: object

**Properties**: createdAt, defaultPaymentOption, expireAt, externalId, id, idLabel, idTagUid, isHomeChargingOnly, lastUpdatedAt, partnerId, paymentMethodId, rfidStandard, status, type, userId, userLabel, vehicleId, vehicleType

---

## Filter-4

**Type**: object

**Properties**: countryCode, externalId, integrationId, lastUpdatedAfter, lastUpdatedBefore, operatorId

---

## Include-3

**Type**: array

---

## InstallationAndMaintenanceCompany-chargePointIds

**Type**: array

---

## InstallationAndMaintenanceCompany-read

**Type**: object

**Properties**: address, businessName, chargePointIds, city, companyName, contactPerson, countryCode, createdAt, email, externalId, id, integrationId, lastUpdatedAt, operatorId, phone, postCode, region

**Required**: id, operatorId, businessName, createdAt, lastUpdatedAt

---

## InstallationAndMaintenanceCompany-base

**Type**: object

**Properties**: address, businessName, city, companyName, contactPerson, countryCode, email, externalId, integrationId, phone, postCode, region

---

## InstallationAndMaintenanceCompany-create

**Type**: object

---

## InstallerJobFilter

**Type**: object

**Properties**: chargePointId, createdAfter, createdBefore, installationAndMaintenanceCompanyId, installerAdminId, lastUpdatedAfter, lastUpdatedBefore, locationId, status

---

## InstallerJob-base

**Type**: object

**Properties**: description, installerAdminId, pin

---

## InstallerJob-create

**Type**: object

---

## Include-4

**Type**: array

---

## InvoiceListingFilter

**Type**: object

**Properties**: externalId, fiscalizationStatus, issuedFrom, issuedTo, operatorId, partnerId, paymentStatus

---

## InvoiceFiscalizationAttempt

**Type**: object

**Properties**: attemptedAt, errorMessage, id, isSuccessful, responseFields

**Required**: id, attemptedAt, isSuccessful, responseFields

---

## IssueFilter

**Type**: object

**Properties**: assigneeId, category, createdAfter, createdBefore, keyResourceId, keyResourceType, operatorId, priority, severity, status, updatedAfter, updatedBefore, workflowState

---

## IssueKeyResourceType

**Type**: string

---

## IssueCreate

**Type**: object

**Properties**: assigneeAdminId, category, description, externalId, keyResource, operatorId, priority, severity, status, title

**Required**: title, description, category, severity, priority

---

## Include-5

**Type**: array

---

## IssueUpdate

**Type**: object

**Properties**: assigneeAdminId, category, description, externalId, priority, resolutionDetails, severity, status, title

---

## LocationFilter

**Type**: object

**Properties**: country, externalId, partnerId, postCode, status

---

## Location-with-required-attr

**Type**: object

---

## Filter-5

**Type**: object

**Properties**: city, country, createdAfter, createdBefore, externalId, lastUpdatedAfter, lastUpdatedBefore, operatorId, partnerId, region, roaming, state, tag

---

## Include-6

**Type**: string

---

## AccessibilityType

**Type**: string

---

## PaymentOption

**Type**: string

---

## AcceptedPaymentBrand

**Type**: string

---

## AdditionalInfo

**Type**: object

**Properties**: description, enabled, title

---

## chargingZoneBase

**Type**: object

**Properties**: additionalInfo, floorLevel, id, locationId, name, status

---

## locationV2ReadBase

**Type**: object

**Properties**: acceptedPaymentBrands, accessMethods, accessibilityType, additionalDescription, address, chargingZones, city, country, createdAt, description, externalAppData, externalId, facilities, geoposition, id, images, isRoaming, lastUpdatedAt, locationImage, locationPin, name, notes, operatorId, parkingType, partnerIds, paymentOptions, postCode, region, roaming, roamingOperatorId, shortDescription, state, status, streetAddress, tags, timezone, workingHours

---

## locationV2Read

**Type**: object

**Required**: id, operatorId, name, geoposition, address, city, country, roamingOperatorId, isRoaming, accessibilityType

---

## locationV2WriteBase

**Type**: object

**Properties**: acceptedPaymentBrands, accessMethods, accessibilityType, additionalDescription, address, city, country, description, externalAppData, externalId, facilities, geoposition, id, name, operatorId, parkingType, paymentOptions, postCode, region, shortDescription, state, status, streetAddress, tags, timezone, workingHours

---

## locationV2Create

**Type**: object

**Required**: name, geoposition, address, country

---

## locationV2PatchBase

**Type**: object

**Properties**: accessMethods, accessibilityType, additionalDescription, address, city, country, description, externalAppData, externalId, facilities, geoposition, id, name, parkingType, postCode, region, shortDescription, state, status, streetAddress, tags, timezone, workingHours

---

## locationV2Patch

**Type**: object

---

## chargingZoneReadWrite

**Type**: object

**Required**: name, status

---

## chargingZonePatch

**Type**: object

**Properties**: additionalInfo, floorLevel, id, locationId, name, status

---

## OcpiCommandResult

**Type**: string

---

## OcpiCommandType

**Type**: string

---

## OcpiCommandFailureReason

**Type**: string

---

## OcpiCommand

**Type**: object

**Properties**: createdAt, evseId, failureReason, id, reservationId, result, roamingConnectionId, roamingEmspId, sessionId, type

**Required**: id, type, createdAt

---

## OperatorBankDetails

**Type**: object

---

## OperatorV1_get

**Type**: object

**Properties**: bankDetails, country, createdAt, currency, default, email, id, locale, name, phone, timezone, translatedName, updatedAt

**Required**: id, name, translatedName, currency, default, createdAt, updatedAt

---

## ParkingDirection

**Type**: string

---

## Filter-6

**Type**: object

**Properties**: createdAfter, createdBefore, dangerousGoodsAllowed, evseId, externalId, lastUpdatedAfter, lastUpdatedBefore, lighting, operatorId, parkingDirection, reservationRequired, roofed

---

## VehicleType-3

**Type**: string

---

## parkingSpaceBase

**Type**: object

**Properties**: accessibility, compliance, directions, disabilitiesAccessible, evses, externalId, id, label, latitude, locationId, longitude, properties, vehicleRestrictions

---

## StatusRead

**Type**: string

---

## OccupancyStatusRead

**Type**: string

---

## parkingSpaceRead

**Type**: object

**Required**: id, operatorId, locationId, label, status, occupancyStatus, lastUpdatedAt

---

## StatusWrite

**Type**: string

---

## OccupancyStatusWrite

**Type**: string

---

## parkingSpacePatch

**Type**: object

---

## parkingSpaceCreate

**Type**: object

**Required**: locationId, label

---

## PartnerContractsFilter

**Type**: object

**Properties**: autoRenewal, contractType, createdAfter, createdBefore, endDateBefore, externalId, lastUpdatedAfter, lastUpdatedBefore, operatorId, partnerId, startDateAfter, titleContains

---

## AccessAndPermissions

**Type**: object

**Properties**: changeSystemStatus, createFromTemplate, firmwareUpdate, resetChargePoint, sessionsRemoteControl, startReservation, stopReservation

---

## ReimbursementFees-read

**Type**: object

**Properties**: perPeriod, perSession

---

## SettlementOverrideName

**Type**: string

---

## SettlementOverridePriority

**Type**: integer

---

## PartnerContractSettlementOverrideRestrictionType

**Type**: string

---

## SettlementOverrideRestriction

**Type**: object

**Properties**: targetIds, type

**Required**: type

---

## SettlementOverrideRead

**Type**: object

**Properties**: acPercent, dcPercent, id, name, priority, restriction

**Required**: id, name, priority, restriction, acPercent, dcPercent

---

## PartnerContract_read

**Type**: object

**Properties**: accessAndPermissions, autoRenewal, contractType, endDate, externalId, id, lastUpdatedAt, monthlyPlatformFees, operatorId, partnerId, reimbursementFees, revenueSharing, settlementOverrides, startDate, title

**Required**: id, operatorId, title, partnerId, startDate

---

## PartnerContract_write

**Type**: object

**Properties**: accessAndPermissions, autoRenewal, contractType, endDate, externalId, monthlyPlatformFees, partnerId, reimbursementFees, revenueSharing, startDate, title

**Required**: title, partnerId, startDate

---

## ReimbursementFees-patch

**Type**: object

**Properties**: perPeriod, perSession

---

## PartnerContract_patch

**Type**: object

**Properties**: accessAndPermissions, autoRenewal, contractType, endDate, externalId, monthlyPlatformFees, reimbursementFees, revenueSharing, startDate, title

---

## SettlementOverrideCreate

**Type**: object

**Properties**: acPercent, dcPercent, name, priority, restriction

**Required**: name, priority, restriction

---

## PartnerContractSettlementOverrideConflictErrorCode

**Type**: string

---

## PartnerContractSettlementOverridePreconditionFailedErrorCode

**Type**: string

---

## SettlementOverrideUpdate

**Type**: object

**Properties**: acPercent, dcPercent, name, priority, restriction

---

## ExpenseBreakdown

**Type**: object

**Properties**: numberOfAcEvses, numberOfChargePoints, numberOfDcEvses, partnerContractId, totalPlatformFeeAcEvses, totalPlatformFeeChargePoints, totalPlatformFeeDcEvses

**Required**: partnerContractId, numberOfChargePoints, totalPlatformFeeChargePoints, numberOfAcEvses, totalPlatformFeeAcEvses, numberOfDcEvses, totalPlatformFeeDcEvses

---

## Expenses

**Type**: object

**Properties**: authorization, breakdown, chargePointName, chargingSessionId, currency, date, duration, id, lastUpdatedAt, operatorDiscountAmount, operatorDiscountPercentage, origin, partnerId, partnerName, period, startedAt, subtotal, totalAmount

**Required**: id, partnerId, partnerName, date, origin, totalAmount, currency

---

## Expenses-2

**Type**: object

**Properties**: authorization, breakdown, chargePointId, chargePointName, chargingSessionId, currencyCode, date, duration, evseCount, id, operatorDiscountAmount, operatorDiscountPercentage, origin, partnerId, partnerName, period, settlementReportId, startedAt, totalAmount

**Required**: id, partnerId, partnerName, date, origin, totalAmount, currencyCode, settlementReportId

---

## Expenses-3

**Type**: object

**Properties**: authorization, breakdown, chargePointId, chargingSessionId, currencyCode, date, duration, evseCount, id, locationId, operatorDiscountAmount, operatorDiscountPercentage, origin, partnerContractId, partnerId, period, settlementReportId, startedAt, totalAmount

**Required**: id, partnerId, date, origin, totalAmount, currencyCode, settlementReportId

---

## PartnerInviteAccessPoliciesFilter

**Type**: object

**Properties**: includeSharedChargePoints, lastUpdatedAfter, lastUpdatedBefore, partnerId

---

## PartnerAccess

**Type**: object

**Properties**: partnerIds, type

**Required**: type

---

## PartnerInviteAccessPolicyRestrictionType

**Type**: string

---

## LocationsRestriction

**Type**: object

**Properties**: locationIds, type

**Required**: type

---

## ChargePointsRestriction

**Type**: object

**Properties**: chargePointIds, type

**Required**: type

---

## LocationTagsRestriction

**Type**: object

**Properties**: locationTagIds, type

**Required**: type

---

## ChargePointTagsRestriction

**Type**: object

**Properties**: chargePointTagIds, type

**Required**: type

---

## Restrictions-2

**Type**: object

**Properties**: chargePointTags, chargePoints, locationTags, locations

---

## PartnerInviteAccessPolicy_read

**Type**: object

**Properties**: createdAt, id, includeSharedChargePoints, isDefault, lastUpdatedAt, name, operatorId, partnerAccess, restrictions

**Required**: id, name, partnerAccess, restrictions, includeSharedChargePoints, isDefault, createdAt, lastUpdatedAt

---

## PartnerInviteAccessPolicy_write

**Type**: object

**Properties**: includeSharedChargePoints, name, operatorId, partnerAccess, restrictions

**Required**: name, partnerAccess

---

## PartnerInviteAccessPolicy_patch

**Type**: object

**Properties**: includeSharedChargePoints, name, partnerAccess, restrictions

---

## Filters

**Type**: object

**Properties**: coverageType, isActive, partnerId

---

## PartnerInviteCorporateBillingPolicy-create

**Type**: object

**Properties**: chargerTypeConfig, coverageType, externalId, individualSpendingLimit, name, overallCostCap, partnerId, restrictions, tariffThresholds

**Required**: partnerId, name, coverageType

---

## PartnerInviteCorporateBillingPolicy-update

**Type**: object

**Properties**: chargerTypeConfig, coverageType, externalId, individualSpendingLimit, name, overallCostCap, restrictions, tariffThresholds

---

## PartnerInviteCorporateBillingPolicySnapshot-read

**Type**: object

**Properties**: chargerTypeConfig, corporateBillingPolicyId, coverageType, createdAt, externalId, id, individualSpendingLimit, isActive, name, overallCostCap, partnerId, period, restrictions, tariffThresholds, updatedAt

**Required**: id, partnerId, name, isActive, coverageType, period, createdAt, updatedAt

---

## PartnerInvitesFilter

**Type**: object

**Properties**: acceptedAfter, acceptedBefore, createdFrom, createdTo, inviteEmail, lastUpdatedAfter, lastUpdatedBefore, partnerId, status, userId

---

## PartnerInvite_write

**Type**: object

**Properties**: acceptUrl, email, language, options, partnerId, sendViaEmail

**Required**: partnerId

---

## PartnerInvite_patch

**Type**: object

**Properties**: acceptUrl, email, language, options, partnerId, sendViaEmail

---

## PartnerInviteStatus

**Type**: string

---

## PartnerInvitesFilterV2

**Type**: object

**Properties**: corporateBillingPolicyId, partnerId, status

---

## Reimbursement_Reimbursement-common

**Type**: object

**Properties**: policyId

---

## ReimbursementCoverageType

**Type**: string

---

## Reimbursement-restrictions

**Type**: object

**Properties**: rfids, vehicles

---

## Reimbursement_Reimbursement-read

**Type**: object

---

## PartnerInviteV2_read

**Type**: object

**Properties**: acceptUrl, acceptedAt, accessPolicyId, corporateBillingPolicyId, createdAt, email, id, language, lastUpdatedAt, partnerId, reimbursement, sendViaEmail, status, userId

**Required**: id, partnerId, sendViaEmail, language, status, createdAt, lastUpdatedAt

---

## Reimbursement-create

**Type**: object

---

## PartnerInviteV2_create

**Type**: object

**Properties**: accessPolicyId, corporateBillingPolicyId, email, language, partnerId, reimbursement, sendViaEmail

**Required**: partnerId

---

## Reimbursement-update

**Type**: object

**Properties**: policyId, restrictions

---

## PartnerInviteV2_update

**Type**: object

**Properties**: accessPolicyId, corporateBillingPolicyId, partnerId, reimbursement

---

## Revenue

**Type**: object

**Properties**: authorization, chargePointName, chargingSessionId, currency, date, duration, electricityCost, id, lastUpdatedAt, operatorShare, origin, partnerId, partnerName, partnerShare, remainingRevenue, startedAt, totalAmount

**Required**: id, partnerId, partnerName, date, origin, totalAmount, partnerShare, currency

---

## Revenue-2

**Type**: object

**Properties**: authorization, chargePointId, chargePointName, chargingSessionId, collectedAt, currencyCode, date, duration, electricityCost, evseCount, id, operatorShare, origin, partnerId, partnerName, partnerShare, period, remainingRevenue, settlementReportId, startedAt, totalAmount

**Required**: id, partnerId, partnerName, date, origin, totalAmount, partnerShare, operatorShare, currencyCode, settlementReportId

---

## Revenue-3

**Type**: object

**Properties**: authorization, chargePointId, chargingSessionId, collectedAt, currencyCode, date, duration, electricityCost, evseCount, id, locationId, operatorShare, origin, partnerContractId, partnerId, partnerShare, period, remainingRevenue, settlementReportId, startedAt, totalAmount

**Required**: id, partnerId, date, origin, totalAmount, partnerShare, operatorShare, currencyCode, settlementReportId

---

## CustomFieldFilters

**Type**: string

---

## PartnerSettlementRecordRequestSchema

**Type**: object

**Properties**: date, note, paidAmount

**Required**: date, paidAmount, note

---

## PartnerSettlementRecordResponseSchema

**Type**: object

---

## PartnersFilter

**Type**: object

**Properties**: country, createdAfter, createdBefore, externalId, hasRoamingOperator, lastUpdatedAfter, lastUpdatedBefore, operatorId, regNo, roamingOperatorId, search, tag

---

## Partner_read

**Type**: object

**Properties**: address, city, contactPerson, corporateBilling, country, email, externalId, faultNotificationsEmail, id, lastUpdatedAt, monthlyPlatformFee, name, options, phone, postcode, regNo, vatNo

**Required**: id, name

---

## Partner_write

**Type**: object

**Properties**: address, city, contactPerson, corporateBilling, country, email, externalId, faultNotificationsEmail, monthlyPlatformFee, name, options, phone, postcode, regNo, vatNo

**Required**: name

---

## PartnersFilterV2

**Type**: object

**Properties**: country, createdAfter, createdBefore, customFields, externalId, hasRoamingOperator, lastUpdatedAfter, lastUpdatedBefore, operatorId, regNo, roamingOperatorId, search, tag

---

## Include-7

**Type**: array

---

## PartnerReimbursement_Reimbursement-create

**Type**: object

---

## translated-v2-write

**Type**: array

---

## PartnerBankDetailsWrite

**Type**: object

---

## Partner-write-base

**Type**: object

**Properties**: address, bankDetails, city, contactDetails, corporateBilling, country, externalId, id, invoiceNumberPrefix, lastUpdatedAt, monthlyPlatformFee, name, notifications, options, postcode, receiptsPrefix, receiptsStartingNumber, regNo, region, startingInvoiceNumber, state, translatedAddress, translatedCity, translatedName, translatedRegion, vatNo

---

## Partner-write

**Type**: object

---

## Partner-create

**Type**: object

---

## NullableReimbursementCycle

**Type**: string

---

## PartnerReimbursement_Reimbursement-update

**Type**: object

---

## Partner-update

**Type**: object

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

## TerminalType

**Type**: string

---

## CommonPropertiesMinimal

**Type**: object

**Properties**: id, integrationId, name, operatorId, terminalType

---

## CommonPropertiesBase

**Type**: object

---

## PayterProperties

**Type**: object

**Properties**: chargePointId, chargingZoneId, defaultLanguage, displayText, displayTextTimeout, externalId, id, integrationId, name, operatorId, serialNumber, terminalType

---

## PayterPropertiesForUpdate

**Type**: object

---

## PayterResponseProperties

**Type**: object

---

## RequiredCommonProperties

**Type**: object

**Required**: name, integrationId, terminalType, operatorId

---

## ValinaBase

**Type**: object

**Required**: phone, defaultLanguage, info, bundle, suppressReceiptWhenInvoiceIssued

---

## CraneBase

**Type**: object

**Required**: serialNumber

---

## AmpecoBase

**Type**: object

**Required**: suppressReceiptWhenInvoiceIssued

---

## NayaxBase

**Type**: object

**Required**: terminalId

---

## EmbeddedBase

**Type**: object

---

## PaxBase

**Type**: object

**Required**: verificationCode, defaultLanguage, info

---

## WindcaveBase

**Type**: object

---

## RequiredMinCommonProperties

**Type**: object

**Required**: name, integrationId, terminalType, operatorId

---

## WebPortalBase

**Type**: object

**Required**: suppressReceiptWhenInvoiceIssued

---

## AdyenCastlesBase

**Type**: object

**Required**: phone, defaultLanguage, info, merchantAccount, adyenApiKey, suppressReceiptWhenInvoiceIssued

---

## PrintecCastles

**Type**: object

**Required**: phone, defaultLanguage, info, bundle, suppressReceiptWhenInvoiceIssued

---

## CardlinkCastlesBase

**Type**: object

**Required**: phone, defaultLanguage, info, bundle, suppressReceiptWhenInvoiceIssued

---

## PreauthorizeAmountForCreation

**Type**: object

**Required**: preauthorizeAmount

---

## TransactionTimeoutForCreation

**Type**: object

**Required**: transactionTimeout

---

## PayterPropertiesBase

**Type**: object

**Required**: name, integrationId, terminalType, serialNumber, defaultLanguage, operatorId

---

## CommonPropertiesMinimalForUpdate

**Type**: object

**Properties**: id, integrationId, name, terminalType

---

## CommonPropertiesBaseForUpdate

**Type**: object

---

## PayterForUpdate

**Type**: object

---

## ValinaForUpdate

**Type**: object

---

## CraneForUpdate

**Type**: object

---

## AmpecoForUpdate

**Type**: object

---

## NayaxForUpdate

**Type**: object

---

## EmbeddedForUpdate

**Type**: object

---

## PaxForUpdate

**Type**: object

---

## WindcaveForUpdate

**Type**: object

---

## WebPortalForUpdate

**Type**: object

---

## AdyenCastlesForUpdate

**Type**: object

---

## PrintecCastlesForUpdate

**Type**: object

---

## CardlinkCastlesForUpdate

**Type**: object

---

## CustomFieldFilterMap

**Type**: object

---

## PayterForUpdateV1_1

**Type**: object

---

## PayterResponsePropertiesV1_1

**Type**: object

---

## ValinaBaseV1_1

**Type**: object

**Required**: phone, defaultLanguage, info, bundle

---

## ValinaResponsePropertiesV1_1

**Type**: object

---

## GenericBase

**Type**: object

---

## PrintecCastlesV1_1

**Type**: object

**Required**: phone, defaultLanguage, info, bundle

---

## PrintecCastlesResponsePropertiesV1_1

**Type**: object

---

## CardlinkCastlesBaseV1_1

**Type**: object

**Required**: phone, defaultLanguage, info, bundle

---

## CardlinkCastlesResponsePropertiesV1_1

**Type**: object

---

## PaymentTerminalReadCustomFieldsV1_1

**Type**: object

**Properties**: customFields

---

## PaymentTerminalListingV1_1

**Type**: object

---

## PayterPropertiesV1_1

**Type**: object

**Properties**: chargePointId, chargingZoneId, defaultLanguage, displayText, displayTextTimeout, externalId, id, integrationId, name, operatorId, serialNumber, terminalType

---

## PayterPropertiesBaseV1_1

**Type**: object

**Required**: name, integrationId, terminalType, serialNumber, defaultLanguage, operatorId

---

## PaymentTerminalReadV1_1

**Type**: object

---

## CommonPropertiesMinimalForUpdateV1_1

**Type**: object

**Properties**: id, integrationId, name, terminalType

---

## CommonPropertiesBaseForUpdateV1_1

**Type**: object

---

## ValinaForUpdateV1_1

**Type**: object

---

## CraneForUpdateV1_1

**Type**: object

---

## GenericForUpdate

**Type**: object

---

## NayaxForUpdateV1_1

**Type**: object

---

## EmbeddedForUpdateV1_1

**Type**: object

---

## PaxForUpdateV1_1

**Type**: object

---

## WindcaveForUpdateV1_1

**Type**: object

---

## WebPortalForUpdateV1_1

**Type**: object

---

## AdyenCastlesForUpdateV1_1

**Type**: object

---

## PrintecCastlesForUpdateV1_1

**Type**: object

---

## CardlinkCastlesForUpdateV1_1

**Type**: object

---

## fields

**Type**: object

**Properties**: id, name, pcId, userId, vehicleType

---

## idTagItemFields

**Type**: object

**Properties**: defaultPaymentOption, expireAt, id, name, paymentMethod, status, type

---

## readIdTagItem

**Type**: object

**Required**: paymentMethod, defaultPaymentOption

---

## ProvisioningCertificate_read

**Type**: object

**Required**: pcId, name, vehicleType, userId

---

## ProvisioningCertificate_create

**Type**: object

**Required**: pcId, name, vehicleType, userId

---

## ReceiptFilter

**Type**: object

**Properties**: issuedFrom, issuedTo, operatorId, partnerId, paymentStatus, periodEnd, periodStart, taxId, userId

---

## Receipt

**Type**: object

**Properties**: downloadUrl, id, issuedOn, operatorId, partnerId, paymentStatus, periodEnd, periodStart, receiptNo, tax, totalAmount, totalKwh, userId

**Required**: id, operatorId, receiptNo, issuedOn, userId, totalAmount

---

## Filters-2

**Type**: object

**Properties**: electricityRateSource, isActive, partnerId

---

## ReimbursementPolicy-common

**Type**: object

**Properties**: name, validityStartsOn

---

## ReimbursementPolicy-optionalFields

**Type**: object

**Properties**: electricityRateId, partnerContractId, partnerId, validityEndsOn

---

## ReimbursementPolicy-read

**Type**: object

**Required**: id, operatorId, name, electricityRateSource, validityStartsOn, createdAt, lastUpdatedAt

---

## ReimbursementElectricityRateSourceWrite

**Type**: string

---

## ReimbursementPolicy-create

**Type**: object

**Required**: name, electricityRateSource, validityStartsOn

---

## ReimbursementPolicy-update

**Type**: object

---

## SessionReimbursementType

**Type**: string

---

## ReimbursementReport

**Type**: object

**Properties**: beneficiary, createdAt, currency, id, operatorId, payer, periodEndsOn, periodStartsOn, reimbursementPolicyId, totalAmount, totalEnergy, updatedAt

**Required**: id, operatorId, totalEnergy, totalAmount, periodStartsOn, periodEndsOn, createdAt, updatedAt

---

## ReservationsFilter

**Type**: object

**Properties**: evseId, operatorId, reservedFrom, reservedTo, status, userId

---

## Reservation

**Type**: object

**Properties**: canceledAt, chargePointId, duration, evseId, id, lastUpdatedAt, operatorId, reservedAt, status, userId

**Required**: id, operatorId, userId, chargePointId, evseId, status, reservedAt, duration

---

## RfidTagsFilter

**Type**: object

**Properties**: expireAt, rfidLabel, rfidTagUid, status, type, userId

---

## RfidTags

**Type**: object

**Properties**: createdAt, expireAt, id, lastUpdatedAt, rfidLabel, rfidTagUid, status, userId

**Required**: rfidTagUid, status

---

## RoamingConnection

**Type**: object

**Properties**: disputePeriodLength, endpoint, id, issuer, lastUpdatedAt, ocpi, preferRealtimeAuthorization, protocol

**Required**: id, protocol, endpoint, disputePeriodLength

---

## TariffMappingMode

**Type**: string

---

## ExternalTariffIntegration

**Type**: string

---

## EvseStatusUnknownTreatment

**Type**: string

---

## PhaseAcPowerFormula

**Type**: string

---

## RoamingCpoSettings_read

**Type**: object

**Properties**: applyCustomTariffsToEvsesWithRoamingTariff, cpoQrCodePrefix, externalTariffIntegration, phaseAcPowerFormula, sendsPeriodicMeterUpdates, tariffMappingMode, treatEvseStatusUnknownAs

**Required**: tariffMappingMode, applyCustomTariffsToEvsesWithRoamingTariff, sendsPeriodicMeterUpdates, treatEvseStatusUnknownAs, phaseAcPowerFormula

---

## RoamingCpo_read

**Type**: object

**Properties**: businessName, connectionId, countryCode, cpoSettings, enabled, hubjectId, id, lastUpdatedAt, partyId

**Required**: id, connectionId, enabled, cpoSettings, lastUpdatedAt

---

## RoamingCpoSettings_write

**Type**: object

**Properties**: applyCustomTariffsToEvsesWithRoamingTariff, cpoQrCodePrefix, externalTariffIntegration, phaseAcPowerFormula, sendsPeriodicMeterUpdates, tariffMappingMode, treatEvseStatusUnknownAs

---

## RoamingCpo_write

**Type**: object

**Properties**: businessName, cpoSettings, enabled

---

## RoamingEmspFilter

**Type**: object

**Properties**: connectionId, countryCode, partyId

---

## RoamingEmsp_read

**Type**: object

**Properties**: businessName, connectionId, countryCode, hubjectId, id, lastUpdatedAt, partyId

**Required**: id, connectionId, lastUpdatedAt

---

## createCommonProperties

**Type**: object

**Properties**: businessName, connectionId

**Required**: connectionId

---

## createHubjectProperties

**Type**: object

**Properties**: hubjectId

---

## writeHubject

**Type**: object

---

## createOcpiProperties

**Type**: object

**Properties**: countryCode, partyId

**Required**: countryCode, partyId

---

## writeOCPI

**Type**: object

---

## updateCommonProperties

**Type**: object

**Properties**: businessName

---

## updateHubjectProperties

**Type**: object

**Properties**: hubjectId

---

## updateHubject

**Type**: object

---

## writeOcpiProperties

**Type**: object

**Properties**: countryCode, partyId

---

## updateOCPI

**Type**: object

---

## RoamingEmspPartnerFilter

**Type**: object

**Properties**: operatorId

---

## RoamingOperatorSettings

**Type**: object

---

## RoamingOperator_read

**Type**: object

**Properties**: businessName, countryCode, cpoSettings, enabled, hubjectId, id, lastUpdatedAt, operatorId, partnerId, partyId, platformId, role

**Required**: id, operatorId

---

## RoamingOperator_write

**Type**: object

**Properties**: businessName, cpoSettings, enabled, partnerId

---

## RoamingCustomTariffFilterProperties

**Type**: object

**Properties**: applicableCurrentTypes, countryCode, createdAt, evseIdPrefix, id, name, order, powerBelowKw, status, updatedAt

---

## RoamingCustomTariffFilter_read

**Type**: object

**Required**: id, name, status, applicableCurrentTypes, order, createdAt, updatedAt

---

## RoamingCustomTariffFilter_create

**Type**: object

**Required**: name, status

---

## reorder

**Type**: object

**Properties**: filters

**Required**: filters

---

## RoamingCustomTariffFilter_update

**Type**: object

**Properties**: applicableCurrentTypes, countryCode, evseIdPrefix, name, order, powerBelowKw, status

---

## RoamingPlatform

**Type**: object

**Properties**: endpoint, id, lastUpdatedAt, ocpi, protocol

**Required**: id, protocol, endpoint

---

## RoamingProviderFilter

**Type**: object

**Properties**: countryCode, partyId, platformId

---

## RoamingProvider_read

**Type**: object

**Properties**: businessName, countryCode, hubjectId, id, lastUpdatedAt, partnerId, partyId, platformId, role

**Required**: id, role, lastUpdatedAt

---

## writeCommonProperties

**Type**: object

**Properties**: businessName, partnerId, platformId

---

## writeHubjectProperties

**Type**: object

**Properties**: hubjectId

---

## requiredCommonProperties

**Type**: object

**Required**: platformId

---

## RoamingProvider_writeHubject

**Type**: object

---

## RoamingProvider_writeOcpiProperties

**Type**: object

**Properties**: countryCode, partyId

---

## RoamingProvider_writeOCPI

**Type**: object

---

## RoamingProvider_updateHubject

**Type**: object

---

## RoamingProvider_updateOCPI

**Type**: object

---

## RoamingTariffFilter

**Type**: object

**Properties**: createdAfter, createdBefore, operatorId

---

## RoamingTariff

**Type**: object

**Properties**: cpoTariffGroupId, id, operatorId, rawRoamingTariffs, roamingIds, roamingTariffHumanReadable, tariffGroupId

---

## SecurityEvent_base

**Type**: object

**Properties**: chargePoint, id, techInfo, timestamp, type

---

## SecurityEvent_read

**Type**: object

---

## externalAppDataFilter

**Type**: string

---

## SessionFilter

**Type**: object

**Properties**: authorizationSource, billingCompletedAfter, billingCompletedBefore, billingStatus, chargePointBootNotificationSerialNumber, chargePointBootNotificationVendor, chargePointId, chargePointNetworkId, corporateBillingPolicyId, customFields, endedAfter, endedBefore, evseId, evsePhysicalReference, externalAppData, hasCorporateBilling, idTag, lastUpdatedAfter, lastUpdatedBefore, locationId, operatorId, partnerId, paymentStatus, paymentStatusUpdatedAfter, paymentStatusUpdatedBefore, paymentType, reason, receiptId, roaming, selectedPaymentMethod, startedAfter, startedBefore, startedOffline, status, subOperatorId, taxId, terminalId, userId, userPartnerId

---

## DurationBreakdown

**Type**: object

**Properties**: billableChargingDurationSeconds, billableIdleDurationSeconds, chargingDurationSeconds, chargingGracePeriodSeconds, idleDurationSeconds, idleGracePeriodSeconds

**Required**: chargingDurationSeconds, billableChargingDurationSeconds, chargingGracePeriodSeconds, idleDurationSeconds, billableIdleDurationSeconds, idleGracePeriodSeconds

---

## SeriesEntry

**Type**: object

**Properties**: currentA, currentExportA, currentOfferedA, energyExportKwh, energyKwh, extra, frequencyHz, phases, powerExportKw, powerFactor, powerKw, powerOfferedKw, socPercent, temperatureC, timestamp, voltageV

**Required**: timestamp

---

## HasFlags

**Type**: object

**Properties**: currentA, currentExportA, currentOfferedA, energyExportKwh, extra, frequencyHz, phases, powerExportKw, powerFactor, powerOfferedKw, socPercent, temperatureC, voltageV

---

## Event

**Type**: object

**Properties**: info, previousValue, timestamp, type, value

**Required**: timestamp, type, value

---

## SessionTimelineSnapshot

**Type**: object

**Properties**: events, has, series

**Required**: series, has, events

---

## Vehicle-pcId

**Type**: string

---

## VehicleUsageType

**Type**: string

---

## Vehicle-read

**Type**: object

**Properties**: createdAt, id, label, licensePlate, operatorId, partnerId, pcId, updatedAt, usageType, vin

**Required**: id, operatorId, label, createdAt, updatedAt

---

## SessionConsumptionStats

**Type**: array

---

## Settings

**Type**: object

**Properties**: baseCurrency, bilingualInvoicesEnabled, bilingualReceiptsEnabled, defaultTax, reservations

**Required**: bilingualInvoicesEnabled, bilingualReceiptsEnabled

---

## SharingInvite-filters

**Type**: object

**Properties**: chargePointId, userId

---

## SharingInviteStatus

**Type**: string

---

## SharingInvite-read

**Type**: object

**Properties**: chargePointId, createdAt, id, lastUpdatedAt, status, userId

**Required**: id, chargePointId, userId, status, createdAt, lastUpdatedAt

---

## SubOperator

**Type**: object

**Properties**: id, lastUpdatedAt, name, operatorId, partner_ids

**Required**: id, operatorId

---

## SubOperator-capabilities

**Type**: object

**Properties**: canControlChargePoints, canControlPartnersTariffsAndTariffGroups, canControlTariff, canControlTariffGroups

---

## SubOperator-base

**Type**: object

**Properties**: businessName, businessOperationalContext, capabilities, contactPerson, country, email, externalId, faultNotificationsEmail, partnerIds, phone, postcode, regNo, state, taxNo

---

## NameRead

**Type**: string

---

## CityRead

**Type**: string

---

## RegionRead

**Type**: object

---

## AddressRead

**Type**: string

---

## TranslatedNameRead

**Type**: object

---

## TranslatedAddressRead

**Type**: object

---

## TranslatedCityRead

**Type**: object

---

## TranslatedRegionRead

**Type**: object

---

## SubOperator-stripe-connect

**Type**: object

**Properties**: accountId, applicationFeeFixed, applicationFeePercentage, chargesEnabled, directPaymentEnabled, onboardingCompleted

**Required**: accountId, onboardingCompleted, chargesEnabled, directPaymentEnabled

---

## SubOperator-read

**Type**: object

**Required**: id, operatorId, name, translatedName, translatedAddress, translatedCity, businessName, capabilities, partnerIds, lastUpdatedAt

---

## translated-v2-write-255

**Type**: array

---

## TranslatedNameWrite

**Type**: object

---

## TranslatedAddressWrite

**Type**: object

---

## TranslatedCityWrite

**Type**: object

---

## TranslatedRegionWrite

**Type**: object

---

## SubOperator-translated-write

**Type**: object

**Properties**: translatedAddress, translatedCity, translatedName, translatedRegion

---

## NameWrite

**Type**: string

---

## CityCreate

**Type**: string

---

## RegionCreate

**Type**: object

---

## AddressCreate

**Type**: string

---

## SubOperator-create

**Type**: object

**Required**: businessName

---

## Include-8

**Type**: array

---

## CityUpdate

**Type**: string

---

## RegionUpdate

**Type**: object

---

## AddressUpdate

**Type**: string

---

## SubOperator-update

**Type**: object

---

## SubscriptionPlan

**Type**: object

**Properties**: id, lastUpdatedAt, name

**Required**: id, name

---

## SubscriptionPlanFilter

**Type**: object

**Properties**: createdAfter, createdBefore, externalId, lastUpdatedAfter, lastUpdatedBefore, operatorId

---

## billingType

**Type**: string

---

## allowance-amount-limits

**Type**: integer

---

## allowance-amounts

**Type**: object

**Properties**: ac, combined, dc

---

## SubscriptionPlanV2_read

**Type**: object

**Properties**: allowance, baseFee, baseFeeAppliesPerEachHomeCharger, billingType, billingUsageThreshold, description, externalId, feePerEachPersonalChargePoint, freeRenewalPeriods, id, lastUpdatedAt, name, operatorId, postPaidChargingSessionsAccumulation, renewalCycle, replacedAt, replacementPlanId, status, type, visibilityRestrictions

**Required**: id, operatorId, name, description, renewalCycle, type, status

---

## SubscriptionPlanV2_write

**Type**: object

**Properties**: allowance, baseFee, baseFeeAppliesPerEachHomeCharger, billingType, billingUsageThreshold, description, externalId, feePerEachPersonalChargePoint, freeRenewalPeriods, lastUpdatedAt, name, operatorId, postPaidChargingSessionsAccumulation, renewalCycle, status, type, visibilityRestrictions

**Required**: name, description, renewalCycle, type, status

---

## SubscriptionPlanV2_patch

**Type**: object

**Properties**: allowance, baseFee, billingType, billingUsageThreshold, description, externalId, feePerEachPersonalChargePoint, freeRenewalPeriods, lastUpdatedAt, name, postPaidChargingSessionsAccumulation, renewalCycle, status, type, visibilityRestrictions

---

## SubscriptionFilter

**Type**: object

**Properties**: billedExternally, endDateFrom, endDateTo, endedAfter, endedBefore, planId, startedAfter, startedBefore, status, statusChangedAfter, statusChangedBefore

---

## Subscription

**Type**: object

**Properties**: endDate, endedAt, id, isRenewable, lastUpdatedAt, planId, remainingAllowance, remainingFreeRenewalPeriods, shouldUseExternalBilling, startDate, startedAt, status, statusChangedAt, statusDate, userId

**Required**: id, planId, userId, startDate, endDate, status, statusDate, startedAt, endedAt, statusChangedAt, isRenewable

---

## TariffGroupFilter

**Type**: object

**Properties**: createdAfter, createdBefore, lastUpdatedAfter, lastUpdatedBefore, operatorId, partnerId

---

## displayWriteBase

**Type**: object

**Properties**: defaultPriceInformation, defaultPriceInformationOffline

---

## TariffGroup_writeBase

**Type**: object

**Properties**: lastUpdatedAt, name, offlineTariffId, partnerId, tariffIds

**Required**: name

---

## TariffGroup_create

**Type**: object

---

## TariffGroup_update

**Type**: object

---

## TariffSnapshot

**Type**: object

---

## TariffFilter

**Type**: object

**Properties**: lastUpdatedAfter, lastUpdatedBefore, operatorId, partnerId, tariffGroupId, type, userId

---

## Tariff_read

**Type**: object

---

## stopSessionUpdate

**Type**: object

---

## startSessionRestrictionsUpdate

**Type**: object

**Properties**: minimumBalance

---

## TariffCommon_patch

**Type**: object

**Properties**: additionalInformation, dayTariffStart, description, discountTariffSettings, display, externalId, integrationId, learnMoreUrl, name, nightTariffStart, partner, pricing, restrictions, startSessionRestrictions, stopSession

---

## TariffCommon_writeBase

**Type**: object

---

## TariffCommon_create

**Type**: object

---

## TariffScheduledChangeStatus

**Type**: string

---

## TariffScheduledChangeFilter

**Type**: object

**Properties**: createdAfter, createdBefore, scheduledAfter, scheduledBefore, status

---

## TariffScheduledChange_read

**Type**: object

**Properties**: additionalInformation, createdAt, createdByAdminId, dayTariffStart, description, display, id, learnMoreUrl, name, nightTariffStart, pricing, scheduledAt, status, stopSession, tariffId, type, updatedAt

**Required**: id, tariffId, status, scheduledAt, createdByAdminId, createdAt, updatedAt, name, type

---

## TariffScheduledChange_create

**Type**: object

**Properties**: additionalInformation, dayTariffStart, description, display, learnMoreUrl, name, nightTariffStart, pricing, scheduledAt, stopSession, type

**Required**: scheduledAt

---

## TariffScheduledChange_patch

**Type**: object

**Properties**: additionalInformation, dayTariffStart, description, display, learnMoreUrl, name, nightTariffStart, pricing, scheduledAt, stopSession, type

---

## TaxIdentificationNumber_read

**Type**: object

**Properties**: id, lastUpdatedAt, name

**Required**: id, name

---

## TaxIdentificationNumber_write

**Type**: object

**Properties**: name

**Required**: name

---

## TaxIdentificationNumber_patch

**Type**: object

**Properties**: name

---

## Tax_read

**Type**: object

**Properties**: displayName, id, lastUpdatedAt, name, percentage, taxIdentificationNumberId

**Required**: id, name, percentage, lastUpdatedAt

---

## Tax_write

**Type**: object

**Properties**: displayName, name, percentage, taxIdentificationNumberId

**Required**: name, percentage

---

## Tax_patch

**Type**: object

**Properties**: displayName, name, percentage, taxIdentificationNumberId

---

## EvseTemplate

**Type**: object

**Properties**: allowsReservation, currentType, dlmConnectedPhase, dlmEfficiencyPercent, dlmMaxCurrentA, dlmPhaseRotation, dlmPhases, dlmPriority, id, inputVoltage, maxPower, networkId, status, tariffGroupId

---

## Template

**Type**: object

**Properties**: evses, id, lastUpdatedAt, name, subscriptionPlanIds

---

## TermsAndPoliciesFilter

**Type**: object

**Properties**: documentId, operatorId, validFrom

---

## TermsAndPolicies

**Type**: object

**Properties**: content, document, id, lastUpdatedAt, operatorId, status, summary, validFrom

**Required**: id, operatorId, document, validFrom, content

---

## TopUpPackageFilter

**Type**: object

**Properties**: enabled, operatorId

---

## TopUpPackage_read

**Type**: object

**Properties**: bonus, enabled, id, operatorId, price

**Required**: operatorId, price, bonus

---

## TopUpPackage_write

**Type**: object

**Properties**: bonus, enabled, operatorId, price

**Required**: price, bonus

---

## TopUpPackage_patch

**Type**: object

**Properties**: bonus, enabled, price

---

## CardNetwork

**Type**: string

---

## CardType

**Type**: string

---

## TransactionPendingReason

**Type**: string

---

## TransactionFilter

**Type**: object

**Properties**: acquirerName, billingType, bin, cardLast4, cardNetwork, cardType, createdAfter, createdBefore, finalizedAfter, finalizedBefore, fingerprint, invoiceId, invoiceNumber, issuerCode, issuerName, lastUpdatedAfter, lastUpdatedBefore, operatorId, paymentMethod, pendingReason, purchaseType, receiptId, ref, refContains, sessionId, settledByTransactionId, status, subscriptionBillingPeriodId, terminalId, totalAmount, userId, voucherId

---

## CardholderVerificationMethod

**Type**: string

---

## Transaction-read

**Type**: object

**Properties**: authorizedAmount, bankMessage, billingType, cardDetails, currency, date, failureReason, finalizedAt, id, invoiceId, invoiceNo, lastUpdatedAt, number, operatorId, paymentMetadata, paymentMethod, paymentMethodId, paymentOrderReference, paymentProcessorId, pendingReason, purchaseResourceId, purchaseResourceType, receiptId, ref, sessionId, settledByTransactionId, status, subscriptionBillingPeriodId, terminalId, totalAmount, userEmail, userId, voucherId

**Required**: id, operatorId, number, date, userId, sessionId, ref, currency

---

## Transaction-write

**Type**: object

**Properties**: authorizedAmount, email, failureReason, invoiceDetails, invoiceRequired, lastUpdatedAt, locale, operatorId, paymentMetadata, paymentMethod, paymentOrderReference, ref, sessionId, status, totalAmount

**Required**: totalAmount, status

---

## Transaction-patch

**Type**: object

**Properties**: authorizedAmount, failureReason, invoiceRequired, lastUpdatedAt, paymentMetadata, paymentMethod, ref, sessionId, status, totalAmount

**Required**: status, totalAmount

---

## UserDeviceFilter

**Type**: object

**Properties**: deviceIdentifier, hasUser, operatorId, userId

---

## UserDevicePlatform

**Type**: string

---

## UserDevice-read

**Type**: object

**Properties**: appBuild, appVersion, createdAt, device, deviceIdentifier, id, internalAppVersion, manufacturer, model, operatorId, platform, pushEnabled, updatedAt, userId

**Required**: id, deviceIdentifier, platform, pushEnabled, createdAt, updatedAt

---

## UserGroupsFilter

**Type**: object

**Properties**: createdAfter, createdBefore, lastUpdatedAfter, lastUpdatedBefore, noPartner, operatorId, partnerId

---

## UserGroups_read

**Type**: object

**Properties**: description, externalId, id, lastUpdatedAt, name, operatorId, partnerId

**Required**: id, operatorId, name

---

## UserGroups_writeBase

**Type**: object

**Properties**: description, externalId, lastUpdatedAt, name, partnerId

**Required**: name

---

## UserGroups_create

**Type**: object

---

## UsersFilter

**Type**: object

**Properties**: createdAfter, createdBefore, email, externalAppData, externalId, invoiceDetailsLastUpdatedAfter, invoiceDetailsLastUpdatedBefore, lastActivityBefore, lastUpdatedAfter, lastUpdatedBefore, operatorId, partnerId, userGroupId

---

## UsersInclude

**Type**: array

---

## User-write

**Type**: object

**Properties**: address, bankDetails, city, company_name, country, email, emailVerified, externalAppData, externalId, first_name, lastUpdatedAt, last_name, locale, middle_name, nonce, operatorId, options, password, personal_id, phone, post_code, receiveNewsAndPromotions, requirePasswordReset, skipPreAuthorization, skipUnpaidSessionCheck, state, userGroupIds, vehicle_no

**Required**: email, password

---

## User-read-single

**Type**: object

---

## UserDeletionBlockedReason

**Type**: string

---

## User-patch

**Type**: object

**Properties**: address, bankDetails, city, company_name, country, email, emailVerified, externalAppData, externalId, first_name, lastUpdatedAt, last_name, middle_name, options, password, phone, post_code, receiveNewsAndPromotions, requirePasswordReset, skipPreAuthorization, skipUnpaidSessionCheck, state, userGroupIds, vehicle_no

---

## InvoiceDetailsAmpecoIntegrationRequestSchema

**Type**: object

**Properties**: address, city, companyName, companyRegNo, companyTaxAdministrationOfficeName, companyTaxId, country, individualName, individualPersonalId, individualTaxId, invoiceType, postCode, region, requireInvoice, state

**Required**: requireInvoice, invoiceType

---

## InvoiceDetailsCardcomIntegrationRequestSchema

**Type**: object

**Properties**: address, city, clientType, country, email, invoiceRequired, landlinePhoneNumber, mobilePhoneNumber, name, postcode, taxId

**Required**: invoiceRequired, clientType

---

## InvoiceDetailsSoftOneIntegrationRequestSchema

**Type**: object

**Properties**: address, city, country, email, firstName, lastName, phone, postcode

**Required**: firstName, lastName, email

---

## InvoiceDetailsEcpayIntegrationRequestSchema

**Type**: object

**Properties**: address, carrierType, citizenId, city, companyId, country, email, invoiceType, loveCode, mobileBarCode, name, phone, postcode

**Required**: invoiceType, name, email, phone

---

## ItalianSdiBuyerFieldsNullableWrite

**Type**: object

**Properties**: recipientCertifiedEmail, recipientCode

---

## InvoiceDetailsAvalaraIntegrationRequestSchema

**Type**: object

**Required**: requireInvoice, invoiceType

---

## PaymentMethod

**Type**: object

**Properties**: acquirerName, addedAt, bankTransferType, bin, cardNetwork, cardType, default, expireMonth, expireYear, fingerprint, id, issuer, issuerCode, issuerName, lastUpdatedAt, name, registrationTransactionId, removedAt, token, tokenizedType, type, userId, walletType

**Required**: id, type, name, userId, default

---

## PaymentMethodResponse

**Type**: object

**Properties**: data

---

## SubscriptionBillingPeriodFilter

**Type**: object

**Properties**: endedAfter, endedBefore, hasUnresolvedPaymentFailure, startedAfter, startedBefore, subscriptionId, subscriptionPlanId

---

## SubscriptionBillingPeriod-read

**Type**: object

**Properties**: baseFee, chargePointFees, createdAt, currency, endedAt, firstPaymentFailureAt, id, latestPaymentFailureAt, latestPaymentFailureReason, obligationsTransferredAt, sessionFees, startedAt, subscriptionId, subscriptionPlanId, totalAmount

**Required**: id, subscriptionPlanId, subscriptionId, startedAt, endedAt, totalAmount, baseFee, currency, createdAt

---

## User-read-v1_1

**Type**: object

---

## LocaleEnum

**Type**: string

---

## User-write-v1_1

**Type**: object

**Properties**: address, bankDetails, city, company_address, company_city, company_country, company_name, company_postal_code, company_receipts_enabled, company_tax_id, country, email, emailVerified, externalAppData, externalId, first_name, lastUpdatedAt, last_name, locale, middle_name, nonce, operatorId, options, partnerId, password, personal_id, phone, post_code, receiveNewsAndPromotions, requirePasswordReset, state, userGroupIds, vehicle_no

**Required**: email, password

---

## User-read-single-v1_1

**Type**: object

---

## User-patch-v1_1

**Type**: object

**Properties**: address, bankDetails, city, company_address, company_city, company_country, company_name, company_postal_code, company_receipts_enabled, company_tax_id, country, email, emailVerified, externalAppData, externalId, first_name, lastUpdatedAt, last_name, locale, middle_name, options, password, personal_id, phone, post_code, receiveNewsAndPromotions, requirePasswordReset, state, userGroupIds, vehicle_no

---

## UtilityResponseSchema

**Type**: object

**Properties**: chargePointsCount, createdAt, electricityRatesCount, id, name, updatedAt

**Required**: id, name, chargePointsCount, electricityRatesCount, createdAt, lastUpdatedAt

---

## UtilityRequestSchema

**Type**: object

**Properties**: name

**Required**: name

---

## VehiclesFilter

**Type**: object

**Properties**: createdAfter, createdBefore, label, lastUpdatedAfter, lastUpdatedBefore, licensePlate, operatorId, partnerId, usageType, userId, vin

---

## Vehicle-write

**Type**: object

**Properties**: label, licensePlate, operatorId, partnerId, pcId, usageType, userIds, vin

**Required**: label

---

## VehicleTelemetryReadingSource

**Type**: string

---

## VehicleTelemetryReadingFilter

**Type**: object

**Properties**: partnerId, source, submittedAfter, submittedBefore, vehicleId

---

## VehicleTelemetryReading

**Type**: object

**Properties**: createdAt, id, odometerKm, source, submittedAt, submittedByUserId, vehicleId

**Required**: id, vehicleId, submittedAt, createdAt, source

---

## Vehicle-telemetry-summary

**Type**: object

**Properties**: lastOdometerAt, lastOdometerKm

**Required**: lastOdometerKm, lastOdometerAt

---

## Vehicle-read-detail

**Type**: object

---

## Vehicle-patch

**Type**: object

**Properties**: label, licensePlate, partnerId, pcId, usageType, userIds, vin

---

## Vehicle-userIds

**Type**: object

**Properties**: userIds

**Required**: userIds

---

## VehicleTelemetryReadingFilters

**Type**: object

**Properties**: source, submittedAfter, submittedBefore

---

## VehicleTelemetryReadingCreate

**Type**: object

**Properties**: odometerKm, submittedAt, submittedByUserId

---

## VendorErrorCode

**Type**: object

**Properties**: errorCode, errorCodeCustomerAction, errorCodeDescription, id, vendorId

**Required**: vendorId, errorCode

---

## VouchersFilter

**Type**: object

**Properties**: createdAt, redeemedAfter, redeemedBefore, status, type, userId

---

## Voucher-read

**Type**: object

**Properties**: amount, code, createdAt, createdByAdminId, currency, description, expireDate, id, lastUpdatedAt, promoCode, redeemedAt, redeemedByUserId, status, transactionId, type

**Required**: id, code, amount, createdAt, type, currency

---

## Voucher-create

**Type**: object

**Properties**: amount, description, expireDate

**Required**: amount

---

## Voucher-patch

**Type**: object

**Properties**: amount, expireDate, status

**Required**: amount

---

## VoucherPurpose

**Type**: string

---

## VouchersFilterV21

**Type**: object

**Properties**: code, createdAt, expireDateAfter, expireDateBefore, operatorId, purpose, redeemedAfter, redeemedBefore, status, type, userId

---

## VoucherExpireDate

**Type**: string

---

## VoucherValidityPeriod

**Type**: string

---

## VoucherTitle

**Type**: object

---

## VoucherV21_Voucher-read

**Type**: object

**Properties**: amount, assignBeforeDate, code, createdAt, createdByAdminId, currencyCode, description, expireDate, id, lastUpdatedAt, operatorId, promoCode, purpose, redeemedAt, redeemedByUserId, remainingAmount, status, title, transactionId, type, validityPeriod

**Required**: id, operatorId, code, amount, createdAt, type, purpose, currencyCode, remainingAmount

---

## VoucherV21_Voucher-create

**Type**: object

**Properties**: amount, assignBeforeDate, description, expireDate, operatorId, prefix, title, validityPeriod

**Required**: amount

---

## VoucherV21_Voucher-patch

**Type**: object

**Properties**: amount, assignBeforeDate, expireDate, prefix, status, title, validityPeriod

**Required**: amount

---

## PaymentTerminalTypeValina

**Type**: string

---

## PaymentTerminalTypeCrane

**Type**: string

---

## PaymentTerminalTypeGeneric

**Type**: string

---

## PaymentTerminalTypeNayax

**Type**: string

---

## PaymentTerminalTypeEmbedded

**Type**: string

---

## PaymentTerminalTypePax

**Type**: string

---

## PaymentTerminalTypeWindcave

**Type**: string

---

## PaymentTerminalTypeWebPortal

**Type**: string

---

## PaymentTerminalTypeAdyenCastles

**Type**: string

---

## PaymentTerminalTypePrintecCastles

**Type**: string

---

## PaymentTerminalTypeCardlinkCastles

**Type**: string

---

## TariffGroup

**Type**: object

---

## SmartChargingTod

**Type**: object

---

## SmartChargingDynamic

**Type**: object

---

## SmartChargingUserSchedule

**Type**: object

---

## SmartChargingDisabled

**Type**: object

---

## PersonalSmartChargingPreferencesUserControlledSchedule

**Type**: object

---

## PersonalSmartChargingPreferencesSolar

**Type**: object

---

## PersonalSmartChargingPreferencesOctopusAgile

**Type**: object

---

## PersonalSmartChargingPreferencesOctopusGo

**Type**: object

---

## PersonalSmartChargingPreferencesNordPool

**Type**: object

---

## PersonalSmartChargingPreferencesChargerElectricityRate

**Type**: object

---

## PaymentTerminalTypePayterRead

**Type**: object

---

## PaymentTerminalTypeValinaRead

**Type**: object

---

## PaymentTerminalTypeCraneRead

**Type**: object

---

## PaymentTerminalTypeGenericRead

**Type**: object

---

## PaymentTerminalTypeNayaxRead

**Type**: object

---

## PaymentTerminalTypeEmbeddedRead

**Type**: object

---

## PaymentTerminalTypePaxRead

**Type**: object

---

## PaymentTerminalTypeWindcaveRead

**Type**: object

---

## PaymentTerminalTypeWebPortalRead

**Type**: object

---

## PaymentTerminalTypeAdyenCastlesRead

**Type**: object

---

## PaymentTerminalTypePrintecCastlesRead

**Type**: object

---

## PaymentTerminalTypeCardlinkCastlesRead

**Type**: object

---

