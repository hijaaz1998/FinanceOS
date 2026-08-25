# FinanceOS — Naming Conventions

**Document ID:** DOC-016

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

This document defines the official naming standards used throughout FinanceOS Version 1.

Naming conventions apply to:

- Excel worksheets.
- Excel tables.
- Named ranges.
- Lookup tables.
- Validation outputs.
- Business Engine outputs.
- Analysis Engine outputs.
- Documentation files.
- Repository folders.
- Future web application.
- Future backend APIs.
- Future mobile application.
- Admin Panel.

Consistent naming is mandatory across every FinanceOS platform.

---

# Naming Philosophy

FinanceOS uses names that are:

- Human readable.
- Predictable.
- Stable.
- Portable across Excel and software development.
- Easy for Cursor to generate consistently.

Names should describe responsibility rather than implementation.

---

# Worksheet Naming Standards (Frozen)

Worksheet names use **Title Case** with spaces.

## Official Worksheet Names

| Worksheet | Status |
|-----------|--------|
| Settings | Frozen |
| Categories | Frozen |
| Accounts | Frozen |
| Income Sources | Frozen |
| Assets | Frozen |
| Liabilities | Frozen |
| Recurring Commitments | Frozen |
| Transactions | Frozen |
| Goals | Frozen |
| Helpers | Frozen |
| Business Engine | Frozen |
| Analysis Engine | Frozen |
| Dashboard | Frozen |
| Insights | Frozen |

Worksheet names never change after Version 1 freeze.

---

# Excel Table Naming Standards (Frozen)

Every business entity is stored inside exactly one Excel Table.

Tables use **camelCase** with a `tbl` prefix.

## Table Prefix Rules

| Prefix | Meaning |
|--------|---------|
| tbl | Business entity table. |

## Official Table Names

| Worksheet | Table Name |
|-----------|------------|
| Settings | tblSettings |
| Categories | tblCategories |
| Accounts | tblAccounts |
| Income Sources | tblIncomeSources |
| Assets | tblAssets |
| Liabilities | tblLiabilities |
| Recurring Commitments | tblRecurringCommitments |
| Transactions | tblTransactions |
| Goals | tblGoals |

Each table name is globally unique.

---

# Lookup Table Naming Standards (Frozen)

Static lookup tables use the `lkp` prefix.

## Lookup Naming Pattern

`lkp{Name}`

### Official Lookup Tables

| Lookup Table | Purpose |
|--------------|---------|
| lkpCurrency | Currency list |
| lkpPaymentMethod | Payment methods |
| lkpTransactionType | Transaction types |
| lkpDestinationType | Destination types |
| lkpFrequency | Recurring frequency |
| lkpPriority | Goal priority |
| lkpStatus | Shared statuses |
| lkpGoalStatus | Goal status |
| lkpLiabilityStatus | Liability status |
| lkpAccountStatus | Account status |
| lkpCommitmentStatus | Commitment status |
| lkpMonth | Month list |
| lkpFinancialYear | Financial year list |
| lkpOwnershipType | Asset ownership |
| lkpYesNo | Boolean values |

---

# Validation Output Naming Standards (Frozen)

Dynamic validation outputs use the `val` prefix.

## Validation Naming Pattern

`val{Name}`

### Official Validation Outputs

| Validation Output | Source |
|-------------------|--------|
| valExpenseCategories | Categories |
| valIncomeCategories | Categories |
| valActiveAccounts | Accounts |
| valActiveGoals | Goals |
| valActiveAssets | Assets |
| valActiveLiabilities | Liabilities |
| valIncomeSources | Income Sources |
| valPaymentMethods | Lookup |
| valFrequency | Lookup |
| valPriority | Lookup |

Validation outputs are generated in Helpers only.

---

# Named Range Standards (Frozen)

Reusable workbook references use the `rng` prefix.

## Named Range Pattern

`rng{Name}`

### Official Named Ranges

| Named Range | Purpose |
|-------------|---------|
| rngCurrency | Currency dropdown |
| rngMonths | Month dropdown |
| rngFinancialYears | Financial year dropdown |
| rngPaymentMethods | Payment method dropdown |
| rngPriority | Goal priority dropdown |
| rngActiveAccounts | Active account validation |
| rngExpenseCategories | Expense category validation |
| rngIncomeCategories | Income category validation |
| rngActiveGoals | Goal validation |
| rngActiveAssets | Asset validation |
| rngActiveLiabilities | Liability validation |

Named ranges always reference Helpers outputs.

---

# Business Engine Output Naming Standards (Frozen)

Reusable Business Engine calculations use the `out` prefix.

## Output Pattern

`out{Name}`

### Examples

| Output | Purpose |
|--------|---------|
| outMonthlyIncome | Monthly income total |
| outMonthlyExpense | Monthly expense total |
| outMonthlySavings | Monthly savings |
| outMonthlySurplus | Monthly surplus |
| outTotalCash | Total cash position |
| outNetWorth | Current net worth |
| outOutstandingDebt | Outstanding liabilities |
| outInvestmentValue | Total investments |
| outBudgetUtilization | Budget utilization |
| outGoalCompletion | Goal completion percentage |

Outputs become reusable workbook APIs.

---

# Analysis Engine Output Naming Standards (Frozen)

Analysis Engine calculations use the `analysis` prefix.

## Pattern

`analysis{Name}`

### Examples

| Output | Purpose |
|--------|---------|
| analysisHealthScore | Overall health score |
| analysisSavingsHealth | Savings indicator |
| analysisCashRunway | Cash runway months |
| analysisGoalForecast | Goal forecast month |
| analysisDebtHealth | Debt indicator |
| analysisPurchaseStatus | Purchase affordability |
| analysisIncomeGrowth | Income trend |
| analysisExpenseTrend | Spending trend |

