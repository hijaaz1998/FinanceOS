# FinanceOS — Business Engine

**Document ID:** DOC-010

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

The Business Engine is the deterministic financial calculation engine of FinanceOS Version 1.

It transforms raw workbook data into reusable financial outputs that power every dashboard card, insight, forecast, and future simulation.

The Business Engine is responsible only for **mathematics and financial calculations**.

It never performs interpretation, recommendations, or presentation.

---

# Business Engine Philosophy

FinanceOS follows a strict three-layer financial architecture.

| Layer           | Responsibility                 |
| --------------- | ------------------------------ |
| Data Layer      | Stores user financial records. |
| Business Engine | Calculates financial metrics.  |
| Analysis Engine | Explains financial metrics.    |

The Business Engine is the only worksheet allowed to calculate reusable financial outputs.

Every other worksheet consumes these outputs.

---

# Business Engine Responsibilities

The Business Engine owns deterministic calculations for:

* Account Balances.
* Cash Flow.
* Savings.
* Net Worth.
* Assets.
* Liabilities.
* Goal Progress.
* Recurring Commitments.
* Financial Health Inputs.
* Forecast Inputs.
* Dashboard KPIs.

Ownership is immutable.

---

# What the Business Engine Does Not Do

The Business Engine never:

* Generates insights.
* Predicts behavior.
* Explains financial health.
* Displays charts.
* Stores transaction history.
* Stores planning data.
* Generates AI responses.

Those responsibilities belong to other layers.

---

# Business Engine Input Sources

Business Engine consumes information from multiple worksheets.

## Input Ownership Matrix

| Worksheet             | Input Purpose                        |
| --------------------- | ------------------------------------ |
| Settings              | Global configuration.                |
| Categories            | Category metadata.                   |
| Accounts              | Account metadata.                    |
| Income Sources        | Income classification.               |
| Assets                | Asset records.                       |
| Liabilities           | Debt records.                        |
| Recurring Commitments | Scheduled obligations.               |
| Transactions          | Historical financial activity.       |
| Goals                 | Planning targets.                    |
| Helpers               | Validation lists, lookup outputs, named ranges, and intermediate helper outputs. |

Business Engine never references Dashboard or Insights.

---

# Business Engine Output Categories

The engine produces reusable outputs grouped into modules.

## Output Modules

| Module              | Purpose                             |
| ------------------- | ----------------------------------- |
| Cash Flow Engine    | Income, expenses, savings, surplus. |
| Account Engine      | Current balances and cash totals.   |
| Goal Engine         | Progress calculations.              |
| Liability Engine    | Debt calculations.                  |
| Asset Engine        | Asset valuation calculations.       |
| Net Worth Engine    | Wealth calculations.                |
| Forecast Engine     | Future financial calculations.      |
| Health Input Engine | Inputs for Analysis Engine scoring. |

Each module owns a defined set of calculations.

---

# Business Engine Architecture

Business Engine is divided into logical calculation sections.

## Section Layout

1. Global Configuration Inputs.
2. Cash Flow Calculations.
3. Account Calculations.
4. Goal Calculations.
5. Liability Calculations.
6. Asset Calculations.
7. Net Worth Calculations.
8. Forecast Calculations.
9. Health Score Inputs.

This order is frozen.

---

# Deterministic Calculation Principles

Every Business Engine calculation follows these rules.

## Principle 1 — One Calculation Owner

Every financial metric is calculated once.

No duplicate calculations across worksheets.

Example:

Monthly Savings exists only inside Business Engine.

---

## Principle 2 — Read Inputs Only

Business Engine reads workbook data.

It never edits user worksheets.

---

## Principle 3 — Reusable Outputs

Every calculation is reusable by:

* Dashboard.
* Analysis Engine.
* Insights.
* Future web application.

---

## Principle 4 — Explainable Mathematics

Every output has:

* Inputs.
* Calculation owner.
* Output.
* Dependency list.

Nothing is hidden.

---

## Principle 5 — No Presentation Logic

Business Engine never contains:

* Colors.
* Progress bars.
* Icons.
* Status badges.
* Text formatting.

Presentation belongs to Dashboard.

---

# Business Engine Calculation Lifecycle

Every calculation follows the same lifecycle.

## Stage 1 — Input Collection

Read workbook data.

Examples:

* Transactions.
* Assets.
* Goals.
* Accounts.

---

## Stage 2 — Validation

Ignore invalid records.

Ignore cancelled transactions.

Respect active/inactive status.

---

## Stage 3 — Calculation

Perform deterministic financial math.

---

## Stage 4 — Output Generation

Store reusable outputs.

Dashboard references outputs instead of recalculating.

---

# Business Engine Dependency Hierarchy

Dependencies flow downward only.

Settings

↓

Transactions / Accounts / Assets / Goals / Liabilities

↓

Business Engine

↓

Analysis Engine

↓

Dashboard

↓

Insights

Circular references are prohibited.

---

# Business Engine Output Naming Convention

Every reusable output follows a stable naming convention.

## Prefix Standards

| Prefix      | Meaning                            |
| ----------- | ---------------------------------- |
| calc        | Financial calculation.             |
| summary     | Aggregated financial summary.      |
| forecast    | Forecast output.                   |
| healthInput | Input consumed by Analysis Engine. |

Examples:

* calcMonthlyIncome
* calcMonthlySavings
* summaryNetWorth
* forecastClosingBalance
* healthInputSavingsRate

Naming is frozen.

---

# Calculation Ownership Matrix

| Financial Metric         | Owner           |
| ------------------------ | --------------- |
| Monthly Income           | Business Engine |
| Monthly Expense          | Business Engine |
| Savings Rate Input       | Business Engine |
| Account Balance          | Business Engine |
| Goal Progress            | Business Engine |
| Net Worth                | Business Engine |
| Outstanding Debt         | Business Engine |
| Asset Allocation         | Business Engine |
| Forecast Closing Balance | Business Engine |

Analysis Engine may consume these values but never recreate them.

---

# Business Engine Performance Principles

Business Engine must remain efficient even with thousands of transactions.

## Rules

