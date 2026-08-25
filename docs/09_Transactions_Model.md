# FinanceOS — Transactions Model

**Document ID:** DOC-009

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

The Transactions Model defines the complete financial activity architecture used by FinanceOS Version 1.

Every movement of money inside FinanceOS is represented as exactly one transaction.

This document freezes:

- Transaction architecture.
- Transaction lifecycle.
- Transaction types.
- Destination model.
- Account movement logic.
- Validation behavior.
- Goal contributions.
- Liability payments.
- Investment purchases.
- Historical integrity rules.

The Transactions worksheet is the single source of truth for historical financial activity.

No other worksheet is allowed to duplicate transaction history.

---

# FinanceOS Transaction Philosophy

FinanceOS treats every financial event as a movement between financial entities.

Every transaction answers three questions.

1. Where did the money come from?
2. Where did the money go?
3. Why did the money move?

The model intentionally separates financial activity from financial planning.

| Financial Planning | Financial Activity |
|--------------------|--------------------|
| Goals | Transactions |
| Recurring Commitments | Transactions |
| Liabilities | Transactions |
| Assets | Transactions |

Planning worksheets define intentions.

Transactions record reality.

---

# FinanceOS Financial Entity Model

Transactions connect financial entities together.

## Entity Types

| Entity | Purpose |
|---------|---------|
| Account | Holds money. |
| Category | Classifies spending or income. |
| Goal | Receives savings contributions. |
| Liability | Receives debt payments. |
| Asset | Receives investment purchases. |
| Income Source | Identifies income origin. |

Transactions may reference multiple entities but remain a single ledger record.

---

# Transaction Lifecycle

Every transaction follows the same lifecycle.

## Stage 1 — User Creates Transaction

User enters:

- Date
- Transaction Type
- Source Account
- Destination Type
- Destination Name
- Amount
- Payment Method
- Optional Notes

## Stage 2 — Validation

FinanceOS validates:

- Required fields.
- Positive amount.
- Valid account.
- Valid destination.
- Valid category.
- Active lookup values.

Invalid transactions cannot be saved.

## Stage 3 — Business Engine Processing

Business Engine determines:

- Cash flow impact.
- Account balance impact.
- Goal impact.
- Liability impact.
- Investment impact.
- Dashboard metrics.
- Analysis metrics.

## Stage 4 — Analysis Engine Interpretation

Analysis Engine generates:

- Spending insights.
- Savings insights.
- Goal insights.
- Debt insights.
- Cash runway insights.

Transactions themselves never contain analysis.

---

# Transaction Identity Rules

Every transaction owns one permanent identifier.

## Stable Transaction ID

Examples:

- TXN-000001
- TXN-000002
- TXN-000003

Rules:

- Never reused.
- Never edited.
- Never reordered.
- Never regenerated.

IDs remain stable forever.

---

## Transaction Timestamp

Version 1 reserves metadata columns.

| Metadata | Purpose |
|----------|---------|
| Created Timestamp | Record creation time. |
| Updated Timestamp | Reserved for future versions. |

Created Timestamp is protected.

Users never edit timestamps manually.

---

# Immutable Transaction Principles

The following decisions are frozen.

## Principle 1

Every movement of money creates exactly one transaction.

## Principle 2

Transactions are immutable historical records.

## Principle 3

Planning worksheets never modify historical transactions.

## Principle 4

Transactions drive balances.

Balances never drive transactions.

## Principle 5

Dashboard, Analysis Engine, and Insights consume transactions but never write back into them.

---

# Version Scope

This document covers:

- Transaction architecture.
- Entity relationships.
- Validation philosophy.
- Financial movement rules.

Formula implementation is documented separately inside DOC-015 Formula Standards.

---

# Part A Complete

This section freezes the architecture and philosophy of FinanceOS transactions.

Part B defines transaction types, destination types, and movement behavior.

---

# Transaction Types (Frozen)

FinanceOS Version 1 supports exactly four transaction types.

No additional transaction types exist in Version 1.

| Transaction Type | Purpose | Cash Flow Impact |
|------------------|---------|------------------|
| Income | Money enters FinanceOS. | Increases Cash |
| Expense | Money leaves FinanceOS. | Decreases Cash |
| Transfer | Money moves between accounts. | No Cash Flow Change |
| Adjustment | Manual balance correction. | Depends on Adjustment |

