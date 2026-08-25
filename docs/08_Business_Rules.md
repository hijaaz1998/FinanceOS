# FinanceOS — Business Rules

**Document ID:** DOC-008

**Version:** 1.0

**Status:** **FROZEN**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Applies To:** FinanceOS Excel Workbook Version 1

**Last Updated:** 24 August 2026

---

# Purpose

This document defines the immutable financial behavior of FinanceOS Version 1.

Unlike DOC-007, which defines worksheet structure, DOC-008 defines **how FinanceOS behaves** when money moves through the system.

Every formula, validation, calculation, forecast, and dashboard metric must follow these rules.

If workbook implementation differs from these rules, **this document is the source of truth**.

---

# FinanceOS Financial Philosophy

FinanceOS follows five permanent principles.

## Principle 1 — Every Financial Event Has One Source of Truth

Every financial event exists exactly once.

Examples:

* Salary appears as one Income transaction.
* Grocery appears as one Expense transaction.
* Transfer appears as one Transfer transaction.

Duplicate financial events are prohibited.

---

## Principle 2 — Money Always Moves Between Entities

Every transaction moves money between defined entities.

Possible entities:

* External World
* Accounts
* Categories
* Goals
* Liabilities
* Assets

No transaction exists without movement between entities.

---

## Principle 3 — Planning and History Are Separate

Planning lives in:

* Goals
* Recurring Commitments

History lives in:

* Transactions

FinanceOS never mixes planned events with completed events.

---

## Principle 4 — Deterministic Calculations Only

Version 1 calculations are deterministic.

Outputs depend only on workbook data.

No AI model changes calculations.

---

## Principle 5 — Historical Data Is Never Destroyed

Users may archive, pause, or close entities.

FinanceOS never deletes historical financial records automatically.

---

# Rule Hierarchy

FinanceOS applies rules in this order.

1. Architecture Decisions.
2. Business Rules.
3. Worksheet Specifications.
4. Formula Standards.
5. UI Rules.

Lower layers cannot override higher layers.

---

# Transaction Rules

Transactions are immutable financial history.

Every financial activity is represented by one transaction record.

---

## Transaction Rule 1 — Income

Income represents money entering the user's financial system.

Examples:

* Salary
* Freelance
* Rental Income
* Cashback
* Refund
* Interest
* Business Income
* Gift Received

### Income Behavior

* Cash increases.
* Income analytics increase.
* Account balance increases.
* Net Worth increases.

---

## Transaction Rule 2 — Expense

Expense represents money leaving an account.

Examples:

* Food
* Rent
* Shopping
* Utilities
* Travel
* Entertainment
* Healthcare

### Expense Behavior

* Cash decreases.
* Expense analytics increase.
* Spending category updates.
* Savings decrease if income unchanged.

---

## Transaction Rule 3 — Transfer

Transfers move money between user-owned accounts.

Examples:

* HDFC Savings → Wallet.
* SBI Savings → Cash.
* Cash → ICICI Savings.

### Transfer Behavior

* Source account decreases.
* Destination account increases.
* Total Cash unchanged.
* Income unchanged.
* Expenses unchanged.
* Net Worth unchanged.

Transfers are excluded from spending reports.

---

## Transaction Rule 4 — Adjustment

Adjustment corrects balances manually.

Examples:

* Bank reconciliation.
* Incorrect opening balance.
* Manual correction.

### Adjustment Behavior

* Account balance changes.
* Analytics ignore adjustments.
* Dashboard records adjustment separately.

Use adjustments sparingly.

---

# Account Rules

Accounts represent containers that hold money.

---

## Rule 1 — Opening Balance

Opening Balance is entered once.

It represents the balance before FinanceOS tracking begins.

Never edit Opening Balance after implementation unless performing reconciliation.

---

## Rule 2 — Current Balance

Current Balance is always calculated.

Formula ownership belongs to Business Engine.

Users never type Current Balance manually.

---

## Rule 3 — Closed Accounts

Closed accounts:

* Stay historically visible.
* Remain in reports.
* Cannot receive new transactions.
* Cannot appear in active dropdowns.

---

## Rule 4 — Account Deletion

Accounts are never deleted after transactions exist.

Status changes instead.

---

## Rule 5 — Multiple Accounts

Users may own unlimited accounts.

Each account maintains an independent balance.

---

## Rule 6 — Credit Card Accounts

Credit Card accounts behave differently.

Purchases create expenses.

Payments create transfers toward liabilities.

Credit card spending must never be counted twice.

---

# Transfer Rules

Transfers follow strict accounting rules.

---

## Transfer Rule 1

Exactly one source account.

Exactly one destination account.

---

## Transfer Rule 2

Transfers never require categories.

---

## Transfer Rule 3

Transfers never affect savings rate.

---

## Transfer Rule 4

Transfers never appear in expense category charts.

---

## Transfer Rule 5

Transfers update both account balances immediately.

---

# Income Source Rules

Income Sources classify origin, not destination.

---

## Income Source Rule 1

Income Source required only for Income transactions.

---

## Income Source Rule 2

Income Source and Category are separate fields.

Example:

Salary Source

Category:

Salary Income

---

## Income Source Rule 3

Inactive Income Sources remain available historically.

---

# Category Rules

Categories classify financial intent.

---

## Expense Categories

Examples:

* Food
* Rent
* Shopping
* Utilities
* Travel
* Entertainment

---

## Income Categories

Examples:

* Salary Income
* Business Income
* Investment Income
* Refund Income
* Cashback Income

---

## Category Rule 1

Category names are unique within each type.

---

## Category Rule 2

Expense Categories never appear in Income transactions.

---

## Category Rule 3

Income Categories never appear in Expense transactions.

---

## Category Rule 4

Transfers do not use categories.

---

## Category Rule 5

Archived categories remain in historical reporting.

---

# Payment Method Rules

Payment Method records **how** money moved.

It does not change financial calculations.

Supported methods:

* Cash
* UPI
* Bank Transfer
* Debit Card
* Credit Card
* Wallet
* Net Banking
* Auto Debit
* Other

Payment Method affects reporting only.

---

# Transaction Status Rules

Supported statuses:

* Completed
* Pending
* Cancelled

### Completed

Included everywhere.

