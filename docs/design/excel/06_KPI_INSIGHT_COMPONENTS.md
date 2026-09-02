# FinanceOS — KPI Cards & Insight Components

**Document ID:** DESIGN-EXCEL-06

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 KPI & Insight Component Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/excel`

**Dependencies:**
- `00_EXCEL_UI_MASTER.md`
- `01_DASHBOARD_LAYOUT.md`
- `02_WORKSHEET_LAYOUTS.md`
- `03_TABLE_UI_STANDARDS.md`
- `04_CHART_UI_GUIDELINES.md`
- `05_INPUT_COMPONENTS.md`
- `../00_DESIGN_MASTER.md`
- `../01_DESIGN_SYSTEM.md`
- `../02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines every **KPI Card**, **Insight Card**, **Metric Badge**, and **Recommendation Component** used throughout FinanceOS.

These components create the "FinTech dashboard" feeling across:

- Microsoft Excel
- Google Sheets
- FinanceOS Website
- FinanceOS Admin Dashboard
- FinanceOS Mobile App

Every summary metric must follow this specification.

---

# FinanceOS KPI Philosophy

FinanceOS should never make users search through numbers.

Instead, the workbook surfaces the most important financial information as **beautiful KPI cards**.

A KPI card answers one question instantly.

Examples:

- How much did I save?
- What is my runway?
- What is my debt load?
- Is my financial health improving?
- What should I do next?

---

# KPI Component Hierarchy

FinanceOS contains five KPI component families.

| Component | Purpose |
|-----------|---------|
| Hero KPI Cards | Top dashboard metrics. |
| Secondary KPI Cards | Supporting financial metrics. |
| Health Score Cards | Financial score visualization. |
| Insight Cards | AI-style financial recommendations. |
| Status & Metric Badges | Small contextual indicators. |

---

# Hero KPI Cards

The most important metrics appear first.

## Dashboard Hero KPI Order

| Order | KPI |
|-------|-----|
| 1 | Net Worth |
| 2 | Monthly Surplus |
| 3 | Total Debt |
| 4 | Savings Rate |
| 5 | Emergency Runway |
| 6 | Financial Health Score |

This hierarchy is frozen.

---

# Hero KPI Card Layout

Every Hero KPI card contains:

1. Icon.
2. Metric Label.
3. Large Value.
4. Change Indicator.
5. Time Context.

Example:

**Net Worth**

₹42.6L

↑ +3.2% This Month

---

# KPI Card Sizes

| Size | Usage |
|------|------|
| Small | Dashboard widgets. |
| Medium | Worksheet summaries. |
| Large | Prediction outputs. |
| Full Width | Financial overview section. |

Spacing follows the Design System.

---

# KPI Typography Rules

Every KPI card uses identical typography hierarchy.

| Element | Style |
|---------|-------|
| Label | Small uppercase. |
| Value | Largest text on card. |
| Delta | Colored indicator. |
| Context | Small muted caption. |

No additional text.

---

# KPI Value Formatting

FinanceOS formats values consistently.

## Currency Values

Examples:

- ₹42.6L
- $18,450
- £3,240
- €7,820

Compact notation is used only on KPI cards.

---

## Percentage KPIs

Examples:

- 24%
- 17.3%
- 8.75%

Always right aligned.

---

## Duration KPIs

Examples:

- 3.7 Months
- 18 Months Remaining
- Debt Free — Mar 2027

Used for predictions.

---

# Delta Indicator Rules

Every KPI includes movement.

| Indicator | Meaning |
|-----------|---------|
| ↑ Positive | Improved. |
| ↓ Negative | Declined. |
| → Neutral | No change. |

Movement never relies on color alone.

---

# Hero KPI Card Types

## Net Worth Card

Displays:

- Current Net Worth.
- Monthly Change.
- Percentage Growth.

Updates automatically.

---

## Monthly Surplus Card

Displays:

- Remaining Income.
- Monthly Change.
- Savings Contribution.

---

## Total Debt Card

Displays:

- Total Outstanding Debt.
- Debt Change.
- Debt Load Percentage.

---

## Savings Rate Card

Displays:

- Current Savings Rate.
- Target Savings Rate.
- Progress Indicator.

---

## Emergency Runway Card

Displays:

- Months Covered.
- Target Months.
- Status Badge.

---

## Financial Health Score Card

Displays:

- Score (0–100).
- Health Badge.
- Trend Direction.

Connected to prediction engine.

---

# Secondary KPI Cards

Used throughout worksheets.

Examples:

- Total Income.
- Total Expenses.
- Largest Expense.
- Highest Income Source.
- Investment Growth.
- EMI Total.
- Goal Progress.

Compact visual layout.

---

