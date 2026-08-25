# FinanceOS — Worksheet Specifications

**Document ID:** DOC-007

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Applies To:** FinanceOS Excel Workbook Version 1

**Last Updated:** 23 August 2026

---

# Purpose

This document is the **authoritative worksheet implementation specification** for FinanceOS Version 1.

It defines every worksheet, every Excel table, every validation dependency, every relationship, and every worksheet responsibility inside the workbook.

This is the document Cursor will use while implementing FinanceOS.

**Nothing inside the workbook should exist unless it is documented here.**

---

# Frozen Rules

This document is governed by:

* DOC-002 — Product Philosophy
* DOC-003 — Architecture Decisions
* DOC-004 — Engineering Standards
* DOC-005 — Version 1 Scope
* DOC-006 — Workbook Architecture

If this document conflicts with workbook implementation, **this document wins** until explicitly updated.

---

# Workbook Philosophy

FinanceOS is **not** an Excel spreadsheet.

FinanceOS is a **desktop-quality financial operating system built inside Microsoft Excel**.

Every worksheet behaves like a software module with one responsibility.

The workbook hides spreadsheet complexity behind a guided user experience.

---

# Workbook Layer Architecture

FinanceOS contains four logical layers.

## Layer 1 — Setup Layer

Responsible for workbook configuration.

Worksheets:

* Settings
* Categories
* Income Sources

Purpose:

Configure FinanceOS before financial data entry begins.

---

## Layer 2 — Financial Data Layer

Stores permanent financial entities.

Worksheets:

* Accounts
* Assets
* Liabilities
* Recurring Commitments
* Transactions
* Goals

Purpose:

Store user-owned financial information.

---

## Layer 3 — Engine Layer

Calculates financial outputs.

Worksheets:

* Helpers
* Business Engine
* Analysis Engine

Purpose:

Perform deterministic calculations and prepare reusable datasets.

---

## Layer 4 — Presentation Layer

Displays information.

Worksheets:

* Dashboard
* Insights

Purpose:

Present financial information through cards, charts, KPIs, and AI-style explanations.

---

# Workbook Navigation Map

FinanceOS guides users through a fixed workflow.

| Step | Worksheet             | User Purpose                                 |
| ---- | --------------------- | -------------------------------------------- |
| 1    | Settings              | Configure workbook preferences.              |
| 2    | Categories            | Define income and expense categories.        |
| 3    | Income Sources        | Define where income comes from.              |
| 4    | Accounts              | Add financial accounts.                      |
| 5    | Assets                | Add owned assets.                            |
| 6    | Liabilities           | Add debts and loans.                         |
| 7    | Recurring Commitments | Add recurring monthly obligations.           |
| 8    | Transactions          | Record financial activity.                   |
| 9    | Goals                 | Create savings goals.                        |
| 10   | Dashboard             | View complete financial overview.            |
| 11   | Insights              | Understand financial health and predictions. |

The navigation order is frozen.

---

# Workbook Directory

| Worksheet             | Layer        | Primary Owner | Editable |
| --------------------- | ------------ | ------------- | -------- |
| Settings              | Setup        | User          | Partial  |
| Categories            | Setup        | User          | Yes      |
| Income Sources        | Setup        | User          | Yes      |
| Accounts              | Data         | User          | Yes      |
| Assets                | Data         | User          | Yes      |
| Liabilities           | Data         | User          | Yes      |
| Recurring Commitments | Data         | User          | Yes      |
| Transactions          | Data         | User          | Yes      |
| Goals                 | Data         | User          | Yes      |
| Helpers               | Engine       | System        | No       |
| Business Engine       | Engine       | System        | No       |
| Analysis Engine       | Engine       | System        | No       |
| Dashboard             | Presentation | System        | Limited  |
| Insights              | Presentation | System        | No       |

---

# Global Worksheet Standards

These rules apply to every worksheet.

## Table Standards

Every structured dataset must use an Excel Table.

Reasons:

* Dynamic expansion.
* Structured references.
* Mobile compatibility.
* Cleaner formulas.

Loose ranges are prohibited for business entities.

---

## Stable IDs

Every business table begins with an immutable ID.

Examples:

* ACC-0001
* CAT-0001
* GOAL-0001
* TXN-000001
* LIA-0001

IDs never change after creation.

IDs are never reused.

---

## Required Column Order

Every business table follows this order.

1. Stable ID.
2. Primary Name.
3. Classification.
4. Dates.
5. Financial Values.
6. Relationships.
7. Status.
8. Notes.

This ordering is frozen.

---

## Protection Philosophy

| Content Type      | Editable |
| ----------------- | -------- |
| User Input        | Yes      |
| Lookup Metadata   | Limited  |
| Calculated Fields | No       |
| Helper Outputs    | No       |
| Engine Outputs    | No       |

Users edit business data only.

---

## Mobile Layout Standard

Every user-facing worksheet follows:

* One vertical scroll.
* Large dropdowns.
* Large input cells.
* Section cards.
* Minimal horizontal scrolling.

FinanceOS must remain usable inside Microsoft Excel Mobile.

---

## Desktop Layout Standard

Every worksheet contains five visual zones.

1. Header.
2. Section Title.
3. User Input Area.
4. Summary Area.
5. Footer / Version.

Every worksheet shares consistent spacing.

---

# Worksheet Specification Template

Every worksheet in this document follows the same specification.

1. Purpose.
2. Worksheet Ownership.
3. Primary Table.
4. Table Columns.
5. Validation Ownership.
6. Relationships.
7. Business Rules.
8. User Interaction.
9. Protection Rules.
10. Mobile Layout.
11. Cursor Implementation Notes.

This structure is mandatory.

---

# Worksheet 1 — Settings

## Purpose

The Settings worksheet stores global workbook configuration.

It controls workbook-wide behavior.

Only workbook preferences belong here.

---

## Worksheet Ownership

| Type              | Owner                     |
| ----------------- | ------------------------- |
| Business Owner    | FinanceOS Settings Module |
| Engineering Owner | Configuration Layer       |

---

## Primary Table

`tblSettings`

---

## Table Purpose

Stores global configuration values.

Exactly one configuration table exists.

---

## Table Columns

| Column           | Required | Editable | Description                            |
| ---------------- | -------- | -------- | -------------------------------------- |
| Setting ID       | Yes      | No       | Stable configuration ID.               |
| Setting Name     | Yes      | No       | Human-readable setting.                |
| Setting Value    | Yes      | Yes      | Current workbook value.                |
| Setting Category | Yes      | No       | Currency, Theme, Date, Dashboard, etc. |
| Description      | Yes      | No       | Explanation of setting.                |

---

## Initial Settings (Version 1)

| Setting              | Example           |
| -------------------- | ----------------- |
| Currency             | INR               |
| Financial Year Start | April             |
| Decimal Places       | 2                 |
| Date Format          | DD/MM/YYYY        |
| Dashboard Theme      | FinanceOS Default |

---

## Validation Ownership

All validations originate from Helpers.

Examples:

* Currency List.
* Month List.
* Theme List.

No hardcoded dropdown values.

---

## Relationships

Referenced by:

* Dashboard.
* Business Engine.
* Analysis Engine.

---

## Business Rules

* Exactly one value per setting.
* IDs are immutable.
* Formulas reference IDs instead of display names.
* New settings require architecture approval.

---

## User Interaction

User edits only the **Setting Value** column.

Everything else is protected.

---

## Protection Rules

| Section       | Editable |
| ------------- | -------- |
| Setting Value | Yes      |
| Metadata      | No       |
| IDs           | No       |

---

## Mobile Layout

Settings appear as stacked configuration cards.

One configuration item per row.

---

## Cursor Implementation Notes

* Create Excel Table `tblSettings`.
* Apply dropdown validation using Helpers.
* Protect non-editable columns.

---

# Worksheet 2 — Categories

## Purpose

Categories classify financial transactions.

Categories are shared across:

* Transactions.
* Budgets.
* Dashboard.
* Insights.
* Analysis Engine.

Categories are lookup entities, not financial records.

---

## Worksheet Ownership

| Type              | Owner             |
| ----------------- | ----------------- |
| Business Owner    | Categories Module |
| Engineering Owner | Lookup Layer      |

---

## Primary Table

`tblCategories`

---

## Table Columns