These four transaction types are immutable for Version 1.

---

## Transaction Type 1 — Income

### Purpose

Income records every inflow of money into a FinanceOS account.

Examples include:

- Salary
- Freelance Payment
- Bonus
- Cashback
- Interest
- Refund
- Rental Income
- Business Income

### Business Rules

Income transactions:

- Require a Source Account.
- Require an Income Category.
- May reference an Income Source.
- Increase account balance.
- Increase monthly income metrics.

### Dashboard Impact

Income contributes to:

- Monthly Income.
- Savings Rate.
- Cash Flow.
- Income Trend.
- Income Distribution.

### Analysis Impact

Analysis Engine measures:

- Income consistency.
- Income growth.
- Income source diversification.

---

## Transaction Type 2 — Expense

### Purpose

Expense records every outflow of money.

Examples include:

- Groceries
- Fuel
- Dining
- Shopping
- Rent
- Utilities
- Insurance
- Entertainment

### Business Rules

Expense transactions:

- Require Expense Category.
- Reduce account balance.
- Increase monthly expense metrics.
- Participate in spending analysis.

### Dashboard Impact

Expense contributes to:

- Monthly Expense.
- Budget Usage.
- Spending Breakdown.
- Cash Flow.

### Analysis Impact

Analysis Engine measures:

- Spending trends.
- Overspending.
- Category growth.
- Monthly comparison.

---

## Transaction Type 3 — Transfer

### Purpose

Transfers move money between accounts owned by the same user.

Examples:

- HDFC Savings → Cash Wallet
- SBI Savings → ICICI Savings
- Cash → UPI Wallet

### Business Rules

Transfers:

- Require two accounts.
- Do not affect income.
- Do not affect expense.
- Preserve total cash.

### Account Rules

Source Account decreases.

Destination Account increases.

Total cash remains unchanged.

### Dashboard Impact

Transfers update account balances only.

Cash Flow cards ignore transfers.

---

## Transaction Type 4 — Adjustment

### Purpose

Adjustments correct balances when workbook data differs from reality.

Examples include:

- Bank correction.
- Opening reconciliation.
- Cash correction.
- Interest correction.
- Manual reconciliation.

### Business Rules

Adjustments:

- Require explanation in Notes.
- Require account selection.
- Never classified as spending.
- Never classified as income unless specified.

### Dashboard Impact

Adjustments affect balances but are separated from spending analytics whenever possible.

---

# Destination Type Model (Frozen)

Destination Type tells FinanceOS what Destination Name represents.

This architecture powers dynamic validation.

| Destination Type | Destination Name References |
|------------------|-----------------------------|
| Expense Category | Expense Categories |
| Income Category | Income Categories |
| Account | Accounts |
| Goal | Goals |
| Liability | Liabilities |
| Investment | Assets |
| Other | Free Text Placeholder |

Destination Type controls dropdown behavior.

---

## Expense Destination

Destination Type = Expense Category.

Destination Name references expense categories only.

Examples:

- Food & Dining
- Utilities
- Fuel
- Shopping

---

## Income Destination

Destination Type = Income Category.

Destination Name references income categories only.

Examples:

- Salary
- Freelance
- Interest
- Bonus

---

## Transfer Destination

Destination Type = Account.

Destination Name references destination account.

Example:

Source Account = HDFC

Destination Name = Cash Wallet

---

## Goal Destination

Destination Type = Goal.

Destination Name references active goals.

Example:

Goal = Emergency Fund

Money moves from cash into savings.

---

## Liability Destination

Destination Type = Liability.

Destination Name references an active liability.

Examples:

- Home Loan
- Credit Card
- Education Loan

---

## Investment Destination

Destination Type = Investment.

Destination Name references an asset.

Examples:

- Gold
- SIP
- Mutual Fund
- Stocks

Cash converts into investment value.

---

## Other Destination

Reserved for exceptional transactions.

Version 1 minimizes usage of free-text destinations.

---

# Transaction Movement Matrix

This table freezes movement behavior.

