# FinanceOS — Dynamic Tables & Data Validation (Google Sheets)

**Document ID:** DESIGN-GSHEETS-02

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Dynamic Tables & Validation Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/google-sheets`

**Dependencies:**
- `00_GSHEETS_MASTER.md`
- `01_GSHEETS_UI_MAPPING.md`
- `docs/design/excel/03_TABLE_UI_STANDARDS.md`
- `docs/design/excel/05_INPUT_COMPONENTS.md`
- `docs/design/excel/11_ACCESSIBILITY_AND_USABILITY_STANDARDS.md`

---

# Purpose

This document defines the complete **dynamic table architecture**, **input validation system**, **dropdown system**, and **data integrity rules** for the FinanceOS Google Sheets edition.

FinanceOS Google Sheets must behave like a structured financial database while remaining easy to edit.

This document is the **single source of truth** for all editable tables inside Google Sheets.

---

# Dynamic Table Philosophy

FinanceOS does **not** use fixed spreadsheet ranges.

Every major worksheet contains a **dynamic table** that automatically grows as users enter new data while preserving formatting, formulas, validations, and conditional formatting.

### User Experience Goals

- Never manually copy formulas.
- Never manually extend formatting.
- Never manually update dropdowns.
- Every new row behaves like previous rows.

---

# FinanceOS Dynamic Table Architecture

Every editable worksheet uses one primary dynamic table.

| Worksheet | Table Name |
|-----------|------------|
| Transactions | `tblTransactions` |
| Income | `tblIncome` |
| Expenses | `tblExpenses` |
| Assets | `tblAssets` |
| Liabilities | `tblLiabilities` |
| Investments | `tblInvestments` |
| Goals | `tblGoals` |
| Budget Planner | `tblBudget` |
| Prediction Inputs | `tblPredictionInputs` |

Table names remain identical to Excel for compatibility.

---

# Table Growth Rules

FinanceOS tables automatically expand downward.

## Automatic Expansion Trigger

When a user enters data in the final formatted row:

1. Formatting copies automatically.
2. Formulas populate automatically.
3. Dropdowns appear automatically.
4. Conditional formatting extends automatically.
5. Dashboard calculations include the new row.

No manual intervention required.

---

# Preformatted Starter Rows

FinanceOS ships with starter rows for usability.

| Worksheet | Starter Rows |
|-----------|--------------|
| Transactions | 100 |
| Income | 50 |
| Expenses | 100 |
| Transfers | 50 |
| Assets | 25 |
| Liabilities | 25 |
| Investments | 50 |
| Goals | 20 |
| Budget Planner | 30 |
| Prediction Inputs | 20 |

These are **starter rows only**.

Dynamic growth removes practical limits.

---

# Unlimited Growth Strategy

Instead of creating 1,000 empty rows, FinanceOS grows intelligently.

### Growth Rules

- Starter rows included.
- New rows inherit formatting.
- New rows inherit validation.
- New rows inherit formulas.
- Empty rows remain visually hidden until used.

Performance remains optimized.

---

# Table Structure Standards

Every table contains four sections.

## Section Order

1. Header Row.
2. Input Rows.
3. Totals Row.
4. Hidden Formula Columns (where required).

Structure is identical across worksheets.

---

# Header Row Standards

Headers remain frozen.

Requirements:

- Dark FinanceOS header.
- Filter enabled.
- Bold typography.
- Center aligned.
- Sticky during scrolling.

---

# Totals Row Standards

Every table ends with an automatic totals row.

Examples:

Transactions:

- Total Income.
- Total Expenses.
- Net Cash Flow.

Goals:

- Total Saved.
- Remaining Amount.

Totals update dynamically.

---

# Input Validation Philosophy

Every editable cell validates data **before** calculations update.

FinanceOS prevents incorrect financial inputs instead of correcting them later.

---

# Validation Categories

FinanceOS has seven validation systems.

| Validation | Purpose |
|------------|---------|
| Required Fields | Prevent empty inputs. |
| Dropdown Validation | Standardized categories. |
| Numeric Validation | Amounts and percentages. |
| Date Validation | Valid transaction dates. |
| Currency Validation | Supported currencies only. |
| Duplicate Validation | Prevent duplicate records. |
| Formula Protection | Protect calculated cells. |

---

# Required Field Validation

Required fields cannot remain blank.

## Transactions

Required:

- Date
- Amount
- Category
- Account

Optional:

- Merchant
- Notes

---

# Numeric Validation Rules

Used for:

- Amounts.
- Interest Rates.
- Savings Rate.
- Percentages.
- EMI Values.

Rules:

- No text.
- No invalid symbols.
- Negative values only where permitted.

---

# Date Validation Rules

FinanceOS accepts only valid calendar dates.

Requirements:

- Valid day/month/year.
- No impossible dates.
- Future dates allowed only in prediction worksheets.

---

# Currency Validation Rules

Supported currencies only.

Allowed values:

- INR
- USD
- GBP
- EUR
- AED

Currency dropdown is connected to PPP mapping.

---

# Duplicate Prevention Rules

Prevent duplicate records where necessary.

Examples:

- Duplicate Account Names.
- Duplicate Goal IDs.
- Duplicate Investment IDs.

Transactions may contain repeated merchants.

---

# Formula Protection Rules

Formula columns cannot be edited.

Examples:

- Running Balance.
- Savings Rate.
- Health Score.
- Prediction Outputs.
- Category Lookup IDs.

Protected ranges preserve workbook integrity.

---

# Dropdown Architecture

All dropdown values come from hidden helper sheets.

No worksheet contains hardcoded dropdown values.

---

# Category Dropdown

Expense Categories

- Food
- Rent
- EMI
- Shopping
- Utilities
- Health
- Travel
- Education
- Entertainment
- Other

Income Categories

- Salary
- Freelance
- Business
- Rental Income
- Dividends
- Interest
- Cashback
- Other

Updates propagate automatically.

---

# Account Dropdown

Connected to `tblAccounts`.

Examples:

- HDFC Savings
- SBI Salary
- ICICI Credit Card
- Cash Wallet
- UPI Wallet

Users can add new accounts from the Settings sheet.

---

# Goal Dropdown

Connected to `tblGoals`.

Examples:

- Emergency Fund
- House
- Vacation
- Education
- Vehicle
- Retirement

Dynamic updates when new goals are created.

---

# Investment Dropdown

Supported investment types.

- Stocks
- Mutual Funds
- ETFs
- Gold
- Crypto
- Fixed Deposit
- PPF
- EPF
- Bonds
- Other

---

# Payment Method Dropdown

Allowed values:

- UPI
- Debit Card
- Credit Card
- Cash
- Bank Transfer
- Wallet

Used in Transactions worksheet.

---

# Status Dropdown

Used throughout workbook.

Values:

- Active
- Pending
- Completed
- Cancelled
- Paid
- Overdue

Status badges update automatically.

---

# Financial Year Dropdown

Settings worksheet controls financial year.

Supported:

- India Financial Year.
- Calendar Year.

Future localization ready.

---

# PPP Region Dropdown

Settings worksheet controls localized pricing region.

Examples:

- India
- USA
- UK
- UAE
- Europe
- Canada
- Australia

Connected to PPP helper sheet.

---

# Searchable Dropdown Rules

Future Website supports searchable dropdowns.

Google Sheets uses standard dropdown chips.

Names remain identical.

---

# Named Range Architecture

FinanceOS uses named ranges extensively.

Examples:

- `rngExpenseCategories`
- `rngIncomeCategories`
- `rngAccounts`
- `rngGoals`
- `rngCurrencies`
- `rngRegions`

Named ranges power dropdown validation.

---

# Dynamic Named Range Rules

Named ranges expand automatically when helper tables grow.

Users never update ranges manually.

---

# Conditional Formatting Architecture

Conditional formatting follows FinanceOS semantic tokens.

## Success

Savings and completed goals.

## Warning

Budget nearing limit.

## Danger

Overspending, overdue debt.

## Forecast

Prediction outputs.

Rules remain identical to Excel.

---

# Budget Threshold Formatting

Budget utilization automatically changes appearance.

| Usage | Status |
|-------|--------|
| 0–69% | Healthy |
| 70–89% | Warning |
| 90–100% | Critical |
| Above 100% | Overspent |

Formatting updates instantly.

---

# Goal Progress Formatting

Goal progress bars update dynamically.

Displays:

- Saved Amount.
- Remaining Amount.
- Completion Percentage.
- Goal Completed badge.

---

# Duplicate Highlighting Rules

Duplicate entries receive warning formatting.

Examples:

- Duplicate Account.
- Duplicate Goal.
- Duplicate Investment.

Transactions excluded.

---

# Invalid Input Highlighting

Invalid inputs display warning formatting immediately.

Examples:

- Invalid Date.
- Empty Required Field.
- Unsupported Currency.
- Invalid Percentage.

Users know exactly what to fix.

---

# Auto Fill Formula Rules

Every dynamic table auto-fills formulas.

Examples:

Transactions:

- Running Balance.
- Month.
- Quarter.
- Financial Year.

Goals:

- Progress Percentage.
- Remaining Amount.

Investments:

- Profit/Loss.
- Allocation Percentage.

---

# Dynamic Totals Rules

Totals always reference the active table range.

Never reference fixed cell ranges.

New rows automatically affect totals.

---

# Protected Range Strategy

Google Sheets protects:

- Helper Sheets.
- Formula Columns.
- Dashboard Calculations.
- Prediction Outputs.

Editable areas remain unlocked.

---

# User Editable Zones

Editable zones include:

- Transaction Inputs.
- Income Inputs.
- Expense Inputs.
- Asset Inputs.
- Goal Inputs.
- Investment Inputs.
- Prediction Inputs.
- Settings Inputs.

Everything else remains protected.

---

# Error Message Standards

Validation messages follow FinanceOS wording.

Examples:

**Amount Required**

Enter a transaction amount.

**Unsupported Currency**

Select one of the supported FinanceOS currencies.

Messages remain concise.

---

# Empty Row Behavior

Empty formatted rows appear ready for entry.

Rules:

- Preserve formatting.
- Preserve validation.
- No calculations until populated.

---

# Import Compatibility Rules

Imported CSV/Excel data inherits validation after insertion into FinanceOS tables.

Users never rebuild formatting manually.

---

# Mobile Google Sheets Behavior

Validation works on:

- Android Sheets.
- iPhone Sheets.
- Tablet Sheets.

Dropdowns use native picker interfaces.

---

# Performance Rules

Dynamic tables must remain lightweight.

Requirements:

- Use named ranges.
- Avoid full-column calculations where unnecessary.
- Reuse validation lists.
- Keep helper sheets hidden.

Optimized for large transaction histories.

---

# Cursor Implementation Rules

Cursor must:

1. Build every worksheet around dynamic named ranges.
2. Never use fixed validation ranges.
3. Protect all formula columns.
4. Keep dropdown values in helper sheets only.
5. Auto-fill formulas into new rows.
6. Ensure totals and charts expand automatically.

---

# Frozen Decisions (Version 1)

The following table decisions are locked.

- Dynamic auto-expanding tables.
- Named range architecture.
- Hidden validation helper sheets.
- Protected formula columns.
- Shared dropdown system.
- Shared category lists.
- Shared PPP region selector.
- Automatic totals.
- Automatic conditional formatting propagation.

---

# Version History

## Version 1.0

Official FinanceOS Google Sheets dynamic table and validation specification defining auto-expanding tables, named ranges, dropdown architecture, validation rules, protected ranges, conditional formatting, formula propagation, and data integrity behavior.

---

**End of Document**

**File:** `docs/design/google-sheets/02_DYNAMIC_TABLES_AND_VALIDATION.md`