* Read Excel Tables only.
* Use structured references.
* Never reference entire worksheets.
* Reuse intermediate calculations.
* Avoid duplicate aggregations.
* Avoid unnecessary volatile calculations.

Performance optimization is mandatory.

---

# Business Engine Mobile Compatibility Rules

The engine must work identically across:

* Excel Windows.
* Excel Mac.
* Excel Web.
* Excel Android.
* Excel iPhone / iPad.

No desktop-only functionality is permitted.

---

# Business Engine Protection Rules

Business Engine is an internal worksheet.

## Editable Areas

None.

Users never edit Business Engine outputs.

## Protected Areas

* All calculations.
* Summary outputs.
* Intermediate outputs.
* Health inputs.
* Forecast outputs.

Entire worksheet remains protected.

---

# Cursor Responsibilities (Business Engine)

Cursor must:

* Implement documented calculations only.
* Preserve calculation ownership.
* Never duplicate formulas in Dashboard.
* Never move calculations into user worksheets.
* Preserve deterministic behavior.
* Preserve mobile compatibility.

---

# Future Migration Readiness

Every Business Engine output should map directly to future TypeScript services.

Examples:

| Excel Output             | Future Service                      |
| ------------------------ | ----------------------------------- |
| Monthly Income           | cashFlowService.getIncome()         |
| Net Worth                | wealthService.getNetWorth()         |
| Goal Progress            | goalService.getProgress()           |
| Outstanding Debt         | debtService.getOutstandingDebt()    |
| Forecast Closing Balance | forecastService.getClosingBalance() |

Excel Version 1 remains the canonical implementation.

---

# Immutable Decisions in Part A

The following Business Engine architecture decisions are frozen.

* Business Engine owns every deterministic calculation.
* Dashboard never recalculates business metrics.
* Analysis Engine never owns financial mathematics.
* One calculation exists in one place only.
* Business Engine outputs are reusable across the workbook.
* Business Engine contains no presentation logic.

---

# Part A Complete

This section freezes the Business Engine architecture, ownership model, dependency hierarchy, calculation philosophy, protection model, and migration readiness.

Part B defines the Cash Flow Engine and Account Engine calculations.


---

# Cash Flow Engine (Frozen)

The Cash Flow Engine is responsible for calculating how money moves through FinanceOS during a selected financial period.

Cash Flow is the foundation for savings, forecasting, runway analysis, budgeting, and financial health.

Every calculation in this section is deterministic.

---

# Cash Flow Philosophy

Cash Flow answers four questions:

1. How much money came in?
2. How much money went out?
3. How much money remains?
4. Where did the money go?

The Cash Flow Engine never interprets whether those numbers are good or bad.

Interpretation belongs to the Analysis Engine.

---

# Cash Flow Input Sources

The Cash Flow Engine reads:

| Worksheet             | Purpose                                    |
| --------------------- | ------------------------------------------ |
| Transactions          | Income and expense history.                |
| Recurring Commitments | Planned future obligations.                |
| Settings              | Financial year and currency configuration. |
| Accounts              | Opening balances and account metadata.     |

No Dashboard worksheet is referenced.

---

# Cash Flow Output Metrics

The Cash Flow Engine produces reusable outputs.

## Primary Outputs

| Output            | Description                           |
| ----------------- | ------------------------------------- |
| Monthly Income    | Completed income transactions.        |
| Monthly Expense   | Completed expense transactions.       |
| Monthly Savings   | Income minus expense.                 |
| Monthly Surplus   | Remaining cash after expenses.        |
| Fixed Commitments | Monthly scheduled obligations.        |
| Variable Spending | Expenses excluding fixed commitments. |
| Remaining Cash    | Cash available after commitments.     |

These outputs are consumed throughout FinanceOS.

---

# Monthly Income Calculation

Monthly Income measures completed income during the selected period.

---

## Monthly Income Rules

### Rule 1 — Include Completed Income Only

Income transactions with Status = Completed participate.

Pending income belongs only to forecasts.

Cancelled income is ignored.

### Rule 2 — Transaction Type Must Equal Income

Only Transaction Type = Income contributes.

Transfers excluded.

Adjustments excluded unless documented.

### Rule 3 — Respect Date Filters

Calculations follow the selected financial month and year.

### Rule 4 — Respect Financial Year Settings

Financial year boundaries come from Settings.

---

## Monthly Income Ownership

Business Engine owns:

* Current Month Income.
* Previous Month Income.
* Financial Year Income.
* Annual Income.

---

# Monthly Expense Calculation

Monthly Expense measures completed expenses.

---

## Monthly Expense Rules

### Rule 1 — Include Completed Expense Transactions

Pending expenses excluded.

Cancelled expenses excluded.

### Rule 2 — Transaction Type Must Equal Expense

Transfers excluded.

Goal contributions excluded from discretionary spending totals.

### Rule 3 — Respect Date Filters

Monthly calculations follow selected reporting period.

### Rule 4 — Expense Categories Aggregate Spending

Expenses grouped using Category IDs.

---

## Monthly Expense Ownership

Business Engine calculates:

* Current Month Expense.
* Previous Month Expense.
* Annual Expense.
* Expense by Category.
* Expense by Payment Method.

---

# Monthly Savings Calculation

Savings measure retained income after spending.

---

## Savings Formula Ownership

Business Engine owns Monthly Savings.

Analysis Engine never recalculates savings.

---

## Monthly Savings Rules

### Rule 1

Savings = Income − Expense.

### Rule 2

Transfers ignored.

### Rule 3

Goal contributions remain expenses from a cash-flow perspective.

### Rule 4

Negative savings allowed.

Dashboard displays warning separately.

---

## Savings Outputs

Business Engine generates:

* Monthly Savings.
* Annual Savings.
* Lifetime Savings.
* Average Monthly Savings.

---

# Monthly Surplus Calculation

Surplus measures remaining money before planned commitments.

---

## Surplus Rules

### Rule 1

Monthly Surplus = Monthly Income − Monthly Expense.

### Rule 2

Recurring commitments displayed separately.

### Rule 3

Transfers ignored.

