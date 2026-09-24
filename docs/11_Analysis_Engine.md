# FinanceOS — Analysis Engine

**Document ID:** DOC-011

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 25 September 2026

---

# Purpose

The Analysis Engine is the deterministic intelligence layer of FinanceOS Version 1.

It reads reusable outputs from the Business Engine and transforms them into financial decision-support metrics that help users understand their financial situation.

The Analysis Engine **never changes financial data**. It only interprets deterministic calculations.

---

# RC1 Official Analysis Outputs (Frozen)

T009.1 and T009.1.1 freeze exactly eight RC1 health dimensions. Analysis reads Business Engine cells only. It does not modify Business Engine, entities, Helpers, Dashboard, or Insights.

| Dimension | Time basis | Business Engine inputs | Unavailable |
| --- | --- | --- | --- |
| Savings Health | Period | `B30`, `B16` | `B16 = 0` |
| Expense Health | Period | `B22`, `B16` | `B16 = 0` and `B22 = 0` |
| Debt Health | Snapshot vs period income | `B66`, `B16`, `B45`, `B42` | Empty financial profile |
| Asset Health | Snapshot | `B70`–`B73`, `B75`, `B35`, `B74`, `B38` | `B38 = 0` or (`B35 − B74`) = 0 |
| Goal Health | Snapshot | `B58`, `B56`, `B57` | `B56 + B57 = 0` |
| Liquidity Health | Snapshot vs period expenses | `B4`, `B22` | `B4 = 0` and `B22 = 0` |
| Net Worth Health | Snapshot | `B48`, `B68`, `B4`, `B35`, `B42` | `B4 = B35 = B42 = 0` |
| Cash Flow Health | Period | `B29`, `B16`, `B22` | `B16 = 0` and `B22 = 0` |

### Shared band, score, and severity mapping

| Band | Score | Severity |
| --- | --- | --- |
| Unavailable | blank | blank |
| Critical | 0 | Red |
| Weak | 25 | Orange |
| Moderate | 50 | Yellow |
| Strong or Healthy | 75 | Green |
| Excellent | 100 | Green |

Interval rule: lower bound inclusive, upper bound exclusive, except each dimension’s top band.

Empty financial profile: `B4`, `B16`, `B22`, `B35`, `B38`, `B42`, `B45`, `B56`, and `B57` are all zero.

### Savings Health bands

`B16 = 0` Unavailable; `B30 < 0` Critical; `[0, 0.10)` Weak; `[0.10, 0.20)` Moderate; `[0.20, 0.30)` Strong; `≥ 0.30` Excellent.

### Expense Health bands

`B16 = 0` and `B22 = 0` Unavailable; `B16 = 0` and `B22 > 0` Critical; else `B22/B16`: `< 0.50` Excellent; `[0.50, 0.70)` Strong; `[0.70, 0.85)` Moderate; `[0.85, 1.00)` Weak; `≥ 1.00` Critical.

### Debt Health bands

Empty profile → Unavailable. Initialized profile and `B45 = 0` and `B42 = 0` → Excellent. `B45 > 0` and `B16 = 0` → Critical. Else `B66`: `< 0.15` Excellent; `[0.15, 0.25)` Strong; `[0.25, 0.35)` Moderate; `[0.35, 0.50)` Weak; `≥ 0.50` Critical.

### Asset Health bands

Diversification only. Cash Equivalent (`B74`) excluded. Appreciation is not an input. Concentration = largest of `{B70,B71,B72,B73,B75}` ÷ (`B35 − B74`).

`B38 = 0` or (`B35 − B74`) = 0 → Unavailable; `≤ 0.40` Excellent; `≤ 0.60` Strong; `≤ 0.80` Moderate; `≤ 0.95` Weak; `> 0.95` Critical.

### Goal Health bands

`B56 + B57 = 0` Unavailable; `B58 ≥ 0.80` Excellent; `≥ 0.50` Strong; `≥ 0.25` Moderate; `> 0` Weak; `= 0` Critical.

### Liquidity Health bands

Liquidity Months = `B4 / B22` when `B22 > 0`. Uses Total Active Account Balance. **Not** Emergency Fund Coverage. Do not use `B6+B7`, `B8`, `B9`, `B49`, or asset category totals. Liquid Assets remain deferred.

