# FinanceOS — Formula Standards (Blueprint)

**Document ID:** DOC-015

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

This document defines every engineering standard for formulas inside FinanceOS Version 1.

It is the implementation blueprint Cursor follows while building the Excel workbook.

This document standardizes:

- Formula architecture.
- Named range usage.
- Structured table references.
- Lookup patterns.
- Error handling.
- Dynamic array standards.
- Business Engine calculations.
- Analysis Engine calculations.
- Dashboard calculations.
- Mobile compatibility rules.

This is the canonical Excel engineering specification.

---

# Formula Philosophy

FinanceOS formulas follow one core principle:

> Every calculation should exist exactly once and be reusable everywhere else.

Business logic should never be duplicated across worksheets.

The workbook separates:

| Layer | Responsibility |
|-------|----------------|
| Helpers | Lookup outputs and validation formulas. |
| Business Engine | Financial calculations. |
| Analysis Engine | Interpretation calculations. |
| Dashboard | Presentation formulas only. |
| Insights | Explanation formulas only. |

Formula ownership is immutable.

---

# Formula Design Principles

Every FinanceOS formula should be:

- Deterministic.
- Readable.
- Reusable.
- Mobile compatible.
- Non-volatile whenever possible.
- Based on structured references.

---

## Formula Priorities

Priority order when writing formulas:

1. Structured Table References.
2. Named Ranges.
3. LET for reusable variables.
4. XLOOKUP for lookups.
5. FILTER / UNIQUE / SORT for dynamic outputs.
6. IFERROR for user-facing outputs.

Avoid unnecessary nested formulas.

---

# Formula Ownership Rules

Each worksheet owns a specific category of formulas.

| Worksheet | Formula Ownership |
|-----------|-------------------|
| Settings | Configuration references only. |
| Helpers | Validation and lookup formulas. |
| Business Engine | Financial mathematics. |
| Analysis Engine | Interpretation calculations. |
| Dashboard | Display calculations only. |
| Insights | Explanation assembly only. |

No worksheet may duplicate another worksheet's calculation responsibility.

---

# Formula Naming Standards (Frozen)

FinanceOS follows consistent naming for every reusable calculation.

---

## Prefix Standards

| Prefix | Meaning |
|--------|---------|
| tbl | Excel Table |
| lkp | Lookup Table |
| val | Validation Output |
| rng | Named Range |
| calc | Intermediate Calculation |
| out | Final Business Engine Output |

Examples:

- tblTransactions
- lkpCurrency
- valExpenseCategories
- rngActiveAccounts
- calcMonthlyIncome
- outNetWorth

---

# Structured Table Reference Standards

FinanceOS always references table columns instead of worksheet ranges.

---

## Preferred Pattern

```excel
tblTransactions[Amount]
```

Avoid worksheet references such as:

```excel
Transactions!H:H
```

Structured references automatically expand with new records.

---

## Structured Reference Rules

Always reference:

- Table names.
- Column names.
- Entire columns only when appropriate.

Never reference fixed row ranges.

---

# Named Range Standards

Named ranges exist only for reusable workbook-wide references.

---

## Global Named Ranges

| Named Range | Purpose |
|-------------|---------|
| rngCurrency | Currency dropdown. |
| rngMonths | Month list. |
| rngFinancialYears | Financial year list. |
| rngPaymentMethods | Payment methods. |

---

## Dynamic Named Ranges

| Named Range | Purpose |
|-------------|---------|
| rngActiveAccounts | Active account names. |
| rngActiveGoals | Active goal names. |
| rngExpenseCategories | Expense category list. |
| rngIncomeCategories | Income category list. |
| rngActiveLiabilities | Liability list. |
| rngActiveAssets | Asset list. |

Named ranges reference spill outputs generated in Helpers.

---

# LET Formula Standard (Frozen)

LET is the preferred method for complex reusable calculations.

---

## Use LET When

- Formula repeats the same calculation.
- Variables improve readability.
- Multiple intermediate values exist.

---

## LET Philosophy

Every variable should have a meaningful name.

Example variable categories:

- income
- expense
- savings
- commitments
- availableCash

Variable names use camelCase.

---

# XLOOKUP Standard (Frozen)

FinanceOS standardizes all lookups using XLOOKUP.

---

## Use Cases

- Account lookup.
- Goal lookup.
- Currency lookup.
- Category lookup.
- Status lookup.

XLOOKUP replaces legacy VLOOKUP.

---

## XLOOKUP Rules

Always lookup by stable IDs whenever available.

Never depend on row positions.

Always provide explicit fallback values.

---

# Dynamic Array Standards (Frozen)

FinanceOS uses dynamic arrays where compatible across all supported Excel platforms.

---

## Allowed Dynamic Functions

| Function | Purpose |
|----------|---------|
| FILTER | Dynamic filtering. |
| UNIQUE | Remove duplicates. |
| SORT | Ordered outputs. |
| SEQUENCE | Generated sequences where compatible. |

Dynamic arrays primarily belong inside Helpers.

---

## Spill Range Rules

Spill outputs should:

- Expand automatically.
- Feed Named Ranges.
- Feed Data Validation.
- Never require manual resizing.