### Pending

Included in forecasts.

Excluded from completed spending.

### Cancelled

Ignored in calculations.

Preserved historically.

---

# Duplicate Transaction Rules

FinanceOS does not automatically merge duplicates.

Users are responsible for reviewing duplicates.

Future versions may include duplicate detection.

---

# Refund Rules

Refund is treated as Income.

Rules:

* Income Source = Refund.
* Category = Refund Income.
* Account increases.
* Expense history remains unchanged.

Refunds do not erase original expenses.

---

# Cashback Rules

Cashback is always Income.

Never negative expense.

Income Source:

Cashback.

Category:

Cashback Income.

---

# Transaction Immutability Rules

Transactions represent historical truth.

Allowed edits:

* Notes.
* Status.
* Category correction.
* Payment Method correction.

Changing Amount or Account after reconciliation should require user confirmation.

---

# Business Rule Ownership Matrix (Part A)

| Rule Category   | Owner   |
| --------------- | ------- |
| Transactions    | DOC-008 |
| Accounts        | DOC-008 |
| Transfers       | DOC-008 |
| Income Sources  | DOC-008 |
| Categories      | DOC-008 |
| Payment Methods | DOC-008 |
| Status Behavior | DOC-008 |

---

# End of Part A

This section freezes:

* Financial philosophy.
* Transaction behavior.
* Account behavior.
* Transfer behavior.
* Income Source behavior.
* Category behavior.
* Payment Method behavior.
* Transaction Status behavior.


---

# Assets Rules

Assets represent everything the user owns that contributes to Net Worth.

Assets are ownership records, not transaction records.

Every asset follows a lifecycle from purchase to disposal.

---

## Asset Philosophy

FinanceOS separates:

* **Asset ownership** (Assets worksheet)
* **Asset purchase/sale activity** (Transactions worksheet)
* **Asset valuation** (Business Engine)

This separation is immutable.

---

## Asset Rule 1 — Asset Creation

A new asset is created when ownership begins.

Examples:

* Buying gold.
* Purchasing a vehicle.
* Starting a mutual fund investment.
* Purchasing land.

Creating an asset **does not** automatically create a transaction.

The purchase transaction must exist separately.

---

## Asset Rule 2 — Purchase Value Is Historical

Purchase Value records the acquisition cost.

It never changes after creation.

Examples:

| Asset       | Purchase Value |
| ----------- | -------------- |
| Gold        | ₹50,000        |
| Bike        | ₹1,40,000      |
| Mutual Fund | ₹25,000        |

Purchase Value is immutable historical information.

---

## Asset Rule 3 — Current Value Represents Today's Value

Current Value represents the latest estimated value.

Users update it manually in Version 1.

Examples:

* Gold appreciates.
* Vehicle depreciates.
* Mutual Fund grows.
* Land value changes.

Business Engine uses Current Value for Net Worth.

---

## Asset Rule 4 — Appreciation and Depreciation

Business Engine calculates appreciation.

<math block value="\\text{Appreciation Amount}=\\text{Current Value}-\\text{Purchase Value}"/>

<math block value="\\text{Appreciation \\%}=\\frac{\\text{Current Value}-\\text{Purchase Value}}{\\text{Purchase Value}}\\times100"/>

Users never edit these fields.

---

## Asset Rule 5 — Asset Categories Drive Reporting

Categories determine Dashboard grouping.

Examples:

| Category         | Dashboard Group |
| ---------------- | --------------- |
| Investment       | Investments     |
| Property         | Property        |
| Retirement Asset | Retirement      |
| Physical Asset   | Physical Wealth |
| Cash Equivalent  | Cash Reserve    |

Categories are immutable reporting groups.

---

## Asset Rule 6 — Asset Types Drive Detail

Asset Type provides detailed classification.

Examples:

Investment Category contains:

* Mutual Fund
* Stock
* ETF
* Bond
* Gold ETF

Reports can aggregate by Category or Type.

---

## Asset Rule 7 — Linked Account

Assets may optionally link to an account.

Purpose:

* Show purchase account.
* Track investment account ownership.

Examples:

Gold ETF linked to Zerodha.

Fixed Deposit linked to HDFC Savings.

---

## Asset Rule 8 — Sold Assets

Sold assets remain permanently.

Status changes:

* Active
* Sold

Historical Net Worth reports preserve sold assets.

Deletion is prohibited.

---

## Asset Rule 9 — Net Worth Behavior

Asset purchase:

* Cash decreases.
* Asset increases.
* Net Worth unchanged immediately.

Future appreciation changes Net Worth.

---

## Asset Rule 10 — Manual Valuation

Version 1 never fetches live market prices.

Users update Current Value manually.

Future versions may automate valuation.

---

# Liability Rules

Liabilities represent money the user owes.

Liabilities reduce Net Worth.

---

## Liability Philosophy

FinanceOS separates:

* Liability ownership.
* Liability payment history.
* Liability forecasting.

Each responsibility belongs to a different worksheet.

---

## Liability Rule 1 — Original Amount Never Changes

Original Amount records borrowed principal.

Immutable after creation.

---

## Liability Rule 2 — Outstanding Balance Represents Remaining Debt

Outstanding Balance represents today's unpaid debt.

Users update it after principal reductions when necessary.

Business Engine reads Outstanding Balance.

---

## Liability Rule 3 — Interest Rate Is Informational in Version 1

Interest Rate is stored.

Business Engine may calculate interest summaries.

Version 1 does not generate amortization schedules.

---

## Liability Rule 4 — EMI Amount Represents Scheduled Payment

EMI Amount records recurring payment size.

Used by:

* Recurring Commitments.
* Dashboard.
* Forecast Engine.

---

## Liability Rule 5 — EMI Frequency

Supported frequencies:

* Monthly
* Quarterly
* Half-Yearly
* Yearly

Frequency controls payment forecasting.

---

## Liability Rule 6 — EMI Due Day

Represents payment day.

Valid values:

1–31.

Used by commitment forecasting.

---

## Liability Rule 7 — Linked Payment Account

Payment Account identifies where EMI is paid from.

Examples:

* SBI Savings.
* HDFC Salary Account.

Dashboard forecasts account cash impact.

---