### Rule 4

Adjustments excluded unless marked completed.

---

## Surplus Outputs

* Monthly Surplus.
* Previous Month Surplus.
* Surplus Trend Input.

---

# Fixed Commitment Calculation

Fixed Commitments measure unavoidable scheduled spending.

---

## Included Commitments

* EMI
* Rent
* Insurance
* Utilities
* Subscription
* SIP
* Planned Savings
* Membership

---

## Commitment Rules

### Rule 1

Only Active commitments included.

### Rule 2

Paused commitments excluded.

### Rule 3

Completed commitments excluded.

### Rule 4

Frequency determines reporting period.

---

## Fixed Commitment Outputs

Business Engine calculates:

* Monthly Fixed Commitments.
* Quarterly Fixed Commitments.
* Annual Fixed Commitments.

---

# Variable Spending Calculation

Variable Spending equals discretionary spending.

---

## Included Categories

Examples:

* Food.
* Dining.
* Shopping.
* Entertainment.
* Travel.
* Clothing.
* Gifts.

---

## Excluded Categories

* Transfers.
* Goal Contributions.
* Asset purchases.
* Liability Payments.

---

## Variable Spending Outputs

Business Engine produces:

* Monthly Variable Spending.
* Category Breakdown.
* Spending Distribution Input.

---

# Remaining Cash Calculation

Remaining Cash measures cash available after scheduled obligations.

---

## Remaining Cash Rules

### Rule 1

Remaining Cash = Monthly Surplus − Remaining Fixed Commitments.

### Rule 2

Future commitments reduce projected remaining cash.

### Rule 3

Completed commitments already appear inside expenses.

No double counting allowed.

---

## Remaining Cash Outputs

* Remaining Monthly Cash.
* Forecast Remaining Cash.
* Purchase Simulator Input.

---

# Cash Flow Summary Outputs

The Cash Flow Engine creates reusable summaries.

---

## Summary Metrics

| Summary Output          | Purpose         |
| ----------------------- | --------------- |
| Total Income            | Dashboard KPI   |
| Total Expense           | Dashboard KPI   |
| Total Savings           | Dashboard KPI   |
| Savings Rate Input      | Analysis Engine |
| Remaining Cash          | Forecast Engine |
| Fixed Commitment Total  | Dashboard KPI   |
| Variable Spending Total | Dashboard KPI   |

---

# Account Engine (Frozen)

The Account Engine calculates current balances across all user accounts.

Accounts are the source of available cash throughout FinanceOS.

---

# Account Engine Philosophy

Accounts answer:

* Where does money exist?
* How much money is available?
* Which institution holds the money?

Account balances are calculated.

Users never manually edit Current Balance.

---

# Account Engine Input Sources

Reads:

| Worksheet    | Purpose                 |
| ------------ | ----------------------- |
| Accounts     | Opening balances.       |
| Transactions | Cash movement history.  |
| Settings     | Currency configuration. |

---

# Account Balance Rules

### Rule 1 — Opening Balance

Opening Balance entered once during setup.

### Rule 2 — Income Increases Balance

Completed income increases Source Account.

### Rule 3 — Expense Decreases Balance

Completed expenses reduce Source Account.

### Rule 4 — Transfers Move Between Accounts

Source decreases.

Destination increases.

### Rule 5 — Adjustments Modify Balance

Adjustment transactions reconcile balances.

---

# Current Balance Calculation

Current Balance is generated.

Users never edit Current Balance directly.

Business Engine owns this calculation.

---

# Available Cash Calculation

Available Cash equals total balances across active cash accounts.

---

## Included Accounts

* Bank Accounts.
* Cash Wallets.
* UPI Wallets.
* Savings Accounts.
* Current Accounts.

---

## Excluded Accounts

* Closed Accounts.
* Archived Accounts.

---

# Cash by Account Type

Business Engine groups balances.

Examples:

| Account Type | Output                   |
| ------------ | ------------------------ |
| Savings      | Total Savings Balance    |
| Cash         | Total Cash Balance       |
| Wallet       | Wallet Balance           |
| Credit Card  | Outstanding Card Balance |

---

# Cash by Institution

Balances grouped by institution.

Examples:

* HDFC.
* SBI.
* ICICI.
* Axis Bank.

Dashboard consumes grouped balances.

---

# Active Account Rules

Only Active accounts participate in:

* Cash calculations.
* Available cash.
* Forecasting.
* Dashboard summaries.

Closed accounts remain historical only.

---

# Closed Account Rules

Closed accounts preserve:

* Transaction history.
* Historical balances.
* Institution history.

No new transactions allowed.

---

# Account Summary Outputs

Business Engine produces reusable account summaries.

| Output               | Purpose          |
| -------------------- | ---------------- |
| Current Balance      | Dashboard        |
| Total Cash           | Dashboard KPI    |
| Cash by Account Type | Dashboard Card   |
| Cash by Institution  | Dashboard Card   |
| Available Cash       | Forecast Engine  |
| Active Account Count | Dashboard Metric |

---

# Cash Flow Engine Dependency Map

Transactions

↓

Cash Flow Engine

↓

Account Engine

↓

Business Engine Outputs

↓

Dashboard & Analysis Engine

Dependencies never reverse.

---

# Business Engine Responsibilities (Cash Flow & Accounts)

Business Engine owns:

### Cash Flow

* Monthly Income.
* Monthly Expense.
* Monthly Savings.
* Monthly Surplus.
* Remaining Cash.
* Fixed Commitments.
* Variable Spending.

### Accounts

* Current Balance.
* Available Cash.
* Total Cash.
* Institution Totals.
* Account Type Totals.

These outputs become source-of-truth metrics for the rest of FinanceOS.

---

# Immutable Decisions in Part B

The following rules are frozen.

* Cash Flow calculations belong only to Business Engine.
* Account balances are calculated, not manually maintained.
* Transfers never affect Cash Flow totals.
* Closed accounts preserve history but are excluded from active cash.
* Remaining Cash is calculated after fixed commitments.
* Dashboard never recalculates balances.

---

# Part B Complete