| Column          | Required | Editable | Description                    |
| --------------- | -------- | -------- | ------------------------------ |
| Category ID     | Yes      | No       | Stable category ID.            |
| Category Name   | Yes      | Yes      | Display name.                  |
| Category Type   | Yes      | Yes      | Income / Expense.              |
| Parent Category | No       | Yes      | Reserved for future hierarchy. |
| Status          | Yes      | Yes      | Active / Inactive.             |
| Display Order   | No       | Yes      | Dashboard ordering.            |
| Notes           | No       | Yes      | Optional notes.                |

---

## Validation Ownership

* Category Type.
* Status.

Source: Helpers worksheet.

---

## Relationships

Referenced by:

* Transactions.
* Dashboard.
* Business Engine.
* Analysis Engine.
* Insights.

---

## Business Rules

* Category names must be unique.
* Categories cannot be deleted once referenced.
* Inactive categories remain available for historical reporting.
* Parent Category is reserved for Version 2 hierarchy.

---

## User Interaction

Users manage categories directly.

Inactive categories disappear from transaction dropdowns while remaining in reports.

---

## Protection Rules

IDs protected.

Business columns editable.

---

## Mobile Layout

Simple editable table with large dropdowns.

---

## Cursor Implementation Notes

* Table name `tblCategories`.
* Dynamic validation list exported to Helpers.

---

# Worksheet 3 — Accounts

## Purpose

Accounts represent every place where money currently exists.

Accounts are financial resources.

Examples include:

* Bank Accounts.
* Cash.
* Wallets.
* UPI Accounts.
* Credit Card Accounts.
* Investment Cash Accounts.

---

## Worksheet Ownership

| Type              | Owner                     |
| ----------------- | ------------------------- |
| Business Owner    | Accounts Module           |
| Engineering Owner | Financial Resources Layer |

---

## Primary Table

`tblAccounts`

---

## Table Columns

| Column          | Required | Editable | Description                           |
| --------------- | -------- | -------- | ------------------------------------- |
| Account ID      | Yes      | No       | Stable account identifier.            |
| Account Name    | Yes      | Yes      | User-facing account name.             |
| Account Type    | Yes      | Yes      | Bank, Cash, Wallet, Credit Card, etc. |
| Institution     | No       | Yes      | Bank or provider.                     |
| Opening Balance | Yes      | Yes      | Initial balance entered once.         |
| Current Balance | No       | No       | Calculated from Business Engine.      |
| Currency        | Yes      | Yes      | Currency code.                        |
| Status          | Yes      | Yes      | Active / Closed.                      |
| Notes           | No       | Yes      | Optional notes.                       |

---

## Account Types (Version 1)

* Savings Bank
* Current Bank
* Cash
* Wallet
* UPI
* Credit Card
* Investment Account
* Other

---

## Validation Ownership

Helpers provides:

* Account Types.
* Currency.
* Status.

---

## Relationships

Referenced by:

* Transactions.
* Assets.
* Liabilities.
* Recurring Commitments.
* Dashboard.
* Business Engine.
* Analysis Engine.

---

## Business Rules

* Opening Balance entered once.
* Current Balance calculated.
* Closed accounts remain historically visible.
* Transactions cannot reference closed accounts for new entries.

---

## User Interaction

Users create accounts during onboarding.

Current Balance is read-only.

---

## Protection Rules

| Field           | Editable |
| --------------- | -------- |
| Opening Balance | Yes      |
| Current Balance | No       |
| ID              | No       |

---

## Mobile Layout

Accounts appear as balance cards showing:

* Balance.
* Account Type.
* Institution.
* Status.

---

## Cursor Implementation Notes

* Table name `tblAccounts`.
* Balance formulas belong to Business Engine.
* Validation references Helpers account list.

---

# Worksheet 4 — Income Sources

## Purpose

Income Sources classify where income originates.

This separates **income origin** from **transaction categories**.

Examples:

* Salary
* Freelance
* Bonus
* Rental Income
* Interest
* Cashback
* Refund
* Business Income

---

## Worksheet Ownership

| Type              | Owner                 |
| ----------------- | --------------------- |
| Business Owner    | Income Sources Module |
| Engineering Owner | Lookup Layer          |

---

## Primary Table

`tblIncomeSources`

---

## Table Columns

| Column                    | Required | Editable | Description                                |
| ------------------------- | -------- | -------- | ------------------------------------------ |
| Income Source ID          | Yes      | No       | Stable identifier.                         |
| Income Source Name        | Yes      | Yes      | Display name.                              |
| Income Category           | Yes      | Yes      | Salary, Business, Investment, Refund, etc. |
| Default Receiving Account | No       | Yes      | Suggested receiving account.               |
| Status                    | Yes      | Yes      | Active / Inactive.                         |
| Notes                     | No       | Yes      | Optional notes.                            |

---

## Validation Ownership

Helpers provides:

* Income Categories.
* Active Accounts.
* Status.

---

## Relationships

Referenced by:

* Transactions.
* Dashboard.
* Business Engine.
* Analysis Engine.

---

## Business Rules

* Income Source names must be unique.
* Income Sources are never deleted.
* Inactive sources remain available historically.
* Default Receiving Account is optional.

---

## User Interaction

Users define all recurring income sources once.

Transactions select from this list.

---

## Protection Rules

IDs protected.

Business fields editable.

---

## Mobile Layout

Simple editable list with touch-friendly dropdowns.

---

## Cursor Implementation Notes

* Table name `tblIncomeSources`.
* Export active income sources to Helpers validation list.

---

# End of Part A

This section freezes:

* Workbook foundation.
* Global worksheet standards.
* Settings worksheet.
* Categories worksheet.
* Accounts worksheet.
* Income Sources worksheet.

The next section (Part B) defines the complete specifications for **Assets, Liabilities, and Recurring Commitments**.


---

# Worksheet 5 — Assets

## Purpose

The Assets worksheet records every financial and physical asset owned by the user.

Assets contribute directly to Net Worth calculations and long-term wealth tracking.

Assets are **ownership records**, not transaction records.

Every purchase or sale is recorded in **Transactions**. The Assets worksheet stores the current state of ownership.

---

## Worksheet Ownership

| Type              | Owner           |
| ----------------- | --------------- |
| Business Owner    | Assets Module   |
| Engineering Owner | Net Worth Layer |

---

## Primary Table

`tblAssets`

---

## Asset Architecture (Frozen)

FinanceOS separates **Asset Category** and **Asset Type**.

### Why?

Category groups assets broadly for reporting.

Type provides detailed classification.

Example:

| Asset Category | Asset Type           |
| -------------- | -------------------- |
| Investment     | Mutual Fund          |
| Investment     | Gold ETF             |
| Investment     | Stock                |
| Physical Asset | Gold Jewellery       |
| Physical Asset | Vehicle              |
| Physical Asset | Electronics          |
| Property       | Residential Property |
| Property       | Commercial Property  |

This separation is permanent.

---

## Supported Asset Categories (Version 1)

* Investment
* Physical Asset
* Property
* Retirement Asset
* Cash Equivalent
* Other Asset

---

## Supported Asset Types (Version 1)

### Investment

* Mutual Fund
* Stock
* ETF
* Gold ETF
* Bond
* SIP
* Fixed Deposit
* PPF
* EPF
* NPS

### Physical Asset

* Gold Jewellery
* Gold Coin
* Vehicle
* Electronics
* Furniture
* Watch
* Other Physical Asset

### Property

* Residential Property
* Commercial Property
* Land
* Plot

### Cash Equivalent

* Emergency Cash
* Foreign Currency
* Cash Reserve

---

## Table Columns

| Column              | Required | Editable | Description                                      |
| ------------------- | -------- | -------- | ------------------------------------------------ |
| Asset ID            | Yes      | No       | Stable asset identifier.                         |
| Asset Name          | Yes      | Yes      | User-facing asset name.                          |
| Asset Category      | Yes      | Yes      | Investment, Property, Physical Asset, etc.       |
| Asset Type          | Yes      | Yes      | Mutual Fund, Vehicle, Gold Jewellery, etc.       |
| Linked Account      | No       | Yes      | Optional account used to purchase or hold asset. |
| Purchase Date       | No       | Yes      | Acquisition date.                                |
| Purchase Value      | Yes      | Yes      | Original acquisition amount.                     |
| Current Value       | Yes      | Yes      | Latest estimated value.                          |
| Appreciation Amount | No       | No       | Calculated gain/loss amount.                     |
| Appreciation %      | No       | No       | Calculated appreciation percentage.              |
| Ownership Type      | Yes      | Yes      | Individual / Joint.                              |
| Status              | Yes      | Yes      | Active / Sold / Closed.                          |
| Notes               | No       | Yes      | Optional notes.                                  |