## Liability Rule 8 — Closed Liabilities

Closed liabilities remain permanently.

Status changes.

Historical payoff progress preserved.

---

## Liability Rule 9 — Credit Cards Are Liabilities

Credit cards follow special rules.

Purchases create Expense transactions.

Payments reduce liability.

Credit card payments never create expenses again.

---

## Liability Rule 10 — Outstanding Balance Cannot Become Negative

Outstanding Balance minimum:

0.

Business Engine prevents negative debt.

---

# EMI Rules

EMIs connect liabilities with recurring commitments.

---

## EMI Rule 1 — Auto EMI

If Auto EMI is enabled:

Recurring Commitments includes scheduled EMI.

---

## EMI Rule 2 — Manual EMI

If Auto EMI disabled:

Liability exists without recurring payment generation.

---

## EMI Rule 3 — EMI Payment Transaction

Actual EMI payment recorded as Transaction.

Destination Type:

Liability.

---

## EMI Rule 4 — Missed EMI

Pending commitment remains unpaid.

Dashboard warns upcoming liability.

---

## EMI Rule 5 — Extra EMI Payment

Users may create additional liability payment transaction.

Outstanding Balance decreases manually afterward.

---

# Credit Card Rules

Credit cards have unique behavior.

---

## Credit Card Purchase Rule

Expense transaction.

Payment Method:

Credit Card.

Liability outstanding increases externally.

---

## Credit Card Payment Rule

Transfer from Bank Account to Liability.

Expense not counted twice.

---

## Credit Card Cashback Rule

Cashback recorded separately as Income.

---

## Credit Card Refund Rule

Refund recorded as Income.

Original expense remains historical.

---

# Recurring Commitments Rules

Recurring Commitments represent future obligations.

---

## Commitment Rule 1 — Planned Payment Only

Recurring Commitment never changes historical spending.

Transactions confirm payment completion.

---

## Commitment Rule 2 — Frequency Controls Forecasts

Supported:

* Monthly
* Quarterly
* Half-Yearly
* Yearly

Business Engine projects upcoming obligations.

---

## Commitment Rule 3 — Start Date Activates Commitment

Payments begin on or after Start Date.

---

## Commitment Rule 4 — End Date Stops Forecasting

After End Date:

Commitment ignored in forecasts.

Historical record retained.

---

## Commitment Rule 5 — Paused Commitment

Paused commitments:

* Excluded from forecasts.
* Retained historically.

---

## Commitment Rule 6 — Completed Commitment

Completed commitments:

* Historical only.
* Never appear in future forecasts.

---

## Commitment Rule 7 — Linked Liability

EMI commitments reference liabilities.

Dashboard groups EMI commitments automatically.

---

## Commitment Rule 8 — Linked Goal

Monthly savings commitments reference goals.

Goal forecast includes commitment.

---

## Commitment Rule 9 — Utility Commitments

Examples:

* Electricity.
* Internet.
* Water.
* Mobile Recharge.

Utilities forecast monthly cash requirements.

---

## Commitment Rule 10 — Subscription Commitments

Examples:

* Netflix.
* Spotify.
* ChatGPT.
* Cursor.

Subscriptions appear separately in Dashboard.

---

# Cash Flow Effect of Commitments

Commitments reduce projected available cash.

Before payment:

Forecast only.

After payment:

Transaction updates actual cash flow.

---

# Business Engine Responsibilities (Assets & Liabilities)

Business Engine calculates:

### Assets

* Total Asset Value.
* Appreciation.
* Allocation by Category.
* Allocation by Type.

### Liabilities

* Outstanding Debt.
* EMI Burden.
* Remaining Debt.
* Debt Distribution.

### Commitments

* Upcoming Payments.
* Monthly Fixed Commitments.
* Quarterly Commitments.
* Annual Commitments.

---

# Analysis Engine Responsibilities (Assets & Liabilities)

Analysis Engine interprets:

### Assets

* Investment Growth.
* Asset Diversification.
* Wealth Allocation.

### Liabilities

* Debt Health.
* Payoff Progress.
* Debt-to-Income Ratio.

### Commitments

* Commitment Burden.
* Upcoming Payment Risk.
* Subscription Growth.

---

# Business Rule Ownership Matrix (Part B)

| Rule Category         | Owner   |
| --------------------- | ------- |
| Assets                | DOC-008 |
| Liabilities           | DOC-008 |
| EMIs                  | DOC-008 |
| Credit Cards          | DOC-008 |
| Recurring Commitments | DOC-008 |
| Asset Valuation       | DOC-008 |
| Liability Payoff      | DOC-008 |

---

# End of Part B

This section freezes:

* Asset behavior.
* Appreciation rules.
* Liability behavior.
* EMI behavior.
* Credit Card behavior.
* Recurring Commitment behavior.


---

# Goal Rules

Goals represent intentional future financial objectives.

Goals are planning entities.

They do not represent historical transactions.

Historical money movement always exists inside Transactions.

---

## Goal Philosophy

FinanceOS separates:

* Goal planning.
* Goal funding.
* Goal forecasting.
* Goal completion.

Each responsibility belongs to a different system layer.

---

## Goal Rule 1 — Goal Creation

A goal represents one financial objective.

Examples:

* Emergency Fund.
* Bike Purchase.
* Car Purchase.
* Home Purchase.
* Travel Fund.
* Gold Purchase.
* Education Fund.

Each goal receives one permanent Goal ID.

---

## Goal Rule 2 — Target Amount Never Represents Current Savings

Target Amount is the desired destination.

Current Saved Amount is calculated independently.

Users never manually synchronize them.

---

## Goal Rule 3 — Current Saved Amount Is Calculated

Business Engine calculates Current Saved Amount using Goal transactions.

Formula ownership belongs entirely to Business Engine.

Users cannot edit Current Saved Amount.

---

## Goal Rule 4 — Remaining Amount

Remaining Amount is calculated.

**Formula**

Remaining Amount = Target Amount − Current Saved Amount

Minimum remaining amount is zero.

Never negative.

---

## Goal Rule 5 — Goal Completion

A goal becomes Completed when:

Current Saved Amount ≥ Target Amount.

Completion is deterministic.

Users do not manually mark completed goals unless overriding status intentionally.