---

# Error Handling Standard (Frozen)

Every user-facing formula must safely handle missing values.

---

## Preferred Pattern

Use IFERROR for presentation outputs.

Examples include:

- Dashboard KPIs.
- Goal completion.
- Insight previews.

Business Engine should avoid hiding engineering errors unless presentation requires it.

---

# Blank Value Handling

Blank records should not create calculation noise.

---

## Rules

- Ignore blank transaction rows.
- Ignore blank goals.
- Ignore inactive entities.
- Ignore closed accounts where appropriate.

Blank values are filtered before calculations.

---

# Rounding Standard

FinanceOS displays rounded outputs while preserving underlying precision.

---

## Display Rules

| Output Type | Display |
|-------------|----------|
| Currency | Currency format. |
| Percentage | One decimal place unless specified. |
| Months | One decimal place. |
| Health Score | Whole number. |

Underlying calculations retain full precision where possible.

---

# Formula Readability Rules

Every complex formula should prioritize maintainability.

---

## Readability Principles

- Avoid deeply nested IF statements where possible.
- Prefer LET variables.
- Use structured references.
- Keep formulas modular.

Business Engine formulas should remain understandable during code review.

---

# Formula Dependency Chain

Helpers

↓

Business Engine

↓

Analysis Engine

↓

Dashboard

↓

Insights

Dependencies always flow downward.

---

# Immutable Decisions in Part A

The following Formula Standards are frozen.

- Business logic exists once.
- Structured references are mandatory.
- Named ranges are reusable.
- LET is preferred for complex formulas.
- XLOOKUP replaces VLOOKUP.
- Dynamic arrays belong primarily in Helpers.
- Dashboard formulas never duplicate Business Engine calculations.

---

# Part A Complete

This section freezes the FinanceOS formula philosophy, ownership model, naming standards, structured reference rules, LET/XLOOKUP standards, dynamic array strategy, rounding rules, and dependency architecture for Version 1.

---

# Lookup Formula Blueprint (Frozen)

FinanceOS uses a standardized lookup architecture across every worksheet.

Lookups always retrieve values from the canonical source tables or lookup tables.

Version 1 uses **XLOOKUP** as the primary lookup function.

---

# Lookup Philosophy

Every lookup must satisfy these rules:

- Lookup by stable ID whenever possible.
- Never depend on worksheet position.
- Never depend on row number.
- Always include fallback handling for presentation formulas.

Lookups are deterministic.

---

# Lookup Ownership Matrix

| Lookup Purpose | Source |
|----------------|--------|
| Account Details | tblAccounts |
| Category Details | tblCategories |
| Goal Details | tblGoals |
| Liability Details | tblLiabilities |
| Asset Details | tblAssets |
| Income Source Details | tblIncomeSources |
| Settings | tblSettings |
| Static Dropdown Values | lkp tables |

---

# XLOOKUP Standards

XLOOKUP is the default lookup function for FinanceOS.

## Standard Pattern

Look up:

- Stable ID
- Stable Code
- Unique Name (only if guaranteed unique)

Never use approximate matching.

---

## Lookup Behavior Rules

| Scenario | Expected Behavior |
|----------|-------------------|
| Match Found | Return value. |
| Match Missing | Return safe fallback. |
| Blank Lookup Value | Return blank where appropriate. |
| Inactive Record | Historical records remain valid. |

---

# ID-Based Lookup Architecture

Every business entity has a stable identifier.

| Entity | Stable ID |
|--------|-----------|
| Account | Account ID |
| Category | Category ID |
| Goal | Goal ID |
| Asset | Asset ID |
| Liability | Liability ID |
| Transaction | Transaction ID |
| Income Source | Income Source ID |

IDs never change after creation.

---

# Name-Based Lookup Rules

Names may be displayed to users but IDs remain the engineering reference.

Examples include:

- Dashboard cards.
- Insight explanations.
- Transaction previews.

Display values are resolved through lookup formulas.

---

# Settings Lookup Blueprint

Settings behave as workbook configuration variables.

## Configuration Values Retrieved

| Setting | Consumer |
|----------|----------|
| Currency | Dashboard |
| Financial Year Start | Business Engine |
| Theme | Dashboard |
| Decimal Precision | Dashboard |
| Date Format | Dashboard |

Business Engine references Setting IDs instead of visible labels.

---

# Category Lookup Blueprint

Categories are filtered before validation.

## Expense Category Lookup

Source:

tblCategories

Conditions:

- Status = Active
- Category Type = Expense

Output:

valExpenseCategories

---

## Income Category Lookup

Source:

tblCategories

Conditions:

- Status = Active
- Category Type = Income

Output:

valIncomeCategories

---

# Account Lookup Blueprint

Accounts expose reusable lookup values.

## Lookup Outputs

| Output | Consumer |
|--------|----------|
| Account Name | Transactions |
| Account Type | Dashboard |
| Currency | Business Engine |
| Status | Validation |
| Opening Balance | Business Engine |

Only Active accounts appear in validation outputs.

---

# Goal Lookup Blueprint

Goal lookup outputs include:

- Goal Name.
- Target Amount.
- Priority.
- Target Date.
- Status.