---

## Validation Ownership

Helpers provides:

* Asset Categories.
* Asset Types.
* Account List.
* Ownership Types.
* Status List.

---

## Relationships

Referenced by:

* Transactions.
* Business Engine.
* Analysis Engine.
* Dashboard.
* Insights.

---

## Business Rules

### Rule 1 — Assets Are Never Transactions

Assets store ownership.

Transactions store financial activity.

### Rule 2 — Current Value Is Editable

Version 1 does not fetch market prices.

Users update Current Value manually.

### Rule 3 — Appreciation Is Calculated

Business Engine calculates:

Current Value minus Purchase Value.

### Rule 4 — Sold Assets Stay Forever

Historical ownership is preserved.

Status changes to **Sold**.

No deletion.

### Rule 5 — Linked Account Is Optional

Useful for:

* Fixed Deposits.
* Mutual Funds.
* Gold Purchases.
* Investment Accounts.

---

## User Interaction

Users create an asset once.

Later they update:

* Current Value.
* Status.
* Notes.

Purchase Value remains historical.

---

## Protection Rules

| Field               | Editable |
| ------------------- | -------- |
| Asset ID            | No       |
| Appreciation Amount | No       |
| Appreciation %      | No       |
| Current Value       | Yes      |
| Status              | Yes      |

---

## Mobile Layout

Each asset appears as a wealth card.

Shows:

* Asset Name.
* Current Value.
* Gain/Loss.
* Category Badge.
* Status Badge.

---

## Cursor Implementation Notes

* Create `tblAssets`.
* Create validation using Helpers.
* Appreciation formulas belong in Business Engine.
* Dashboard consumes Business Engine outputs only.

---

# Worksheet 6 — Liabilities

## Purpose

The Liabilities worksheet stores every debt obligation owned by the user.

Liabilities reduce Net Worth and generate recurring financial commitments.

---

## Worksheet Ownership

| Type              | Owner                 |
| ----------------- | --------------------- |
| Business Owner    | Liabilities Module    |
| Engineering Owner | Debt Management Layer |

---

## Primary Table

`tblLiabilities`

---

## Liability Architecture (Frozen)

A liability represents:

* Original Debt.
* Current Outstanding Balance.
* EMI Information.
* Repayment Lifecycle.

Recurring Commitments references liabilities.

Transactions record liability payments.

---

## Supported Liability Types

* Home Loan
* Personal Loan
* Education Loan
* Vehicle Loan
* Gold Loan
* Credit Card
* Buy Now Pay Later
* Family Loan
* Business Loan
* Other Liability

---

## Table Columns

| Column                 | Required | Editable | Description                              |
| ---------------------- | -------- | -------- | ---------------------------------------- |
| Liability ID           | Yes      | No       | Stable identifier.                       |
| Liability Name         | Yes      | Yes      | User-facing liability name.              |
| Liability Type         | Yes      | Yes      | Loan classification.                     |
| Institution            | Yes      | Yes      | Bank or lender.                          |
| Original Amount        | Yes      | Yes      | Original borrowed amount.                |
| Outstanding Balance    | Yes      | Yes      | Remaining amount owed.                   |
| Interest Rate          | No       | Yes      | Annual interest percentage.              |
| EMI Amount             | Yes      | Yes      | Regular payment amount.                  |
| EMI Frequency          | Yes      | Yes      | Monthly, Quarterly, Half-Yearly, Yearly. |
| EMI Due Day            | Yes      | Yes      | Day of payment cycle.                    |
| Start Date             | Yes      | Yes      | Loan start date.                         |
| End Date               | No       | Yes      | Planned completion date.                 |
| Linked Payment Account | No       | Yes      | Payment account.                         |
| Auto EMI               | Yes      | Yes      | Yes / No.                                |
| Status                 | Yes      | Yes      | Active / Closed / Paused.                |
| Notes                  | No       | Yes      | Optional notes.                          |

---

## Validation Ownership

Helpers provides:

* Liability Types.
* Accounts.
* Frequency.
* Yes / No.
* Status.

---

## Relationships

Referenced by:

* Transactions.
* Recurring Commitments.
* Business Engine.
* Dashboard.
* Analysis Engine.
* Insights.

---

## Business Rules

### Rule 1 — Outstanding Balance Is User Maintained

Version 1 does not automatically amortize loans.

Users update principal reductions when required.

### Rule 2 — EMI Frequency Drives Recurring Commitments

Business Engine generates commitment schedules.

### Rule 3 — Auto EMI Creates Commitment

If enabled:

Recurring Commitments recognizes liability automatically.

### Rule 4 — Closed Liabilities Stay Forever

Historical reporting requires permanent records.

### Rule 5 — Credit Cards Are Liabilities

Outstanding credit card balance is tracked here.

Credit card purchases remain Transactions.

---

## User Interaction

Users maintain:

* Outstanding Balance.
* EMI.
* Status.

Everything else remains historical.

---

## Protection Rules

| Field               | Editable |
| ------------------- | -------- |
| Liability ID        | No       |
| EMI Amount          | Yes      |
| Outstanding Balance | Yes      |
| Status              | Yes      |

---

## Mobile Layout

Liability cards display:

* Outstanding Balance.
* EMI.
* Due Date.
* Remaining Timeline.
* Status.

---

## Cursor Implementation Notes

* Create `tblLiabilities`.
* Frequency validation from Helpers.
* Outstanding calculations belong in Business Engine.

---

# Worksheet 7 — Recurring Commitments

## Purpose

Recurring Commitments stores every scheduled future financial obligation.

It powers monthly cash flow forecasting.

This worksheet represents **planned payments**, not historical payments.

---

## Worksheet Ownership

| Type              | Owner                        |
| ----------------- | ---------------------------- |
| Business Owner    | Recurring Commitments Module |
| Engineering Owner | Cash Flow Layer              |

---

## Primary Table

`tblRecurringCommitments`

---

## Commitment Architecture (Frozen)

Recurring commitments can originate from:

* Liabilities.
* Subscriptions.
* Utilities.
* Insurance.
* Savings Goals.
* Investments.
* Manual recurring expenses.

---

## Supported Commitment Types

* EMI
* Rent
* Subscription
* Insurance
* Utility
* SIP
* Goal Contribution
* Savings Transfer
* Membership
* Investment Contribution
* Other Commitment

---

## Table Columns

| Column              | Required | Editable | Description                              |
| ------------------- | -------- | -------- | ---------------------------------------- |
| Commitment ID       | Yes      | No       | Stable identifier.                       |
| Commitment Name     | Yes      | Yes      | User-facing commitment.                  |
| Commitment Type     | Yes      | Yes      | Commitment classification.               |
| Linked Liability ID | No       | Yes      | Optional liability relationship.         |
| Linked Goal ID      | No       | Yes      | Optional goal relationship.              |
| Payment Account     | Yes      | Yes      | Account used for payment.                |
| Amount              | Yes      | Yes      | Scheduled payment amount.                |
| Frequency           | Yes      | Yes      | Monthly, Quarterly, Half-Yearly, Yearly. |
| Due Day             | Yes      | Yes      | Scheduled payment day.                   |
| Start Date          | Yes      | Yes      | First payment date.                      |
| End Date            | No       | Yes      | Final scheduled payment.                 |
| Auto Generate       | Yes      | Yes      | Yes / No.                                |
| Status              | Yes      | Yes      | Active / Paused / Completed.             |
| Notes               | No       | Yes      | Optional notes.                          |

---

## Validation Ownership

Helpers provides:

* Commitment Types.
* Accounts.
* Goals.
* Liabilities.
* Frequency.
* Status.
* Yes / No.

---

## Relationships

Referenced by:

* Dashboard.
* Business Engine.
* Analysis Engine.
* Insights.
* Monthly Forecast.

---

## Business Rules

### Rule 1 — Commitments Represent Future Payments

Transactions represent completed payments.

### Rule 2 — Goal Contributions Are Supported

Recurring monthly savings into goals.

### Rule 3 — Liability Payments Can Be Linked

EMI commitments connect to liabilities.

### Rule 4 — Frequency Controls Forecasts

Business Engine generates monthly forecasts.

### Rule 5 — Auto Generate Participates In Cash Flow

