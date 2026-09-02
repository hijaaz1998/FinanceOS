# FinanceOS — Table UI Standards

**Document ID:** DESIGN-EXCEL-03

**Version:** 1.1 (Official V1)

**Status:** Frozen (V1 Table Design Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/excel`

**Dependencies:**
- `00_EXCEL_UI_MASTER.md`
- `01_DASHBOARD_LAYOUT.md`
- `02_WORKSHEET_LAYOUTS.md`
- `../00_DESIGN_MASTER.md`
- `../01_DESIGN_SYSTEM.md`
- `../02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines the universal table design system used throughout FinanceOS.

Every editable worksheet, analytics table, prediction table, Google Sheets table, website table and admin dashboard table must inherit this specification.

This document is the **single source of truth** for FinanceOS table behavior.

---

# Design Philosophy

FinanceOS tables should never feel like traditional Excel spreadsheets.

Instead, they should behave like modern financial database applications.

**Inspired by**

- Stripe Dashboard
- Linear
- Notion Database
- Airtable
- Premium FinTech SaaS dashboards

Users should instantly understand:

- What is editable.
- What is calculated.
- What is locked.
- What needs attention.
- Where to take action.

---

# Design Goals

Every FinanceOS table must be:

- Premium.
- Compact.
- Highly readable.
- Scroll friendly.
- Filter friendly.
- Search friendly.
- Mobile adaptable.
- Performance optimized.

---

# Table Families

## Transaction Tables

Editable financial records.

Examples:

- Transactions
- Income
- Expenses
- Transfers

---

## Financial Tables

Editable financial assets and liabilities.

Examples:

- Assets
- Liabilities
- Investments
- Goals

---

## Analytics Tables

Read-only calculated summaries.

Examples:

- Monthly Summary
- Annual Summary
- Budget Summary
- Category Breakdown

---

## Prediction Tables

Calculation outputs.

Examples:

- EMI Stress Test
- Runway Forecast
- Retirement Forecast
- Savings Projection

---

## System Tables

Hidden helper tables.

Examples:

- Categories
- Currency Mapping
- PPP Regions
- Dropdown Lists

---

# Table Container Architecture

Every table lives inside a reusable FinanceOS container.

## Container Structure

1. Section Header
2. Toolbar
3. Data Table
4. Totals Row
5. Insight Footer

No table appears directly on the worksheet without a container.

---

# Section Header

Contains:

- Icon
- Table Name
- Short Description
- Optional Badge

Example:

💳 Transactions

"Track every income, expense and transfer."

---

# Toolbar Layout

Appears above editable tables.

Contains:

- Search Box
- Filter Button
- Sort Button
- Export Button
- Total Rows Counter

Toolbar layout is identical across Excel, Google Sheets and Website.

---

# Header Row Standards

The header row is one of FinanceOS's visual identities.

## Rules

- Single line only.
- Fixed height.
- Vertically centered.
- Sticky while scrolling.
- High contrast.
- No wrapped text.

---

# Auto-Shrinking Header Text (Mandatory)

FinanceOS intentionally clips long header names instead of increasing row height.

### Examples

| Original | FinanceOS Display |
|----------|-------------------|
| Account | Accoun |
| Institution | Instituti |
| Opening Balance | Openin |
| Currency Symbol | Curren |
| Remaining Tenure | Remainin |
| Emergency Runway Months | Emergency |

Purpose:

- Uniform header height.
- Compact SaaS appearance.
- Smaller worksheet footprint.

Never wrap header text.

---

# Column Width Token System

Cursor must use width tokens instead of manual widths.

| Token | Usage |
|-------|-------|
| XS | Checkbox / Icon |
| S | Date / Status |
| M | Category / Currency |
| L | Account / Institution |
| XL | Description |
| XXL | Notes |

All worksheets inherit these width tokens.

---

# Header Alignment Rules

| Column Type | Alignment |
|-------------|----------|
| Date | Center |
| Amount | Right |
| Currency | Right |
| Percentage | Right |
| Status | Center |
| Category | Left |
| Account | Left |
| Description | Left |
| Notes | Left |

Alignment is globally frozen.

---

# Row Height Standards

| Row Type | Height |
|----------|--------|
| Header | Fixed |
| Data Rows | Uniform |
| Totals Row | Slightly Larger |
| Insight Footer | Auto |

Rows never expand automatically.

---

# Dynamic Auto-Expanding Tables (Official FinanceOS V1)

## Purpose

FinanceOS tables grow automatically as users enter data.

Users never drag formulas, formatting or dropdowns.

This replaces fixed-size tables.

---

## How FinanceOS Tables Behave

FinanceOS uses **Excel Structured Tables** (`Ctrl + T`).

Whenever a user types into the last row:

1. A brand new row is created automatically.
2. Formatting copies automatically.
3. Formulas copy automatically.
4. Dropdown validation copies automatically.
5. Conditional formatting copies automatically.

The table has **no practical limit** for the user.

---

## Initial Visible Rows

FinanceOS starts with a clean set of rows for immediate use.

| Worksheet | Initial Rows |
|-----------|-------------:|
| Transactions | 100 |
| Income | 50 |
| Expenses | 100 |
| Transfers | 50 |
| Assets | 30 |
| Liabilities | 30 |
| Investments | 50 |
| Goals | 20 |
| Budget Planner | 50 |
| Prediction Inputs | 25 |

These rows are **starting rows**, not limits.

---

## Unlimited Growth Rule

Tables continue growing indefinitely.

Examples:

- Transaction #101 creates Row 101.
- Transaction #500 creates Row 500.
- Transaction #5,000 creates Row 5,000.

Users never notice the table expanding.

---

## Structured Table Requirement

Every editable dataset must be an Excel Table.

| Worksheet | Table Name |
|-----------|------------|
| Transactions | tblTransactions |
| Income | tblIncome |
| Expenses | tblExpenses |
| Transfers | tblTransfers |
| Assets | tblAssets |
| Liabilities | tblLiabilities |
| Investments | tblInvestments |
| Goals | tblGoals |
| Budget Planner | tblBudget |
| Prediction Inputs | tblPrediction |

Cursor must create named structured tables.

---

## Automatic Formula Expansion

Every calculated column automatically fills new rows.

Examples:

- Running Balance
- Remaining Budget
- Savings Contribution
- Debt Remaining
- Goal Progress
- Cash Flow Difference
- Health Score Inputs

Users only enter editable values.

Formula cells populate themselves.

---

## Automatic Dropdown Expansion

Every new row inherits dropdown validation.

Examples:

- Category
- Account
- Currency
- Payment Method
- Essential / Non-Essential
- Loan Type
- Goal Category

Dropdowns never disappear.

---

## Automatic Conditional Formatting Expansion

Every new row inherits FinanceOS conditional formatting.

Examples:

- Overspending
- Negative Cash Flow
- High EMI
- Goal Completed
- Risk Badge
- Paid Status
- Pending Status

Formatting follows table growth automatically.

---

## Blank Row Standards

Unused rows remain production ready.

Requirements:

- Zebra striping continues.
- Borders continue.
- Currency formatting continues.
- Dropdown arrows remain active.
- Formulas populate when data appears.

Blank rows should never look unfinished.

---

## Performance Rules

Cursor must optimize for workbook speed.

Requirements:

- Use Structured Tables.
- Use structured references.
- Avoid formatting entire columns.
- Avoid volatile formulas.
- Avoid duplicated conditional formatting rules.

FinanceOS must remain smooth after thousands of rows.

---

# Freeze Pane Standards

Large tables freeze:

- Header Row.
- Toolbar Row.
- Filters Row (if present).

Users always see column headers.

---

# Search Toolbar Standards

Editable tables contain search functionality.

Supported searches:

- Description
- Merchant
- Category
- Account
- Institution
- Goal
- Loan Name
- Investment

Toolbar remains above table.

---

# Filter Standards

Editable tables support filtering.

Enabled:

- Transactions
- Income
- Expenses
- Transfers
- Assets
- Liabilities
- Investments
- Goals

Disabled:

- Dashboard
- KPI Tables
- Report Cards
- Prediction Outputs

---

# Sorting Standards

Supported sorting:

- Date
- Amount
- Category
- Status
- Account
- Progress
- Interest Rate
- Institution

Sorting indicators remain subtle.

---

# Zebra Row Standards

Alternate rows improve readability.

Rules:

- Soft alternating backgrounds.
- Header excluded.
- Totals excluded.
- Compatible with dark and light themes.

---

# Border Standards

FinanceOS minimizes spreadsheet borders.

Rules:

- Thin horizontal separators.
- Minimal vertical separators.
- Rounded container appearance.
- No default Excel table borders.

Whitespace separates information.

---

# Cell Padding Standards

Every cell contains breathing room.

Rules:

- Equal horizontal padding.
- Compact vertical spacing.
- Numeric columns align visually.

Improves readability.

---

# Editable Cell Standards

Editable cells communicate interaction.

Appearance:

- Soft background.
- Visible border.
- Input highlight.
- Focus outline.

Website includes hover states.

---

# Formula Cell Standards

Formula cells are protected.

Appearance:

- Locked.
- Slightly muted.
- Not editable.

Users immediately understand calculated values.

---

# Locked/System Cell Standards

Used only for backend calculations.

Examples:

- Lookup values.
- Currency mappings.
- Hidden helpers.
- Prediction engine helpers.

Never exposed to users.

---

# Currency Formatting Standards

Supported currencies:

- INR
- USD
- EUR
- GBP
- AED

Future currencies added through PPP system.

Rules:

- Symbol before amount.
- Thousand separators.
- Consistent decimal places.

---

# Percentage Formatting Standards

Examples:

- 17%
- 24.5%
- 3.75%

Rules:

- Right aligned.
- Compact width.
- Consistent decimals.

---

# Number Formatting Standards

Examples:

- 1,200
- 18,900
- 2,45,000
- 12.4L
- 1.2M (Charts only)

Readable everywhere.

---

# Negative Number Standards

Negative numbers communicate financial reduction.

Examples:

- Expenses.
- Debt Increase.
- Cash Flow Deficit.

Never communicate meaning through color alone.

---

# Status Badge System

Supported badges.

| Badge | Meaning |
|-------|---------|
| Active | Current |
| Paid | Completed |
| Pending | Awaiting |
| Overdue | Action Required |
| Completed | Goal Finished |
| Forecast | Prediction |
| Safe | Healthy |
| Warning | Needs Attention |
| Critical | Immediate Risk |

Same badges everywhere.

---

# Category Chip Standards

Categories become colored chips.

Examples:

- Salary
- Rent
- Food
- Travel
- EMI
- Investment
- Utilities
- Healthcare

Improves scanning.

---

# Account Chip Standards

Examples:

- HDFC Savings
- ICICI Credit Card
- SBI Salary Account
- Cash Wallet
- UPI Wallet

Future Website/Admin displays account logos.

---

# Totals Row Standards

Every financial table ends with a totals row.

Displays:

- Total Amount.
- Total Records.
- Net Difference.
- Savings Contribution.
- Percentage of Total.

Totals visually separated from data.

---

# Insight Footer Standards

Every major table ends with one insight.

Examples:

Transactions

> Largest expense this month is Travel.

Expenses

> Dining exceeded budget by 18%.

Income

> Side income increased by 12%.

Liabilities

> Paying ₹5,000 extra saves ₹18,400 interest.

Tables become decision tools.

---

# Empty State Standards

Never show empty spreadsheets.

Examples:

Transactions

> Add your first transaction to activate FinanceOS.

Goals

> Create your first financial goal.

Investments

> Add your first investment holding.

Reports

> Generate your first financial report.

Every empty state includes guidance.

---

# Validation Standards

Inline validation only.

Supported validation:

- Invalid Date.
- Invalid Currency.
- Missing Category.
- Duplicate Account.
- Negative Amount.
- Invalid Interest Rate.

Messages remain compact.

---

# Scrolling Standards

Rules:

- Header remains frozen.
- Toolbar remains visible.
- Tables scroll vertically.
- Dashboard tables remain compact.

---

# Accessibility Standards

Tables must support:

- High contrast.
- Keyboard navigation.
- Mobile scrolling.
- Large dropdown targets.
- Consistent alignment.

---

# Google Sheets Compatibility

Google Sheets mirrors Excel.

Requirements:

- Structured table appearance.
- Dynamic row growth.
- Dropdown expansion.
- Formula expansion.
- Conditional formatting expansion.
- Frozen headers.

No redesign.

---

# Website Table Mapping

Website tables inherit this design.

| Excel | Website |
|--------|---------|
| Toolbar | Toolbar |
| Search | Search |
| Filters | Filters |
| Badges | Interactive Badges |
| Zebra Rows | Zebra Rows |
| Totals Row | Sticky Totals |

---

# Admin Dashboard Mapping

Admin dashboard inherits this table system.

Examples:

- Orders.
- Customers.
- Downloads.
- Payments.
- Email Logs.
- Meta Ads.
- AI Content Analytics.

All admin tables share one language.

---

# Cursor Implementation Rules

Cursor must always:

1. Use named Structured Tables (`Ctrl + T`).
2. Never generate fixed-size one-row tables.
3. Start with initial visible rows only.
4. Enable automatic row expansion.
5. Auto-copy formulas.
6. Auto-copy dropdown validation.
7. Auto-copy conditional formatting.
8. Preserve frozen headers.
9. Preserve toolbar layout.
10. Preserve totals row and insight footer.

---

# Frozen Decisions (Version 1)

The following are locked for FinanceOS V1.

- Premium SaaS table language.
- Auto-shrinking headers.
- Dynamic auto-expanding tables.
- Structured Excel Tables.
- Automatic formula propagation.
- Automatic dropdown propagation.
- Automatic conditional formatting propagation.
- Toolbar architecture.
- Zebra rows.
- Totals row.
- Insight footer.
- Cross-platform identical table behavior.

---

# Version History

## Version 1.1

Replaced fixed row-count architecture with dynamic auto-expanding structured tables, added automatic formula/dropdown/conditional formatting propagation, toolbar standards, performance rules, and cross-platform table behavior for Excel, Google Sheets, Website, and Admin Dashboard.

---

**End of Document — `docs/design/excel/03_TABLE_UI_STANDARDS.md`**