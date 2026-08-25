# FinanceOS — Insights Architecture

**Document ID:** DOC-013

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

The Insights Engine is the explanation layer of FinanceOS Version 1.

Its responsibility is to convert deterministic financial metrics into understandable financial guidance without using generative AI for financial calculations.

Insights answer:

> **"What changed?"**

> **"Why did it change?"**

> **"What should the user know?"**

Every insight is traceable to Business Engine and Analysis Engine outputs.

---

# Insights Philosophy

FinanceOS insights must always be:

- Deterministic.
- Explainable.
- Transparent.
- Action-oriented.
- Based on workbook calculations.

Every insight must reference measurable financial data.

Insights never invent financial facts.

---

# Insights Architecture

FinanceOS follows a three-stage intelligence pipeline.

| Stage | Owner |
|-------|-------|
| Financial Calculation | Business Engine |
| Financial Interpretation | Analysis Engine |
| Financial Explanation | Insights Engine |

This separation is immutable.

---

# Insight Structure (Frozen)

Every insight follows the same structure.

## Insight Fields

| Field | Purpose |
|-------|---------|
| Insight ID | Stable identifier. |
| Category | Financial area. |
| Severity | Financial priority level. |
| Headline | Short summary. |
| Explanation | Human-readable explanation. |
| Supporting Metrics | Numeric evidence. |
| Recommended Interpretation | Plain-language takeaway. |
| Status | Active / Resolved. |

This structure is reused across Dashboard, Excel, Web App, Mobile App, and Notifications.

---

# Insight Categories (Frozen)

FinanceOS Version 1 supports exactly nine insight categories.

| Category | Purpose |
|----------|---------|
| Financial Health | Overall financial condition. |
| Cash Flow | Income and spending behaviour. |
| Spending | Expense trends and categories. |
| Income | Income trends and consistency. |
| Goals | Goal progress and delays. |
| Liabilities | Debt burden and EMI analysis. |
| Assets | Asset allocation and appreciation. |
| Cash Runway | Emergency reserve and survival months. |
| Purchase Decisions | Affordability analysis. |

No additional categories exist in Version 1.

---

# Financial Health Insights

Financial Health insights summarize overall financial wellness.

## Example Triggers

- Savings rate increased.
- Savings rate decreased.
- Emergency coverage improved.
- Emergency coverage below target.
- Debt burden improved.
- Debt burden increased.

## Example Headlines

- Your financial health improved this month.
- Emergency fund coverage is below your target.
- Your savings rate is stronger than last month.

Business Engine provides numbers.

Analysis Engine determines triggers.

Insights generates explanations.

---

# Cash Flow Insights

Cash Flow insights explain monthly money movement.

## Trigger Examples

| Trigger | Example Insight |
|---------|-----------------|
| Surplus increased | Monthly surplus improved. |
| Expenses exceeded income | Spending exceeded monthly income. |
| Fixed commitments increased | Fixed monthly obligations increased. |
| Remaining cash declined | Less discretionary cash remains this month. |

---

## Supporting Metrics

- Monthly Income.
- Monthly Expense.
- Monthly Savings.
- Remaining Cash.
- Fixed Commitments.

---

# Spending Insights

Spending insights explain expense behaviour.

## Trigger Types

- Highest spending category.
- Category spending spike.
- Spending reduction.
- Subscription increase.
- Lifestyle spending increase.

---

## Example Headlines

- Dining spending increased compared to last month.
- Shopping became your largest expense category.
- Subscription spending increased this month.

---

## Spending Supporting Metrics

- Category Total.
- Monthly Change.
- Percentage Change.
- Category Rank.

---

# Income Insights

Income insights explain earnings behaviour.

## Trigger Types

- Income increased.
- Income decreased.
- New income source detected.
- Income stability improved.
- Income variability increased.

---

## Example Headlines

- Freelance income increased this month.
- Salary remained consistent this month.
- Income decreased compared to previous month.

---

# Goal Insights

Goal insights explain savings progress.