Disabled commitments remain informational.

### Rule 6 — Completed Commitments Stay Historically

Status changes.

Records remain.

---

## User Interaction

Users create commitments once.

FinanceOS forecasts upcoming obligations.

---

## Protection Rules

| Field         | Editable |
| ------------- | -------- |
| Commitment ID | No       |
| Amount        | Yes      |
| Frequency     | Yes      |
| Status        | Yes      |

---

## Mobile Layout

Payment cards show:

* Amount.
* Due Day.
* Frequency.
* Linked Goal or Liability.
* Status Badge.

---

## Cursor Implementation Notes

* Create `tblRecurringCommitments`.
* Validation sourced from Helpers.
* Forecast calculations belong to Business Engine.

---

# Cross-Worksheet Relationship Summary (Part B)

| Worksheet             | Referenced By                                             |
| --------------------- | --------------------------------------------------------- |
| Assets                | Transactions, Business Engine, Dashboard, Analysis Engine |
| Liabilities           | Transactions, Commitments, Dashboard, Analysis Engine     |
| Recurring Commitments | Dashboard, Business Engine, Analysis Engine, Insights     |

---

# End of Part B

This section freezes the three major financial resource worksheets:

* Assets
* Liabilities
* Recurring Commitments

The next section (Part C) defines the **Transactions worksheet**, which is the core ledger of FinanceOS, followed by the complete **Goals worksheet** specification.


---

# Worksheet 8 — Transactions

## Purpose

The **Transactions** worksheet is the **single financial activity ledger** of FinanceOS.

Every movement of money is recorded here exactly once.

This worksheet becomes the source of truth for:

* Cash Flow
* Income Tracking
* Expense Tracking
* Account Balances
* Goal Contributions
* Liability Payments
* Investment Purchases
* Dashboard KPIs
* Financial Insights
* Forecasting & Simulations

No financial activity should exist outside this worksheet.

---

## Worksheet Ownership

| Type              | Owner                    |
| ----------------- | ------------------------ |
| Business Owner    | Transactions Module      |
| Engineering Owner | Financial Activity Layer |

---

## Primary Table

`tblTransactions`

---

# Transaction Architecture (Frozen)

FinanceOS uses a **unified transaction model**.

Every transaction answers three questions:

1. Where did the money come from?
2. Where did the money go?
3. Why did the money move?

Instead of multiple transaction tables, Version 1 stores every activity in one standardized table.

---

# Supported Transaction Types

FinanceOS Version 1 supports exactly four transaction types.

| Transaction Type | Purpose                            |
| ---------------- | ---------------------------------- |
| Income           | Money enters FinanceOS.            |
| Expense          | Money leaves FinanceOS.            |
| Transfer         | Money moves between user accounts. |
| Adjustment       | Manual balance correction.         |

No additional transaction types exist in Version 1.

---

# Transaction Flow

| Type       | Source Account  | Destination                                      |
| ---------- | --------------- | ------------------------------------------------ |
| Income     | External Source | User Account                                     |
| Expense    | User Account    | Expense Category / Goal / Liability / Investment |
| Transfer   | User Account    | User Account                                     |
| Adjustment | User Account    | User Account (manual correction)                 |

This flow is immutable.

---

# Destination Type Model (Frozen)

Destination Type controls which entity receives the transaction.

| Destination Type | Destination Name References    |
| ---------------- | ------------------------------ |
| Expense Category | Expense Categories             |
| Income Category  | Income Categories              |
| Account          | Accounts                       |
| Goal             | Goals                          |
| Liability        | Liabilities                    |
| Investment       | Assets                         |
| Other            | Reserved free-text destination |

This architecture powers dynamic dropdown validation.

---

# Primary Table Columns

| Column             | Required    | Editable | Description                               |
| ------------------ | ----------- | -------- | ----------------------------------------- |
| Transaction ID     | Yes         | No       | Stable transaction identifier.            |
| Transaction Date   | Yes         | Yes      | Date of transaction.                      |
| Transaction Type   | Yes         | Yes      | Income, Expense, Transfer, Adjustment.    |
| Source Account     | Yes         | Yes      | Account money originates from.            |
| Destination Type   | Yes         | Yes      | Entity receiving money.                   |
| Destination Name   | Yes         | Yes      | Dynamic lookup based on Destination Type. |
| Category           | Conditional | Yes      | Income or Expense category.               |
| Income Source      | Conditional | Yes      | Income origin (Salary, Freelance, etc.).  |
| Amount             | Yes         | Yes      | Transaction amount.                       |
| Payment Method     | Yes         | Yes      | Cash, Bank, UPI, Card, Wallet, etc.       |
| Transaction Status | Yes         | Yes      | Completed / Pending / Cancelled.          |
| Notes              | No          | Yes      | Optional description.                     |
| Created Timestamp  | No          | No       | Future metadata field.                    |

---

# Category Architecture

## Income Transactions

Income transactions require:

* Income Source.
* Income Category.

Example:

| Field         | Value         |
| ------------- | ------------- |
| Income Source | Salary        |
| Category      | Salary Income |

---

## Expense Transactions

Expense transactions require Expense Category only.

Example:

| Field    | Value         |
| -------- | ------------- |
| Category | Food & Dining |

---

## Transfer Transactions

Category is blank.

Transfers are excluded from spending analytics.

---

## Adjustment Transactions

Category optional.

Used only for manual reconciliation.

---

# Income Source Rules

Income Source is required only for Income transactions.

Examples:

* Salary
* Freelance
* Bonus
* Cashback
* Refund
* Rental Income
* Interest
* Business Income

Income Sources come from `tblIncomeSources`.

---

# Source Account Rules

Every transaction must have one Source Account.

Examples:

| Transaction         | Source Account    |
| ------------------- | ----------------- |
| Grocery             | HDFC Savings      |
| Netflix             | SBI Savings       |
| Salary              | External Employer |
| Transfer            | ICICI Savings     |
| Credit Card Payment | HDFC Savings      |

Transfers always originate from an account.

---

# Destination Rules

## Expense Transaction

Destination Type:

Expense Category

Destination Name:

Food & Dining, Shopping, Utilities, etc.

---

## Income Transaction

Destination Type:

Income Category

Destination Name:

Salary Income, Freelance Income, Business Income, etc.

---

## Transfer Transaction

Destination Type:

Account

Destination Name:

Receiving account.

Transfers never affect Income or Expense totals.

---

## Goal Contribution

Destination Type:

Goal

Destination Name:

Emergency Fund, Bike Fund, Home Fund, etc.

Business Engine increases Goal Savings.

---

## Liability Payment

Destination Type:

Liability

Destination Name:

Education Loan, Home Loan, Credit Card, etc.

Business Engine measures debt repayment.

---

## Investment Purchase

Destination Type:

Investment

Destination Name:

Gold, Mutual Fund, SIP, Stock, Fixed Deposit.

Cash decreases.

Asset ownership increases.

---

# Payment Method

Version 1 supports:

* Cash
* Bank Transfer
* UPI
* Debit Card
* Credit Card
* Wallet
* Net Banking
* Auto Debit
* Other

Payment Method is informational only.

---

# Transaction Status

Version 1 supports:

* Completed
* Pending
* Cancelled

Dashboard excludes Cancelled transactions.

Pending transactions appear in Forecasts.

---

# Validation Ownership

Helpers generates dynamic validation lists.

| Field              | Validation Source          |
| ------------------ | -------------------------- |
| Transaction Type   | Transaction Type List      |
| Source Account     | Active Accounts            |
| Destination Type   | Destination Type List      |
| Destination Name   | Dynamic Validation Formula |
| Category           | Dynamic Category List      |
| Income Source      | Active Income Sources      |
| Payment Method     | Payment Method List        |
| Transaction Status | Status List                |

No hardcoded dropdowns.

---

# Dynamic Validation Flow

Destination Name validation changes automatically.

Expense Category → Expense Categories

Income Category → Income Categories

Account → Active Accounts

Goal → Active Goals

Liability → Active Liabilities

Investment → Active Assets

This logic is owned entirely by Helpers.

---

# Business Rules

## Rule 1 — Every Transaction Has One Source Account

No orphan transactions.

---

## Rule 2 — Transfers Never Affect Spending

Transfers move balances only.

---

## Rule 3 — Goal Contributions Count As Savings

Cash leaves account.

Goal balance increases.

Net Worth remains unchanged.

---