---

## Goal Rule 6 — Goal Priority

Version 1 supports:

* High
* Medium
* Low

Priority affects:

* Dashboard ordering.
* Recommendation ordering.
* Forecast ordering.

Priority never changes calculations.

---

## Goal Rule 7 — Paused Goals

Paused goals:

* Stay visible.
* Keep historical contributions.
* Stop recommendation calculations.
* Stop recurring contribution forecasts.

---

## Goal Rule 8 — Archived Goals

Archived goals:

* Historical only.
* Excluded from active dashboard cards.
* Included in historical reports.

---

## Goal Rule 9 — Monthly Contribution Target

Monthly Contribution Target is planning information.

Business Engine compares:

Target Contribution vs Actual Contribution.

Analysis Engine identifies delays.

---

## Goal Rule 10 — Linked Goal Contributions

Transactions with Destination Type = Goal increase Goal Savings.

Goal contributions reduce available cash.

They do **not** reduce Net Worth.

---

# Goal Funding Rules

Goals receive money only through Goal transactions.

---

## Funding Rule 1

Every Goal contribution creates an Expense transaction with a Goal destination.

---

## Funding Rule 2

Transfers between accounts do not increase Goal Savings.

---

## Funding Rule 3

Deleting a Goal transaction reduces Goal Savings immediately.

---

## Funding Rule 4

Cancelled Goal transactions do not affect Goal Savings.

---

## Funding Rule 5

Refunded Goal transactions reverse Goal Savings.

---

# Savings Rules

Savings represent money intentionally retained after expenses.

FinanceOS distinguishes savings from investments.

---

## Savings Philosophy

Savings answer:

**"How much money remained after spending?"**

Investments answer:

**"Where did saved money move?"**

---

## Savings Rule 1 — Monthly Savings

Monthly Savings equals:

Monthly Income − Monthly Expense.

Transfers excluded.

---

## Savings Rule 2 — Savings Rate

Savings Rate measures income retained.

**Formula**

Savings Rate = Monthly Savings / Monthly Income × 100

Displayed as percentage.

---

## Savings Rule 3 — Negative Savings

If expenses exceed income:

Savings become negative.

Dashboard displays warning.

Analysis Engine generates Overspending Insight.

---

## Savings Rule 4 — Savings Never Includes Transfers

Transfers do not change savings.

---

## Savings Rule 5 — Goal Contributions Are Savings Behavior

Goal contribution is treated as intentional saving behavior.

Cash leaves spending account.

Goal balance increases.

Net Worth unchanged.

---

# Cash Flow Rules

Cash Flow measures money movement during a period.

---

## Cash Flow Philosophy

Cash Flow has four layers:

1. Income.
2. Expenses.
3. Fixed Commitments.
4. Remaining Cash.

---

## Cash Flow Rule 1 — Monthly Income

Sum of completed Income transactions within selected period.

Pending income excluded from actual cash flow.

---

## Cash Flow Rule 2 — Monthly Expense

Sum of completed Expense transactions within selected period.

Transfers excluded.

Cancelled transactions excluded.

---

## Cash Flow Rule 3 — Monthly Surplus

Monthly Surplus equals:

Income − Expenses.

Displayed on Dashboard.

---

## Cash Flow Rule 4 — Fixed Commitments

Fixed Commitments include:

* EMI.
* Rent.
* Insurance.
* Subscription.
* Utilities.
* Planned Savings.
* SIP.

Displayed separately.

---

## Cash Flow Rule 5 — Variable Spending

Variable Spending equals expenses excluding fixed commitments.

Examples:

* Food.
* Shopping.
* Travel.
* Entertainment.

---

## Cash Flow Rule 6 — Available Cash

Available Cash equals:

Monthly Surplus − Remaining Fixed Commitments.

Used for affordability predictions.

---

## Cash Flow Rule 7 — Closing Balance Forecast

Forecast Closing Balance equals:

Current Cash + Expected Income − Expected Expense.

Forecast uses recurring commitments.

---

## Cash Flow Rule 8 — Pending Transactions

Pending transactions appear only in Forecast.

Not in actual cash flow.

---

## Cash Flow Rule 9 — Cancelled Transactions

Ignored completely.

---

## Cash Flow Rule 10 — Financial Year

Cash flow calculations respect Settings financial year.

Default:

April → March.

---

# Emergency Fund Rules

Emergency Fund is a dedicated goal category.

It powers survival predictions.

---

## Emergency Fund Philosophy

Emergency Fund measures resilience.

Not wealth.

---

## Emergency Rule 1 — Emergency Fund Coverage

Coverage measured in months.

**Formula**

Emergency Fund ÷ Average Monthly Essential Expenses

---

## Emergency Rule 2 — Essential Expenses

Essential expenses include:

* Rent.
* Utilities.
* EMI.
* Insurance.
* Groceries.
* Transport.
* Healthcare.

Entertainment excluded.

Shopping excluded.

Luxury excluded.

---

## Emergency Rule 3 — Coverage Status

Coverage categories:

| Coverage          | Status    |
| ----------------- | --------- |
| Less than 1 month | Critical  |
| 1–3 months        | Weak      |
| 3–6 months        | Moderate  |
| 6–12 months       | Healthy   |
| Above 12 months   | Excellent |

Thresholds are frozen.

---

## Emergency Rule 4 — Target Emergency Fund

Target equals:

6 × Monthly Essential Expenses.

Displayed on Dashboard.

---

## Emergency Rule 5 — Emergency Goal Integration

If a goal category equals Emergency Fund:

Dashboard uses its progress automatically.

---

# Net Worth Rules

Net Worth measures total owned wealth after debt.

---

## Net Worth Philosophy

Net Worth excludes income and expenses directly.

It measures accumulated financial position.

---

## Net Worth Rule 1 — Net Worth Formula

Net Worth = Total Assets − Total Liabilities

Cash accounts are assets.

---

## Net Worth Rule 2 — Goal Savings

Goal savings remain cash.

Goals do not create separate assets.

Avoid double counting.

---

## Net Worth Rule 3 — Investment Purchases

Investment purchase converts cash into asset.

Net Worth unchanged immediately.

---

## Net Worth Rule 4 — Asset Appreciation