This section freezes the Cash Flow Engine and Account Engine architecture, ownership, outputs, dependency flow, and summary metrics.

Part C freezes the Goal Engine, Asset Engine, and Liability Engine.


---

# Goal Engine (Frozen)

The Goal Engine calculates progress toward every financial goal inside FinanceOS.

Goals represent future financial objectives.

Transactions represent historical contributions.

The Goal Engine connects those two systems.

---

# Goal Engine Philosophy

The Goal Engine answers:

* How much has been saved?
* How much remains?
* How close is the goal to completion?
* What contribution pace is required?

The Goal Engine performs mathematics only.

Recommendations belong to the Analysis Engine.

---

# Goal Engine Input Sources

Reads data from:

| Worksheet    | Purpose                       |
| ------------ | ----------------------------- |
| Goals        | Goal definitions and targets. |
| Transactions | Goal contribution history.    |
| Settings     | Financial year configuration. |

The Goal Engine never references Dashboard or Insights.

---

# Goal Engine Output Metrics

The Goal Engine produces reusable outputs.

| Output                           | Purpose                 |
| -------------------------------- | ----------------------- |
| Current Saved Amount             | Goal progress.          |
| Remaining Amount                 | Amount left to save.    |
| Completion Percentage            | Dashboard progress bar. |
| Monthly Contribution Total       | Contribution history.   |
| Average Monthly Contribution     | Forecast input.         |
| Required Monthly Contribution    | Forecast input.         |
| Estimated Completion Month Input | Analysis Engine input.  |

---

# Current Saved Amount Calculation

Current Saved Amount is the total completed contributions made toward a goal.

---

## Current Saved Amount Rules

### Rule 1 — Sum Goal Transactions Only

Only transactions where Destination Type = Goal participate.

### Rule 2 — Match Goal ID

Contributions grouped using Goal ID.

### Rule 3 — Completed Transactions Only

Pending contributions excluded.

Cancelled contributions excluded.

### Rule 4 — Goal Status Does Not Delete History

Completed and paused goals preserve contribution totals.

---

# Remaining Amount Calculation

Remaining Amount measures remaining savings required.

---

## Remaining Amount Rules

### Rule 1

Remaining Amount = Target Amount − Current Saved Amount.

### Rule 2

Minimum Remaining Amount = 0.

### Rule 3

Never produce negative remaining values.

---

# Completion Percentage Calculation

Completion Percentage measures overall goal progress.

---

## Completion Rules

### Rule 1

Completion Percentage = Saved ÷ Target × 100.

### Rule 2

Cap maximum display at 100%.

### Rule 3

Internal values may exceed target for surplus reporting if needed later.

Dashboard displays completed goals as 100%.

---

# Monthly Goal Contribution Calculation

Calculates contributions during reporting month.

---

## Rules

* Current month completed contributions only.
* Grouped by Goal ID.
* Financial year aware.

Outputs feed Dashboard monthly goal cards.

---

# Average Monthly Contribution Calculation

Measures average contribution pace.

---

## Rules

Average uses completed historical contributions only.

Pending contributions excluded.

---

# Required Monthly Contribution Calculation

Calculates contribution needed to meet target by Target Date.

---

## Rules

### Rule 1

Uses Remaining Amount.

### Rule 2

Uses Remaining Months until Target Date.

### Rule 3

If no Target Date exists, output unavailable.

---

# Goal Completion Status Input

Business Engine produces completion input.

| Condition              | Output          |
| ---------------------- | --------------- |
| Saved ≥ Target         | Completed       |
| Saved less than Target | Active Progress |
| Paused Goal            | Paused          |
| Archived Goal          | Historical      |

Analysis Engine consumes this input.

---

# Goal Summary Outputs

Business Engine generates reusable summaries.

| Output                        | Purpose       |
| ----------------------------- | ------------- |
| Total Goals                   | Dashboard KPI |
| Active Goals                  | Dashboard KPI |
| Completed Goals               | Dashboard KPI |
| Total Saved Across Goals      | Dashboard     |
| Remaining Savings Required    | Dashboard     |
| Completion Percentage by Goal | Dashboard     |

---

# Asset Engine (Frozen)

The Asset Engine calculates owned wealth across every asset category.

Assets contribute directly to Net Worth.

---

# Asset Engine Philosophy

Assets answer:

* What does the user own?
* What is it worth today?
* How has it changed since purchase?

The Asset Engine performs valuation calculations only.

---

# Asset Engine Input Sources

Reads data from:

| Worksheet    | Purpose                 |
| ------------ | ----------------------- |
| Assets       | Asset records.          |
| Transactions | Asset purchases.        |
| Settings     | Currency configuration. |

---

# Asset Engine Output Metrics

| Output                   | Purpose             |
| ------------------------ | ------------------- |
| Total Asset Value        | Dashboard KPI       |
| Asset Appreciation       | Dashboard KPI       |
| Appreciation Percentage  | Dashboard KPI       |
| Asset Allocation         | Dashboard charts    |
| Asset Contributions      | Dashboard cards     |
| Asset Category Totals    | Dashboard summaries |

---

# Total Asset Value Calculation

Calculates total current value of active assets.

---

## Rules

### Rule 1

Use Current Value.

### Rule 2

Active assets only.

### Rule 3

Sold assets excluded from current totals.

Historical reports may include sold assets separately.

---

# Appreciation Calculation

Measures value growth.

---

## Rules

### Rule 1

Appreciation Amount = Current Value − Purchase Value.

### Rule 2

Negative values represent depreciation.

### Rule 3

Users never edit appreciation values.

---

# Appreciation Percentage Calculation

Measures growth percentage.

---

## Rules

Use Purchase Value as baseline.

Zero purchase value produces unavailable output.

---

# Asset Allocation Calculation

Groups asset value by category.

---

## Categories

* Cash Equivalent
* Gold
* Mutual Funds
* Stocks
* Property
* Retirement
* Vehicle
* Electronics
* Other Assets

Outputs consumed by Dashboard.

---

# Asset Contribution Calculation

Calculates asset purchases made through Transactions, including the Investment category inside `tblAssets`.

---

## Rules