## Rule 4 — Liability Payments Reduce Cash

Outstanding Balance is maintained separately.

---

## Rule 5 — Investment Purchases Convert Cash Into Assets

Cash decreases.

Asset increases.

Net Worth unchanged at purchase.

---

## Rule 6 — Credit Card Purchases

Purchases:

Expense Transaction.

Payments:

Transfer to Liability.

No duplicate spending.

---

## Rule 7 — Refund Transactions

Refunds use:

Transaction Type = Income.

Income Source = Refund.

Category = Refund Income.

---

## Rule 8 — Cashback Transactions

Income transaction.

Income Source = Cashback.

---

## Rule 9 — Adjustments

Used only for reconciliation.

Hidden from spending analytics.

---

# User Interaction Flow

User selects:

1. Transaction Type.
2. Source Account.
3. Destination Type.
4. Destination Name.
5. Category.
6. Amount.
7. Payment Method.
8. Notes.

Dropdowns update dynamically.

---

# Protection Rules

| Field          | Editable |
| -------------- | -------- |
| Transaction ID | No       |
| Timestamp      | No       |
| User Fields    | Yes      |

---

# Mobile Layout

Transaction Entry Card

Displays:

* Date
* Amount
* Transaction Type
* Source Account
* Destination
* Category
* Payment Method

Large touch-friendly controls.

---

## Cursor Implementation Notes

* Create `tblTransactions`.
* Dynamic validation driven by Helpers.
* No formulas inside transaction table except metadata.
* Current Balance updates through Business Engine only.

---

# Worksheet 9 — Goals

## Purpose

Goals allow users to plan and save toward future financial objectives.

Goals connect financial planning with transaction history and future forecasting.

---

## Worksheet Ownership

| Type              | Owner          |
| ----------------- | -------------- |
| Business Owner    | Goals Module   |
| Engineering Owner | Planning Layer |

---

## Primary Table

`tblGoals`

---

# Goal Architecture (Frozen)

A Goal contains:

* Target Amount.
* Saved Amount.
* Forecast Completion.
* Priority.
* Monthly Contribution Target.
* Linked Savings Account.

Transactions contribute toward Goals.

Business Engine measures progress.

Analysis Engine predicts completion.

---

# Supported Goal Categories

* Emergency Fund
* Bike
* Car
* Home
* Education
* Wedding
* Travel
* Gold
* Electronics
* Business
* Other

---

# Goal Priority Levels

* High
* Medium
* Low

Used by Dashboard ordering.

---

# Goal Status

* Active
* Paused
* Completed
* Archived

Archived goals remain historically visible.

---

# Table Columns

| Column                      | Required | Editable | Description                          |
| --------------------------- | -------- | -------- | ------------------------------------ |
| Goal ID                     | Yes      | No       | Stable identifier.                   |
| Goal Name                   | Yes      | Yes      | User-facing goal name.               |
| Goal Category               | Yes      | Yes      | Goal classification.                 |
| Goal Account                | No       | Yes      | Account holding goal savings.        |
| Target Amount               | Yes      | Yes      | Savings target.                      |
| Current Saved Amount        | No       | No       | Calculated from transactions.        |
| Remaining Amount            | No       | No       | Calculated remaining savings.        |
| Monthly Contribution Target | No       | Yes      | Planned monthly savings.             |
| Target Date                 | No       | Yes      | Desired completion date.             |
| Priority                    | Yes      | Yes      | High, Medium, Low.                   |
| Goal Status                 | Yes      | Yes      | Active, Paused, Completed, Archived. |
| Notes                       | No       | Yes      | Optional notes.                      |

---

# Validation Ownership

Helpers provides:

* Goal Categories.
* Accounts.
* Priority.
* Status.

---

# Relationships

Referenced by:

* Transactions.
* Recurring Commitments.
* Dashboard.
* Business Engine.
* Analysis Engine.
* Insights.

---

# Business Rules

## Rule 1 — Goal Savings Come From Transactions

Users never edit Current Saved Amount.

---

## Rule 2 — Goal Account Is Optional

Useful when savings remain inside one account.

---

## Rule 3 — Goal Completion

Completed automatically when:

Saved Amount ≥ Target Amount.

---

## Rule 4 — Archived Goals Stay Historically

No deletion.

---

## Rule 5 — Monthly Contribution Target Drives Forecasts

Business Engine calculates expected completion.

---

# Business Engine Outputs

Calculates:

* Saved Amount.
* Remaining Amount.
* Completion Percentage.
* Funding Gap.
* Required Monthly Contribution.
* Estimated Completion Month.

---

# Analysis Engine Outputs

Calculates:

* Goal Delay.
* Goal Acceleration.
* Savings Momentum.
* Missed Contributions.
* Forecast Confidence.

---

# Dashboard Outputs

Displays:

* Progress Ring.
* Saved Amount.
* Remaining Amount.
* Priority Badge.
* Estimated Completion Month.

---

# User Interaction

Users create goals once.

Transactions contribute automatically.

---

# Protection Rules

| Field                 | Editable |
| --------------------- | -------- |
| Goal ID               | No       |
| Current Saved Amount  | No       |
| Remaining Amount      | No       |
| Completion Percentage | No       |

---

# Mobile Layout

Goal cards display:

* Progress Ring.
* Target Amount.
* Saved Amount.
* Remaining Amount.
* Monthly Contribution.
* Target Date.

Designed for vertical scrolling.

---

## Cursor Implementation Notes

* Create `tblGoals`.
* Saved Amount comes from Business Engine.
* Dashboard never calculates goal totals directly.

---

# Cross-Worksheet Relationship Summary (Part C)

| Worksheet    | Referenced By                                                                     |
| ------------ | --------------------------------------------------------------------------------- |
| Transactions | Accounts, Assets, Liabilities, Goals, Dashboard, Business Engine, Analysis Engine |
| Goals        | Transactions, Recurring Commitments, Dashboard, Analysis Engine, Insights         |

---

# End of Part C

This section freezes the two most important business worksheets:

* Transactions
* Goals

The next section (Part D) defines the engineering worksheets:

* Helpers
* Business Engine
* Analysis Engine

These worksheets power every calculation inside FinanceOS.


---

# Worksheet 10 — Helpers

## Purpose

The **Helpers** worksheet is the internal utility worksheet of FinanceOS.

It powers:

* Dropdown validations.
* Dynamic validation lists.
* Lookup tables.
* Intermediate formula outputs.
* Named ranges.
* Helper calculations.

It is **not** a financial worksheet.

Users should never interact with this worksheet directly.

---

## Worksheet Ownership

| Type              | Owner                     |
| ----------------- | ------------------------- |
| Business Owner    | Engineering Layer         |
| Engineering Owner | Validation & Helper Layer |

---

## Worksheet Visibility

| Property     | Value                      |
| ------------ | -------------------------- |
| User Visible | No (Hidden or Very Hidden) |
| Editable     | No                         |
| Protected    | Yes                        |

The worksheet is hidden from normal user navigation.

---

# Helper Architecture (Frozen)

Helpers is divided into logical sections.

| Section          | Purpose                               |
| ---------------- | ------------------------------------- |
| Validation Lists | Dropdown sources.                     |
| Lookup Outputs   | Dynamic filtered lists.               |
| Calendar Helpers | Months, years, dates.                 |
| Status Lists     | Active / Closed / Paused etc.         |
| Category Lists   | Income and Expense categories.        |
| Entity Lists     | Accounts, Goals, Liabilities, Assets. |
| Constants        | Static workbook values.               |

No business calculations belong here.

---

## Validation Lists

### Transaction Validation

Produces:

* Transaction Types.
* Destination Types.
* Payment Methods.
* Transaction Status.

Used by Transactions worksheet.

---

### Category Validation

Produces:

* Expense Categories.
* Income Categories.

Dynamic FILTER outputs from Categories table.

---

### Account Validation

Produces:

* Active Accounts.
* Savings Accounts.
* Credit Card Accounts.
* Investment Accounts.

Used across multiple worksheets.

---

### Goal Validation

Produces Active Goals.

Paused and Archived goals excluded.

---

### Liability Validation

Produces Active Liabilities.

Closed liabilities excluded.

---

### Asset Validation

Produces Active Assets.

Sold assets excluded.

---

### Commitment Validation

Produces Commitment Types.

Frequency Lists.

Status Lists.

---

### Settings Validation

Produces:

* Currency List.
* Theme List.
* Month List.
* Priority List.