Dashboard and Analysis Engine consume these outputs.

---

# Liability Lookup Blueprint

Lookup outputs include:

- Outstanding Balance.
- EMI Amount.
- Due Day.
- Linked Account.
- Status.

Used by Dashboard and Analysis Engine.

---

# Asset Lookup Blueprint

Lookup outputs include:

- Asset Category.
- Current Value.
- Purchase Value.
- Ownership Type.
- Status.

Consumed by Business Engine.

---

# Helper Formula Architecture (Frozen)

Helper formulas generate reusable workbook outputs.

Helpers own every intermediate formula used for validation and lookup generation.

---

# Helper Output Categories

| Category | Purpose |
|----------|---------|
| Validation Lists | Dropdown outputs. |
| Active Entity Lists | Dynamic entity filtering. |
| Date Outputs | Month and year lists. |
| Category Outputs | Expense and income filtering. |
| Status Outputs | Shared status lists. |

Helper outputs are reusable workbook-wide.

---

# FILTER Formula Blueprint

FILTER generates active validation outputs.

## Standard Use Cases

- Active Accounts.
- Active Goals.
- Active Liabilities.
- Expense Categories.
- Income Categories.

FILTER outputs spill dynamically.

---

# UNIQUE Formula Blueprint

UNIQUE removes duplicate values.

## Use Cases

- Institutions.
- Payment Methods.
- Category summaries.
- Income source summaries.

UNIQUE belongs inside Helpers only.

---

# SORT Formula Blueprint

SORT creates predictable validation ordering.

## Sorting Rules

Alphabetical sorting is preferred for:

- Accounts.
- Goals.
- Categories.
- Assets.
- Liabilities.

Chronological sorting is preferred for:

- Months.
- Financial Years.

---

# Combined Dynamic Array Pattern

FinanceOS combines:

- FILTER
- UNIQUE
- SORT

to create reusable validation outputs.

These outputs feed Named Ranges.

---

# Named Range Blueprint (Frozen)

Named ranges expose reusable spill outputs.

## Static Named Ranges

| Named Range | Source |
|-------------|--------|
| rngCurrency | lkpCurrency |
| rngMonths | lkpMonth |
| rngFinancialYears | lkpFinancialYear |
| rngPaymentMethods | lkpPaymentMethod |
| rngPriority | lkpPriority |

---

## Dynamic Named Ranges

| Named Range | Source Output |
|-------------|---------------|
| rngActiveAccounts | valActiveAccounts |
| rngExpenseCategories | valExpenseCategories |
| rngIncomeCategories | valIncomeCategories |
| rngActiveGoals | valActiveGoals |
| rngActiveAssets | valActiveAssets |
| rngActiveLiabilities | valActiveLiabilities |
| rngIncomeSources | valIncomeSources |

All validation references these names.

---

# Dynamic Validation Formula Ownership

Helpers produce validation outputs.

Transactions consume validation outputs.

No worksheet owns duplicate validation formulas.

---

# IFERROR Blueprint

IFERROR is used only for presentation safety.

## Presentation Use Cases

- Dashboard KPIs.
- Goal completion percentages.
- Empty lookup values.
- Insight preview cards.

Engineering calculations should expose genuine errors during development.

---

# Text Formula Standards

Text assembly is allowed only for presentation layers.

## Allowed Consumers

- Dashboard labels.
- Insight headlines.
- Preview cards.
- Summary strings.

Business Engine calculations remain numeric wherever possible.

---

# Helper Formula Performance Rules

Helper formulas should:

- Avoid volatile functions.
- Spill automatically.
- Minimize repeated calculations.
- Reference structured tables.
- Feed reusable named ranges.

Performance is prioritized for mobile compatibility.

---

# Workbook Lookup Dependency Chain

Lookup Tables

↓

Helper Outputs

↓

Named Ranges

↓

Validation Rules

↓

Business Engine

↓

Dashboard

↓

Insights

Dependencies always flow downward.

---

# Immutable Decisions in Part B

The following lookup and helper formula standards are frozen.

- XLOOKUP is the workbook lookup standard.
- FILTER generates active entity outputs.
- UNIQUE removes duplicate lookup values.
- SORT creates predictable validation ordering.
- Named ranges expose helper outputs.
- Helper formulas own reusable workbook outputs.
- Presentation layers consume helper outputs without duplicating formulas.

---

# Part B Complete

This section freezes the lookup formula architecture, helper formula blueprint, named range engineering standards, dynamic array strategy, IFERROR usage, text formula standards, and workbook lookup dependency model for FinanceOS Version 1.


---

# Business Engine Formula Blueprint (Frozen)

This section defines the deterministic financial calculations owned by the Business Engine worksheet.

The Business Engine is the only worksheet responsible for financial mathematics.

Dashboard, Analysis Engine, and Insights consume these outputs without recreating calculations.

---

# Business Engine Calculation Groups

FinanceOS Version 1 groups calculations into reusable output modules.

| Module | Purpose |
|--------|---------|
| Cash Flow | Income, expenses, savings, surplus. |
| Account Balances | Live balances for every account. |
| Net Worth | Assets minus liabilities. |
| Goals | Savings progress calculations. |
| Liabilities | Debt burden calculations. |
| Assets | Asset allocation and appreciation. |
| Recurring Commitments | Fixed monthly obligations. |