Only transactions that purchase an Asset participate.

Grouped by Asset ID.

---

# Asset Summary Outputs

| Output                       | Purpose       |
| ---------------------------- | ------------- |
| Total Assets                 | Dashboard KPI |
| Investment Category Value    | Dashboard KPI |
| Appreciation Total           | Dashboard KPI |
| Depreciation Total           | Dashboard KPI |
| Asset Allocation by Category | Dashboard     |
| Asset Allocation by Type     | Dashboard     |

---

# Liability Engine (Frozen)

The Liability Engine calculates debt metrics across all liabilities.

Liabilities reduce Net Worth.

---

# Liability Engine Philosophy

Liability calculations answer:

* How much debt remains?
* What is the monthly EMI burden?
* How is debt distributed?

No payoff recommendations are generated here.

---

# Liability Engine Input Sources

Reads:

| Worksheet             | Purpose          |
| --------------------- | ---------------- |
| Liabilities           | Debt records.    |
| Transactions          | Payment history. |
| Recurring Commitments | EMI schedule.    |

---

# Liability Engine Output Metrics

| Output                 | Purpose       |
| ---------------------- | ------------- |
| Outstanding Debt       | Dashboard KPI |
| Monthly EMI Total      | Dashboard KPI |
| EMI Burden Total       | Health Input  |
| Debt Distribution      | Dashboard     |
| Active Liability Count | Dashboard     |

---

# Outstanding Debt Calculation

Measures remaining debt.

---

## Rules

### Rule 1

Use Outstanding Balance.

### Rule 2

Closed liabilities excluded.

### Rule 3

Outstanding Balance never negative.

---

# Monthly EMI Calculation

Calculates scheduled monthly EMI obligations.

---

## Rules

Only Active liabilities included.

Paused liabilities excluded.

Closed liabilities excluded.

---

# EMI Burden Calculation

Calculates total monthly debt obligation.

---

## Rules

Sum active EMI Amount values.

Grouped by liability.

---

# Debt Distribution Calculation

Groups outstanding debt by liability category.

---

## Categories

* Home Loan
* Vehicle Loan
* Education Loan
* Personal Loan
* Credit Card
* Gold Loan
* BNPL
* Other Debt

Outputs feed Dashboard charts.

---

# Liability Payment History Calculation

Calculates completed liability payments.

---

## Rules

Only Destination Type = Liability.

Completed payments only.

Grouped by Liability ID.

---

# Liability Summary Outputs

| Output                           | Purpose       |
| -------------------------------- | ------------- |
| Outstanding Debt                 | Dashboard KPI |
| Monthly EMI Total                | Dashboard KPI |
| Active EMI Count                 | Dashboard     |
| Debt Distribution                | Dashboard     |
| Liability Payment Total          | Dashboard     |
| Outstanding Balance by Liability | Dashboard     |

---

# Net Worth Engine (Frozen)

The Net Worth Engine combines Assets and Liabilities.

Net Worth is one of the highest-priority Business Engine outputs.

---

# Net Worth Philosophy

Net Worth represents accumulated wealth.

Income and expenses affect Net Worth indirectly through assets, cash, and liabilities.

---

# Net Worth Input Sources

Reads:

| Worksheet   | Purpose           |
| ----------- | ----------------- |
| Accounts    | Cash balances.    |
| Assets      | Asset values.     |
| Liabilities | Outstanding debt. |

---

# Net Worth Output Metrics

| Output                   | Purpose        |
| ------------------------ | -------------- |
| Total Cash               | Dashboard KPI  |
| Total Assets             | Dashboard KPI  |
| Total Liabilities        | Dashboard KPI  |
| Net Worth                | Dashboard KPI  |
| Monthly Net Worth Change | Analysis Input |
| Annual Net Worth Change  | Analysis Input |

---

# Net Worth Rules

### Rule 1

Net Worth = Cash + Assets − Liabilities.

### Rule 2

Goal balances remain cash.

No double counting.

### Rule 3

Transfers never affect Net Worth.

### Rule 4

Asset purchases convert cash into assets.

### Rule 5

Asset appreciation changes Net Worth.

### Rule 6

Debt reduction increases Net Worth.

---

# Business Engine Responsibilities (Goals, Assets & Liabilities)

Business Engine owns calculations for:

### Goals

* Saved Amount.
* Remaining Amount.
* Completion Percentage.
* Contribution Totals.

### Assets

* Current Value.
* Appreciation.
* Allocation.
* Asset Totals.

### Liabilities

* Outstanding Debt.
* EMI Totals.
* Debt Distribution.
* Payment Totals.

### Net Worth

* Total Cash.
* Total Assets.
* Total Liabilities.
* Net Worth.

These outputs become reusable workbook metrics.

---

# Immutable Decisions in Part C

The following rules are frozen.

* Goal progress is calculated only by Business Engine.
* Asset appreciation is calculated only by Business Engine.
* Liability totals are calculated only by Business Engine.
* Net Worth is calculated only by Business Engine.
* Dashboard never recalculates wealth metrics.
* Analysis Engine only consumes these outputs.

---

# Part C Complete

This section freezes the Goal Engine, Asset Engine, Liability Engine, Net Worth Engine, reusable outputs, and ownership rules.

Part D freezes the Forecast Engine, Recurring Commitment Engine, and Financial Health input calculations.


---

# Recurring Commitment Engine (Frozen)

The Recurring Commitment Engine calculates every scheduled financial obligation that repeats over time.

Recurring commitments represent planned payments.

Transactions represent completed payments.

This separation is immutable.

---

# Recurring Commitment Philosophy

The Recurring Commitment Engine answers:

* What payments are scheduled this month?
* How much fixed spending is committed?
* Which commitments are upcoming?
* Which commitments are overdue?

The engine performs scheduling calculations only.

---

# Recurring Commitment Input Sources

Reads data from:

| Worksheet             | Purpose                           |
| --------------------- | --------------------------------- |
| Recurring Commitments | Commitment records.               |
| Liabilities           | EMI relationships.                |
| Settings              | Financial calendar configuration. |