`B22 = 0` and `B4 = 0` Unavailable; `B22 = 0` and `B4 > 0` Excellent; `[0, 1)` Critical; `[1, 3)` Weak; `[3, 6)` Moderate; `[6, 12]` Healthy; `> 12` Excellent.

### Net Worth Health bands

Does not modify `B48`. `B4 = B35 = B42 = 0` Unavailable; `B48 < 0` Critical; `B48 = 0` Weak; `B48 > 0` and `B68 ≥ 0.70` Weak; `≥ 0.40` Moderate; `≥ 0.20` Strong; `< 0.20` Excellent.

### Cash Flow Health bands

Surplus Ratio = `B29 / B16` when `B16 > 0`. No commitment burden. No forecasting.

`B16 = 0` and `B22 = 0` Unavailable; `B29 < 0` Critical; `B29 = 0` Weak; Surplus Ratio `(0, 0.10)` Moderate; `[0.10, 0.25)` Strong; `≥ 0.25` Excellent.

### RC1 deferred Analysis modules

* Composite Financial Health Score.
* Emergency Fund Health.
* Liquid Assets metric.
* Depreciation Total (Business Engine).
* Asset Sale Engine.
* Per-Asset Matrix.
* Cash Runway / Forecast / Purchase Simulation / Scenario Analysis.

---

# Analysis Engine Philosophy

FinanceOS separates financial intelligence into two layers.

| Layer | Responsibility |
|-------|----------------|
| Business Engine | Calculates financial numbers. |
| Analysis Engine | Interprets financial numbers. |

Examples:

| Business Engine Output | Analysis Engine Interpretation |
|------------------------|--------------------------------|
| Savings Rate = 18% | Savings Health = Moderate |
| EMI Ratio = 34% | Debt Health = Moderate |
| `B4 / B22` = 2.4 months | Liquidity Health = Weak (not Emergency Fund Coverage) |

This separation is immutable.

---

# Input Sources

The Analysis Engine reads outputs from upstream worksheets only.

| Worksheet | Purpose |
|-----------|---------|
| Business Engine | Primary financial metrics. RC1 health formulas read Business Engine cells only. |
| Settings | Financial year and configuration. Not an RC1 health input. |
| Goals | Goal metadata. RC1 Goal Health reads Goal Summary cells on Business Engine. |
| Categories | Category metadata. Not an RC1 health input. |

The Analysis Engine never reads Dashboard or Insights.

---

# Output Categories

The Analysis Engine produces reusable interpretation metrics.

| Module | RC1 status |
|--------|------------|
| Financial Health Engine | Official — eight dimensions |
| Cash Runway Engine | **Deferred** |
| Spending Analysis Engine | Existing leftover only; not T009 product |
| Income Analysis Engine | Existing leftover only; not T009 product |
| Goal Forecast Engine | **Deferred** |
| Debt Analysis Engine | Official as Debt Health only |
| Purchase Affordability Engine | **Deferred** |
| Scenario Analysis Engine | **Deferred** |

Outputs from these modules are consumed by Dashboard and Insights.

---

# Financial Health Engine (Frozen)

The Financial Health Engine combines multiple Business Engine metrics into reusable health indicators.

It does **not** generate the final narrative explanation.

## Health Inputs Consumed

RC1 consumes the Business Engine cells listed in **RC1 Official Analysis Outputs**.

Emergency Coverage and cash-flow stability history are **deferred**.

## Health Outputs

| Output | RC1 status |
|--------|------------|
| Savings Health | Official |
| Expense Health | Official |
| Debt Health | Official |
| Asset Health | Official |
| Goal Health | Official |
| Liquidity Health | Official — not Emergency Fund Coverage |
| Net Worth Health | Official |
| Cash Flow Health | Official |
| Emergency Fund Health | **Deferred** |
| Overall Financial Health Score | **Deferred** |

These outputs do **not** roll up into a composite score in RC1.

---

# Cash Runway Engine (Frozen)

The Cash Runway Engine is **deferred for RC1**. T009 does not implement runway, income-stop survival, or Emergency Fund Coverage.

The remainder of this section is Version 1 architecture only.

The Cash Runway Engine measures how long the user can survive if income stops.

This is one of FinanceOS's signature deterministic features.

## Cash Runway Philosophy

The calculation answers:

> "If income stopped today, how many months could current cash support essential expenses?"

## Inputs

- Available Cash
- Essential Monthly Expenses
- Emergency Reserve
- Fixed Commitments

## Outputs