Each module produces reusable outputs prefixed with `out`.

---

# Cash Flow Formula Module (Frozen)

Cash Flow is calculated from historical transactions.

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| outMonthlyIncome | Total income during reporting period. |
| outMonthlyExpense | Total expenses during reporting period. |
| outMonthlySavings | Income minus expenses. |
| outMonthlySurplus | Remaining cash after commitments. |
| outFixedCommitments | Monthly recurring obligations. |
| outVariableSpending | Spending excluding fixed commitments. |

---

## Cash Flow Formula Rules

### Monthly Income

Sum all transactions where:

- Transaction Type = Income.
- Date falls inside reporting period.

---

### Monthly Expense

Sum all transactions where:

- Transaction Type = Expense.
- Date falls inside reporting period.

Transfers are excluded.

---

### Monthly Savings

Monthly Savings = Monthly Income − Monthly Expense

Savings never include transfers.

---

### Monthly Surplus

Monthly Surplus = Monthly Savings − Fixed Commitments

Surplus represents discretionary cash remaining.

---

### Fixed Commitments

Fixed commitments aggregate active recurring commitments.

Include:

- EMI
- Rent
- Insurance
- SIP
- Utility
- Membership
- Subscription

Exclude paused commitments.

---

### Variable Spending

Variable Spending = Expense − Fixed Commitments

Used for spending analysis.

---

# Account Balance Formula Module (Frozen)

Account balances are calculated entirely from transactions.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| outAccountBalance | Current balance for one account. |
| outTotalCash | Combined balance across active accounts. |
| outCashByInstitution | Cash grouped by institution. |
| outCashByAccountType | Cash grouped by account type. |

---

## Account Balance Rules

### Opening Balance

Opening Balance originates from tblAccounts.

Never changes automatically.

---

### Current Balance

Current Balance = Opening Balance + Income − Expense + Transfers In − Transfers Out + Adjustments

Business Engine owns this calculation.

---

### Closed Accounts

Closed accounts remain historical.

Dashboard excludes closed accounts from active cash totals unless explicitly requested.

---

# Net Worth Formula Module (Frozen)

Net Worth combines assets and liabilities.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| outTotalAssets | Current asset value. |
| outTotalLiabilities | Outstanding liabilities. |
| outNetWorth | Assets minus liabilities. |
| outNetWorthChange | Period-over-period change. |

---

## Net Worth Rules

Assets use Current Value.

Liabilities use Outstanding Balance.

Net Worth updates dynamically.

---

### Net Worth Difference

Compare current reporting period against previous reporting period.

Used by Dashboard trend indicators.

---

# Goal Formula Module (Frozen)

Goal progress is calculated automatically.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| outGoalSaved | Current saved amount. |
| outGoalRemaining | Remaining savings required. |
| outGoalCompletion | Completion percentage. |
| outGoalMonthlyRequired | Monthly amount needed. |
| outGoalForecastMonth | Estimated completion month. |

---

## Goal Calculation Rules

### Saved Amount

Calculated from transactions linked to Goal destination.

Never manually edited.

---

### Remaining Amount

Remaining = Target Amount − Saved Amount

Never less than zero.

---

### Completion Percentage

Saved Amount ÷ Target Amount

Displayed as percentage.

---

### Monthly Required Savings

Remaining Amount divided by remaining months until Target Date.

Used by Analysis Engine.

---

# Liability Formula Module (Frozen)

Liability calculations summarize debt burden.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| outOutstandingDebt | Total outstanding debt. |
| outMonthlyEMI | Total monthly EMI. |
| outDebtDistribution | Liability category totals. |
| outLargestLiability | Highest outstanding balance. |

---

## Liability Rules

Only Active liabilities contribute.

Closed liabilities remain historical.

---

### EMI Total

Sum EMI Amount for Active liabilities.

---

### Debt Distribution

Group liabilities by Liability Type.

Used for Dashboard visualization.

---

# Asset Formula Module (Frozen)

Asset calculations summarize allocation and totals.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| outAssetValue | Total asset value. |
| outGoldValue | Gold assets. |
| outMutualFundValue | Mutual fund assets. |
| outStockValue | Stock assets. |
| outAssetAllocation | Allocation percentages. |
| outAssetGrowth | Appreciation totals. |

---

## Asset Rules

Use Current Value for allocation.

Appreciation = Current Value − Purchase Value.

---

# Spending Analysis Formula Module

Version 1 does not include a Budget Formula Module.

There are no outBudgetSpent, outBudgetRemaining, or outBudgetUtilization outputs.

Spending analysis uses Cash Flow Expense outputs grouped by category.

---

# Recurring Commitment Formula Module (Frozen)

Recurring Commitments generate future obligation summaries.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| outMonthlyCommitments | Monthly recurring obligations. |
| outQuarterlyCommitments | Quarterly obligations. |
| outYearlyCommitments | Yearly obligations. |
| outUpcomingPayments | Upcoming commitment summary. |

---

## Commitment Rules

