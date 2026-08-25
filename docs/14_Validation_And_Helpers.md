# FinanceOS — Validation & Helpers Architecture

**Document ID:** DOC-014

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

The Helpers worksheet is the internal engineering layer that powers validation, lookup tables, reusable dropdown lists, and intermediate workbook outputs.

It is not a user-facing worksheet.

The Helpers worksheet exists so every user-facing worksheet can use a centralized validation system instead of maintaining duplicate lists or formulas.

This worksheet is mandatory for FinanceOS Version 1.

---

# Helpers Philosophy

FinanceOS follows a **single source of truth** principle for every dropdown and lookup value.

Instead of creating validation lists inside multiple worksheets:

- Helpers owns lookup lists.
- User worksheets consume lookup lists.
- Business Engine consumes lookup outputs when required.

This architecture is immutable.

---

# Helpers Responsibilities

The Helpers worksheet is responsible for:

- Lookup tables.
- Dynamic validation lists.
- Named Range outputs.
- Filtered active lists.
- Status lists.
- Month lists.
- Priority lists.
- Currency lists.
- Payment method lists.
- Frequency lists.
- Intermediate validation outputs.

It does **not** store business entities.

---

# Helpers Dependency Architecture

Settings

↓

Categories / Accounts / Goals / Assets / Liabilities

↓

Helpers

↓

Transactions / Dashboard / Business Engine

Dependencies always flow downward.

User worksheets never generate validation lists themselves.

---

# Helpers Worksheet Sections (Frozen)

The Helpers worksheet is divided into permanent engineering sections.

| Section | Purpose |
|--------|---------|
| Global Lookups | Static dropdown values. |
| Dynamic Lookups | Active workbook entity lists. |
| Date Lookups | Months, Years, Financial Years. |
| Status Lookups | Active / Closed / Paused lists. |
| Validation Outputs | Spill ranges used by Data Validation. |
| Reserved Future Lookups | Future-proof expansion area. |

Section order is frozen.

---

# Section 1 — Global Lookup Tables (Frozen)

Global lookup tables contain workbook-wide static values.

These values rarely change.

---

## Currency Lookup

**Table Name**

`lkpCurrency`

### Columns

| Column | Description |
|--------|-------------|
| Currency Code | ISO currency code. |
| Currency Name | Display name. |
| Symbol | Currency symbol. |

### Version 1 Values

- INR
- USD
- EUR
- GBP
- AED

Settings references this lookup.

---

## Payment Method Lookup

**Table Name**

`lkpPaymentMethod`

### Version 1 Values

- Bank Transfer
- Cash
- UPI
- Debit Card
- Credit Card
- Wallet
- Net Banking
- Other

Transactions consume this lookup.

---

## Transaction Type Lookup

**Table Name**

`lkpTransactionType`

### Values

- Income
- Expense
- Transfer
- Adjustment

Transactions consume this lookup.

---

## Destination Type Lookup

**Table Name**

`lkpDestinationType`

### Values

- Expense Category
- Income Category
- Account
- Goal
- Liability
- Investment
- Other

Destination validation uses this lookup.

---

## Frequency Lookup

**Table Name**

`lkpFrequency`

### Values

- Monthly
- Quarterly
- Half-Yearly
- Yearly

Recurring Commitments consume this lookup.

---

## Priority Lookup

**Table Name**

`lkpPriority`

### Values

- High
- Medium
- Low

Goals consume this lookup.

---

## Ownership Type Lookup

**Table Name**

`lkpOwnershipType`

### Values

- Individual
- Joint

Assets consume this lookup.

---

## Yes / No Lookup

**Table Name**

`lkpYesNo`

### Values

- Yes
- No

Used across workbook.

---

# Section 2 — Status Lookup Tables (Frozen)

Status values remain centralized.

---

## Entity Status Lookup

**Table Name**

`lkpStatus`

### Values

- Active
- Inactive
- Paused
- Completed
- Closed

Shared across workbook.

---

## Goal Status Lookup