Appreciation increases Net Worth.

Depreciation decreases Net Worth.

---

## Net Worth Rule 5 — Liability Reduction

Reducing Outstanding Balance increases Net Worth.

---

## Net Worth Rule 6 — Transfers

Transfers do not affect Net Worth.

---

## Net Worth Rule 7 — Monthly Net Worth Change

Current Net Worth − Previous Month Net Worth.

Displayed on Dashboard.

---

## Net Worth Rule 8 — Annual Growth

Current Net Worth − Previous Year Net Worth.

Displayed annually.

---

# Goal Forecast Rules

Forecasting predicts completion using deterministic calculations.

---

## Forecast Rule 1 — Estimated Completion Month

Uses:

Remaining Amount ÷ Monthly Contribution Target.

---

## Forecast Rule 2 — Insufficient Contribution

If Monthly Contribution Target equals zero:

Forecast unavailable.

Analysis Engine creates insight.

---

## Forecast Rule 3 — Ahead of Schedule

Actual contributions exceed target.

Goal acceleration insight generated.

---

## Forecast Rule 4 — Behind Schedule

Actual contributions below target.

Goal delay insight generated.

---

## Forecast Rule 5 — Forecast Updates Monthly

Forecast recalculated whenever transactions change.

---

# Survival Prediction Rules

FinanceOS flagship deterministic prediction engine.

---

## Survival Philosophy

Answers:

**"If income stopped today, how long could you survive?"**

No AI.

Pure financial math.

---

## Survival Rule 1 — Available Survival Cash

Available cash includes:

* Cash accounts.
* Emergency cash.
* Cash equivalents.

Investments excluded.

Property excluded.

Vehicle excluded.

---

## Survival Rule 2 — Monthly Survival Cost

Monthly Survival Cost equals essential monthly expenses only.

---

## Survival Rule 3 — Survival Months

**Formula**

Available Survival Cash ÷ Monthly Survival Cost

Output:

4.3 months.

Rounded to one decimal.

---

## Survival Rule 4 — Survival Date

Analysis Engine estimates depletion month.

Example:

Income stops today.

Cash exhausted in December 2026.

---

## Survival Rule 5 — Emergency Extension

Increasing Emergency Fund extends survival months.

Displayed as comparison.

---

## Survival Rule 6 — Commitment Burden

Higher fixed commitments reduce runway.

---

## Survival Rule 7 — Goal Contributions During Survival

Goal contributions paused automatically in simulation.

Simulation assumes survival spending only.

---

## Survival Rule 8 — Simulation Never Changes Real Data

Simulation outputs remain read-only.

No workbook values modified.

---

# Business Engine Responsibilities (Goals & Cash Flow)

Business Engine calculates:

* Savings.
* Savings Rate.
* Goal Progress.
* Remaining Amount.
* Monthly Surplus.
* Cash Flow.
* Emergency Coverage.
* Net Worth.
* Forecast Closing Balance.

---

# Analysis Engine Responsibilities (Goals & Survival)

Analysis Engine calculates:

* Goal Delay.
* Goal Acceleration.
* Savings Momentum.
* Emergency Fund Health.
* Survival Months.
* Cash Runway.
* Goal Completion Forecast.
* Monthly Contribution Sufficiency.

---

# Business Rule Ownership Matrix (Part C)

| Rule Category       | Owner   |
| ------------------- | ------- |
| Goals               | DOC-008 |
| Goal Funding        | DOC-008 |
| Savings             | DOC-008 |
| Cash Flow           | DOC-008 |
| Emergency Fund      | DOC-008 |
| Net Worth           | DOC-008 |
| Goal Forecast       | DOC-008 |
| Survival Prediction | DOC-008 |

---

# End of Part C

This section freezes:

* Goal behavior.
* Savings behavior.
* Cash Flow calculations.
* Emergency Fund rules.
* Net Worth rules.
* Goal Forecast rules.
* Survival Prediction rules.


---

# Dashboard Rules

The Dashboard is the primary presentation layer of FinanceOS.

It displays financial information but never owns business calculations.

Business Engine performs calculations.

Analysis Engine performs interpretation.

Dashboard only consumes outputs.

---

## Dashboard Philosophy

The Dashboard must answer three questions immediately.

1. Where do I stand financially today?
2. What needs my attention next?
3. What will likely happen if nothing changes?

Every Dashboard card exists to answer one of those questions.

---

## Dashboard Rule 1 — Read-Only Financial View

The Dashboard never stores financial records.

No user edits balances directly from the Dashboard.

All metrics originate from engine worksheets.

---

## Dashboard Rule 2 — Current Month First

Default Dashboard always opens on the current month.

Users may change filters.

Filters never modify workbook data.

---

## Dashboard Rule 3 — Snapshot Card Priority

Snapshot always appears first.

Metrics:

* Total Cash
* Net Worth
* Monthly Income
* Monthly Expense
* Monthly Savings
* Savings Rate

Snapshot metrics always reflect current filters.

---

## Dashboard Rule 4 — Cash Flow Card

Cash Flow card always displays:

* Income
* Expenses
* Surplus
* Fixed Commitments
* Variable Spending
* Remaining Cash

No transfers included.

---

## Dashboard Rule 5 — Goals Card

Goals sorted using:

1. High Priority
2. Nearest Target Date
3. Largest Completion Percentage

Sorting rules are frozen.

---

## Dashboard Rule 6 — Liability Card

Liabilities sorted using:

1. Highest EMI
2. Nearest Due Date

Dashboard highlights upcoming EMIs automatically.

---

## Dashboard Rule 7 — Forecast Card

Forecast always represents the remainder of the selected month.

Forecast includes:

* Pending commitments.
* Pending income.
* Pending expenses.

Completed transactions are historical.

---

## Dashboard Rule 8 — Financial Health Card

Financial Health Card displays one unified health score.

Supporting metrics remain visible underneath.

---

## Dashboard Rule 9 — Insights Preview Card

Shows maximum three insights.

Priority order:

1. Critical
2. Warning
3. Opportunity

---

## Dashboard Rule 10 — Filters Never Change Calculations

Filters affect presentation only.

Business Engine always calculates complete datasets.

---

# Financial Health Score Rules

Financial Health Score is a deterministic score from 0–100.