Include Active commitments only.

Paused commitments excluded.

Completed commitments historical only.

---

# Business Engine Output Naming Standards

Every reusable calculation uses the `out` prefix.

Examples:

| Output | Purpose |
|--------|---------|
| outMonthlyIncome | Dashboard KPI |
| outNetWorth | Dashboard KPI |
| outGoalCompletion | Goals Card |
| outDebtBurden | Analysis Engine input |
| outCashRunwayInputs | Analysis Engine input |

Outputs become the public API of the workbook.

---

# Business Engine Calculation Dependency

Transactions

↓

Accounts / Assets / Liabilities / Goals / Commitments

↓

Business Engine Outputs

↓

Analysis Engine

↓

Dashboard

↓

Insights

No calculations flow upward.

---

# Immutable Decisions in Part C

The following Business Engine formula decisions are frozen.

- Business Engine owns all financial mathematics.
- Account balances are transaction-driven.
- Net Worth uses Current Asset Value minus Outstanding Liabilities.
- Goal progress comes from transactions.
- Fixed commitments exclude paused commitments.
- Every reusable Business Engine calculation uses the `out` prefix.

---

# Part C Complete

This section freezes the Cash Flow, Account Balance, Net Worth, Goal, Liability, Asset, Spending Analysis, and Recurring Commitment formula blueprint for FinanceOS Version 1.


---

# Analysis Engine Formula Blueprint (Frozen)

The Analysis Engine converts Business Engine outputs into reusable financial interpretation metrics.

It never modifies financial records.

Its formulas produce deterministic indicators that Dashboard and Insights consume.

---

# Analysis Engine Calculation Modules

Version 1 contains seven calculation modules.

| Module | Purpose |
|--------|---------|
| Financial Health | Overall financial condition. |
| Cash Runway | Income-stop survival calculations. |
| Spending Analysis | Spending behaviour interpretation. |
| Income Analysis | Income stability calculations. |
| Goal Forecast | Goal completion forecasting. |
| Purchase Affordability | Safe purchase evaluation. |
| Scenario Simulation | Future financial comparison. |

Every module produces reusable outputs prefixed with `analysis`.

---

# Financial Health Formula Module (Frozen)

Financial Health combines multiple Business Engine outputs into reusable indicators.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| analysisHealthScore | Overall financial health score. |
| analysisSavingsHealth | Savings indicator. |
| analysisEmergencyHealth | Emergency fund indicator. |
| analysisDebtHealth | Debt burden indicator. |
| analysisCashFlowHealth | Cash flow stability indicator. |
| analysisGoalHealth | Goal progress indicator. |

---

## Health Score Inputs

| Business Engine Output | Used For |
|------------------------|----------|
| outMonthlySavings | Savings health. |
| outMonthlyIncome | Savings rate calculation. |
| outOutstandingDebt | Debt health. |
| outMonthlyEMI | EMI burden. |
| outGoalCompletion | Goal health. |
| outNetWorth | Wealth indicator. |

The Health Score is deterministic.

---

## Health Score Rules

The score evaluates multiple dimensions independently.

### Savings Health

Higher savings rate improves score.

### Emergency Health

Higher emergency coverage improves score.

### Debt Health

Higher debt burden reduces score.

### Goal Health

Consistent goal progress improves score.

### Cash Flow Health

Positive monthly surplus improves score.

Each dimension contributes independently.

---

# Cash Runway Formula Module (Frozen)

Cash Runway measures financial survival without income.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| analysisEmergencyCoverage | Emergency months covered. |
| analysisCashRunway | Total months of runway. |
| analysisRunwayStatus | Healthy / Monitor / Critical. |

---

## Cash Runway Inputs

- outTotalCash
- outMonthlyExpense
- outFixedCommitments
- Essential Expense Total

---

## Formula Rules

### Emergency Coverage

Available Emergency Cash ÷ Essential Monthly Expenses

### Cash Runway

Available Cash ÷ Essential Monthly Spending

---

## Runway Status Rules

| Condition | Status |
|-----------|--------|
| Meets target coverage | Healthy |
| Below target coverage | Monitor |
| Critically low coverage | Critical |

Threshold values remain configurable through Settings in future versions.

---

# Spending Analysis Formula Module (Frozen)

Spending Analysis evaluates expense behaviour over time.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| analysisTopCategory | Highest spending category. |
| analysisCategoryGrowth | Category spending change. |
| analysisMonthlyExpenseTrend | Monthly expense comparison. |
| analysisVariableSpendingTrend | Variable spending comparison. |

---

## Spending Trend Rules

Compare:

- Current Month vs Previous Month.
- Current FY vs Previous FY.

Transfers excluded.

---

## Category Growth Rules

Calculate:

Current Category Spending − Previous Category Spending.

Output percentage difference.

---

# Income Analysis Formula Module (Frozen)

Income Analysis measures earnings consistency.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| analysisIncomeGrowth | Monthly income growth. |
| analysisIncomeStability | Income consistency indicator. |
| analysisLargestIncomeSource | Largest income source. |
| analysisIncomeDistribution | Source distribution. |

---

## Income Stability Rules

Income stability evaluates recurring income behaviour.