**Table Name**

`lkpGoalStatus`

### Values

- Active
- Completed
- Paused

Goals consume this lookup.

---

## Liability Status Lookup

**Table Name**

`lkpLiabilityStatus`

### Values

- Active
- Closed

Liabilities consume this lookup.

---

## Account Status Lookup

**Table Name**

`lkpAccountStatus`

### Values

- Active
- Closed

Accounts consume this lookup.

---

## Commitment Status Lookup

**Table Name**

`lkpCommitmentStatus`

### Values

- Active
- Paused
- Completed

Recurring Commitments consume this lookup.

---

# Section 3 — Date Lookup Tables (Frozen)

Date lookup tables provide reusable calendar values.

---

## Month Lookup

**Table Name**

`lkpMonth`

### Columns

| Column | Description |
|--------|-------------|
| Month Number | 1–12 |
| Month Name | January–December |
| Short Name | Jan–Dec |

Dashboard filters consume this lookup.

---

## Financial Year Lookup

**Table Name**

`lkpFinancialYear`

Generated from Settings configuration.

Supports:

- Current FY.
- Previous FY.
- Future FY placeholders.

---

## Day Lookup

**Table Name**

`lkpDay`

Values:

1–31.

Used for EMI Due Day and Recurring Commitments.

---

# Section 4 — Category Lookup Tables (Frozen)

Helpers creates reusable category outputs.

---

## Expense Category Lookup

Generated dynamically from `tblCategories`.

Includes:

- Active Expense Categories only.

Output Name:

`valExpenseCategories`

---

## Income Category Lookup

Generated dynamically from `tblCategories`.

Includes:

- Active Income Categories only.

Output Name:

`valIncomeCategories`

---

## Category Type Lookup

Static lookup values.

- Income
- Expense

Used inside Categories worksheet.

---

# Section 5 — Reserved Future Lookup Area

Reserved for future FinanceOS versions.

Examples include:

- Countries.
- Time Zones.
- Languages.
- Notification Preferences.
- Subscription Plans.
- AI Models.
- Institution Icons.

Version 1 leaves this section empty.

---

# Named Lookup Table Standards

Every lookup follows naming conventions.

| Prefix | Purpose |
|--------|---------|
| lkp | Static lookup table. |
| val | Validation spill range. |
| rng | Named range. |

Examples:

- `lkpCurrency`
- `valExpenseCategories`
- `rngActiveAccounts`

Naming conventions are frozen.

---

# Protection Rules (Part A)

Users never edit lookup tables.

Protected:

- Static lookup values.
- Validation formulas.
- Named range outputs.

Editable:

None.

---

# Immutable Decisions in Part A

The following Validation & Helpers architecture decisions are frozen.

- Helpers owns all workbook lookup tables.
- Static lookups use `lkp` prefix.
- Dynamic validation outputs use `val` prefix.
- User worksheets never duplicate dropdown values.
- Helpers is a protected engineering worksheet.

---

# Part A Complete

This section freezes the Helpers worksheet architecture, lookup tables, status tables, date tables, category lookup outputs, naming conventions, and worksheet ownership.


---

# Dynamic Validation Architecture (Frozen)

FinanceOS Version 1 uses a centralized dynamic validation system powered entirely by the Helpers worksheet.

Every dropdown inside the workbook references a reusable validation output instead of maintaining its own list.

This architecture guarantees consistency across Desktop, Web, Android, and iPhone Excel.

---

# Dynamic Validation Philosophy

Validation should always reference the latest active business entities.

Examples:

- Adding a new account automatically updates account dropdowns.
- Adding a new goal automatically updates goal dropdowns.
- Inactivating a category removes it from future selections without affecting historical transactions.

The Helpers worksheet owns this behavior.

---

# Validation Output Standards

Dynamic validation outputs use the `val` prefix.