| Transaction Type | Source Account | Destination | Cash Changes | Net Worth Changes |
|------------------|---------------|------------|--------------|-------------------|
| Income | Yes | Income Category | Increase | Increase |
| Expense | Yes | Expense Category | Decrease | Decrease |
| Transfer | Yes | Account | No Overall Change | No Change |
| Goal Contribution | Yes | Goal | Decrease Cash | No Change |
| Liability Payment | Yes | Liability | Decrease Cash | Liability Reduces |
| Investment Purchase | Yes | Investment Asset | Decrease Cash | Asset Increases |
| Adjustment | Yes | Adjustment | Depends | Depends |

This matrix is frozen for Version 1.

---

# Transaction Direction Rules

Every transaction has exactly one direction.

## Incoming Money

Money enters an account.

Examples:

- Salary received.
- Refund received.

## Outgoing Money

Money leaves an account.

Examples:

- Grocery purchase.
- Utility payment.

## Internal Movement

Money changes accounts without changing ownership.

Example:

Savings → Wallet.

## Asset Conversion

Cash converts into another owned asset.

Example:

Savings → Gold.

## Debt Payment

Cash reduces an outstanding liability.

Example:

Savings → Home Loan EMI.

---

# Immutable Decisions in Part B

The following are frozen:

- Exactly four transaction types exist.
- Destination Type controls validation.
- Transfers never count as spending.
- Goal contributions move cash into goals.
- Liability payments reduce debt obligations.
- Investment purchases convert cash into assets.

---

# Part B Complete

This section freezes transaction types, destination types, and movement behavior.

Part C defines validation rules, account logic, and transaction relationships.

---

# Transaction Validation Rules (Frozen)

Validation ensures every transaction entered into FinanceOS is structurally valid before it participates in calculations.

Validation is owned by the **Helpers worksheet** and enforced throughout the workbook.

No transaction should bypass validation.

---

## Required Field Validation

The following fields are mandatory for every transaction.

| Field | Required | Validation Rule |
|-------|----------|-----------------|
| Transaction Date | Yes | Must be a valid Excel date. |
| Transaction Type | Yes | Must be selected from the Transaction Type list. |
| Source Account | Yes | Must reference an active account. |
| Destination Type | Yes | Must reference a supported destination type. |
| Destination Name | Yes | Must reference a valid destination based on Destination Type. |
| Amount | Yes | Must be greater than zero. |
| Payment Method | Yes | Must be selected from the Payment Method list. |

A transaction cannot be considered valid if any required field is empty.

---

## Conditional Validation Rules

Some fields become mandatory depending on the transaction type.

| Transaction Type | Required Additional Fields |
|------------------|----------------------------|
| Income | Income Category, Income Source (optional but recommended). |
| Expense | Expense Category. |
| Transfer | Destination Account. |
| Goal Contribution | Goal Destination. |
| Liability Payment | Liability Destination. |
| Investment Purchase | Investment Destination. |
| Adjustment | Notes explaining the adjustment. |

Conditional validation is deterministic.

---

# Dynamic Destination Validation

Destination Name is not a static dropdown.

It changes based on Destination Type.

## Validation Matrix

| Destination Type | Validation Source |
|------------------|-------------------|
| Expense Category | Active Expense Categories |
| Income Category | Active Income Categories |
| Account | Active Accounts |
| Goal | Active Goals |
| Liability | Active Liabilities |
| Investment | Active Assets |
| Other | Free Text (optional) |

Helpers produces every validation list dynamically.

---

## Active Record Filtering

Validation lists only include active records.

Examples:

### Accounts

Only Status = Active appears.

Closed accounts disappear from dropdowns.

### Categories

Inactive categories disappear from future selections.

Historical transactions remain unchanged.

### Goals

Paused and completed goals follow documented goal rules.

### Liabilities

Closed liabilities are excluded from new transactions.

---

# Amount Validation Rules

Amount represents the monetary value of the transaction.

## Rules

- Positive numbers only.
- Zero is not allowed.
- Negative values are not allowed.
- Decimal values follow workbook currency precision.

## Currency Precision

Precision comes from Settings.

Version 1 supports configurable decimal precision.

---

# Date Validation Rules

Transaction Date controls reporting periods.

## Rules

- Valid Excel date.
- No blank values.
- Financial year calculations use Settings.
- Future dates are allowed for planned manual entries when explicitly entered by the user.

No automatic future transactions are created by Version 1.

