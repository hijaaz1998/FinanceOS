# FinanceOS — Formula Compatibility (Excel ↔ Google Sheets)

**Document ID:** DESIGN-GSHEETS-04

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Formula Compatibility Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/google-sheets`

**Dependencies:**
- `00_GSHEETS_MASTER.md`
- `01_GSHEETS_UI_MAPPING.md`
- `02_DYNAMIC_TABLES_AND_VALIDATION.md`
- `03_CHARTS_AND_DASHBOARD_MAPPING.md`
- `docs/design/excel/03_TABLE_UI_STANDARDS.md`
- `docs/design/excel/05_INPUT_COMPONENTS.md`
- `docs/design/excel/12_EXCEL_IMPLEMENTATION_CHECKLIST.md`

---

# Purpose

This document defines the complete **formula compatibility architecture** between **Microsoft Excel** and **Google Sheets** for FinanceOS Version 1.

FinanceOS is developed in Excel first, but every calculation, dashboard, prediction, KPI, report, and validation must also work inside Google Sheets with identical outputs.

This document is the **single source of truth** for Cursor when converting FinanceOS formulas between platforms.

---

# Formula Compatibility Philosophy

FinanceOS follows one compatibility rule:

> **A user entering the same financial data in Excel and Google Sheets must receive identical outputs.**

The implementation may differ internally, but the calculation result must remain the same.

---

# Formula Architecture

FinanceOS formulas are divided into six layers.

| Layer | Purpose |
|-------|---------|
| Lookup Layer | Categories, currencies, PPP mappings. |
| Calculation Layer | Income, expenses, balances, net worth. |
| Dashboard Layer | KPI cards and summaries. |
| Prediction Layer | Forecasting and simulations. |
| Report Layer | Monthly and annual reports. |
| Helper Layer | Hidden supporting calculations. |

Each layer has compatibility rules.

---

# Compatibility Principles

Cursor must follow these principles.

## Rules

- Prefer formulas supported by both platforms.
- Avoid Excel-only functions when possible.
- Use dynamic arrays carefully.
- Use named ranges instead of hardcoded references.
- Keep helper calculations inside hidden sheets.

---

# Formula Naming Standards

FinanceOS uses named formulas and named ranges.

Examples:

- `rngTransactions`
- `rngExpenses`
- `rngIncome`
- `rngAssets`
- `rngLiabilities`
- `rngGoals`
- `rngInvestments`
- `rngPPP`

These names remain identical across both platforms.

---

# Lookup Formula Mapping

## Primary Lookup Strategy

| Excel | Google Sheets |
|-------|---------------|
| XLOOKUP | XLOOKUP |

FinanceOS V1 uses **XLOOKUP** because it is supported in both modern Excel and Google Sheets.

### Use Cases

- Category lookup.
- Currency lookup.
- PPP lookup.
- Goal lookup.
- Account lookup.

---

## Fallback Lookup Strategy

Used only if compatibility issues occur.

| Excel | Google Sheets |
|-------|---------------|
| INDEX + MATCH | INDEX + MATCH |

Fallback formulas must produce identical outputs.

---

# FILTER Function Mapping

Used for dynamic dashboard sections.

Examples:

- Monthly transactions.
- Food expenses.
- Active goals.
- Completed goals.

Behavior remains identical.

---

# SORT Function Mapping

Used for:

- Largest expenses.
- Top investments.
- Goal ranking.
- Spending categories.

Sorting behavior must match exactly.

---

# UNIQUE Function Mapping

Used for:

- Merchant list.
- Category list.
- Accounts.
- Financial years.

Helper sheets generate dropdown values dynamically.

---

# SEQUENCE Function Mapping

Used for:

- Calendar generation.
- Monthly timeline.
- Forecast timeline.
- Goal timeline.

Supports prediction engine timelines.

---

# IF / IFS Mapping

Used throughout FinanceOS.

Examples:

- Budget status.
- Health score.
- Goal completion.
- Debt warnings.
- Recommendation logic.

Cursor should prefer `IFS()` where readability improves.

---

# SUMIFS Architecture

Used extensively.

Examples:

- Monthly income.
- Monthly expenses.
- Category totals.
- Goal savings.
- Investment totals.

FinanceOS standardizes `SUMIFS()` across both platforms.

---

# COUNTIFS Architecture

Used for analytics.

Examples:

- Number of transactions.
- Active goals.
- Paid EMIs.
- Overdue payments.

Outputs feed KPI cards.

---

# AVERAGEIFS Architecture

Used for:

- Monthly spending average.
- Average savings.
- Average investment contribution.

Prediction engine references these values.

---

# MAXIFS / MINIFS Mapping

Used for:

- Largest expense.
- Highest income.
- Biggest investment.
- Lowest savings month.

Dynamic dashboard highlights.

---

# TEXT Function Standards

Used for display formatting.

Examples:

- Month Names.
- Quarter Labels.
- Financial Year Labels.
- Currency Formatting Labels.

Formatting logic remains consistent.

---

# DATE Functions

Used throughout workbook.

Supported functions:

- DATE
- YEAR
- MONTH
- DAY
- EOMONTH
- WEEKDAY
- TODAY

Used for financial year calculations.

---

# Financial Year Formula Rules

FinanceOS supports:

- India Financial Year.
- Calendar Year.

Helper sheet generates financial year labels dynamically.

Example outputs:

- FY 2026–27
- FY 2027–28

---

# Running Balance Formula

Transactions worksheet generates running balance dynamically.

Requirements:

- Works with new rows.
- Updates instantly.
- Supports filtering.
- Supports multiple accounts.

---

# Net Worth Formula

Net Worth calculation.

Formula components:

Assets minus Liabilities.

Updates:

- Dashboard.
- Reports.
- Prediction Engine.
- Health Score.

---

# Savings Rate Formula

Savings Rate calculation.

Formula:

Savings divided by Income.

Displays percentage.

Used throughout workbook.

---

# Debt Load Formula

Debt Load calculation.

Formula:

Monthly EMI divided by Monthly Income.

Feeds Health Score and Prediction Engine.

---

# Emergency Runway Formula

Formula inputs:

- Savings Balance.
- Monthly Expenses.

Output:

Months of runway remaining.

Prediction engine references this value.

---

# Budget Utilization Formula

Formula inputs:

- Budget Amount.
- Actual Spending.

Outputs:

- Used %
- Remaining %
- Overspending Status.

Conditional formatting references output.

---

# Goal Progress Formula

Formula inputs:

- Target Amount.
- Saved Amount.

Outputs:

- Progress %
- Remaining Amount.
- ETA.

Dashboard uses identical calculation.

---

# Investment Profit Formula

Formula inputs:

- Invested Amount.
- Current Value.

Outputs:

- Profit.
- Loss.
- Percentage Return.

Used in Investments dashboard.

---

# Asset Allocation Formula

Calculates allocation percentages.

Outputs feed donut charts.

Always totals 100%.

---

# Cash Flow Formula

Formula inputs:

- Total Income.
- Total Expenses.

Outputs:

- Monthly Surplus.
- Cash Flow Trend.
- Dashboard KPI.

---

# Category Summary Formula

Groups expenses by category.

Used for:

- Spending donut.
- Budget planner.
- Reports.

Dynamic category additions supported.

---

# Merchant Summary Formula

Groups spending by merchant.

Used for:

- Largest merchants.
- Monthly merchant analysis.

Supports dynamic merchant list.

---

# Prediction Engine Formula Architecture

Prediction formulas live inside helper sheets.

Main modules:

- Savings Forecast.
- Emergency Runway Forecast.
- EMI Forecast.
- Retirement Projection.
- Scenario Comparison.

Outputs remain visible only in prediction cards.

---

# Savings Forecast Formula Rules

Inputs:

- Current Savings.
- Monthly Savings.
- Growth Rate.

Outputs:

- Forecast Balance.
- Goal Completion Month.
- Milestone Dates.

---

# EMI Forecast Formula Rules

Inputs:

- Principal.
- Interest.
- EMI Amount.
- Extra Payment.

Outputs:

- New Debt-Free Date.
- Interest Saved.
- Months Saved.

---

# Retirement Projection Formula Rules

Inputs:

- Current Age.
- Retirement Age.
- Monthly Investment.
- Return Rate.
- Inflation.

Outputs:

- Retirement Corpus.
- Inflation Adjusted Target.
- Gap Value.

---

# What-If Scenario Formula Rules

Scenario simulator recalculates independently.

Inputs:

- Salary Increase.
- Expense Change.
- EMI Change.
- Savings Change.
- Investment Change.

Outputs update dashboard comparison.

---

# Health Score Formula Architecture

Health Score uses weighted scoring.

Inputs include:

- Savings Rate.
- Debt Load.
- Emergency Runway.
- Budget Utilization.
- Investment Habit.

Outputs:

- Score.
- Badge.
- Recommendation.

Calculation remains hidden.

---

# Dashboard Formula Rules

Dashboard references helper sheets only.

Rules:

- Never calculate directly inside KPI cards.
- KPI cards display helper outputs.
- Charts reference helper ranges.

Improves performance.

---

# Report Formula Rules

Reports pull summarized data.

Sections:

- Monthly Summary.
- Quarterly Summary.
- Annual Summary.
- Goal Summary.
- Investment Summary.

Reports never duplicate calculations.

---

# Array Formula Strategy

Google Sheets uses `ARRAYFORMULA` only where beneficial.

Allowed use cases:

- Running labels.
- Financial year columns.
- Month extraction.
- Quarter extraction.

Avoid workbook-wide array formulas for heavy calculations.

---

# Named Range Strategy

Every major calculation references named ranges.

Examples:

- `rngMonthlyIncome`
- `rngMonthlyExpenses`
- `rngSavingsBalance`
- `rngGoalTargets`

Avoid hardcoded cell references.

---

# Error Handling Strategy

Use `IFERROR` for user-facing outputs.

Examples:

- Empty dashboard.
- Empty reports.
- Missing goals.
- Missing investments.

Never display spreadsheet errors to users.

---

# Blank State Formula Rules

Empty worksheets display:

- Zero values where appropriate.
- Blank charts replaced by placeholders.
- Helper text instead of errors.

---

# Circular Reference Prevention

FinanceOS must never create circular references.

Rules:

- Helper calculations separated.
- Dashboard references helpers only.
- Reports reference helpers only.

Prediction engine isolated.

---

# Performance Formula Rules

Cursor must optimize formulas.

Requirements:

- Use helper columns where beneficial.
- Avoid repeated expensive lookups.
- Reuse named ranges.
- Avoid volatile calculations where unnecessary.

Supports large transaction histories.

---

# Excel ↔ Google Sheets Compatibility Table

| Formula Category | Excel | Google Sheets | Status |
|-----------------|-------|---------------|--------|
| Lookup | XLOOKUP | XLOOKUP | ✅ |
| Filter | FILTER | FILTER | ✅ |
| Sort | SORT | SORT | ✅ |
| Unique | UNIQUE | UNIQUE | ✅ |
| Sequence | SEQUENCE | SEQUENCE | ✅ |
| Conditional Sum | SUMIFS | SUMIFS | ✅ |
| Conditional Count | COUNTIFS | COUNTIFS | ✅ |
| Error Handling | IFERROR | IFERROR | ✅ |
| Dynamic Arrays | Supported | Supported | ✅ |

Version 1 uses only compatible functions.

---

# Cursor Formula Implementation Rules

Cursor must:

1. Use named ranges everywhere possible.
2. Prefer shared formulas supported by both platforms.
3. Separate helper calculations from UI sheets.
4. Use `IFERROR` for user-facing outputs.
5. Keep prediction calculations isolated.
6. Ensure Excel and Google Sheets outputs remain identical.

---

# Frozen Decisions (Version 1)

The following formula decisions are locked.

- Shared formula architecture.
- XLOOKUP as primary lookup.
- Named range system.
- SUMIFS / COUNTIFS architecture.
- Helper-sheet calculation strategy.
- Prediction engine isolation.
- IFERROR user-facing handling.
- No platform-specific calculation differences.

---

# Version History

## Version 1.0

Official FinanceOS Excel ↔ Google Sheets formula compatibility specification defining lookup architecture, dashboard formulas, prediction formulas, named ranges, error handling, dynamic arrays, performance optimization, and cross-platform calculation consistency.

---

**End of Document**

**File:** `docs/design/google-sheets/04_FORMULA_COMPATIBILITY.md`