Higher recurring consistency produces a stronger stability indicator.

---

# Goal Forecast Formula Module (Frozen)

Goal Forecast predicts future goal completion using current contribution behaviour.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| analysisGoalForecast | Estimated completion month. |
| analysisGoalDelay | Delay indicator. |
| analysisGoalAcceleration | Acceleration indicator. |
| analysisRequiredContribution | Required monthly savings. |

---

## Forecast Rules

Inputs:

- Remaining Amount.
- Average Monthly Contribution.
- Target Date.

Forecast assumes current contribution behaviour continues.

---

## Delay Rules

Goal becomes delayed when projected completion exceeds target date.

Acceleration occurs when projected completion is earlier.

---

# Purchase Affordability Formula Module (Frozen)

Purchase Affordability evaluates planned purchases.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| analysisPurchaseStatus | Safe / Caution / Not Recommended. |
| analysisRemainingCash | Remaining cash after purchase. |
| analysisRunwayAfterPurchase | Runway after purchase. |
| analysisGoalImpact | Goal delay impact. |

---

## Purchase Inputs

- Purchase Amount.
- Available Cash.
- Emergency Coverage.
- Upcoming Commitments.
- Goal Forecasts.

---

## Safe Purchase Rules

Purchase remains affordable when:

- Emergency reserve remains healthy.
- Commitments remain affordable.
- Remaining cash remains positive.

---

## Caution Rules

Purchase is possible but reduces financial flexibility.

---

## Not Recommended Rules

Purchase significantly reduces financial safety.

---

# Scenario Simulation Formula Module (Frozen)

Scenario Simulation compares current finances against hypothetical scenarios.

---

## Primary Outputs

| Output Name | Description |
|-------------|-------------|
| analysisScenarioCash | Cash difference. |
| analysisScenarioSavings | Savings difference. |
| analysisScenarioNetWorth | Net worth difference. |
| analysisScenarioGoals | Goal completion difference. |
| analysisScenarioRunway | Runway difference. |

---

## Supported Scenarios

| Scenario | Comparison |
|----------|------------|
| Income Increase | Current vs Higher Income |
| Income Reduction | Current vs Lower Income |
| New EMI | Current vs Added EMI |
| Purchase | Current vs Purchase |
| Expense Reduction | Current vs Reduced Expenses |
| Goal Contribution Increase | Current vs Higher Savings |

---

## Scenario Rules

Scenario outputs are temporary calculations.

Workbook data never changes.

---

# Deterministic Prediction Formula Standards

Predictions use Analysis Engine outputs only.

---

## Prediction Outputs

| Prediction | Formula Source |
|------------|----------------|
| Cash Runway | analysisCashRunway |
| Goal Completion Month | analysisGoalForecast |
| Purchase Impact | analysisPurchaseStatus |
| Savings Projection | analysisRequiredContribution |
| Debt Burden Projection | analysisDebtHealth |

Predictions remain reproducible.

---

# Insight Trigger Formula Blueprint

Insights activate when deterministic thresholds are met.

---

## Example Trigger Outputs

| Trigger Output | Insight Category |
|----------------|------------------|
| analysisRunwayStatus | Cash Runway |
| analysisGoalDelay | Goals |
| analysisDebtHealth | Liabilities |
| analysisSavingsHealth | Financial Health |
| analysisPurchaseStatus | Purchase Decisions |

The Analysis Engine never assembles narrative text.

---

# Analysis Output Naming Standards

Every reusable interpretation metric uses the `analysis` prefix.

Examples:

| Output | Purpose |
|--------|---------|
| analysisHealthScore | Dashboard Health Card |
| analysisCashRunway | Dashboard Runway Card |
| analysisPurchaseStatus | Purchase Simulator |
| analysisGoalForecast | Goal Cards |
| analysisDebtHealth | Insights |

This prefix is reserved for Analysis Engine outputs.

---

# Analysis Engine Dependency Chain

Business Engine Outputs

↓

Analysis Engine Formulas

↓

Dashboard Metrics

↓

Insights Feed

↓

Future Notifications

Dependencies always flow downward.

---

# Immutable Decisions in Part D

The following Analysis Engine formula standards are frozen.

- Analysis Engine owns interpretation calculations.
- Health Score combines multiple financial dimensions.
- Cash Runway is deterministic.
- Goal Forecasts use historical contribution behaviour.
- Purchase Affordability evaluates emergency reserve, commitments, and goal impact.
- Scenario Simulation never modifies workbook data.
- Every reusable interpretation metric uses the `analysis` prefix.

---

# Part D Complete

This section freezes the Financial Health, Cash Runway, Spending Analysis, Income Analysis, Goal Forecast, Purchase Affordability, Scenario Simulation, and deterministic prediction formula blueprint for FinanceOS Version 1.


---

# Dashboard Formula Blueprint (Frozen)

The Dashboard consumes outputs from the Business Engine and Analysis Engine.

It never recreates financial calculations.

Dashboard formulas are responsible only for presentation, formatting, filtering, and card assembly.

---

# Dashboard KPI Formula Standards

Every KPI card references one reusable Business Engine or Analysis Engine output.

## Financial Snapshot KPIs