---

# Payment Method Validation

Payment Method records how money moved.

## Supported Methods

- Bank Transfer
- Cash
- UPI
- Debit Card
- Credit Card
- Wallet
- Net Banking
- Other

Payment Method is informational.

It does not determine account balances.

---

# Source Account Validation

Every transaction references exactly one funding account.

## Rules

- Must be active.
- Must exist in tblAccounts.
- Cannot reference deleted accounts.
- Closed accounts cannot receive new transactions.

---

# Destination Name Validation

Destination Name always depends on Destination Type.

Users never manually type values when a lookup exists.

Validation prevents invalid references.

Examples:

| Destination Type | Allowed Example |
|------------------|-----------------|
| Goal | Emergency Fund |
| Liability | Education Loan |
| Investment | Gold |
| Expense Category | Food & Dining |

---

# Notes Validation Rules

Notes are optional except for Adjustment transactions.

### Adjustment Rule

Every adjustment requires a written explanation.

Examples:

- Bank reconciliation.
- Cash correction.
- Opening balance correction.

Notes improve auditability.

---

# Duplicate Prevention Rules

FinanceOS allows similar transactions.

It does not automatically reject duplicates.

However:

Transactions remain uniquely identified by Transaction ID.

Business Engine treats each transaction independently.

---

# Transaction Relationship Model

Transactions connect multiple workbook entities.

## Relationship Summary

| Entity | Relationship Type |
|---------|-------------------|
| Accounts | Required |
| Categories | Conditional |
| Income Sources | Conditional |
| Goals | Optional Destination |
| Liabilities | Optional Destination |
| Assets | Optional Destination |

Transactions are the central relationship table inside FinanceOS.

---

# Cross-Worksheet Dependencies

The Transactions worksheet feeds multiple workbook modules.

| Consuming Worksheet | Purpose |
|---------------------|---------|
| Accounts | Balance calculations. |
| Goals | Goal contribution totals. |
| Liabilities | Payment history reference. |
| Business Engine | Cash flow calculations. |
| Analysis Engine | Spending and savings analysis. |
| Dashboard | Financial overview. |
| Insights | Financial explanations. |

Transactions never consume Dashboard outputs.

Dependencies flow one direction only.

---

# Historical Integrity Rules

Historical transactions are permanent records.

## Immutable Rules

- Transactions are never deleted after use.
- Transaction IDs never change.
- Historical category names remain associated through IDs.
- Closed accounts retain transaction history.
- Closed goals retain contribution history.
- Closed liabilities retain payment history.

Version 1 prioritizes financial audit integrity.

---

# Error Handling Rules

If validation fails:

1. Reject invalid entry.
2. Show validation error.
3. Preserve user-entered values until corrected.
4. Do not generate partial calculations.

Business Engine ignores invalid transactions.

---

# Immutable Decisions in Part C

The following rules are frozen.

- Dynamic validation is mandatory.
- Destination validation depends on Destination Type.
- Positive amounts only.
- Every transaction requires one active source account.
- Historical records are immutable.
- Invalid transactions never participate in calculations.

---

# Part C Complete

This section freezes validation behavior, transaction relationships, and historical integrity.

Part D defines Goal Contributions, Liability Payments, Investment Purchases, and Transfer behavior.


---

# Goal Contribution Transaction Model (Frozen)

Goal Contributions represent intentional savings transfers from available cash into a financial goal.

They are historical financial events and therefore always exist inside the Transactions worksheet.

Goals store progress.

Transactions store contributions.

This separation is immutable.

---

## Goal Contribution Philosophy

A goal contribution answers:

- Which account funded the contribution?
- Which goal received the contribution?
- How much was contributed?
- When was the contribution made?

Every contribution increases goal progress while decreasing available cash.

---

## Goal Contribution Flow

Account

↓

Transaction

↓

Goal

↓

Business Engine

↓

Dashboard

↓

Insights

The Goal worksheet never creates contributions automatically.

---

## Goal Contribution Rules

### Rule 1 — Source Account Is Mandatory

Every goal contribution originates from exactly one account.

Examples:

- HDFC Salary Account
- SBI Savings
- Cash Wallet

### Rule 2 — Destination Type Is Goal

Destination Type must equal **Goal**.