## Trigger Types

- Goal on track.
- Goal delayed.
- Goal accelerated.
- Goal completed.
- Contribution skipped.

---

## Example Headlines

- Your Emergency Fund is ahead of schedule.
- Your Bike Goal is one month behind schedule.
- You completed your Gold Savings Goal.

---

## Supporting Metrics

- Completion Percentage.
- Remaining Amount.
- Monthly Contribution Average.
- Estimated Completion Month.

---

# Liability Insights

Liability insights explain debt behaviour.

## Trigger Types

- EMI burden increased.
- Outstanding debt reduced.
- Debt payoff progress improved.
- New liability added.

---

## Example Headlines

- Your debt burden increased this month.
- Credit card balance decreased.
- Monthly EMI commitments increased.

---

## Supporting Metrics

- Outstanding Debt.
- Monthly EMI.
- Debt-to-Income Ratio.
- Largest Liability.

---

# Asset Insights

Asset insights explain asset growth.

## Trigger Types

- Asset allocation changed.
- Asset appreciation increased.
- Portfolio value increased.
- Portfolio value decreased.

---

## Example Headlines

- Gold value increased this month.
- Mutual fund allocation grew.
- Asset value reached a new high.

---

## Supporting Metrics

- Total Asset Value.
- Appreciation.
- Allocation Percentage.
- Asset Contributions.

---

# Spending Analysis Insights

Spending Analysis insights explain spending behaviour.

Version 1 does not include Budget Insights, Budget Utilization, or Remaining Budget.

## Trigger Types

- Category overspending detected.
- Spending increased versus last month.
- Spending decreased versus last month.
- Spending concentrated in few categories.

---

## Example Headlines

- Dining spending increased this month.
- Travel spending remains below last month.
- Shopping is a larger share of expenses this month.

---

## Supporting Metrics

- Category Spend.
- Monthly Spend.
- Spending Distribution.

---

# Cash Runway Insights

Cash Runway is one of FinanceOS's flagship insight categories.

## Trigger Types

- Runway improved.
- Runway declined.
- Emergency reserve critical.
- Runway exceeds target.

---

## Example Headlines

- You currently have approximately 4 months of runway if income stops today.
- Emergency reserve increased to 6 months.
- Cash runway dropped below your target.

---

## Supporting Metrics

- Available Cash.
- Essential Monthly Expenses.
- Emergency Coverage Months.
- Remaining Cash.

---

# Purchase Decision Insights

Purchase insights explain affordability.

## Trigger Types

- Purchase is safe.
- Purchase requires caution.
- Purchase is not recommended.

---

## Example Headlines

- Buying this bike is financially safe today.
- This purchase will delay your home goal.
- This purchase reduces your emergency runway below target.

---

## Supporting Metrics

- Purchase Amount.
- Remaining Cash After Purchase.
- Emergency Coverage After Purchase.
- Goal Delay Difference.

---

# Insight Lifecycle

Every insight follows the same lifecycle.

1. Business Engine generates metrics.
2. Analysis Engine evaluates deterministic rules.
3. Insight becomes Active.
4. Dashboard preview displays highest-priority insights.
5. Insights worksheet displays complete explanation.
6. Insight becomes Resolved when trigger condition disappears.

---

# Insight Priority Rules

When multiple insights exist simultaneously, FinanceOS prioritizes display.

## Priority Order

1. Red
2. Orange
3. Yellow
4. Green

Higher severity insights always appear first.

---

# Immutable Decisions in Part A

The following Insight architecture decisions are frozen.

- Insights explain calculations only.
- Business Engine provides metrics.
- Analysis Engine determines triggers.
- Insights generate human-readable explanations.
- Every insight has a stable structure.
- Exactly nine insight categories exist in Version 1.

---

# Part A Complete

This section freezes the Insights architecture, categories, lifecycle, priority rules, and deterministic explanation model for FinanceOS Version 1.


---

# AI-Style Explanation System (Frozen)