| Validation Output | Source Table |
|-------------------|-------------|
| `valExpenseCategories` | tblCategories |
| `valIncomeCategories` | tblCategories |
| `valActiveAccounts` | tblAccounts |
| `valActiveGoals` | tblGoals |
| `valActiveLiabilities` | tblLiabilities |
| `valActiveAssets` | tblAssets |
| `valIncomeSources` | tblIncomeSources |
| `valRecurringTypes` | lkpFrequency |
| `valPaymentMethods` | lkpPaymentMethod |

These outputs are reusable workbook-wide.

---

# Active Entity Validation Rules

Only active records appear inside validation outputs.

## Account Validation

Source:

`tblAccounts`

Filter:

Status = Active

Output:

`valActiveAccounts`

Used by:

- Transactions
- Liabilities
- Recurring Commitments
- Income Sources

---

## Goal Validation

Source:

`tblGoals`

Filter:

Status = Active

Output:

`valActiveGoals`

Used by:

- Transactions
- Recurring Commitments

Completed goals are excluded from new selections but remain in historical transactions.

---

## Liability Validation

Source:

`tblLiabilities`

Filter:

Status = Active

Output:

`valActiveLiabilities`

Used by:

- Transactions
- Recurring Commitments

Closed liabilities remain historical only.

---

## Asset Validation

Source:

`tblAssets`

Filter:

Status = Active

Output:

`valActiveAssets`

Used by:

- Transactions (Investment destination)
- Dashboard filters
- Analysis Engine lookups

---

## Income Source Validation

Source:

`tblIncomeSources`

Filter:

Status = Active

Output:

`valIncomeSources`

Used only for Income transactions.

---

# Category Validation Rules

Categories are split into two independent validation outputs.

## Expense Categories

Source:

`tblCategories`

Filter:

- Category Type = Expense
- Status = Active

Output:

`valExpenseCategories`

---

## Income Categories

Source:

`tblCategories`

Filter:

- Category Type = Income
- Status = Active

Output:

`valIncomeCategories`

Transactions dynamically switch between these lists.

---

# Dependent Dropdown Architecture (Frozen)

FinanceOS uses dependent dropdowns for the Transactions worksheet.

Dropdown options change based on earlier selections.

---

## Primary Dependency Flow

Transaction Type

↓

Destination Type

↓

Destination Name

↓

Category / Income Source (Conditional)

This dependency order is immutable.

---

# Destination Type → Destination Name Mapping

| Destination Type | Validation Output |
|------------------|-------------------|
| Expense Category | valExpenseCategories |
| Income Category | valIncomeCategories |
| Account | valActiveAccounts |
| Goal | valActiveGoals |
| Liability | valActiveLiabilities |
| Investment | valActiveAssets |
| Other | Free Text Placeholder |

Destination Name validation changes automatically.

---

# Transaction Type Dependency Rules

## Income Transaction

Destination Type defaults to Income Category.

Destination Name references Income Categories.

Income Source dropdown becomes available.

---

## Expense Transaction

Destination Type defaults to Expense Category.

Destination Name references Expense Categories.

Income Source hidden.

---

## Transfer Transaction

Destination Type becomes Account.

Destination Name references Active Accounts.

Category hidden.

Income Source hidden.

---

## Adjustment Transaction

Destination Type optional.

Notes required.

Category optional.

---

# Named Range Architecture (Frozen)

Named ranges provide reusable workbook references.

Every reusable validation list receives a named range.

---

## Named Range Standards

| Prefix | Purpose |
|--------|---------|
| rng | Workbook reference |
| val | Validation output |
| lkp | Static lookup table |

Examples:

- rngActiveAccounts
- rngActiveGoals
- rngCurrency
- rngMonthList

---

## Required Named Ranges

### Global

| Named Range | Purpose |
|-------------|---------|
| rngCurrency | Currency dropdown |
| rngMonths | Month dropdown |
| rngFinancialYears | Financial year dropdown |
| rngPaymentMethods | Payment Method dropdown |

---

### Dynamic