Destination Name references an active goal.

### Rule 3 — Amount Must Be Positive

Goal contributions cannot be zero or negative.

### Rule 4 — Goal Progress Updates Automatically

Business Engine aggregates all Goal transactions.

Current Saved Amount updates automatically.

### Rule 5 — Net Worth Does Not Decrease

Cash decreases.

Goal savings increase.

Net Worth remains unchanged because ownership does not change.

---

## Goal Contribution Examples

| Source Account | Goal | Amount |
|---------------|------|-------:|
| HDFC Salary | Emergency Fund | ₹5,000 |
| SBI Savings | Bike Fund | ₹3,500 |
| Cash Wallet | Travel Fund | ₹1,000 |

Each transaction becomes permanent history.

---

## Goal Contribution Validation

Required:

- Source Account.
- Goal.
- Amount.
- Date.
- Payment Method.

Optional:

- Notes.

---

## Goal Contribution Analytics

Business Engine calculates:

- Total Contributions.
- Monthly Contributions.
- Contribution Streak.
- Contribution Consistency.

Analysis Engine calculates:

- Goal Delay.
- Goal Acceleration.
- Monthly Required Savings.

---

# Liability Payment Transaction Model (Frozen)

Liability payments reduce outstanding debt.

Transactions record payment history.

Liabilities store remaining debt.

---

## Liability Payment Philosophy

Liability transactions answer:

- Which account paid?
- Which liability received payment?
- When was payment made?
- How much was paid?

Outstanding Balance remains user-controlled in Version 1.

---

## Liability Payment Flow

Account

↓

Transaction

↓

Liability

↓

Business Engine

↓

Dashboard

↓

Insights

---

## Liability Payment Rules

### Rule 1 — Source Account Required

Payment always leaves one account.

### Rule 2 — Destination Type = Liability

Destination references an active liability.

### Rule 3 — EMI Payments Are Expense Events

Cash decreases.

Debt obligation decreases separately.

### Rule 4 — Outstanding Balance Updated Separately

Version 1 does not auto-amortize loans.

Users update Outstanding Balance manually after payment when needed.

### Rule 5 — Payment History Never Deleted

Every EMI remains historical.

---

## Liability Payment Examples

| Source Account | Liability | Amount |
|---------------|-----------|-------:|
| HDFC Salary | Home Loan | ₹18,500 |
| SBI Savings | Credit Card | ₹4,200 |
| ICICI Savings | Education Loan | ₹7,000 |

---

## Liability Payment Analytics

Business Engine calculates:

- Total EMI Paid.
- Monthly EMI Burden.
- Outstanding Debt.
- Debt Distribution.

Analysis Engine calculates:

- Debt-to-Income Ratio.
- Payoff Progress.
- Remaining Debt Burden.

---

# Investment Purchase Transaction Model (Frozen)

Investment purchases convert cash into owned assets.

Transactions record purchases.

Assets record ownership.

---

## Investment Philosophy

Investment purchases are not expenses.

They convert one owned resource into another.

Cash becomes investment value.

---

## Investment Flow

Account

↓

Transaction

↓

Asset

↓

Business Engine

↓

Dashboard

---

## Investment Purchase Rules

### Rule 1 — Destination Type = Investment

Destination references an asset.

### Rule 2 — Source Account Required

Cash leaves one funding account.

### Rule 3 — Asset Must Exist

Investment references an existing asset record.

### Rule 4 — Purchase Does Not Reduce Net Worth

Cash decreases.

Asset increases.

Net Worth unchanged immediately.

### Rule 5 — Future Appreciation Changes Net Worth

Only Current Value changes Net Worth.

---

## Investment Examples

| Source Account | Investment | Amount |
|---------------|------------|-------:|
| HDFC Salary | Gold | ₹10,000 |
| SBI Savings | Mutual Fund SIP | ₹5,000 |
| ICICI Savings | Stock Portfolio | ₹15,000 |

---

## Investment Analytics

Business Engine calculates:

- Investment Allocation.
- Total Investment Value.
- Investment Contributions.

Analysis Engine calculates:

- Allocation Distribution.
- Investment Momentum.

---

# Transfer Transaction Model (Frozen)

Transfers move money between accounts owned by the same user.

No wealth is created.

No wealth is destroyed.