| Output | Description |
|--------|-------------|
| Emergency Coverage Months | Months covered by emergency savings. |
| Total Cash Runway | Months supported by available cash. |
| Runway Status | Healthy / Monitor / Critical input. |

The Analysis Engine explains runway; Business Engine calculates the inputs.

---

# Spending Analysis Engine (Frozen)

The Spending Analysis Engine interprets spending behaviour across time and categories.

## Primary Outputs

| Output | Description |
|--------|-------------|
| Top Spending Categories | Largest expense categories. |
| Monthly Spending Trend | Spending growth or decline. |
| Spending Distribution | Category contribution percentages. |
| Fixed vs Variable Spending | Spending composition. |
| Subscription Spending Total | Recurring subscription spending. |

## Trend Categories

Version 1 compares:

- Current Month vs Previous Month.
- Current Financial Year vs Previous Financial Year.
- Category averages across historical months.

No predictions are generated here.

---

# Income Analysis Engine (Frozen)

The Income Analysis Engine evaluates income consistency.

## Outputs

| Output | Description |
|--------|-------------|
| Monthly Income Trend | Income growth over time. |
| Income Stability Indicator | Income consistency metric. |
| Income Distribution | Income source distribution. |
| Largest Income Source | Highest contributing source. |

Version 1 focuses on deterministic historical analysis only.

---

# Goal Forecast Engine (Frozen)

The Goal Forecast Engine is **deferred for RC1**. T009 Goal Health uses `B58` only.

The Goal Forecast Engine predicts goal completion using current contribution behaviour.

## Inputs

- Current Saved Amount
- Remaining Amount
- Monthly Contribution Average
- Target Date
- Monthly Contribution Target

## Outputs

| Output | Description |
|--------|-------------|
| Estimated Completion Month | Forecast completion month. |
| Contribution Sufficiency | Whether current pace reaches target. |
| Goal Delay Indicator | Delay input for Insights. |
| Goal Acceleration Indicator | Faster-than-plan input. |

No AI predictions are used.

---

# Debt Analysis Engine (Frozen)

The Debt Analysis Engine measures financial pressure created by liabilities.

## Inputs

- Outstanding Debt
- Monthly EMI Total
- Monthly Income
- Debt Distribution

## Outputs

| Output | Description |
|--------|-------------|
| Debt-to-Income Ratio | Monthly debt burden. |
| EMI Burden Indicator | EMI pressure input. |
| Largest Liability | Highest outstanding debt. |
| Debt Distribution Summary | Liability composition. |

Outputs feed Dashboard and Insights.

---

# Analysis Engine Output Principles

Every Analysis Engine output must be:

- Deterministic.
- Explainable.
- Derived from Business Engine outputs.
- Reusable by Dashboard and Insights.
- Independent of presentation formatting.

The Analysis Engine never stores financial history.

---

# Dependency Architecture

The Analysis Engine sits between Business Engine and presentation layers.

Settings

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

The following Analysis Engine decisions are frozen.

- Analysis Engine owns interpretation only.
- Business Engine owns all financial mathematics.
- Cash Runway is deterministic.
- Goal Forecasts use historical contribution behaviour.
- Spending Trends are historical comparisons.
- Debt Analysis uses Business Engine outputs only.

---

# Part A Complete

This section freezes the Analysis Engine architecture, modules, inputs, outputs, and dependency model for FinanceOS Version 1.

Part B freezes the Financial Health Score architecture, Purchase Affordability Engine, Future Prediction Engine, AI-style deterministic insight inputs, severity system, Cursor implementation rules, and Version 1 freeze.


---

# Financial Health Score Architecture (Frozen)

The composite Financial Health Score is **deferred for RC1**.

RC1 ships the eight independent dimension outputs documented above.

A later version may combine dimensions into one 0–100 score. RC1 does not.

The score, when implemented later, remains **explainable** and **rule-based**.

Version 1 does not use machine learning or generative AI.

---

## Health Score Philosophy

The Financial Health Score answers one question:

> "How healthy is the user's overall financial position today?"

The score is calculated from multiple independent dimensions instead of a single metric.

---

## Health Score Dimensions