| Dashboard KPI | Formula Source |
|---------------|----------------|
| Total Cash | outTotalCash |
| Net Worth | outNetWorth |
| Monthly Income | outMonthlyIncome |
| Monthly Expense | outMonthlyExpense |
| Monthly Savings | outMonthlySavings |
| Savings Rate | analysisSavingsHealth |

Dashboard never calculates these values independently.

---

## Cash Flow Card Formula Sources

| Dashboard Field | Formula Source |
|-----------------|----------------|
| Income | outMonthlyIncome |
| Expense | outMonthlyExpense |
| Surplus | outMonthlySurplus |
| Fixed Commitments | outFixedCommitments |
| Variable Spending | outVariableSpending |

---

## Net Worth Card Formula Sources

| Dashboard Field | Formula Source |
|-----------------|----------------|
| Net Worth | outNetWorth |
| Total Assets | outTotalAssets |
| Total Liabilities | outTotalLiabilities |
| Monthly Net Worth Change | outNetWorthChange |

---

## Goals Card Formula Sources

| Dashboard Field | Formula Source |
|-----------------|----------------|
| Current Saved Amount | outGoalSaved |
| Remaining Amount | outGoalRemaining |
| Completion Percentage | outGoalCompletion |
| Forecast Month | analysisGoalForecast |
| Required Monthly Contribution | outGoalMonthlyRequired |

Goals cards reference reusable outputs only.

---

## Liabilities Card Formula Sources

| Dashboard Field | Formula Source |
|-----------------|----------------|
| Outstanding Debt | outOutstandingDebt |
| Monthly EMI | outMonthlyEMI |
| Debt Burden | analysisDebtHealth |
| Largest Liability | outLargestLiability |

---

## Asset Card Formula Sources

| Dashboard Field | Formula Source |
|-----------------|----------------|
| Total Asset Value | outAssetValue |
| Gold Value | outGoldValue |
| Mutual Fund Value | outMutualFundValue |
| Stock Value | outStockValue |
| Appreciation | outAssetGrowth |

---

## Financial Health Card Formula Sources

| Dashboard Field | Formula Source |
|-----------------|----------------|
| Health Score | analysisHealthScore |
| Savings Health | analysisSavingsHealth |
| Emergency Health | analysisEmergencyHealth |
| Debt Health | analysisDebtHealth |
| Cash Flow Health | analysisCashFlowHealth |
| Goal Health | analysisGoalHealth |

---

# Dashboard Progress Formula Standards

Progress indicators use deterministic percentage outputs.

## Goal Progress Bars

Progress value comes from:

outGoalCompletion

Display range:

0%–100%

---

## Spending Progress

Version 1 does not include Budget Progress Bars or outBudgetUtilization.

Spending analysis uses Cash Flow category totals.

---

## Debt Payoff Progress

Progress compares:

Outstanding Balance vs Original Amount.

Displayed as repayment progress.

---

## Emergency Fund Progress

Progress compares:

analysisEmergencyCoverage against target emergency months.

Displayed as completion toward target reserve.

---

# Dashboard Preview Formula Blueprint

Dashboard displays previews instead of full datasets.

---

## Recent Transactions Preview

Display:

Latest five transactions ordered by Transaction Date descending.

Fields displayed:

- Date
- Category
- Destination
- Amount
- Account

---

## Insights Preview

Display highest-priority active insights.

Maximum five cards.

Priority order:

1. Red
2. Orange
3. Yellow
4. Green

---

# Insights Formula Blueprint (Frozen)

Insights assemble deterministic outputs into readable cards.

---

## Insight Card Components

| Component | Formula Source |
|-----------|----------------|
| Severity Badge | Analysis Engine |
| Headline | Insight Template |
| Explanation | Insight Template |
| Supporting Metric | Business Engine |
| Category Label | Analysis Engine |

---

## Insight Assembly Rules

Insights combine:

- Analysis outputs.
- Business metrics.
- Static text templates.

No financial calculations occur inside Insights.

---

## Insight Feed Ordering Formula

Feed ordering uses:

1. Severity.
2. Timestamp.
3. Category.

Resolved insights appear below active insights.

---

# Conditional Formatting Standards (Frozen)

Conditional formatting communicates financial meaning.

---

## Semantic Formatting Rules

| State | Meaning |
|-------|---------|
| Green | Healthy / Positive |
| Yellow | Monitor |
| Orange | Action Recommended |
| Red | Financial Risk |
| Gray | Informational |

Conditional formatting never changes values.

---

## Progress Formatting

Apply conditional formatting to:

- Goal progress.
- Spending progress.
- Savings progress.
- Emergency fund progress.
- Debt payoff progress.

Formatting remains presentation-only.

---

# Formula Testing Blueprint (Frozen)

Every formula group must be validated before workbook release.

---

## Testing Categories

### Lookup Tests

Verify:

- Named ranges resolve correctly.
- Active entity lists update automatically.
- Lookup fallbacks behave correctly.

---

### Business Engine Tests

Verify:

- Cash flow totals.
- Account balances.
- Net worth.
- Goal progress.
- Debt totals.
- Category spending.

---

### Analysis Engine Tests

Verify:

- Health score.
- Cash runway.
- Goal forecast.
- Purchase affordability.
- Spending trends.
- Income stability.

---

### Dashboard Tests

Verify:

- KPI cards.
- Progress bars.
- Preview cards.
- Filters.
- Navigation formulas.

---

### Insights Tests

Verify:

- Trigger activation.
- Severity ordering.
- Resolution behavior.
- Preview ordering.
- Supporting metrics.

---

# Formula Regression Checklist

Every workbook update must confirm:

- Existing formulas still return identical outputs.
- Named ranges remain valid.
- Validation still functions.
- Dashboard cards still update.
- Analysis outputs remain unchanged unless intentionally modified.

Regression testing is mandatory before release.

---

# Excel Compatibility Matrix (Frozen)

FinanceOS formulas must work across every supported Excel platform.

| Platform | Required Support |
|----------|------------------|
| Excel Desktop (Windows) | Yes |
| Excel Desktop (Mac) | Yes |
| Excel Web | Yes |
| Excel Android | Yes |
| Excel iPhone / iPad | Yes |

Compatibility is mandatory.

---

## Approved Excel Functions

FinanceOS Version 1 standardizes these functions.

### Lookup Functions

- XLOOKUP

### Logical Functions

- IF
- IFERROR
- AND
- OR
- NOT

### Dynamic Arrays

- FILTER
- UNIQUE
- SORT
- SEQUENCE (where compatible)

### Aggregation

- SUM
- SUMIFS
- COUNTIFS
- AVERAGEIFS
- MAXIFS
- MINIFS

### Text

- TEXT
- TEXTJOIN
- CONCAT
- LEFT
- RIGHT
- MID

### Date

- TODAY
- EDATE
- EOMONTH
- YEAR
- MONTH
- DAY

### Formula Organization

- LET

These functions are approved for Version 1.

---

## Forbidden Formula Features

Do not use:

- OFFSET for dynamic ranges.
- INDIRECT for validation architecture.
- VBA functions.
- Office Script functions.
- Power Query formulas.
- Desktop-only formula features.

Version 1 remains portable across Excel platforms.

---

# Formula Performance Standards (Frozen)

Performance is prioritized for large transaction histories.

---

## Performance Rules

- Prefer SUMIFS over repeated FILTER calculations when appropriate.
- Reuse Business Engine outputs.
- Avoid repeated XLOOKUP calls for identical values.
- Use LET for repeated calculations.
- Use structured references instead of entire worksheet references.
- Avoid volatile functions unless required.

---

## Scalability Targets

FinanceOS Version 1 should comfortably support:

| Dataset | Target |
|---------|--------|
| Transactions | 50,000+ |
| Accounts | 100+ |
| Goals | 200+ |
| Assets | 500+ |
| Liabilities | 200+ |
| Recurring Commitments | 500+ |

Formula architecture must remain performant at these scales.

---

# Cursor Formula Implementation Rules

Cursor must:

- Follow formula ownership exactly.
- Never duplicate Business Engine calculations.
- Create named ranges before dependent formulas.
- Build Helpers before Business Engine.
- Build Business Engine before Analysis Engine.
- Build Analysis Engine before Dashboard.
- Build Dashboard before Insights.

Implementation order is mandatory.

---

## Formula Review Rules

Before replacing any formula Cursor must provide:

### Impact Summary

- Worksheets affected.
- Tables affected.
- Named ranges affected.
- Business outputs affected.
- Dashboard outputs affected.

Cursor waits for approval before changing existing formula behavior.

---

# Formula Migration Readiness (Frozen)

Formula architecture must remain portable to future FinanceOS platforms.

| Excel Layer | Future Platform |
|-------------|-----------------|
| Named Ranges | API Models |
| Business Outputs | Backend Calculation Services |
| Analysis Outputs | Analytics Services |
| Dashboard Formulas | React Components |
| Insight Templates | Notification & AI Services |

Excel Version 1 is the canonical implementation.

---

# Immutable Formula Principles

The following formula decisions are permanently frozen.

### Architecture

- Business logic exists only once.
- Business Engine owns calculations.
- Analysis Engine owns interpretation.
- Dashboard owns presentation.
- Insights own explanation assembly.

### Engineering

- Structured references are mandatory.
- Named ranges are reusable.
- LET is preferred for complex calculations.
- XLOOKUP is the lookup standard.
- Dynamic arrays belong in Helpers where appropriate.

### Compatibility

- Mobile compatibility is mandatory.
- Excel-first implementation is mandatory.
- No VBA or Office Scripts.
- No desktop-only formula behavior.

### Migration

- Formula architecture maps directly to future backend services.
- Dashboard formulas map to React UI components.
- Analysis outputs map to future AI explanation services.

---

# Version History

## Version 1.0 — Initial Freeze

The complete Formula Standards Blueprint for FinanceOS Version 1 has been frozen.

This document defines workbook formula architecture, lookup standards, Business Engine calculations, Analysis Engine calculations, Dashboard formulas, Insight formulas, testing standards, performance rules, compatibility standards, and migration readiness.

---

**End of Document — DOC-015 Formula Standards (Blueprint) Version 1.0**