FinanceOS Version 1 presents financial explanations that feel conversational while remaining completely deterministic.

The Insights Engine never invents financial facts.

Every explanation must be traceable to Business Engine and Analysis Engine outputs.

---

# Explanation Philosophy

Every explanation answers four questions.

1. What happened?
2. Why did it happen?
3. What is the financial impact?
4. What should the user understand?

The explanation is educational, not emotional.

---

# Explanation Template

Every insight follows the same response structure.

| Section | Purpose |
|---------|---------|
| Headline | One-sentence summary. |
| Explanation | What changed and why. |
| Financial Impact | Numeric impact on finances. |
| Recommendation | Deterministic interpretation. |

---

## Example Structure

### Headline

Your emergency fund now covers approximately 4 months of essential expenses.

### Explanation

Your available cash increased while essential monthly expenses remained stable.

### Financial Impact

Emergency coverage increased from 3.2 months to 4.0 months.

### Recommendation

You are moving closer to the recommended emergency reserve target.

---

# Financial Impact Rules (Frozen)

Every insight must include measurable financial impact.

---

## Financial Impact Sources

| Metric | Source |
|--------|--------|
| Currency Difference | Business Engine |
| Percentage Difference | Business Engine |
| Month Difference | Analysis Engine |
| Goal Difference | Analysis Engine |
| Runway Difference | Analysis Engine |

Narrative never exists without supporting metrics.

---

# Deterministic Future Predictions (Frozen)

Future predictions are generated from documented financial rules.

Version 1 predictions are explainable.

---

## Supported Prediction Types

| Prediction | Example Output |
|------------|----------------|
| Cash Runway | You have approximately 5 months of runway if income stops today. |
| Goal Completion | Your Bike Goal is projected to complete in January 2027. |
| Purchase Projection | Buying this laptop delays your travel goal by one month. |
| Savings Projection | Continuing your current savings pace reaches ₹5,00,000 by June 2027. |
| Debt Projection | Current EMI commitments remain affordable if income stays constant. |

Predictions use deterministic inputs only.

---

## Prediction Rules

Predictions assume:

- Current recurring commitments continue.
- Current contribution behaviour continues.
- Current income continues unless simulated.
- No undocumented financial events occur.

Scenario Analysis generates alternative predictions.

---

# Notification Architecture (Frozen)

The notification system extends the Insights Engine into the future FinanceOS web application and admin panel.

Version 1 defines notification architecture even though Excel does not send notifications.

---

## Notification Philosophy

Notifications surface important financial events.

Notifications are deterministic triggers.

---

## Notification Categories

| Category | Example |
|----------|---------|
| Cash Flow | Monthly savings decreased. |
| Goals | Goal completed. |
| Goals | Monthly contribution skipped. |
| Liabilities | EMI due in 3 days. |
| Spending | Category spending increased. |
| Cash Runway | Emergency runway below target. |
| Purchase | Purchase becomes affordable. |
| Financial Health | Health score improved. |

---

## Notification Priority

| Priority | Trigger |
|----------|---------|
| High | Critical financial risk. |
| Medium | Action recommended soon. |
| Low | Informational financial update. |

Priority maps directly to severity.

---

# Email Insight Architecture (Frozen)

FinanceOS Admin Panel will generate deterministic financial email summaries.

Emails are generated from Insights outputs.

---

## Email Summary Types

| Email | Purpose |
|-------|---------|
| Weekly Financial Summary | Weekly spending and savings recap. |
| Monthly Financial Report | Complete monthly financial report. |
| Goal Progress Report | Goal progress update. |
| Spending Alert | Category spending increased. |
| Cash Runway Alert | Emergency runway warning. |
| Financial Health Report | Health score summary. |

---

## Monthly Email Structure

Every monthly report contains:

1. Financial Snapshot.
2. Income Summary.
3. Expense Summary.
4. Savings Summary.
5. Goal Progress.
6. Debt Summary.
7. Asset Summary.
8. Top Insights.
9. Recommended Focus Areas.