---

## Transfer Philosophy

Transfers answer:

- Which account lost money?
- Which account received money?

Nothing else changes.

---

## Transfer Flow

Account A

↓

Transaction

↓

Account B

---

## Transfer Rules

### Rule 1 — Two Accounts Required

Source Account.

Destination Account.

### Rule 2 — Source and Destination Cannot Match

Transfers to the same account are invalid.

### Rule 3 — Amount Must Match Exactly

Money leaving equals money arriving.

### Rule 4 — Transfers Do Not Affect Income

Income reports ignore transfers.

### Rule 5 — Transfers Do Not Affect Expenses

Expense reports ignore transfers.

---

## Transfer Examples

| Source | Destination | Amount |
|--------|-------------|-------:|
| HDFC Savings | Cash Wallet | ₹2,000 |
| SBI Savings | ICICI Savings | ₹15,000 |
| Cash Wallet | UPI Wallet | ₹500 |

---

## Transfer Analytics

Business Engine updates:

- Account balances.
- Cash distribution.
- Institution balances.

Analysis Engine ignores transfers for spending trends.

---

# Income Source Transaction Model (Frozen)

Income Sources classify where income originated.

Transactions reference Income Sources.

Income Sources own metadata.

---

## Income Source Rules

### Rule 1 — Income Source Optional But Recommended

Examples:

- Salary
- Freelance
- Bonus
- Cashback
- Rental Income

### Rule 2 — Income Source Never Replaces Category

Income Category describes type.

Income Source describes origin.

### Rule 3 — Dashboard Groups Income Sources

Income distribution charts use Income Source.

---

# Payment Method Transaction Model (Frozen)

Payment Method records how money moved.

It never determines transaction classification.

---

## Supported Payment Methods

- Cash
- Bank Transfer
- UPI
- Debit Card
- Credit Card
- Wallet
- Net Banking
- Other

---

## Payment Method Rules

### Rule 1 — Informational Only

Payment Method affects reporting.

Not balances.

### Rule 2 — Credit Card Purchases

Expense occurs immediately.

Liability payment occurs separately.

### Rule 3 — Cash Payments

Cash account decreases directly.

---

# Transaction Audit Trail

Transactions preserve historical financial history.

## Audit Fields

| Field | Editable |
|-------|----------|
| Transaction ID | No |
| Created Timestamp | No |
| Updated Timestamp | Reserved |
| Notes | Yes |

Historical integrity is mandatory.

---

# Business Engine Responsibilities (Transactions)

Business Engine owns:

- Account Balance Updates.
- Cash Flow Aggregation.
- Goal Contribution Totals.
- Investment Contribution Totals.
- Liability Payment Totals.
- Income Totals.
- Expense Totals.

---

# Analysis Engine Responsibilities (Transactions)

Analysis Engine owns:

- Spending Trends.
- Income Trends.
- Payment Method Distribution.
- Goal Contribution Momentum.
- Liability Payment Progress.
- Investment Contribution Trends.

---

# Immutable Decisions in Part D

The following rules are frozen.

- Goal contributions are transactions.
- Liability payments are transactions.
- Investment purchases are transactions.
- Transfers preserve total cash.
- Income Sources classify origin only.
- Payment Method is informational.

---

# Part D Complete

This section freezes Goal Contributions, Liability Payments, Investment Purchases, Transfer behavior, Income Sources, and Payment Method architecture.

Part E finalizes edge cases, historical integrity, transaction status behavior, reconciliation rules, and the immutable transaction model matrix.


---

# Transaction Status Model (Frozen)

Every transaction exists in one financial state.

Transaction Status determines whether the transaction participates in historical reporting, forecasting, and dashboard calculations.

---

## Transaction Status Philosophy

Status controls participation.

It never changes historical ownership.

Transactions remain permanent records regardless of status.

---

## Supported Transaction Statuses

FinanceOS Version 1 supports exactly four statuses.

| Status | Purpose |
|--------|---------|
| Completed | Historical financial activity. |
| Pending | Expected future transaction. |
| Cancelled | Historical record excluded from calculations. |
| Reconciled | Historical transaction verified against account balance. |

No additional statuses exist in Version 1.

---

## Completed Status Rules

Completed represents real financial activity.

### Rules