It summarizes overall financial condition.

---

## Health Score Philosophy

Health Score combines multiple financial dimensions.

No AI.

No subjective weighting after Version 1 freeze.

---

## Health Score Components

| Component             | Weight |
| --------------------- | ------ |
| Savings Health        | 25%    |
| Emergency Fund Health | 20%    |
| Debt Health           | 20%    |
| Cash Flow Health      | 15%    |
| Goal Progress Health  | 10%    |
| Investment Health     | 10%    |

Weights total 100%.

Weights are frozen.

---

## Savings Health Rules

Savings Health evaluates Savings Rate.

Suggested interpretation:

| Savings Rate | Health    |
| ------------ | --------- |
| Above 30%    | Excellent |
| 20–30%       | Strong    |
| 10–20%       | Moderate  |
| 0–10%        | Weak      |
| Negative     | Critical  |

---

## Emergency Fund Health Rules

Evaluates months of essential expense coverage.

Uses Emergency Fund rules defined in Part C.

---

## Debt Health Rules

Measures:

* EMI Burden.
* Debt-to-Income Ratio.
* Outstanding Debt Trend.

Higher debt burden lowers score.

---

## Cash Flow Health Rules

Measures:

* Positive Surplus.
* Consistent Monthly Savings.
* Fixed Commitment Burden.

Negative surplus reduces score immediately.

---

## Goal Health Rules

Measures:

* Contribution consistency.
* Goal completion progress.
* Number of delayed goals.

---

## Investment Health Rules

Measures diversification only.

Version 1 does not evaluate investment performance quality.

---

## Health Score Update Frequency

Score recalculates whenever workbook data changes.

No manual refresh.

---

# Analysis Engine Rules

Analysis Engine converts calculations into intelligence.

It never changes financial records.

---

## Analysis Philosophy

Analysis explains calculations.

Every output must answer:

* Why?
* Compared to what?
* What changed?

---

## Analysis Rule 1 — Interpretation Only

Analysis cannot write values into data worksheets.

---

## Analysis Rule 2 — Explainable Outputs

Every metric must trace back to Business Engine.

No hidden scoring logic.

---

## Analysis Rule 3 — Trend Analysis

Trends compare historical periods.

Examples:

* Month-over-month.
* Financial year.
* Previous month.

---

## Analysis Rule 4 — Momentum Analysis

Momentum measures direction.

Categories:

* Savings Momentum.
* Spending Momentum.
* Debt Momentum.
* Net Worth Momentum.
* Investment Momentum.

Momentum never predicts future by itself.

---

## Analysis Rule 5 — Opportunity Detection

Analysis identifies opportunities when:

* Cash surplus available.
* Goal contributions below capacity.
* Debt payoff acceleration possible.

Opportunity insights are informational.

---

# AI-Style Deterministic Insights Rules

FinanceOS Version 1 generates AI-style explanations without generative AI.

---

## Insight Philosophy

Every insight contains:

1. Observation.
2. Reason.
3. Financial interpretation.

No hallucinations.

No unsupported advice.

---

## Insight Categories

### Health Insights

Explain overall financial condition.

---

### Spending Insights

Explain unusual spending behavior.

---

### Goal Insights

Explain savings progress.

---

### Liability Insights

Explain debt changes.

---

### Cash Flow Insights

Explain surplus and spending.

---

### Opportunity Insights

Explain unused financial capacity.

---

### Warning Insights

Explain financial risks.

---

## Insight Rule 1 — Trigger Thresholds

Insights appear only when thresholds are crossed.

Example:

Food spending increases more than defined threshold.

---

## Insight Rule 2 — One Root Cause

Each insight should explain one primary cause.

Avoid combining unrelated causes.

---

## Insight Rule 3 — Severity Assignment

Severity comes from deterministic thresholds.

Green

Healthy.

Yellow

Monitor.

Orange

Action recommended.

Red

Immediate attention.

---

## Insight Rule 4 — Explain the Metric

Every insight references supporting metrics.

Example:

Savings Rate dropped from 18% to 11%.

---

## Insight Rule 5 — Historical Comparison

Insights compare against:

* Previous month.
* Average spending.
* Current goal target.
* Current emergency target.

---

# Purchase Affordability Engine Rules

Purchase Simulator evaluates whether a purchase is financially safe.

---

## Philosophy

Questions answered:

* Can I afford this today?
* Will this delay my goals?
* Will this reduce emergency safety?

---

## Inputs

* Purchase Amount.
* Available Cash.
* Emergency Fund.
* Monthly Surplus.
* Active Goals.
* Upcoming Commitments.

---

## Output States

| Status    | Meaning                                 |
| --------- | --------------------------------------- |
| Safe      | Financially affordable.                 |
| Caution   | Affordable but affects goals or runway. |
| High Risk | Not recommended financially.            |

---

## Safe Purchase Rules

Purchase is safe when:

* Emergency reserve remains healthy.
* Monthly cash flow remains positive.
* Goals remain on schedule.

---

## Caution Purchase Rules

Triggered when purchase delays goals or reduces emergency coverage.

---

## High Risk Purchase Rules

Triggered when purchase:

* Eliminates emergency reserve.
* Creates negative cash flow.
* Significantly reduces survival runway.

---

## Purchase Delay Rules

Analysis estimates goal delay after purchase.

Displayed as months delayed.

---

## Purchase Recovery Rules

Analysis estimates recovery timeline if purchase proceeds.

---

# Future Prediction Rules

FinanceOS predictions are deterministic projections.

---

## Prediction Philosophy

Predictions simulate current financial behavior continuing into the future.

No probabilistic AI.

---

## Prediction Rule 1 — Income Stop Simulation

Assumes income becomes zero.

Projects runway until available survival cash reaches zero.

---

## Prediction Rule 2 — Expense Increase Simulation

Users simulate percentage increase in expenses.

Forecast updates runway.

---

## Prediction Rule 3 — EMI Simulation

Users simulate adding a new EMI.

Forecast updates:

* Cash Flow.
* Savings Rate.
* Runway.
* Health Score.

---

## Prediction Rule 4 — Salary Increase Simulation

Users simulate future salary.

Forecast updates:

* Savings.
* Goal completion.
* Net Worth projection.