This structure is frozen.

---

# AI Insights Feed Architecture (Frozen)

FinanceOS presents insights as a chronological feed.

This feed becomes the foundation of the future web and mobile applications.

---

## Feed Components

| Component | Purpose |
|----------|---------|
| Severity Badge | Priority indicator. |
| Insight Category | Financial topic. |
| Headline | Summary. |
| Explanation | Detailed explanation. |
| Timestamp | When insight became active. |
| Status | Active or Resolved. |

---

## Feed Rules

- Highest severity appears first.
- New insights appear above older insights.
- Resolved insights remain historically available.
- Duplicate active insights are prevented.

---

# Insight Resolution Rules (Frozen)

Insights automatically resolve when trigger conditions disappear.

---

## Resolution Examples

| Active Trigger | Resolution Trigger |
|---------------|--------------------|
| Spending increased | Spending returns toward typical range. |
| Emergency runway below target | Runway reaches target. |
| Goal delayed | Contribution pace improves. |
| Debt burden high | EMI burden decreases. |

Resolved insights remain in historical logs.

---

# Dashboard Integration (Frozen)

Dashboard displays a preview of Insights.

---

## Dashboard Preview Rules

Display:

- Maximum five insights.
- Highest severity first.
- Short headline.
- One-line explanation.

Selecting an insight navigates to the Insights worksheet.

---

# Admin Panel Integration (Frozen)

The Admin Panel manages insight delivery.

The Admin Panel is a separate web application.

---

## Admin Panel Responsibilities

- Generate monthly reports.
- Generate weekly reports.
- Generate email summaries.
- Generate push notifications.
- Generate in-app notifications.
- Manage notification preferences.
- Monitor insight delivery status.

Excel workbook never manages notifications.

---

# Mobile Application Integration (Frozen)

The mobile application displays Insights as the primary financial feed.

---

## Mobile Insight Feed

Sections include:

- Today
- This Week
- This Month
- Goals
- Spending
- Cash Runway
- Assets
- Debt
- Financial Health

Feed order follows severity and recency.

---

# Future AI Layer Boundary (Frozen)

Future AI features must never replace deterministic financial calculations.

---

## AI Layer Responsibilities

Future AI may:

- Rewrite explanations.
- Personalize wording.
- Answer user questions using deterministic metrics.
- Generate conversational summaries.

Future AI may **not**:

- Calculate savings.
- Calculate debt burden.
- Calculate runway.
- Calculate affordability.
- Modify Business Engine outputs.

Business Engine remains the financial source of truth.

---

# Cursor Implementation Rules (Insights)

Cursor must:

- Build insights from deterministic triggers.
- Preserve the Insight Structure template.
- Preserve severity ordering.
- Keep notifications separate from workbook calculations.
- Keep Dashboard preview read-only.
- Keep Admin Panel architecture separate from Excel.

---

# Insights Dependency Matrix

Business Engine

↓

Analysis Engine

↓

Insights Engine

↓

Dashboard Preview

↓

Admin Panel / Web App / Mobile App

Dependencies always flow downward.

---

# Version 1 Immutable Rules

The following Insight decisions are frozen.

### Insight Architecture

- Insights explain deterministic calculations.
- Every insight has supporting metrics.
- Every insight has severity.
- Every insight has lifecycle status.

### Notifications

- Notifications are deterministic.
- Admin Panel owns delivery.
- Excel workbook owns calculations only.

### Future Predictions

- Predictions are deterministic.
- AI never replaces Business Engine calculations.

### Platform Architecture

- Dashboard previews insights.
- Mobile uses Insights Feed.
- Admin Panel manages notification delivery.

---

# Version History

## Version 1.0 — Initial Freeze

The complete Insights Architecture for FinanceOS Version 1 has been frozen.

This document defines deterministic explanations, insight structure, notification architecture, email summaries, AI-style explanation boundaries, platform integrations, and immutable insight rules.

---

**End of Document — DOC-013 Insights Architecture Version 1.0**