| Named Range | Purpose |
|-------------|---------|
| rngActiveAccounts | Account dropdown |
| rngActiveGoals | Goal dropdown |
| rngActiveAssets | Asset dropdown |
| rngActiveLiabilities | Liability dropdown |
| rngExpenseCategories | Expense category dropdown |
| rngIncomeCategories | Income category dropdown |
| rngIncomeSources | Income source dropdown |

---

# Worksheet Validation Ownership Matrix

Every worksheet consumes Helpers outputs.

| Worksheet | Validation Source |
|-----------|-------------------|
| Settings | Currency, Financial Year |
| Categories | Category Type, Status |
| Accounts | Currency, Account Type, Status |
| Income Sources | Income Type, Status |
| Assets | Asset Category, Ownership Type, Status |
| Liabilities | Liability Type, Account List, Status |
| Recurring Commitments | Frequency, Goals, Accounts, Liabilities |
| Transactions | Dynamic Validation Outputs |
| Goals | Goal Category, Priority, Status |

Validation ownership is centralized.

---

# Validation Rules by Worksheet (Frozen)

## Settings

Dropdowns:

- Currency.
- Financial Year Start Month.
- Theme.

---

## Categories

Dropdowns:

- Category Type.
- Status.

---

## Accounts

Dropdowns:

- Account Type.
- Currency.
- Status.

---

## Assets

Dropdowns:

- Asset Category.
- Ownership Type.
- Status.
- Linked Account.

---

## Liabilities

Dropdowns:

- Liability Type.
- Linked Account.
- Auto EMI.
- Status.

---

## Recurring Commitments

Dropdowns:

- Commitment Type.
- Linked Goal.
- Linked Liability.
- Frequency.
- Status.
- Auto Generate.

---

## Transactions

Dynamic dropdowns:

- Transaction Type.
- Source Account.
- Destination Type.
- Destination Name.
- Category.
- Income Source.
- Payment Method.

Transactions have the most advanced validation architecture.

---

## Goals

Dropdowns:

- Goal Category.
- Priority.
- Goal Status.

---

# Data Validation Rules (Frozen)

Every validation field follows deterministic rules.

| Validation Rule | Behavior |
|-----------------|----------|
| Required Field | Blank values rejected where mandatory. |
| Dropdown Only | User selects from validation list. |
| Positive Number | Amount fields greater than zero. |
| Date Validation | Valid Excel date required. |
| Active Entity Only | Dropdown excludes inactive entities. |
| Conditional Validation | Appears only when applicable. |

No worksheet creates custom validation independently.

---

# Spill Range Architecture

Dynamic validation outputs use spill ranges generated in Helpers.

Spill ranges automatically expand when new records are added.

---

## Spill Range Rules

- Never manually resize validation lists.
- Never hardcode validation ranges.
- Always reference named spill outputs.
- Mobile compatibility is mandatory.

---

# Reserved Validation Outputs (Future Ready)

Reserved named outputs for future versions.

| Output | Purpose |
|--------|---------|
| valInstitutions | Bank institutions |
| valNotificationPreferences | User notification settings |
| valSubscriptionPlans | FinanceOS subscription plans |
| valCountries | Localization |
| valLanguages | Localization |

Reserved but unused in Version 1.

---

# Validation Engine Responsibilities

The Helpers worksheet owns:

### Static Validation

- Lookup tables.
- Status lists.
- Months.
- Currency.
- Payment methods.

### Dynamic Validation

- Active Accounts.
- Active Goals.
- Active Liabilities.
- Active Assets.
- Income Sources.
- Category filtering.
- Destination mapping.

Business Engine consumes outputs but never owns validation.

---

# Immutable Decisions in Part B

The following validation architecture decisions are frozen.

- Helpers owns every dropdown list.
- Transactions use dependent dropdowns.
- Named ranges are mandatory.
- Validation outputs use spill ranges.
- Active records only appear in future dropdowns.
- Historical records remain unaffected by validation changes.

---

# Part B Complete

This section freezes the dynamic validation architecture, dependent dropdown system, named range standards, worksheet validation ownership, spill range strategy, and workbook validation rules for FinanceOS Version 1.