---

## Calendar Helper Section

Provides reusable calendar outputs.

Includes:

* Month Numbers.
* Month Names.
* Quarter Labels.
* Financial Year Labels.
* Financial Month Order.

Used by Dashboard and Business Engine.

---

## Constants Section

Stores reusable workbook constants.

Examples:

* Health Score thresholds.
* Emergency Fund thresholds.
* Savings Rate thresholds.
* Insight severity limits.

These values are documented and protected.

---

## Named Range Ownership

Helpers owns workbook named ranges.

Examples:

| Named Range         | Source                |
| ------------------- | --------------------- |
| nrActiveAccounts    | Active Accounts       |
| nrExpenseCategories | Expense Category List |
| nrIncomeCategories  | Income Category List  |
| nrGoals             | Active Goals          |
| nrLiabilities       | Active Liabilities    |
| nrAssets            | Active Assets         |
| nrMonths            | Month List            |
| nrCurrencies        | Currency List         |

No other worksheet creates validation named ranges.

---

## Formula Standards

Helpers uses only:

* FILTER
* SORT
* UNIQUE
* LET
* IFERROR
* Structured References

No volatile formulas unless approved.

---

## Protection Rules

Everything protected.

No editable cells.

---

## Cursor Implementation Notes

* Create worksheet last before engines.
* Hide worksheet.
* Generate all validation named ranges here.

---

# Worksheet 11 — Business Engine

## Purpose

Business Engine is the deterministic financial calculation engine.

It transforms user data into reusable financial metrics.

Business Engine owns **calculations only**.

No presentation logic belongs here.

---

## Worksheet Ownership

| Type              | Owner             |
| ----------------- | ----------------- |
| Business Owner    | Financial Engine  |
| Engineering Owner | Calculation Layer |

---

## Worksheet Visibility

Protected.

Read-only.

---

# Business Engine Architecture (Frozen)

Inputs flow in from Data Layer.

Outputs flow out to Dashboard and Analysis Engine.

Data never flows backward.

---

## Input Sources

Reads from:

* Settings
* Categories
* Accounts
* Income Sources
* Assets
* Liabilities
* Recurring Commitments
* Transactions
* Goals

No manual inputs.

---

# Output Modules

---

## Module 1 — Cash Flow Engine

Calculates:

* Monthly Income.
* Monthly Expense.
* Monthly Savings.
* Monthly Surplus.
* Savings Rate.
* Fixed Commitments.
* Variable Spending.
* Available Cash After Commitments.
* Expected Closing Balance.

Output consumed by Dashboard.

---

## Module 2 — Account Engine

Calculates:

* Current Account Balance.
* Total Cash Balance.
* Cash by Institution.
* Cash by Account Type.
* Active Account Count.

Updates every account automatically.

---

## Module 3 — Asset Engine

Calculates:

* Total Asset Value.
* Investment Value.
* Property Value.
* Physical Asset Value.
* Retirement Asset Value.
* Appreciation Amount.
* Appreciation Percentage.

Outputs investment allocation.

---

## Module 4 — Liability Engine

Calculates:

* Outstanding Debt.
* Total EMI.
* EMI Due This Month.
* Remaining EMI Months.
* Debt Distribution.
* Debt Burden.
* Liability Completion Progress.

---

## Module 5 — Goal Engine

Calculates:

* Saved Amount.
* Remaining Amount.
* Goal Completion %.
* Goal Funding Gap.
* Monthly Required Contribution.
* Estimated Completion Month.
* Active Goal Count.

---

## Module 6 — Commitment Engine

Calculates:

* Upcoming Monthly Commitments.
* Quarterly Commitments.
* Yearly Commitments.
* Total Fixed Commitments.
* Next Payment Date.
* Upcoming Payment Count.

---

## Module 7 — Net Worth Engine

Calculates:

Total Assets − Total Liabilities

Outputs:

* Current Net Worth.
* Previous Month Net Worth.
* Monthly Change.
* Annual Change.
* Net Worth Growth %.

---

## Module 8 — Budget Engine

Calculates spending summaries.

Outputs:

* Category Spend.
* Monthly Spend.
* Remaining Budget.
* Overspending Categories.
* Budget Utilization %.

Version 1 budget calculations remain deterministic.

---

## Output Ownership Matrix

| Module      | Used By                    |
| ----------- | -------------------------- |
| Cash Flow   | Dashboard, Analysis Engine |
| Accounts    | Dashboard                  |
| Assets      | Dashboard, Analysis Engine |
| Liabilities | Dashboard, Insights        |
| Goals       | Dashboard, Insights        |
| Commitments | Dashboard, Forecast        |
| Net Worth   | Dashboard, Insights        |
| Budget      | Dashboard, Insights        |

---

## Formula Standards

Allowed:

* SUMIFS
* COUNTIFS
* XLOOKUP
* LET
* FILTER
* IFERROR
* MAP/BYROW only if Excel Mobile compatible.

No VBA.

No Power Query.

No Office Scripts.

---

## Protection Rules

Entire worksheet protected.

Outputs only.

---

## Cursor Implementation Notes

* Create grouped calculation blocks.
* Each module has its own section.
* Dashboard references modules, not raw tables.

---

# Worksheet 12 — Analysis Engine

## Purpose

Analysis Engine converts Business Engine outputs into financial intelligence.

It explains financial health without changing underlying calculations.

Analysis Engine owns:

* Interpretation.
* Forecasts.
* Scores.
* Deterministic predictions.

---

## Worksheet Ownership

| Type              | Owner                 |
| ----------------- | --------------------- |
| Business Owner    | Analysis Layer        |
| Engineering Owner | Interpretation Engine |

---

## Worksheet Visibility

Hidden.

Protected.

Read-only.

---

# Analysis Architecture (Frozen)

Analysis Engine consumes Business Engine outputs.

Produces reusable insight datasets.

Dashboard and Insights never calculate analysis independently.

---

## Module 1 — Financial Health Engine

Calculates:

* Financial Health Score.
* Savings Score.
* Debt Score.
* Emergency Fund Score.
* Cash Flow Score.
* Investment Score.

Outputs 0–100 score.

---

## Module 2 — Spending Intelligence

Calculates:

* Top Spending Categories.
* Spending Trend.
* Monthly Comparison.
* Largest Expense.
* Subscription Growth.
* Spending Momentum.

---

## Module 3 — Income Intelligence

Calculates:

* Income Stability.
* Income Growth.
* Income Distribution.
* Income Concentration.
* Recurring vs Non-recurring Income.

---

## Module 4 — Goal Intelligence

Calculates:

* Goal Delay.
* Goal Acceleration.
* Contribution Consistency.
* Funding Gap.
* Goal Completion Forecast.

---

## Module 5 — Liability Intelligence

Calculates:

* Debt-to-Income Ratio.
* EMI Burden.
* Liability Payoff Progress.
* Remaining Payoff Duration.

---

## Module 6 — Emergency Fund Intelligence

Calculates:

* Emergency Fund Coverage Months.
* Emergency Fund Gap.
* Recommended Emergency Target.
* Progress Toward Target.

---

## Module 7 — Survival Prediction Engine

FinanceOS flagship deterministic prediction.

Calculates:

* Survival Months.
* Income Stop Simulation.
* Emergency Exhaustion Date.
* Minimum Monthly Survival Cost.
* Cash Burn Rate.
* Remaining Safe Days.

Outputs deterministic runway prediction.

Example output:

> "You have approximately 4.3 months of financial runway if income stops today."

---

## Module 8 — Purchase Affordability Engine

Inputs:

* Purchase Amount.
* Available Cash.
* Emergency Reserve.
* Goal Priorities.

Outputs:

* Safe Purchase.
* Caution Purchase.
* High Risk Purchase.

Provides affordability reasoning.

---

## Module 9 — Monthly Forecast Engine

Projects:

* Expected Income.
* Expected Expenses.
* Expected Savings.
* Expected Closing Balance.
* Expected Goal Contributions.

Based entirely on recurring commitments and current trends.

---

## Module 10 — Financial Momentum Engine

Calculates:

* Savings Momentum.
* Net Worth Momentum.
* Spending Momentum.
* Debt Momentum.
* Investment Momentum.

Trend-based deterministic metrics.

---

## Analysis Output Ownership