Simulation remains temporary.

---

## Prediction Rule 5 — Goal Contribution Simulation

Users simulate increasing monthly contributions.

Forecast recalculates completion month.

---

## Prediction Rule 6 — Expense Reduction Simulation

Users simulate reducing discretionary expenses.

Forecast shows additional savings capacity.

---

## Prediction Rule 7 — Simulations Never Modify Workbook Data

Simulations are read-only.

Workbook values remain unchanged.

---

# Runway Prediction Rules

Runway predicts survival duration.

---

## Runway Rule 1

Uses essential expenses only.

---

## Runway Rule 2

Ignores luxury spending.

---

## Runway Rule 3

Ignores paused recurring commitments.

---

## Runway Rule 4

Assumes recurring essential commitments continue.

---

## Runway Rule 5

Displays:

* Months Remaining.
* Estimated Exhaustion Date.
* Remaining Safe Days.

---

# Monthly Forecast Rules

Forecast projects end-of-month position.

---

## Forecast Inputs

* Current balances.
* Pending transactions.
* Active commitments.
* Scheduled income.

---

## Forecast Outputs

* Closing Cash.
* Closing Savings.
* Goal Contributions.
* Remaining Commitments.
* Net Worth Projection.

---

## Forecast Rule 1

Completed transactions never appear twice.

---

## Forecast Rule 2

Cancelled transactions ignored.

---

## Forecast Rule 3

Pending commitments reduce projected cash only.

---

## Forecast Rule 4

Forecast recalculates immediately after data changes.

---

# Momentum Rules

Momentum measures direction of financial behavior.

---

## Savings Momentum

Compares recent savings trend.

---

## Spending Momentum

Compares recent spending trend.

---

## Debt Momentum

Measures debt reduction speed.

---

## Net Worth Momentum

Measures wealth growth direction.

---

## Goal Momentum

Measures contribution consistency.

---

# Business Engine Ownership (Dashboard Layer)

Business Engine owns:

* Health components.
* Forecast calculations.
* Net Worth calculations.
* Cash Flow calculations.

Dashboard owns display only.

---

# Analysis Engine Ownership (Insights Layer)

Analysis Engine owns:

* Health Score.
* Insights.
* Momentum.
* Simulations.
* Runway Prediction.
* Purchase Affordability.
* Goal Delay.
* Opportunity Detection.

---

# Business Rule Ownership Matrix (Part D)

| Rule Category          | Owner   |
| ---------------------- | ------- |
| Dashboard              | DOC-008 |
| Health Score           | DOC-008 |
| Analysis Engine        | DOC-008 |
| Deterministic Insights | DOC-008 |
| Purchase Affordability | DOC-008 |
| Future Prediction      | DOC-008 |
| Forecast Rules         | DOC-008 |
| Momentum Rules         | DOC-008 |

---

# End of Part D

This section freezes:

* Dashboard behavior.
* Financial Health Score.
* Analysis Engine interpretation.
* AI-style deterministic insights.
* Purchase Affordability Engine.
* Future Prediction Engine.
* Monthly Forecast rules.
* Momentum rules.


---

# Edge Case Rules

FinanceOS must behave predictably even in unusual financial situations.

These rules freeze how Version 1 handles exceptional scenarios.

---

## Edge Case Philosophy

FinanceOS never silently guesses user intent.

When an edge case occurs:

1. Preserve historical data.
2. Preserve accounting consistency.
3. Preserve deterministic calculations.
4. Never delete financial history.

---

# Refund Rules

Refunds reverse money received after a previous expense.

---

## Refund Rule 1 — Refund Creates Income

Refunds are recorded as **Income** transactions.

They never modify or delete the original expense.

---

## Refund Rule 2 — Refund References Original Spending Category

Refund Category = Refund Income.

Original expense category remains unchanged.

---

## Refund Rule 3 — Partial Refund

Partial refund increases cash only by refunded amount.

Original expense remains full historical value.

---

## Refund Rule 4 — Full Refund

Expense remains historical.

Refund offsets spending analytics through separate income reporting.

---

# Cashback Rules

Cashback is not a discount.

It is income received after spending.

---

## Cashback Rule 1

Cashback transaction type = Income.

---

## Cashback Rule 2

Income Source = Cashback.

---

## Cashback Rule 3

Cashback increases account balance.

---

## Cashback Rule 4

Cashback never modifies historical spending.

---

# Cancelled Transaction Rules

Cancelled transactions preserve history while excluding financial impact.

---

## Cancelled Rule 1

Cancelled transactions remain in transaction history.

---

## Cancelled Rule 2

Cancelled transactions do not affect:

* Cash Flow.
* Savings.
* Goals.
* Net Worth.
* Dashboard metrics.
* Forecasts.

---

## Cancelled Rule 3

Cancelled transactions remain searchable.

---

# Pending Transaction Rules

Pending transactions represent expected future activity.

---

## Pending Rule 1

Pending income appears only in Forecast.

---

## Pending Rule 2

Pending expense appears only in Forecast.

---

## Pending Rule 3

Pending transactions never affect completed monthly summaries.

---

## Pending Rule 4

Changing Pending → Completed immediately updates Business Engine outputs.

---

# Duplicate Transaction Rules

FinanceOS does not automatically merge transactions.

---

## Duplicate Rule 1

Users may intentionally record similar transactions.

---

## Duplicate Rule 2

Future duplicate detection may suggest duplicates.

Version 1 never auto-removes duplicates.

---

# Archived Entity Rules

Archived entities preserve history.

---

## Archived Goal Rules

Archived goals:

* Hidden from active dashboard.
* Visible historically.
* Included in historical reports.

---

## Archived Account Rules

Archived accounts become Closed.

Historical balances remain available.

---

## Archived Asset Rules

Sold assets remain permanently.

---

## Archived Liability Rules

Closed liabilities remain permanently.

---

## Archived Category Rules

Inactive categories remain available historically.

---

# Opening Balance Correction Rules

Opening balance corrections require explicit user action.

---

## Opening Balance Rule 1

Users should avoid editing Opening Balance after workbook setup.

---

## Opening Balance Rule 2

Balance corrections should use Adjustment transactions whenever possible.

---