- Included in Cash Flow.
- Included in Dashboard.
- Included in Analysis Engine.
- Included in Insights.
- Updates Account Balances.
- Updates Goal Progress.
- Updates Investment Totals.
- Updates Liability Payment Totals.

Completed is the default operational state.

---

## Pending Status Rules

Pending represents expected future activity.

### Rules

- Does not affect historical cash flow.
- Does not affect historical income.
- Does not affect historical expenses.
- Appears in Forecast calculations.
- Appears in Upcoming Commitments.
- Appears in Forecast Dashboard cards.

Pending transactions become Completed manually.

---

## Cancelled Status Rules

Cancelled transactions preserve historical intent.

### Rules

- Excluded from calculations.
- Excluded from Dashboard KPIs.
- Excluded from Goal Progress.
- Excluded from Spending Analysis.
- Excluded from Cash Flow.
- Remain searchable.
- Remain auditable.

Cancelled transactions are never deleted automatically.

---

## Reconciled Status Rules

Reconciled transactions have been matched against account records.

### Rules

- Behave like Completed.
- Marked as verified.
- Used for reconciliation reporting.
- Historical calculations remain unchanged.

---

# Transaction Reconciliation Model

FinanceOS supports manual reconciliation without changing historical activity.

---

## Reconciliation Philosophy

Reconciliation verifies reality.

It does not rewrite history.

---

## Reconciliation Workflow

1. Import or review bank balance.
2. Compare workbook balance.
3. Create Adjustment transaction if required.
4. Mark verified transactions as Reconciled.

---

## Adjustment Transaction Rules

Adjustments exist only for reconciliation purposes.

### Examples

- Missing bank fee.
- Cash correction.
- Opening balance correction.
- Interest correction.

---

## Adjustment Requirements

Required fields:

- Account.
- Amount.
- Date.
- Notes.

Notes are mandatory.

---

## Reconciliation Integrity Rules

- Original transactions remain unchanged.
- Adjustment creates a new transaction.
- Account history remains complete.
- Dashboard reflects corrected balance.

---

# Refund Transaction Model

Refunds reverse previous spending.

---

## Refund Philosophy

Refunds are new financial events.

They never delete previous expenses.

---

## Refund Rules

### Rule 1

Refund Transaction Type = Income.

### Rule 2

Income Source = Refund.

### Rule 3

Original Expense remains historical.

### Rule 4

Refund increases Source Account balance.

### Rule 5

Partial refunds only increase refunded amount.

---

## Refund Examples

| Original Expense | Refund |
|------------------|-------:|
| Shoes ₹4,000 | ₹1,200 Refund |
| Flight ₹8,000 | ₹8,000 Refund |
| Grocery ₹2,000 | ₹300 Refund |

---

# Cashback Transaction Model

Cashback is treated as income.

---

## Cashback Rules

- Transaction Type = Income.
- Income Source = Cashback.
- Destination Category = Cashback Income.
- Account balance increases.
- Spending history unchanged.

---

# Duplicate Transaction Policy

FinanceOS intentionally does not remove duplicates automatically.

---

## Duplicate Rules

### Rule 1

Every transaction has a unique Transaction ID.

### Rule 2

Users may intentionally record identical transactions.

### Rule 3

Future versions may suggest duplicates.

Version 1 never merges automatically.

---

# Historical Integrity Model

Historical integrity is a permanent FinanceOS principle.

---

## Historical Principles

### Principle 1

Transactions are append-only history.

### Principle 2

IDs never change.

### Principle 3

Deleted financial history is prohibited.

### Principle 4

Closed accounts preserve history.

### Principle 5

Inactive categories preserve history.

### Principle 6

Completed goals preserve contribution history.

### Principle 7

Closed liabilities preserve payment history.

---

# Transaction Import Readiness

Version 1 is manual-first but architecture supports future imports.

---

## Reserved Import Metadata

| Field | Version 1 |
|-------|-----------|
| Import Source | Reserved |
| External Transaction ID | Reserved |
| Import Batch ID | Reserved |
| Import Timestamp | Reserved |

Fields remain empty in Version 1.

---

# Transaction Audit Rules

Transactions maintain an audit trail.

---

## Protected Metadata