---

# Validation Error Handling Architecture (Frozen)

FinanceOS prevents invalid data entry through deterministic validation rules instead of correcting invalid values after entry.

Validation exists before Business Engine calculations.

---

## Validation Philosophy

Every user input should satisfy three conditions:

1. Valid value.
2. Valid format.
3. Valid relationship with other workbook entities.

Invalid inputs should never reach the Business Engine.

---

# Validation Error Categories

| Error Type | Example |
|------------|---------|
| Missing Required Value | Transaction Amount left blank. |
| Invalid Dropdown Value | Category not in active list. |
| Invalid Date | Non-date value entered. |
| Invalid Numeric Value | Negative transaction amount. |
| Invalid Relationship | Goal selected when Destination Type is Account. |
| Inactive Entity Selected | Closed account selected for a new transaction. |

Each error category has deterministic behavior.

---

## Required Field Rules

Required fields cannot remain blank.

### Required Examples

| Worksheet | Required Fields |
|-----------|-----------------|
| Transactions | Date, Type, Account, Amount, Destination. |
| Goals | Goal Name, Target Amount, Priority. |
| Accounts | Account Name, Account Type, Currency. |
| Liabilities | Liability Name, EMI Amount, Status. |

Business Engine ignores incomplete records until validation succeeds.

---

## Numeric Validation Rules

Numeric fields accept positive values only unless explicitly documented otherwise.

### Positive Number Fields

- Transaction Amount
- Target Amount
- Purchase Value
- Current Value
- EMI Amount
- Opening Balance
- Outstanding Balance

Negative values are rejected by validation.

---

## Date Validation Rules

All date fields require valid Excel dates.

### Date Fields

- Transaction Date
- Purchase Date
- Goal Target Date
- Liability Start Date
- Liability End Date
- Commitment Start Date
- Commitment End Date

Text values are invalid.

---

## Relationship Validation Rules

Validation prevents inconsistent entity relationships.

### Examples

| Invalid Relationship | Expected Behavior |
|----------------------|-------------------|
| Transfer → Expense Category | Reject selection. |
| Income → Liability Category | Reject selection. |
| Expense → Income Source | Hide validation. |
| Goal Contribution → Expense Category | Require Goal destination. |

Transactions must remain internally consistent.

---

# Worksheet Protection Architecture (Frozen)

FinanceOS protects engineering layers while leaving user data editable.

---

## Protection Philosophy

Users edit business data only.

Engineering calculations remain protected.

---

## Worksheet Protection Matrix

| Worksheet | Protection Level |
|-----------|------------------|
| Settings | Partial |
| Categories | Partial |
| Accounts | Partial |
| Income Sources | Partial |
| Assets | Partial |
| Liabilities | Partial |
| Recurring Commitments | Partial |
| Transactions | Partial |
| Goals | Partial |
| Helpers | Full |
| Business Engine | Full |
| Analysis Engine | Full |
| Dashboard | Partial |
| Insights | Read Only |

---

## Editable Areas

Editable areas include:

- Data entry tables.
- Dropdown selections.
- Notes fields.
- Planning fields.
- Filters.

---

## Protected Areas

Protected areas include:

- IDs.
- Formulas.
- Lookup outputs.
- Validation outputs.
- Health metrics.
- Dashboard KPIs.
- Insight generation outputs.

Users cannot overwrite workbook logic.

---

# Hidden Engineering Worksheet Rules (Frozen)

Some worksheets are engineering-only.

---

## Hidden Worksheets

| Worksheet | Visibility |
|-----------|------------|
| Helpers | Hidden / Protected |
| Business Engine | Hidden / Protected |
| Analysis Engine | Hidden / Protected |

Version 1 allows these sheets to remain visible during development.

Production workbook may hide them.

---

## Visible Worksheets

User-facing worksheets remain visible.

- Dashboard
- Transactions
- Goals
- Accounts
- Assets
- Liabilities
- Categories
- Income Sources
- Settings
- Insights