Transactions are **not** used to determine upcoming commitments.

---

# Recurring Commitment Output Metrics

| Output                    | Purpose             |
| ------------------------- | ------------------- |
| Monthly Commitment Total  | Dashboard KPI       |
| Upcoming Commitment Total | Forecast Engine     |
| Commitment Count          | Dashboard KPI       |
| Commitment Calendar       | Dashboard Timeline  |
| Commitment by Type        | Dashboard Breakdown |
| Overdue Commitment Count  | Analysis Input      |

---

# Monthly Commitment Calculation

Calculates obligations due during the selected month.

---

## Monthly Commitment Rules

### Rule 1 — Active Commitments Only

Only commitments with Status = Active participate.

### Rule 2 — Frequency Must Match Current Month

Monthly commitments appear every month.

Quarterly commitments appear only during due quarters.

Half-Yearly commitments appear every six months.

Yearly commitments appear during due month.

### Rule 3 — Respect Start Date

Commitments begin only after Start Date.

### Rule 4 — Respect End Date

Commitments stop after End Date.

---

# Upcoming Commitment Calculation

Calculates commitments scheduled after today's date within the selected reporting period.

---

## Upcoming Commitment Rules

### Rule 1

Include Active commitments only.

### Rule 2

Exclude Completed commitments.

### Rule 3

Exclude Paused commitments.

### Rule 4

Sort by Due Day.

---

# Overdue Commitment Calculation

Calculates commitments whose Due Day has passed without a completed payment transaction during the reporting period.

---

## Overdue Rules

### Rule 1

Current month only.

### Rule 2

Only Active commitments.

### Rule 3

Completed payments remove overdue status.

---

# Commitment Category Totals

Groups commitment value by type.

---

## Supported Categories

* EMI
* Rent
* Utilities
* Insurance
* Subscription
* Asset Contribution
* SIP
* Savings Transfer
* Membership
* Other

Dashboard consumes grouped totals.

---

# Budget Engine

The Budget Engine is **not included** in FinanceOS Version 1.

Version 1 does not include a Budget Module, Budgets worksheet, Budget Card, or planned-versus-actual budget outputs.

Spending remains visible through Transactions, Categories, Dashboard, and Insights.

The following budget calculation headings are retained only as Version 1 exclusions.

---

# Budget Philosophy

Budgets are not part of Version 1. There is no planned-versus-actual budget model.

---

# Budget Engine Input Sources

Not applicable in Version 1.

---

# Budget Output Metrics

Version 1 produces no budget outputs.

---

# Budget Allocation Calculation

Not applicable in Version 1.

---

# Budget Spent Calculation

Not applicable in Version 1.

---

# Budget Remaining Calculation

Not applicable in Version 1.

---

# Budget Utilization Calculation

Not applicable in Version 1.

---

# Budget Overspending Calculation

Not applicable in Version 1.

---

# Forecast Engine (Frozen)

The Forecast Engine projects future financial position using deterministic assumptions.

Forecasts never modify workbook data.

---

# Forecast Philosophy

Forecast answers:

* How much money will remain this month?
* Which commitments are still unpaid?
* What will closing balance look like?
* What happens if current financial behavior continues?

The Forecast Engine performs projection only.

---

# Forecast Input Sources

Reads:

| Worksheet             | Purpose                             |
| --------------------- | ----------------------------------- |
| Accounts              | Current balances.                   |
| Transactions          | Completed and Pending transactions. |
| Recurring Commitments | Upcoming obligations.               |
| Goals                 | Planned contributions.              |
| Settings              | Calendar configuration.             |

---

# Forecast Output Metrics

| Output                    | Purpose                     |
| ------------------------- | --------------------------- |
| Forecast Income           | Remaining expected income   |
| Forecast Expense          | Remaining expected expenses |
| Forecast Commitment Total | Remaining commitments       |
| Forecast Closing Balance  | Dashboard KPI               |
| Forecast Monthly Savings  | Dashboard Forecast          |
| Forecast Remaining Cash   | Purchase Simulator Input    |

---

# Forecast Income Calculation

Calculates pending income expected before period end.

---

## Rules

### Rule 1

Pending income only.

### Rule 2

Completed income excluded.

### Rule 3

Respect reporting month.

---

# Forecast Expense Calculation

Calculates pending expense expected before period end.

---

## Rules

### Rule 1

Pending expenses only.

### Rule 2

Completed expenses excluded.

### Rule 3

Cancelled expenses excluded.

---

# Forecast Commitment Calculation

Calculates remaining active commitments not yet completed.

---

## Rules

### Rule 1

Only upcoming commitments.

### Rule 2

Exclude completed commitment payments.

### Rule 3

Respect Due Day.

---

# Forecast Closing Balance Calculation

Projects end-of-month available cash.

---

## Rules

### Rule 1

Opening Cash + Remaining Income − Remaining Expense − Remaining Commitments.

### Rule 2

Uses Available Cash as starting point.

### Rule 3

Forecast remains read-only.

---

# Forecast Savings Calculation

Projects expected savings for reporting period.

---

## Rules

Forecast Income − Forecast Expense.

Goal contributions included according to planned spending rules.

---

# Forecast Remaining Cash Calculation

Projects discretionary cash after all known obligations.

---

## Rules

Subtract fixed commitments first.

Subtract pending expenses.

Remaining cash becomes Purchase Simulator input.

---

# Financial Health Input Engine (Frozen)

The Financial Health Input Engine calculates reusable inputs consumed by the Analysis Engine.

It does **not** calculate the final Health Score.

---

# Health Input Philosophy

Business Engine provides measurements.

Analysis Engine provides interpretation.

---

# Health Input Output Metrics

| Output                      | Purpose                |
| --------------------------- | ---------------------- |
| Savings Rate Input          | Health Score component |
| Emergency Coverage Input    | Health Score component |
| Debt Burden Input           | Health Score component |
| Cash Flow Stability Input   | Health Score component |
| Goal Progress Input         | Health Score component |
| Asset Allocation Input      | Health Score component |

---

# Savings Rate Input Calculation

Measures percentage of income retained.

---

## Rules