| Metadata Field | Editable |
|---------------|----------|
| Transaction ID | No |
| Created Timestamp | No |
| Import Metadata | Reserved |
| Notes | Yes |

Audit metadata is protected.

---

# Transaction Performance Rules

Transactions are expected to become the largest worksheet.

---

## Performance Principles

- Excel Tables only.
- Structured References only.
- No entire worksheet references.
- Validation generated from Helpers.
- Business calculations outside Transactions.
- Dashboard never scans raw transaction rows directly.

These rules preserve workbook performance on mobile and desktop.

---

# Transaction Security Rules

Transactions contain editable financial history.

Protection balances usability and integrity.

---

## Editable Fields

Users may edit:

- Date.
- Amount.
- Notes.
- Payment Method.
- Status.
- Destination.
- Source Account.

---

## Protected Fields

Users may not edit:

- Transaction ID.
- Created Timestamp.
- Internal metadata columns.
- Helper-generated validation outputs.

---

# Business Engine Responsibilities (Final)

Business Engine owns every financial calculation derived from transactions.

### Calculation Ownership

- Monthly Income.
- Monthly Expense.
- Cash Flow.
- Savings.
- Account Balances.
- Goal Contributions.
- Investment Contributions.
- Liability Payments.
- Net Worth Inputs.

Transactions provide inputs only.

---

# Analysis Engine Responsibilities (Final)

Analysis Engine owns every interpretation generated from transaction history.

### Interpretation Ownership

- Spending Trends.
- Income Trends.
- Category Trends.
- Goal Momentum.
- Savings Momentum.
- Payment Method Distribution.
- Subscription Growth.
- Cash Runway Inputs.
- Financial Health Inputs.

Analysis never modifies transactions.

---

# Dashboard Responsibilities (Transactions)

Dashboard consumes transaction outputs only.

### Dashboard Displays

- Monthly Cash Flow.
- Spending Breakdown.
- Income Breakdown.
- Recent Transactions.
- Upcoming Transactions.
- Goal Contributions.
- Liability Payments.

Dashboard never stores transaction history.

---

# Insights Responsibilities (Transactions)

Insights explain transaction behavior.

Examples include:

- Spending unusually high this month.
- Dining expenses increased 28%.
- EMI paid successfully.
- Emergency Fund contribution skipped this month.
- Cashback received after recent purchase.

Every insight references deterministic metrics.

---

# Immutable Transactions Model Matrix

| Financial Event | Transaction Required | Notes |
|-----------------|----------------------|-------|
| Salary Received | Yes | Income |
| Freelance Payment | Yes | Income |
| Grocery Purchase | Yes | Expense |
| Rent Payment | Yes | Expense |
| EMI Payment | Yes | Liability Destination |
| Credit Card Payment | Yes | Liability Destination |
| Goal Contribution | Yes | Goal Destination |
| SIP Purchase | Yes | Investment Destination |
| Gold Purchase | Yes | Investment Destination |
| Cash Withdrawal | Yes | Transfer |
| Bank Transfer | Yes | Transfer |
| Refund Received | Yes | Income |
| Cashback Received | Yes | Income |
| Balance Correction | Yes | Adjustment |

Every movement of money requires a transaction.

---

# Version 1 Frozen Decisions

The following transaction decisions are immutable for FinanceOS Version 1.

### Architecture

- Transactions are the single financial ledger.
- Exactly four transaction types exist.
- Destination Type controls validation.
- Source Account is mandatory.
- Every transaction has one stable ID.

### Historical Integrity

- Transactions are append-only.
- No automatic deletion.
- No automatic duplicate merging.
- Historical references remain permanent.

### Financial Behavior

- Transfers never affect income or expenses.
- Goal contributions increase savings progress.
- Liability payments reduce debt obligations.
- Investment purchases convert cash into assets.
- Refunds and cashback are separate income events.

### Engine Responsibilities

- Business Engine calculates.
- Analysis Engine interprets.
- Dashboard presents.
- Insights explain.

---

# Version History

## Version 1.0 — Initial Freeze

The complete Transactions Model for FinanceOS Version 1 has been frozen.

This document defines the permanent transaction architecture, lifecycle, validation behavior, reconciliation model, status model, relationship model, and historical integrity rules for the workbook.

---

**End of Document — DOC-009 Transactions Model Version 1.0**