---

# Validation Performance Rules (Frozen)

Validation should remain lightweight for Excel Mobile compatibility.

---

## Performance Principles

- Reuse spill ranges.
- Avoid duplicate lookup formulas.
- Avoid unnecessary volatile formulas.
- Centralize validation outputs.
- Reuse named ranges everywhere possible.

Performance takes priority over duplicated formulas.

---

# Validation Testing Standards (Frozen)

Every validation implementation must be tested before release.

---

## Test Categories

### Static Validation Tests

Verify lookup tables.

Examples:

- Currency list.
- Payment methods.
- Priority list.

---

### Dynamic Validation Tests

Verify spill outputs update automatically.

Examples:

- New Account appears.
- Closed Account disappears.
- New Goal appears.
- Completed Goal disappears.

---

### Transaction Validation Tests

Verify dependent dropdown behavior.

Test cases include:

- Income transaction.
- Expense transaction.
- Transfer transaction.
- Goal contribution.
- Liability payment.
- Investment purchase.

---

### Invalid Input Tests

Examples:

- Blank amount.
- Negative amount.
- Invalid date.
- Closed account.
- Missing destination.

Expected behavior is deterministic rejection.

---

# Validation Ownership Rules (Frozen)

Validation ownership never changes.

| Layer | Responsibility |
|-------|----------------|
| Helpers | Validation lists. |
| User Worksheet | Data entry only. |
| Business Engine | Calculation only. |
| Analysis Engine | Interpretation only. |
| Dashboard | Presentation only. |

No layer duplicates another layer's responsibility.

---

# Cursor Implementation Rules (Validation)

Cursor must:

- Build lookup tables exactly as documented.
- Create named ranges using documented names.
- Create spill-based validation outputs.
- Apply validation only to editable fields.
- Protect engineering worksheets.
- Preserve worksheet dependency order.
- Never hardcode dropdown values inside user worksheets.

---

## Cursor Approval Rules

Cursor must ask for approval before:

- Adding new lookup tables.
- Renaming named ranges.
- Changing validation behavior.
- Changing worksheet protection.
- Adding hidden worksheets.
- Removing validation rules.

Validation architecture is frozen.

---

# Excel Compatibility Rules (Validation)

Validation must work on:

- Excel Desktop (Windows)
- Excel Desktop (Mac)
- Excel Web
- Excel Android
- Excel iPhone / iPad

Forbidden validation features include:

- VBA-generated dropdowns.
- Office Scripts.
- ActiveX controls.
- Desktop-only validation methods.

---

# Future Migration Readiness (Frozen)

The Helpers architecture must migrate directly into future FinanceOS applications.

---

## Migration Mapping

| Excel Validation Layer | Future Application Layer |
|------------------------|--------------------------|
| Lookup Tables | Database lookup tables |
| Named Ranges | API lookup endpoints |
| Spill Outputs | Dynamic query results |
| Data Validation | Form validation layer |
| Worksheet Protection | Backend permission layer |

The architecture remains identical across platforms.

---

# Immutable Validation Principles

The following validation decisions are permanently frozen.

### Workbook Rules

- Helpers owns validation.
- Named ranges are reusable.
- Spill ranges are the default strategy.
- Dynamic validation references active entities only.

### Engineering Rules

- Business Engine never owns validation.
- Dashboard never owns validation.
- Insights never owns validation.

### Compatibility Rules

- Mobile compatibility is mandatory.
- Excel-first implementation is mandatory.
- No desktop-only validation behavior.

### Migration Rules

- Validation architecture is portable to React and backend APIs.
- Lookup ownership remains centralized.

---

# Version History

## Version 1.0 — Initial Freeze

The complete Validation & Helpers Architecture for FinanceOS Version 1 has been frozen.

This document defines lookup ownership, dynamic validation, named ranges, dependent dropdowns, validation testing standards, worksheet protection, migration mapping, and immutable validation rules.

---

**End of Document — DOC-014 Validation & Helpers Architecture Version 1.0**