| Dimension | RC1 Business Engine Input | RC1 status |
|-----------|---------------------------|------------|
| Savings Health | `B30` | Official |
| Expense Health | `B22` / `B16` | Official |
| Debt Health | `B66` | Official |
| Asset Health | Non-cash-equivalent category totals | Official |
| Goal Health | `B58` | Official |
| Liquidity Health | `B4` / `B22` | Official |
| Net Worth Health | `B48`, `B68` | Official |
| Cash Flow Health | `B29` / `B16` | Official |
| Emergency Fund Health | Emergency Coverage Months | **Deferred** |

Each dimension contributes independently.

---

## Health Score Outputs

| Output | RC1 status |
|--------|------------|
| Overall Financial Health Score | **Deferred** |
| Savings Health Indicator | Official |
| Expense Health Indicator | Official |
| Debt Health Indicator | Official |
| Asset Health Indicator | Official |
| Goal Health Indicator | Official |
| Liquidity Health Indicator | Official |
| Net Worth Health Indicator | Official |
| Cash Flow Health Indicator | Official |
| Emergency Health Indicator | **Deferred** |

The Dashboard consumes scores.

Insights explain why scores changed.

---

# Purchase Affordability Engine (Frozen)

The Purchase Affordability Engine is **deferred for RC1**. T009 does not implement Safe / Caution / Not Recommended.

The Purchase Affordability Engine evaluates whether a planned purchase is financially safe.

This is one of FinanceOS Version 1's signature deterministic features.

---

## Purchase Philosophy

Every purchase simulation answers:

- Can I afford this purchase?
- Will it reduce emergency safety?
- Will it delay my goals?
- Will it create financial stress?

---

## Inputs

- Purchase Amount
- Available Cash
- Monthly Savings
- Emergency Coverage
- Remaining Cash After Purchase
- Upcoming Commitments

---

## Outputs

| Output | Meaning |
|--------|---------|
| Safe | Purchase fits current financial position. |
| Caution | Purchase is possible but reduces financial safety. |
| Not Recommended | Purchase creates financial risk. |

The engine produces the status only.

Insights explain the reasoning.

---

## Purchase Decision Rules

### Safe

- Emergency reserve remains above target.
- Commitments remain affordable.
- Remaining cash remains positive.

### Caution

- Emergency reserve decreases noticeably.
- Goal progress slows.
- Remaining cash becomes limited.

### Not Recommended

- Emergency reserve falls below safety threshold.
- Upcoming commitments become difficult.
- Remaining cash becomes critically low.

Rules are deterministic.

---

# Future Prediction Engine (Frozen)

The Future Prediction Engine is **deferred for RC1**. T009 implements no forecasting.

The Future Prediction Engine projects future financial outcomes using Business Engine calculations.

It is **deterministic forecasting**, not AI prediction.

---

## Prediction Philosophy

Predictions answer:

> "If current behaviour continues, what is the most likely financial outcome?"

Inputs come from current financial behaviour only.

---

## Supported Version 1 Predictions

| Prediction | Description |
|------------|-------------|
| Cash Runway | Months remaining if income stops today. |
| Goal Completion Forecast | Estimated completion month. |
| Savings Projection | Projected savings by month. |
| Closing Balance Projection | Expected month-end cash. |
| EMI Burden Projection | Expected debt burden. |
| Commitment Projection | Upcoming scheduled obligations. |

---

## Prediction Rules

Predictions always assume:

- Current recurring commitments continue.
- Current savings behaviour continues.
- Current income behaviour continues unless simulated otherwise.
- User inputs remain unchanged.

Scenario Analysis creates alternative projections.

---

# Scenario Analysis Engine (Frozen)

Scenario Analysis is **deferred for RC1**.

Scenario Analysis compares hypothetical financial situations.

Scenarios never modify workbook data.

---

## Supported Version 1 Scenarios

| Scenario | Description |
|----------|-------------|
| Income Reduction | Salary decreases. |
| Income Increase | Salary increases. |
| New EMI | Adds monthly debt obligation. |
| Purchase Simulation | Adds planned purchase. |
| Goal Contribution Increase | Higher monthly savings. |
| Expense Reduction | Reduced discretionary spending. |

---

## Scenario Outputs

| Output | Description |
|--------|-------------|
| Monthly Cash Difference | Cash flow comparison. |
| Savings Difference | Savings comparison. |
| Net Worth Difference | Wealth comparison. |
| Goal Completion Difference | Faster or slower completion. |
| Emergency Coverage Difference | Runway impact. |

Outputs feed Dashboard comparison cards.

---

# AI-Style Deterministic Insight Inputs (Frozen)