| Output              | Used By              |
| ------------------- | -------------------- |
| Health Score        | Dashboard            |
| Survival Prediction | Insights             |
| Purchase Simulator  | Insights             |
| Forecast            | Dashboard            |
| Momentum            | Insights             |
| Goal Intelligence   | Dashboard & Insights |

---

## Protection Rules

Entire worksheet protected.

No editable cells.

---

## Cursor Implementation Notes

* Analysis references Business Engine only.
* Never reference raw worksheets directly unless documented.
* Keep outputs modular for future React migration.

---

# Validation Ownership Matrix (Engine Layer)

| Validation        | Owner Worksheet |
| ----------------- | --------------- |
| Categories        | Helpers         |
| Accounts          | Helpers         |
| Assets            | Helpers         |
| Goals             | Helpers         |
| Liabilities       | Helpers         |
| Commitments       | Helpers         |
| Settings          | Helpers         |
| Payment Methods   | Helpers         |
| Transaction Types | Helpers         |

Helpers is the only validation provider.

---

# Formula Ownership Matrix

| Worksheet       | Formula Ownership       |
| --------------- | ----------------------- |
| Settings        | Minimal                 |
| Categories      | None                    |
| Income Sources  | None                    |
| Accounts        | Business Engine         |
| Assets          | Business Engine         |
| Liabilities     | Business Engine         |
| Commitments     | Business Engine         |
| Transactions    | Metadata only           |
| Goals           | Business Engine         |
| Helpers         | Validation formulas     |
| Business Engine | Core calculations       |
| Analysis Engine | Interpretation formulas |
| Dashboard       | Display formulas only   |
| Insights        | Display formulas only   |

Formula ownership is frozen.

---

# End of Part D

This section freezes the FinanceOS engineering layer:

* Helpers
* Business Engine
* Analysis Engine
* Validation ownership
* Formula ownership

The final section (Part E) defines the Dashboard, Insights, worksheet protection matrix, dependency architecture, Cursor implementation notes, and worksheet freeze status.


---

# Worksheet 13 — Dashboard

## Purpose

The **Dashboard** is the primary user interface of FinanceOS.

It transforms workbook calculations into a mobile-friendly and desktop-friendly financial operating system.

The Dashboard never stores business data. It only presents outputs from the Business Engine and Analysis Engine.

---

## Worksheet Ownership

| Type              | Owner              |
| ----------------- | ------------------ |
| Business Owner    | Dashboard Module   |
| Engineering Owner | Presentation Layer |

---

## Dashboard Philosophy

FinanceOS Dashboard should feel like a native finance application rather than an Excel worksheet.

Design principles:

* Minimal.
* Visual.
* Card-based.
* Mobile-first.
* Touch-friendly.
* Zero spreadsheet clutter.

---

## Dashboard Architecture (Frozen)

The dashboard is divided into reusable cards.

Cards consume outputs from Business Engine and Analysis Engine only.

---

## Section 1 — Financial Snapshot

Displays the user's current financial position.

### Components

* Total Cash
* Net Worth
* Monthly Income
* Monthly Expenses
* Monthly Savings
* Savings Rate

Purpose:

Provide an instant overview within five seconds of opening FinanceOS.

---

## Section 2 — Cash Flow Card

Displays monthly money movement.

### Metrics

* Income
* Expenses
* Surplus
* Savings
* Fixed Commitments
* Variable Spending

### Visualization

Progress bars.

Mini comparison indicators.

---

## Section 3 — Upcoming Commitments Card

Displays upcoming scheduled obligations.

### Components

* Next EMI
* Next Subscription
* Upcoming Utility Bill
* Upcoming Insurance Payment
* Upcoming Goal Contribution

### Metrics

* Due Date
* Amount
* Account
* Status

---

## Section 4 — Goal Progress Card

Displays active savings goals.

### Components

* Goal Progress Ring
* Saved Amount
* Remaining Amount
* Target Date
* Estimated Completion Month
* Priority Badge

Goals sorted by priority.

---

## Section 5 — Liability Overview Card

Displays debt summary.

### Components

* Outstanding Debt
* EMI This Month
* Debt Burden
* Remaining EMI Months

Includes quick warning badges.

---

## Section 6 — Investment & Asset Card

Displays asset allocation.

### Components

* Total Asset Value
* Investment Allocation
* Gold Allocation
* Property Allocation
* Retirement Assets
* Asset Growth

---

## Section 7 — Monthly Forecast Card

Displays projected month-end financial position.

### Components

* Expected Income
* Expected Expenses
* Expected Savings
* Forecast Closing Balance
* Forecast Goal Contributions

Generated by Analysis Engine.

---

## Section 8 — Financial Health Card

Displays overall financial health.

### Components

* Financial Health Score
* Emergency Fund Status
* Savings Momentum
* Debt Health
* Investment Health

Score displayed from 0–100.

---

## Section 9 — AI Insights Preview Card

Displays top three deterministic insights.

Each insight contains:

* Severity Badge
* Title
* One-line explanation

Links to Insights worksheet.

---

## Dashboard Filters (Version 1)

Supported filters:

* Current Month
* Current Financial Year
* Account
* Category
* Goal

Filters affect presentation only.

---

## Desktop Layout Rules

Dashboard organized vertically.

Order is frozen:

1. Snapshot
2. Cash Flow
3. Upcoming Commitments
4. Goals
5. Liabilities
6. Assets
7. Forecast
8. Financial Health
9. Insights Preview

---

## Mobile Layout Rules

Every dashboard card occupies nearly full screen width.

Cards stack vertically.

Large spacing.

Large typography.

Touch-friendly.

Excel Mobile compatibility is mandatory.

---

## Protection Rules

| Area    | Editable |
| ------- | -------- |
| Filters | Yes      |
| Cards   | No       |
| Metrics | No       |
| Charts  | No       |

---

## Cursor Implementation Notes

* Dashboard references engine outputs only.
* Never calculate business logic on Dashboard.
* Use named ranges wherever practical.

---

# Worksheet 14 — Insights

## Purpose

The **Insights** worksheet explains financial information in plain English.

Insights are deterministic explanations generated from Analysis Engine outputs.

FinanceOS does **not** use generative AI for Version 1 insights.

Every insight is explainable from workbook calculations.

---

## Worksheet Ownership

| Type              | Owner                  |
| ----------------- | ---------------------- |
| Business Owner    | Insights Module        |
| Engineering Owner | Decision Support Layer |

---

## Insight Philosophy

Insights answer:

* What happened?
* Why did it happen?
* What should the user pay attention to?

Insights never modify financial records.

---

# Insight Categories (Frozen)

## Financial Health Insights

Examples:

* Savings rate improved.
* Emergency fund below recommendation.
* Financial Health Score increased.

---

## Cash Flow Insights

Examples:

* Monthly expenses exceeded income.
* Largest spending category this month.
* Fixed commitments increased.

---

## Goal Insights

Examples:

* Bike Goal will complete 2 months early.
* Emergency Fund contribution is behind schedule.
* Home Goal funding gap increased.

---

## Liability Insights

Examples:

* EMI burden exceeds recommended threshold.
* Credit card balance increasing.
* Debt payoff improving consistently.

---

## Spending Insights

Examples:

* Food spending is 18% above average.
* Subscription spending increased this month.
* Shopping exceeded monthly average.

---

## Opportunity Insights

Positive recommendations.

Examples:

* You can safely save ₹3,000 more this month.
* You have discretionary cash remaining.
* You can complete your goal earlier by increasing savings.

---

## Purchase Insights

Generated from Purchase Affordability Engine.

Examples:

* Safe Purchase
* Purchase Delays Goal
* Purchase Reduces Emergency Fund

Always includes reasoning.

---

## Survival Prediction Insights

Generated from Survival Prediction Engine.

Examples:

* You have 4.3 months of financial runway.
* Income stopping today would exhaust savings in December.
* Reduce discretionary spending to extend runway.

This is a flagship FinanceOS insight category.

---

## Financial Momentum Insights

Examples:

* Savings momentum improving.
* Spending momentum declining.
* Net worth growing consistently.

---

## Insight Severity Levels

| Severity | Meaning                                 |
| -------- | --------------------------------------- |
| Green    | Healthy financial state.                |
| Yellow   | Monitor this area.                      |
| Orange   | Action recommended.                     |
| Red      | Immediate financial attention required. |

Severity colors are standardized across FinanceOS.

---

## Insight Card Structure

Every insight contains:

* Category.
* Severity.
* Headline.
* Explanation.
* Supporting Metric.
* Suggested Interpretation.