Analysis outputs are interpretation metrics only.

---

# Intermediate Calculation Naming Standards (Frozen)

Temporary reusable calculations use the `calc` prefix.

### Examples

| Calculation | Purpose |
|-------------|---------|
| calcSavingsRate | Savings rate calculation |
| calcRemainingCash | Cash after commitments |
| calcEmergencyCoverage | Emergency months |
| calcGoalRemaining | Remaining goal amount |
| calcDebtRatio | Debt-to-income ratio |

Intermediate calculations should remain inside Business Engine or Analysis Engine.

---

# Stable ID Naming Standards (Frozen)

Every business entity has a permanent ID column.

## ID Pattern

`Entity ID`

### Examples

| Entity | ID Column |
|--------|-----------|
| Account | Account ID |
| Category | Category ID |
| Transaction | Transaction ID |
| Goal | Goal ID |
| Asset | Asset ID |
| Liability | Liability ID |
| Income Source | Income Source ID |
| Commitment | Commitment ID |
| Setting | Setting ID |

IDs never change after creation.

---

# Documentation Naming Standards (Frozen)

Documentation files use numeric ordering.

## Pattern

`NN_Document_Name.md`

### Examples

| File | Document ID |
|------|-------------|
| 01_Project_Vision.md | DOC-001 |
| 06_Workbook_Architecture.md | DOC-006 |
| 10_Business_Engine.md | DOC-010 |
| 15_Formula_Standards.md | DOC-015 |
| 23_Product_Strategy.md | DOC-023 |

File numbering never changes.

---

# Repository Folder Naming Standards (Frozen)

Repository folders use **lowercase snake_case**.

## Official Folder Names

| Folder | Purpose |
|--------|---------|
| docs | Documentation |
| workbook | Excel workbook assets |
| scripts | Automation scripts |
| assets | Icons and images |
| templates | Workbook templates |
| exports | Generated exports |
| archive | Historical files |

Folders remain stable across versions.

---

# Git Branch Naming Standards (Frozen)

Branch names use lowercase with hyphens.

## Pattern

`type/short-description`

### Examples

- docs/dashboard-architecture
- feat/business-engine
- feat/dashboard-ui
- fix/goal-progress
- refactor/helpers-validation

---

# Git Commit Naming Standards (Frozen)

Commits represent engineering milestones.

## Pattern

`DOC-XXX: Description`

### Examples

- DOC-011: Freeze FinanceOS analysis engine
- DOC-012: Freeze FinanceOS dashboard architecture
- DOC-015: Freeze FinanceOS formula standards blueprint

Implementation commits use sprint-based messages.

---

# Future React Naming Standards (Frozen)

React components use **PascalCase**.

### Examples

| Component | Purpose |
|-----------|---------|
| DashboardPage | Dashboard screen |
| GoalCard | Goal component |
| CashFlowCard | Cash flow widget |
| HealthScoreCard | Health widget |
| InsightFeed | Insights list |
| PurchaseSimulator | Purchase simulator |

---

# Future API Naming Standards (Frozen)

Backend APIs use **kebab-case** endpoints.

### Examples

| Endpoint | Purpose |
|----------|---------|
| /accounts | Accounts API |
| /transactions | Transactions API |
| /goals | Goals API |
| /insights | Insights API |
| /dashboard | Dashboard summary |
| /analysis | Analysis outputs |

API field names use **camelCase**.

---

# Future Database Naming Standards (Frozen)

Database tables use **snake_case**.

### Examples

| Database Table | Workbook Table |
|----------------|----------------|
| accounts | tblAccounts |
| transactions | tblTransactions |
| goals | tblGoals |
| liabilities | tblLiabilities |
| recurring_commitments | tblRecurringCommitments |

IDs remain identical across platforms.

---

# Admin Panel Naming Standards (Frozen)

Admin Panel modules use descriptive names.

### Modules

- Users
- Plans
- Notifications
- Email Automation
- Workbook Generation
- Analytics
- Support
- Settings

Module names remain user-facing.

---

# Reserved Prefixes

These prefixes are reserved across the repository.

| Prefix | Reserved For |
|--------|--------------|
| tbl | Excel Tables |
| lkp | Lookup Tables |
| val | Validation Outputs |
| rng | Named Ranges |
| calc | Intermediate Calculations |
| out | Business Engine Outputs |
| analysis | Analysis Engine Outputs |
| DOC | Documentation IDs |

No other purpose may use these prefixes.

---

# Cursor Naming Rules (Frozen)

Cursor must:

- Preserve worksheet names exactly.
- Preserve table names exactly.
- Preserve named range names exactly.
- Preserve lookup prefixes.
- Preserve output prefixes.
- Never invent alternative names.
- Never rename frozen entities without documentation approval.

---

# Version 1 Immutable Naming Rules

The following naming conventions are permanently frozen.

- Worksheet names use Title Case.
- Table names use `tbl` + camelCase.
- Lookup tables use `lkp`.
- Validation outputs use `val`.
- Named ranges use `rng`.
- Business Engine outputs use `out`.
- Analysis Engine outputs use `analysis`.
- Documentation files use numeric ordering.
- Repository folders use lowercase snake_case.
- IDs remain stable across every platform.

---

# Version History

## Version 1.0 — Initial Freeze

The complete naming convention system for FinanceOS Version 1 has been frozen.

This document defines workbook naming, repository naming, formula naming, API naming, database naming, Git naming, and migration naming standards.

---

**End of Document — DOC-016 Naming Conventions Version 1.0**