## Opening Balance Rule 3

Dashboard reflects latest reconciled balance only.

---

# Reconciliation Rules

FinanceOS supports manual reconciliation.

---

## Reconciliation Rule 1

Adjustment transactions exist only for reconciliation.

---

## Reconciliation Rule 2

Reconciliation never changes transaction history.

---

## Reconciliation Rule 3

Adjustment transactions are excluded from spending analytics.

---

# Validation Rules

Validation ensures workbook integrity.

---

## Validation Philosophy

Validation prevents invalid financial states.

Cursor must generate validation using Helpers worksheet only.

---

# Required Field Rules

Transactions require:

* Date
* Transaction Type
* Source Account
* Destination Type
* Destination Name
* Amount
* Payment Method
* Status

Blank required fields are invalid.

---

## Positive Amount Rule

Amount must always be greater than zero.

Zero-value transactions are prohibited.

Negative transaction amounts are prohibited.

---

## Date Validation Rule

Transaction Date must be a valid Excel date.

Future dates allowed only for Pending transactions.

---

## Dropdown Validation Rule

Every dropdown references Helpers named ranges.

Hardcoded dropdown values are prohibited.

---

## Goal Validation Rule

Goal contribution transactions must reference active goals only.

---

## Liability Validation Rule

Liability transactions must reference active liabilities only.

---

## Account Validation Rule

Transactions may reference only active accounts.

Closed accounts excluded.

---

## Frequency Validation Rule

Recurring commitments support only:

* Monthly
* Quarterly
* Half-Yearly
* Yearly

No custom frequencies in Version 1.

---

# Formula Integrity Rules

Formulas must remain deterministic.

---

## Formula Rule 1

Business calculations belong only in Business Engine.

---

## Formula Rule 2

Analysis calculations belong only in Analysis Engine.

---

## Formula Rule 3

Dashboard formulas only reference engine outputs.

---

## Formula Rule 4

No circular references.

---

## Formula Rule 5

No volatile formulas unless documented.

---

# Data Integrity Rules

FinanceOS preserves financial integrity.

---

## Integrity Rule 1

IDs never change.

---

## Integrity Rule 2

IDs are never reused.

---

## Integrity Rule 3

Tables never reorder ID columns.

---

## Integrity Rule 4

Deleting referenced entities is prohibited.

---

## Integrity Rule 5

Relationships always use IDs internally.

Display names are presentation only.

---

# Mobile Compatibility Rules

FinanceOS Version 1 must behave consistently across Excel platforms.

---

## Mobile Rule 1

No VBA.

---

## Mobile Rule 2

No Office Scripts.

---

## Mobile Rule 3

No Power Query.

---

## Mobile Rule 4

No Power Pivot.

---

## Mobile Rule 5

Only Excel features supported across Desktop, Web, Android, and iPhone.

---

# Cursor Prohibited Behaviors

Cursor must never perform these actions without explicit approval.

---

## Architecture Prohibitions

* Add worksheets.
* Remove worksheets.
* Rename worksheets.
* Merge worksheets.
* Split worksheets.
* Add new entities.

---

## Business Logic Prohibitions

* Change formulas.
* Change financial calculations.
* Change Health Score weights.
* Change Survival calculations.
* Change Goal calculations.

---

## Validation Prohibitions

* Hardcode dropdown values.
* Replace named ranges.
* Remove validation rules.

---

## Git Prohibitions

* Force Push.
* Rewrite commit history.
* Delete branches automatically.

---

## Workbook Prohibitions

* Use VBA.
* Install plugins.
* Add desktop-only Excel features.
* Create hidden calculations outside documented worksheets.

---

# Cursor Mandatory Behaviors

Cursor must always:

1. Read documentation first.
2. Explain implementation impact.
3. Ask approval for structural changes.
4. Preserve mobile compatibility.
5. Preserve worksheet responsibilities.
6. Preserve deterministic calculations.
7. Preserve table names and IDs.

These behaviors are mandatory.

---

# Immutable Financial Rules Matrix

| Financial Area     | Immutable Rule                                             |
| ------------------ | ---------------------------------------------------------- |
| Transactions       | Single source of truth.                                    |
| Transfers          | Never affect income or expense totals.                     |
| Goal Contributions | Increase goal savings without reducing Net Worth.          |
| Investments        | Convert cash into assets.                                  |
| Assets             | Current Value editable, Purchase Value immutable.          |
| Liabilities        | Outstanding Balance user-maintained in Version 1.          |
| EMIs               | Forecasted through commitments, paid through transactions. |
| Cash Flow          | Transfers excluded.                                        |
| Savings Rate       | Based on completed income and expenses only.               |
| Emergency Fund     | Uses essential expenses only.                              |
| Net Worth          | Assets minus liabilities.                                  |
| Dashboard          | Presentation only.                                         |
| Analysis Engine    | Interpretation only.                                       |
| Insights           | Deterministic explanations only.                           |
| Forecasts          | Never modify workbook data.                                |
| Simulations        | Temporary, read-only calculations.                         |

This matrix is frozen.

---

# Version 1 Business Logic Freeze

The following behaviors are permanently frozen for FinanceOS Version 1.

### Financial Core

* Unified transaction ledger.
* Deterministic calculations.
* Goal-based planning.
* Account-based cash tracking.
* Asset and liability separation.
* Net Worth ownership model.

### Intelligence Layer

* Financial Health Score.
* Cash Runway Prediction.
* Purchase Affordability.
* Goal Forecasting.
* Spending Intelligence.
* Financial Momentum.
* AI-style deterministic insights.

### Workbook Rules

* Documentation-first development.
* Helpers own validation.
* Business Engine owns calculations.
* Analysis Engine owns interpretation.
* Dashboard owns presentation.
* Insights own explanations.

### Compatibility Rules

* Excel-first Version 1.
* Desktop/Web/Mobile compatibility mandatory.
* No unsupported Excel technologies.

---

# Version History

## Version 1.0 — Initial Freeze

The complete financial behavior of FinanceOS Version 1 has been frozen.

This document defines the permanent business logic for every calculation, validation, dashboard metric, forecast, simulation, and deterministic insight implemented by Cursor.

---

**End of Document — DOC-008 Business Rules Version 1.0**