Monthly Savings ÷ Monthly Income × 100.

Negative values allowed.

---

# Emergency Coverage Input

Measures emergency reserve coverage in months.

---

## Rules

Emergency Cash ÷ Monthly Essential Expenses.

Essential expense definitions come from DOC-008.

---

# Debt Burden Input

Measures debt obligation relative to income.

---

## Rules

Monthly EMI Total ÷ Monthly Income × 100.

Used by Analysis Engine.

---

# Cash Flow Stability Input

Measures consistency of positive surplus.

---

## Rules

Uses historical monthly surplus calculations.

Business Engine outputs numeric stability metrics only.

---

# Goal Progress Input

Measures overall savings progress.

---

## Rules

Uses Goal Completion Percentages.

Outputs reusable aggregate metrics.

---

# Asset Allocation Input

Measures distribution of asset value.

---

## Rules

Uses Asset Allocation outputs.

No performance interpretation.

---

# Forecast Summary Outputs

The Forecast Engine creates reusable monthly projections.

| Output                        | Purpose         |
| ----------------------------- | --------------- |
| Closing Cash Forecast         | Dashboard       |
| Remaining Commitment Forecast | Dashboard       |
| Remaining Income Forecast     | Dashboard       |
| Remaining Expense Forecast    | Dashboard       |
| Monthly Savings Forecast      | Dashboard       |
| Purchase Simulation Input     | Analysis Engine |

---

# Business Engine Responsibilities (Forecast & Health Inputs)

Business Engine owns:

### Recurring Commitments

* Upcoming commitments.
* Overdue commitments.
* Commitment totals.
* Commitment schedule.

### Forecast

* Closing balance.
* Forecast savings.
* Remaining cash.
* Forecast commitments.

### Health Inputs

* Savings Rate Input.
* Debt Burden Input.
* Emergency Coverage Input.
* Goal Progress Input.
* Asset Allocation Input.

These outputs become the foundation for the Analysis Engine.

---

# Immutable Decisions in Part D

The following rules are frozen.

* Forecast Engine performs deterministic projections only.
* Budget Engine is not included in Version 1.
* Recurring Commitment Engine owns scheduling calculations.
* Business Engine provides Health Score inputs only.
* Analysis Engine owns final scoring and interpretation.
* Forecast calculations never modify workbook data.

---

# Part D Complete

This section freezes the Recurring Commitment Engine, Forecast Engine, Financial Health Input Engine, reusable outputs, and ownership rules.

Part E completes DOC-010 with the dependency matrix, worksheet protection rules, performance architecture, Cursor implementation rules, and Version 1 Business Engine freeze.


---

# Business Engine Dependency Matrix (Frozen)

The Business Engine follows a strict dependency architecture.

Every calculation has exactly one owner and one direction of dependency.

No circular references are permitted.

---

## Dependency Philosophy

FinanceOS calculations always flow downward.

User Data

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

Presentation layers never become calculation inputs.

---

## Worksheet Dependency Matrix

| Source Worksheet | Business Engine Uses |
|------------------|----------------------|
| Settings | Currency, Financial Year, Configuration |
| Categories | Category metadata |
| Accounts | Opening balances, account metadata |
| Income Sources | Income metadata |
| Assets | Asset records |
| Liabilities | Debt records |
| Recurring Commitments | Scheduled obligations |
| Transactions | Financial activity ledger |
| Goals | Goal targets and priorities |
| Helpers | Validation lists, lookup outputs, named ranges, and intermediate helper outputs |

Business Engine consumes only upstream worksheets.

---

## Business Engine Output Consumers

| Consumer Worksheet | Uses Business Engine Outputs |
|--------------------|-----------------------------|
| Analysis Engine | Health metrics, forecasts, runway inputs |
| Dashboard | KPIs, cards, charts, balances |
| Insights | Deterministic financial explanations |

Business Engine outputs are the source of truth.

---

# Business Engine Section Layout (Frozen)

The worksheet is divided into permanent calculation sections.

---

## Section 1 — Global Configuration

Purpose:

Store reusable configuration values imported from Settings.

Examples:

- Current Financial Year
- Current Reporting Month
- Currency
- Decimal Precision

This section contains helper references only.

---

## Section 2 — Cash Flow Engine

Contains:

- Monthly Income
- Monthly Expense
- Savings
- Surplus
- Fixed Commitments
- Variable Spending
- Remaining Cash

Outputs reused throughout workbook.

---

## Section 3 — Account Engine

Contains:

- Current Balance
- Total Cash
- Cash by Institution
- Cash by Account Type
- Available Cash

---

## Section 4 — Goal Engine

Contains:

- Saved Amount
- Remaining Amount
- Completion Percentage
- Monthly Contributions
- Average Contributions

---

## Section 5 — Asset Engine

Contains:

- Asset Value
- Appreciation
- Depreciation
- Asset Allocation
- Asset Contributions

---

## Section 6 — Liability Engine

Contains:

- Outstanding Debt
- EMI Total
- Debt Distribution
- Liability Payment Totals

---

## Section 7 — Budget Engine

Not included in Version 1.

---

## Section 8 — Forecast Engine

Contains:

- Forecast Income
- Forecast Expense
- Forecast Commitments
- Forecast Savings
- Forecast Remaining Cash
- Forecast Closing Balance

---

## Section 9 — Health Input Engine

Contains reusable inputs for Analysis Engine.

Includes:

- Savings Rate
- Emergency Coverage
- Debt Burden
- Goal Progress
- Cash Flow Stability
- Asset Allocation

---

# Business Engine Calculation Ownership Matrix

Every financial metric belongs to one calculation section.

| Calculation | Owner Section |
|-------------|---------------|
| Monthly Income | Cash Flow Engine |
| Monthly Expense | Cash Flow Engine |
| Monthly Savings | Cash Flow Engine |
| Remaining Cash | Cash Flow Engine |
| Current Balance | Account Engine |
| Available Cash | Account Engine |
| Goal Progress | Goal Engine |
| Remaining Goal Amount | Goal Engine |
| Asset Appreciation | Asset Engine |
| Outstanding Debt | Liability Engine |
| EMI Burden | Liability Engine |
| Closing Balance Forecast | Forecast Engine |
| Savings Rate Input | Health Input Engine |
| Emergency Coverage Input | Health Input Engine |