# Health Score Component

FinanceOS uses a universal health score.

## Score Scale

| Score | Status |
|-------|--------|
| 0–39 | Critical |
| 40–59 | Warning |
| 60–79 | Stable |
| 80–100 | Excellent |

Every platform uses the same thresholds.

---

# Health Score Ring

The ring contains:

- Score.
- Label.
- Progress Arc.
- Short Description.

Used on Dashboard and Website.

---

# Insight Cards

FinanceOS generates recommendations.

Examples:

- Largest expense this month is Dining.
- Increase savings by ₹2,000 to reach your goal sooner.
- Paying ₹5,000 extra monthly saves ₹18,400 in interest.
- Your emergency fund covers only 2.3 months.

Insight cards always contain one recommendation.

---

# Insight Card Layout

Every insight card contains:

1. Icon.
2. Title.
3. Recommendation.
4. Action Label.

Example:

**Savings Opportunity**

Increase monthly savings by ₹2,500.

---

# Recommendation Priority Levels

| Priority | Meaning |
|----------|---------|
| Critical | Immediate attention. |
| Warning | Needs improvement. |
| Positive | Good progress. |
| Opportunity | Suggested optimization. |
| Forecast | Future recommendation. |

---

# AI Recommendation Components (Future)

Reserved for FinanceOS Premium.

Examples:

- Predicted overspending alert.
- Upcoming EMI warning.
- Subscription reminder.
- Salary allocation recommendation.

Same card design.

---

# Metric Badges

Small reusable status indicators.

Examples:

- Stable.
- Growing.
- Forecast.
- Caution.
- High Risk.
- Goal Completed.

Badges appear inside KPI cards and tables.

---

# Category Summary Chips

Used inside dashboards.

Examples:

- Food — ₹8,200
- Rent — ₹18,000
- EMI — ₹24,500

Compact pill layout.

---

# Progress Components

Progress bars visualize completion.

Used for:

- Savings Goal.
- Debt Payoff.
- Budget Utilization.
- Emergency Fund.
- Investment Goal.

Progress bars use semantic colors only.

---

# Budget Utilization Component

Displays:

- Budget Used.
- Budget Remaining.
- Percentage Used.
- Warning Threshold.

Automatically updates.

---

# Goal Progress Component

Displays:

- Target Amount.
- Saved Amount.
- Remaining Amount.
- ETA.
- Completion Percentage.

Used in Goal Tracker.

---

# Debt Summary Component

Displays:

- Total Debt.
- Monthly EMI.
- Interest Remaining.
- Debt-Free Date.

Appears in Prediction dashboard.

---

# Cash Flow Summary Component

Displays:

- Income.
- Expenses.
- Remaining Cash Flow.
- Burn Rate.

Used in Dashboard Hero section.

---

# Investment Summary Component

Displays:

- Portfolio Value.
- Invested Amount.
- Profit/Loss.
- Allocation.

Used in Investments worksheet.

---

# Empty KPI States

Never display empty metric cards.

Examples:

**Net Worth**

> Add your accounts to calculate net worth.

**Savings Rate**

> Record income and expenses first.

---

# Loading KPI States

Website and Mobile use skeleton cards.

Excel and Google Sheets show placeholder values until calculations exist.

---

# KPI Container Rules

Every KPI container includes:

- Rounded corners.
- Internal padding.
- Icon alignment.
- Equal spacing.
- Hover state (Website only).

---

# Cross Platform Mapping

| Excel | Google Sheets | Website | Admin | Mobile |
|-------|---------------|---------|-------|--------|
| KPI Cell Block | KPI Card | Interactive KPI Card | Live KPI Card | Swipeable KPI Card |

Excel remains the visual reference.

---

# Cursor Implementation Rules

Cursor must:

1. Build reusable KPI card templates.
2. Use semantic delta indicators.
3. Use consistent compact currency formatting.
4. Generate health score cards from prediction engine.
5. Surface insight cards beneath major dashboards.
6. Reuse identical KPI hierarchy across all platforms.

---

# Frozen Decisions (Version 1)

The following KPI decisions are locked for FinanceOS V1.

- Six Hero KPI cards.
- Universal Health Score system.
- Insight card architecture.
- Progress bar system.
- Metric badge hierarchy.
- Recommendation priority levels.
- Cross-platform KPI consistency.

---

# Version History

## Version 1.0

Official FinanceOS KPI and Insight component specification defining dashboard KPI hierarchy, financial health score, recommendation cards, metric badges, progress components, and reusable KPI architecture across Excel, Google Sheets, Website, Admin Dashboard, and Mobile.

---

**End of Document**

**File:** `docs/design/excel/06_KPI_INSIGHT_COMPONENTS.md`
