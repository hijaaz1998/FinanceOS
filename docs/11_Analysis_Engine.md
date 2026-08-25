# FinanceOS — Analysis Engine

**Document ID:** DOC-011

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

The Analysis Engine is the deterministic intelligence layer of FinanceOS Version 1.

It reads reusable outputs from the Business Engine and transforms them into financial decision-support metrics that help users understand their financial situation.

The Analysis Engine **never changes financial data**. It only interprets deterministic calculations.

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
| Savings Rate = 18% | "Your savings rate is improving." |
| Emergency Coverage = 2.4 months | "Your emergency fund covers approximately 2 months of expenses." |
| EMI Burden = 34% | "Debt obligations consume one-third of monthly income." |

This separation is immutable.

---

# Input Sources

The Analysis Engine reads outputs from upstream worksheets only.

| Worksheet | Purpose |
|-----------|---------|
| Business Engine | Primary financial metrics. |
| Settings | Financial year and configuration. |
| Goals | Goal metadata. |
| Categories | Category metadata. |

The Analysis Engine never reads Dashboard or Insights.

---

# Output Categories

The Analysis Engine produces reusable interpretation metrics.

| Module | Purpose |
|--------|---------|
| Financial Health Engine | Overall financial health inputs. |
| Cash Runway Engine | Income stop survival calculations. |
| Spending Analysis Engine | Spending patterns and trends. |
| Income Analysis Engine | Income consistency and growth. |
| Goal Forecast Engine | Goal completion forecasting. |
| Debt Analysis Engine | Liability burden analysis. |
| Purchase Affordability Engine | Safe purchase calculations. |
| Scenario Analysis Engine | Deterministic future simulations. |

Outputs from these modules are consumed by Dashboard and Insights.

---

# Financial Health Engine (Frozen)

The Financial Health Engine combines multiple Business Engine metrics into reusable health indicators.

It does **not** generate the final narrative explanation.

## Health Inputs Consumed

- Savings Rate
- Emergency Coverage
- Debt Burden
- Cash Flow Stability
- Goal Progress
- Investment Allocation

## Health Outputs

| Output | Purpose |
|--------|---------|
| Savings Health | Savings quality indicator. |
| Emergency Fund Health | Emergency preparedness indicator. |
| Debt Health | Debt pressure indicator. |
| Cash Flow Health | Cash flow consistency indicator. |
| Goal Health | Goal progress indicator. |

These outputs become inputs for the final Financial Health Score in Part B.

---

# Cash Runway Engine (Frozen)

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

The Financial Health Score is the primary summary metric generated by the Analysis Engine.

It combines multiple Business Engine outputs into a single deterministic health indicator.

The score is **explainable** and **rule-based**.

Version 1 does not use machine learning or generative AI.

---

## Health Score Philosophy

The Financial Health Score answers one question:

> "How healthy is the user's overall financial position today?"

The score is calculated from multiple independent dimensions instead of a single metric.

---

## Health Score Dimensions

| Dimension | Business Engine Input |
|-----------|-----------------------|
| Savings Health | Savings Rate |
| Emergency Fund Health | Emergency Coverage Months |
| Debt Health | Debt Burden |
| Cash Flow Health | Monthly Surplus Stability |
| Goal Health | Goal Completion Progress |
| Investment Health | Asset Allocation |

Each dimension contributes independently.

---

## Health Score Outputs

| Output | Purpose |
|--------|---------|
| Overall Financial Health Score | Dashboard KPI |
| Savings Health Indicator | Dashboard Card |
| Emergency Health Indicator | Dashboard Card |
| Debt Health Indicator | Dashboard Card |
| Cash Flow Health Indicator | Dashboard Card |
| Goal Health Indicator | Dashboard Card |

The Dashboard consumes scores.

Insights explain why scores changed.

---

# Purchase Affordability Engine (Frozen)

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

Version 1 supports:

- Financial Health
- Cash Flow
- Spending
- Income
- Goals
- Liabilities
- Investments
- Budget
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

Examples include:

- Financial Health Card.
- Savings Health Card.
- Cash Runway Card.
- Purchase Simulator Card.
- Spending Trend Card.
- Goal Forecast Card.
- Debt Health Card.

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

- Safe / Caution / Not Recommended is deterministic.
- Emergency reserve is always considered.
- Goal delay is considered.
- Commitment burden is considered.

### Future Predictions

- Cash Runway is deterministic.
- Goal forecasts are deterministic.
- Scenario analysis is deterministic.
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

---

**End of Document — DOC-011 Analysis Engine Version 1.0**