FinanceOS Version 1 generates AI-like explanations without AI-generated financial calculations.

The Analysis Engine produces structured insight inputs.

Insights converts them into readable cards.

---

## Insight Input Structure

Every insight contains:

| Field | Purpose |
|-------|---------|
| Insight Category | Spending, Goal, Debt, Cash Flow, etc. |
| Severity | Green, Yellow, Orange, Red. |
| Headline Input | Deterministic title. |
| Explanation Input | Numeric explanation source. |
| Supporting Metrics | Business Engine values. |

---

## Insight Categories

Version 1 supports exactly nine insight categories.

- Financial Health
- Cash Flow
- Spending
- Income
- Goals
- Liabilities
- Assets
- Cash Runway
- Purchase Decisions

Categories are frozen.

---

## Example Insight Inputs

| Trigger | Insight Input |
|--------|---------------|
| Savings Rate Improved | Savings Momentum Positive |
| Spending Increased | Spending Trend Increase |
| Goal Behind Schedule | Goal Delay |
| EMI Burden Increased | Debt Pressure |
| Emergency Coverage Below Target | Emergency Warning |

Insights decides presentation.

---

# Severity System (Frozen)

Every deterministic insight includes a severity level.

---

## Severity Levels

| Severity | Meaning |
|----------|---------|
| Green | Healthy financial state. |
| Yellow | Monitor this area. |
| Orange | Action recommended soon. |
| Red | Immediate financial attention required. |

Severity is determined by documented thresholds.

---

## Severity Ownership

Analysis Engine determines severity.

Dashboard displays severity.

Insights explains severity.

---

# Dashboard Output Ownership

Dashboard consumes Analysis Engine outputs.

RC1 examples include:

- Savings Health Card.
- Expense Health Card.
- Debt Health Card.
- Asset Health Card.
- Goal Health Card.
- Liquidity Health Card.
- Net Worth Health Card.
- Cash Flow Health Card.

Deferred for RC1:

- Unified Financial Health Score Card.
- Cash Runway Card.
- Purchase Simulator Card.
- Goal Forecast Card.

Dashboard never recalculates analysis metrics.

---

# Insights Output Ownership

Insights converts deterministic outputs into readable financial explanations.

Examples:

- "Your emergency fund currently covers approximately 3 months of essential expenses."
- "Your dining expenses increased compared to last month."
- "Your bike goal is projected to finish one month earlier than planned."
- "Adding this EMI would reduce your cash runway to 4 months."

The wording is generated from deterministic inputs.

---

# Cursor Implementation Rules (Analysis Engine)

Cursor must:

- Read Business Engine outputs only.
- Keep deterministic calculations separate from presentation.
- Never duplicate Business Engine formulas.
- Never generate AI calculations.
- Preserve reusable outputs for Dashboard and Insights.

---

# Dependency Matrix

Settings

↓

Business Engine

↓

Analysis Engine

↓

Dashboard

↓

Insights

The Analysis Engine is read-only.

Dependencies never flow upward.

---

# Version 1 Immutable Decisions

The following Analysis Engine decisions are frozen.

### Financial Intelligence

- Analysis Engine owns interpretation only.
- Business Engine owns mathematics.
- Insights own explanations.

### Purchase Intelligence

- Deferred for RC1.
- Safe / Caution / Not Recommended remains Version 1 architecture only.

### Future Predictions

- Deferred for RC1 (Cash Runway, Goal Forecast, Scenario).
- No external AI models participate.

### Architecture

- Dashboard consumes outputs.
- Insights consume outputs.
- Analysis Engine never modifies workbook data.

---

# Version History

## Version 1.0 — Initial Freeze

The complete Analysis Engine architecture for FinanceOS Version 1 has been frozen.

This document defines financial health architecture, purchase affordability, future prediction modules, deterministic AI-style insight inputs, severity levels, dependency rules, and implementation boundaries.

## RC1 T009.2 — Analysis Engine Documentation Freeze

RC1 official outputs are the eight health dimensions frozen in T009.1 and T009.1.1.

Composite Health Score, Emergency Fund Health, Liquid Assets, Cash Runway, Goal Forecast, Purchase Simulation, Scenario Analysis, Asset Sale Engine, and Per-Asset Matrix remain deferred.

T009 implementation has not started.

---

**End of Document — DOC-011 Analysis Engine Version 1.0**