Ownership is immutable.

---

# Intermediate Calculation Rules

Business Engine may use intermediate calculations internally.

---

## Philosophy

Intermediate calculations reduce duplicate formulas.

They are not user-facing metrics.

---

## Rules

### Rule 1

Intermediate outputs remain inside Business Engine.

### Rule 2

Dashboard never references intermediate calculations directly unless documented.

### Rule 3

Analysis Engine references final reusable outputs only.

---

# Business Engine Protection Rules

The Business Engine is a protected engineering worksheet.

---

## Editable Regions

None.

Users never edit Business Engine values.

---

## Protected Regions

Protect:

- Formulas
- Summary outputs
- Intermediate calculations
- Forecast outputs
- Health inputs
- Lookup references

Entire worksheet remains locked.

---

## Hidden Rows and Columns

Hidden rows are permitted only for engineering organization.

Hidden calculations must remain documented.

No undocumented hidden logic.

---

# Business Engine Performance Rules

Performance is mandatory because Transactions becomes the largest worksheet.

---

## Performance Principles

### Rule 1 — Structured References Only

Use Excel Tables.

Never hardcoded ranges.

### Rule 2 — Avoid Duplicate Aggregations

Calculate once.

Reuse outputs.

### Rule 3 — No Circular References

Circular formulas prohibited.

### Rule 4 — Minimize Volatile Functions

Avoid:

- OFFSET
- INDIRECT
- TODAY inside repeated calculations
- RAND
- RANDBETWEEN

Unless documented.

### Rule 5 — Spill From Helper Sections Only

Business Engine should consume helper outputs.

Not generate large spill ranges.

---

## Performance Targets

The workbook should remain responsive with:

- 50,000+ transactions.
- Hundreds of goals.
- Hundreds of assets.
- Hundreds of liabilities.
- Multiple financial years.

Architecture is optimized for long-term growth.

---

# Business Engine Error Handling Rules

Errors should never reach Dashboard.

---

## Error Handling Philosophy

Business Engine handles missing data gracefully.

---

## Rules

### Missing Lookup

Return blank or unavailable.

### Missing Goal

Ignore invalid reference.

### Missing Liability

Ignore invalid payment aggregation.

### Division by Zero

Return blank.

Never display Excel error codes.

---

# Business Engine Testing Rules

Every calculation module must be independently testable.

---

## Cash Flow Tests

Validate:

- Income totals.
- Expense totals.
- Savings.
- Surplus.

---

## Account Tests

Validate:

- Transfers.
- Balance updates.
- Available cash.

---

## Goal Tests

Validate:

- Contributions.
- Completion percentage.
- Remaining amount.

---

## Asset Tests

Validate:

- Appreciation.
- Allocation totals.
- Total asset value.

---

## Liability Tests

Validate:

- Outstanding debt.
- EMI totals.
- Debt distribution.

---

## Forecast Tests

Validate:

- Closing balance.
- Pending commitments.
- Remaining cash.

Testing checklist documented separately in DOC-022.

---

# Cursor Implementation Rules (Business Engine)

Cursor must follow these implementation rules.

---

## Mandatory Rules

Cursor must:

- Build calculation sections in documented order.
- Use documented output names.
- Keep reusable calculations together.
- Preserve worksheet ownership.
- Preserve deterministic outputs.
- Preserve structured references.

---

## Prohibited Rules

Cursor must never:

- Move calculations into Dashboard.
- Move calculations into Transactions.
- Duplicate calculations inside Analysis Engine.
- Hardcode summary values.
- Create undocumented helper calculations.

---

# Future Migration Readiness

The Business Engine is designed for migration to React and TypeScript.

---

## Mapping Philosophy

Each Business Engine module becomes one future service.

| Business Engine Module | Future Service |
|-------------------------|----------------|
| Cash Flow Engine | cashFlowService |
| Account Engine | accountService |
| Goal Engine | goalService |
| Asset Engine | assetService |
| Liability Engine | liabilityService |
| Forecast Engine | forecastService |
| Health Input Engine | healthInputService |

Workbook logic maps directly to application logic.

---

## Migration Rules

Future applications should preserve:

- Calculation ownership.
- Dependency direction.
- Deterministic outputs.
- Separation between calculation and interpretation.

Excel Version 1 remains the canonical implementation.

---

# Business Engine Immutable Rules Matrix

| Rule Category | Immutable Decision |
|---------------|--------------------|
| Cash Flow | Calculated only in Business Engine. |
| Account Balances | Calculated only in Business Engine. |
| Goal Progress | Calculated only in Business Engine. |
| Asset Valuation | Calculated only in Business Engine. |
| Liability Totals | Calculated only in Business Engine. |
| Forecast Metrics | Calculated only in Business Engine. |
| Health Inputs | Produced only in Business Engine. |
| Dashboard | Never recalculates Business Engine outputs. |
| Analysis Engine | Consumes Business Engine outputs only. |

This matrix is frozen.

---

# Version 1 Business Engine Freeze

The following Business Engine architecture decisions are permanently frozen.

### Calculation Architecture

- One owner per calculation.
- One dependency direction.
- One reusable output per metric.

### Financial Modules

- Cash Flow Engine.
- Account Engine.
- Goal Engine.
- Asset Engine.
- Liability Engine.
- Forecast Engine.
- Health Input Engine.

### Protection Rules

- Protected worksheet.
- No user edits.
- No undocumented formulas.
- No circular references.

### Compatibility Rules

- Excel-first implementation.
- Desktop/Web/Mobile compatible.
- Migration-ready architecture.

---

# Version History

## Version 1.0 — Initial Freeze

The complete deterministic Business Engine architecture for FinanceOS Version 1 has been frozen.

This document defines every calculation owner, dependency rule, reusable financial output, forecast input, health input, protection rule, and migration mapping for the workbook.

---

**End of Document — DOC-010 Business Engine Version 1.0**