Example:

**Category**

Emergency Fund

**Headline**

Emergency Fund Below Recommended Target

**Explanation**

Current emergency fund covers 2.8 months of expenses.

**Suggested Interpretation**

Increase monthly savings until emergency coverage reaches 6 months.

---

## Protection Rules

Entire worksheet protected.

Users cannot edit generated insights.

---

## Mobile Layout Rules

Insights displayed as stacked cards.

Cards use colored severity badges.

Cards remain readable without horizontal scrolling.

---

## Cursor Implementation Notes

* Insights consume Analysis Engine outputs.
* No business calculations inside Insights worksheet.

---

# Validation Ownership Matrix

This matrix freezes ownership of every dropdown in FinanceOS.

| Validation         | Source Worksheet | Source Table / Named Range |
| ------------------ | ---------------- | -------------------------- |
| Currency           | Helpers          | `nrCurrencies`             |
| Month              | Helpers          | `nrMonths`                 |
| Theme              | Helpers          | `nrThemes`                 |
| Category Type      | Helpers          | `nrCategoryTypes`          |
| Expense Categories | Helpers          | `nrExpenseCategories`      |
| Income Categories  | Helpers          | `nrIncomeCategories`       |
| Accounts           | Helpers          | `nrActiveAccounts`         |
| Assets             | Helpers          | `nrAssets`                 |
| Goals              | Helpers          | `nrGoals`                  |
| Liabilities        | Helpers          | `nrLiabilities`            |
| Commitment Types   | Helpers          | `nrCommitmentTypes`        |
| Frequency          | Helpers          | `nrFrequency`              |
| Payment Method     | Helpers          | `nrPaymentMethods`         |
| Transaction Type   | Helpers          | `nrTransactionTypes`       |
| Destination Type   | Helpers          | `nrDestinationTypes`       |
| Status             | Helpers          | `nrStatusList`             |
| Priority           | Helpers          | `nrPriorityList`           |

No validation is hardcoded anywhere else.

---

# Worksheet Protection Matrix

This matrix freezes editable and protected areas.

| Worksheet             | User Editable   | Protected            |
| --------------------- | --------------- | -------------------- |
| Settings              | Setting Values  | IDs, Metadata        |
| Categories            | Business Fields | IDs                  |
| Income Sources        | Business Fields | IDs                  |
| Accounts              | Business Fields | IDs, Current Balance |
| Assets                | Business Fields | IDs, Appreciation    |
| Liabilities           | Business Fields | IDs                  |
| Recurring Commitments | Business Fields | IDs                  |
| Transactions          | User Fields     | IDs, Timestamp       |
| Goals                 | Planning Fields | IDs, Saved Amount    |
| Helpers               | None            | Entire Worksheet     |
| Business Engine       | None            | Entire Worksheet     |
| Analysis Engine       | None            | Entire Worksheet     |
| Dashboard             | Filters Only    | Metrics & Layout     |
| Insights              | None            | Entire Worksheet     |

Protection behavior is frozen.

---

# Worksheet Dependency Architecture

FinanceOS follows a strict one-way dependency chain.

## Dependency Flow

Settings

↓

Categories + Income Sources

↓

Accounts

↓

Assets + Liabilities + Recurring Commitments + Goals

↓

Transactions

↓

Helpers

↓

Business Engine

↓

Analysis Engine

↓

Dashboard

↓

Insights

---

## Dependency Rules

1. Setup Layer never depends on Presentation Layer.
2. Data Layer never depends on Dashboard.
3. Business Engine consumes Data Layer only.
4. Analysis Engine consumes Business Engine only.
5. Dashboard consumes Business Engine and Analysis Engine.
6. Insights consume Analysis Engine only.

Circular references are prohibited.

---

# Workbook Data Flow

| Source                | Consumed By                   |
| --------------------- | ----------------------------- |
| Settings              | Business Engine, Dashboard    |
| Categories            | Helpers, Transactions         |
| Income Sources        | Transactions                  |
| Accounts              | Transactions, Business Engine |
| Assets                | Business Engine               |
| Liabilities           | Business Engine               |
| Recurring Commitments | Business Engine               |
| Transactions          | Business Engine               |
| Goals                 | Business Engine               |
| Business Engine       | Analysis Engine, Dashboard    |
| Analysis Engine       | Dashboard, Insights           |

This data flow is immutable.

---

# Worksheet Naming Standards

Every worksheet uses stable names.

| Worksheet             | Table Name                |
| --------------------- | ------------------------- |
| Settings              | `tblSettings`             |
| Categories            | `tblCategories`           |
| Income Sources        | `tblIncomeSources`        |
| Accounts              | `tblAccounts`             |
| Assets                | `tblAssets`               |
| Liabilities           | `tblLiabilities`          |
| Recurring Commitments | `tblRecurringCommitments` |
| Transactions          | `tblTransactions`         |
| Goals                 | `tblGoals`                |

Engine worksheets do not own business entity tables.

---

# Cursor Workbook Implementation Notes

Cursor must implement worksheets in this exact order.

## Phase 1 — Foundation

1. Settings
2. Categories
3. Income Sources
4. Accounts

## Phase 2 — Financial Resources

5. Assets
6. Liabilities
7. Recurring Commitments
8. Goals

## Phase 3 — Activity Layer

9. Transactions

## Phase 4 — Engineering Layer

10. Helpers
11. Business Engine
12. Analysis Engine

## Phase 5 — Presentation Layer

13. Dashboard
14. Insights

No worksheet should be implemented before its dependencies exist.

---

## Workbook Compatibility Requirements

Cursor must ensure compatibility with:

* Excel Windows.
* Excel Mac.
* Excel Web.
* Excel Android.
* Excel iPhone / iPad.

Forbidden features remain defined in DOC-004.

---

## Mobile Experience Requirements

FinanceOS Version 1 must behave like an application on Excel Mobile.

Requirements:

* Large buttons.
* Large dropdowns.
* Large spacing.
* Vertical navigation.
* No horizontal scrolling for user workflows.
* Dashboard optimized for portrait orientation.

---

## Future Migration Notes (Non-Implementation)

This worksheet architecture is intentionally portable.

Future React application mapping:

| Excel Layer     | Future React Layer        |
| --------------- | ------------------------- |
| Tables          | Database Models           |
| Helpers         | Services / Lookup APIs    |
| Business Engine | Calculation Services      |
| Analysis Engine | Analytics Services        |
| Dashboard       | UI Components             |
| Insights        | AI & Analytics Components |

This mapping is documentation only.

Version 1 remains Excel-first.

---

# Worksheet Implementation Status (Version 1 Freeze)

| Worksheet             | Architecture Status | Cursor Status            |
| --------------------- | ------------------- | ------------------------ |
| Settings              | Frozen              | Ready for Implementation |
| Categories            | Frozen              | Ready for Implementation |
| Income Sources        | Frozen              | Ready for Implementation |
| Accounts              | Frozen              | Ready for Implementation |
| Assets                | Frozen              | Ready for Implementation |
| Liabilities           | Frozen              | Ready for Implementation |
| Recurring Commitments | Frozen              | Ready for Implementation |
| Transactions          | Frozen              | Ready for Implementation |
| Goals                 | Frozen              | Ready for Implementation |
| Helpers               | Frozen              | Ready for Implementation |
| Business Engine       | Frozen              | Ready for Implementation |
| Analysis Engine       | Frozen              | Ready for Implementation |
| Dashboard             | Frozen              | Ready for Implementation |
| Insights              | Frozen              | Ready for Implementation |

All worksheet architecture decisions are frozen for Version 1.

---

# Immutable Worksheet Decisions

The following decisions cannot change without updating architecture documentation.

* Every worksheet owns one primary responsibility.
* Every business entity owns exactly one Excel Table.
* Transactions are the single financial activity ledger.
* Goals own planning only.
* Helpers own validations only.
* Business Engine owns deterministic calculations.
* Analysis Engine owns interpretation and prediction.
* Dashboard owns presentation only.
* Insights own deterministic explanations only.
* Mobile compatibility is mandatory.

---

# Version History

## Version 1.0 — Initial Freeze

The complete worksheet architecture for FinanceOS Version 1 has been frozen.

This document defines the permanent implementation blueprint for the Excel workbook and serves as the authoritative reference for Cursor implementation.

---

**End of Document — DOC-007 Worksheet Specifications Version 1.0**
