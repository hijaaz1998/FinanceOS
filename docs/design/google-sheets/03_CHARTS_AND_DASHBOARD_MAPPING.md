# FinanceOS — Charts & Dashboard Mapping (Google Sheets)

**Document ID:** DESIGN-GSHEETS-03

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Charts & Dashboard Mapping Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/google-sheets`

**Dependencies:**
- `00_GSHEETS_MASTER.md`
- `01_GSHEETS_UI_MAPPING.md`
- `02_DYNAMIC_TABLES_AND_VALIDATION.md`
- `docs/design/excel/01_DASHBOARD_LAYOUT.md`
- `docs/design/excel/04_CHART_UI_GUIDELINES.md`
- `docs/design/excel/06_KPI_INSIGHT_COMPONENTS.md`
- `docs/design/excel/09_DARK_LIGHT_THEME_SPECIFICATION.md`

---

# Purpose

This document defines the complete **Dashboard recreation**, **Chart implementation**, **KPI layout**, and **interactive analytics mapping** for the FinanceOS Google Sheets edition.

Google Sheets must recreate the FinanceOS dashboard experience while using Google Sheets chart capabilities.

This document is the **single source of truth** for dashboard and chart implementation inside Google Sheets.

---

# Dashboard Philosophy

The Dashboard is the **home screen** of FinanceOS.

Users should understand their financial health within **10 seconds**.

Dashboard priorities:

1. Financial Health.
2. Money Flow.
3. Spending Insights.
4. Savings Progress.
5. Debt Health.
6. Future Predictions.

Every chart supports one decision.

---

# Dashboard Layout Architecture

Dashboard follows a fixed 12-column grid.

## Section Order

1. FinanceOS Header
2. Hero KPI Cards
3. Quick Financial Snapshot
4. Hero Charts
5. Goal Progress Section
6. Investment Overview
7. Prediction Overview
8. AI Insight Cards
9. Navigation Cards
10. Footer Summary

This order is frozen.

---

# Dashboard Canvas Layout

### Row 1 — FinanceOS Header

Contains:

- FinanceOS Logo.
- Welcome Message.
- Current Month.
- Financial Year.
- Currency Indicator.
- Theme Indicator.

Always visible.

---

### Row 2 — Hero KPI Cards

Exactly **6 Hero KPI Cards**.

| KPI | Description |
|-----|-------------|
| Net Worth | Total Assets - Liabilities |
| Monthly Surplus | Income - Expenses |
| Savings Rate | Savings Percentage |
| Total Debt | Outstanding Liabilities |
| Emergency Runway | Months Covered |
| Health Score | Overall Financial Score |

Cards remain identical to Excel.

---

### Row 3 — Quick Snapshot Cards

Secondary KPI cards.

Examples:

- Total Income.
- Total Expenses.
- Investment Value.
- Goal Progress.
- Largest Expense.
- Monthly Savings.

Compact card layout.

---

# Hero Chart Architecture

Dashboard contains **4 primary charts**.

| Order | Chart | Priority |
|-------|-------|----------|
| 1 | Cash Flow Trend | Critical |
| 2 | Spending Breakdown | Critical |
| 3 | Savings Growth | High |
| 4 | Net Worth Growth | High |

No additional hero charts allowed.

---

# Hero Chart Container Specification

Every chart lives inside a FinanceOS container.

## Container Structure

1. Chart Title.
2. Subtitle.
3. Chart Visualization.
4. Legend.
5. Insight Footer.

Identical hierarchy to Excel.

---

# Cash Flow Trend Mapping

## Purpose

Visualize monthly inflow vs outflow.

### Google Sheets Chart Type

Area + Line Combination.

### Data Sources

- Monthly Income.
- Monthly Expenses.
- Monthly Surplus.

### Required Features

- Dynamic range.
- Forecast extension.
- Current month highlight.
- FinanceOS colors.

---

# Spending Breakdown Mapping

## Purpose

Understand where money goes.

### Google Sheets Chart Type

Donut Chart.

### Displays

- Category.
- Amount.
- Percentage.

Maximum eight categories.

---

# Savings Growth Mapping

## Purpose

Track savings over time.

### Chart Type

Smooth Line Chart.

### Displays

- Monthly Savings.
- Cumulative Savings.
- Goal Milestones.

Current month highlighted.

---

# Net Worth Growth Mapping

## Purpose

Track long-term financial growth.

### Chart Type

Line + Area.

Displays:

- Net Worth.
- Asset Growth.
- Debt Reduction.

Forecast region uses lighter styling.

---

# Monthly Income Chart

Located in Income worksheet.

### Displays

- Monthly Income.
- Income Source Breakdown.
- Income Trend.

Chart updates dynamically.

---

# Income Source Breakdown

Chart Type:

Horizontal Bar Chart.

Displays ranking of income sources.

Examples:

- Salary.
- Freelance.
- Business.
- Dividends.

---

# Expense Trend Mapping

Located in Expenses worksheet.

### Displays

- Monthly Spending.
- Category Trend.
- Budget Comparison.

Line chart with category filters.

---

# Expense Category Ranking

Chart Type:

Vertical Bar Chart.

Shows:

- Highest Spending Categories.
- Monthly Comparison.

Dynamic sorting.

---

# Budget Utilization Chart

Chart Type:

Progress Bar Visualization.

Displays:

- Budget Used.
- Remaining Budget.
- Overspending Indicator.

Conditional formatting linked.

---

# Asset Allocation Mapping

Located in Assets worksheet.

### Chart Type

Donut Chart.

Displays:

- Cash.
- Bank.
- Investments.
- Gold.
- Property.
- Crypto.

Allocation updates automatically.

---

# Asset Growth Trend

Line Chart.

Displays total asset value over time.

Supports monthly history.

---

# Liability Breakdown Mapping

Located in Liabilities worksheet.

### Chart Type

Stacked Bar Chart.

Displays:

- Principal Remaining.
- Interest Remaining.

Each loan appears separately.

---

# Debt Distribution Chart

Donut Chart.

Shows debt percentage by loan type.

Examples:

- Home Loan.
- Car Loan.
- Credit Card.

---

# EMI Timeline Mapping

Area Chart.

Displays monthly EMI commitments.

Used inside Prediction Engine.

---

# Goal Progress Dashboard

Goals worksheet contains progress cards.

### Components

- Progress Ring.
- Progress Bar.
- Completion Percentage.
- ETA.

Each goal receives its own visualization.

---

# Goal Timeline Chart

Line Chart.

Displays projected completion timeline.

Milestones labeled.

---

# Investment Dashboard Mapping

Investments worksheet contains three charts.

### Charts

- Portfolio Allocation.
- Portfolio Growth.
- Profit / Loss Trend.

Dynamic portfolio updates.

---

# Portfolio Allocation Chart

Donut Chart.

Displays investment allocation percentages.

Supports dynamic asset additions.

---

# Portfolio Growth Trend

Line Chart.

Displays investment growth over time.

Supports cumulative value.

---

# Profit & Loss Visualization

Column Chart.

Positive and negative values visually separated.

Monthly comparison.

---

# Prediction Dashboard Architecture

Prediction worksheet contains dedicated analytics cards.

### Prediction Modules

1. Emergency Runway.
2. EMI Simulator.
3. Savings Forecast.
4. Retirement Forecast.
5. Scenario Comparison.

Each module has KPIs + charts.

---

# Emergency Runway Chart

Chart Type:

Area Forecast Chart.

Displays:

- Current Savings.
- Monthly Burn Rate.
- Months Remaining.

Forecast depletion line included.

---

# Savings Forecast Chart

Chart Type:

Forecast Line Chart.

Displays:

- Historical Savings.
- Future Savings.
- Goal Achievement Point.

Forecast styling matches Excel.

---

# EMI Stress Test Chart

Chart Type:

Dual Scenario Line Chart.

Displays:

- Current EMI.
- Increased EMI.
- Debt-Free Timeline Difference.

Used for simulation.

---

# Retirement Projection Chart

Chart Type:

Forecast Line.

Displays:

- Retirement Corpus Growth.
- Inflation Adjusted Target.
- Gap Indicator.

Timeline extends into future years.

---

# Scenario Comparison Dashboard

Displays side-by-side comparison.

### Current Scenario

- Current Salary.
- Current Savings.
- Current Runway.

### Simulated Scenario

- Updated Salary.
- Updated Savings.
- Updated Runway.
- Updated Health Score.

Charts update live.

---

# Financial Health Dashboard

Health Score section includes:

- Score Ring.
- Score Badge.
- Trend Indicator.
- Recommendation Card.

Connected to prediction engine.

---

# AI Insight Dashboard Mapping

Dashboard always displays insight cards.

Examples:

- Biggest Spending Opportunity.
- Budget Warning.
- Savings Recommendation.
- Debt Recommendation.
- Investment Recommendation.

Maximum three insights shown.

---

# Report Dashboard Mapping

Reports worksheet recreates dashboard for exports.

Contains:

- KPI Summary.
- Monthly Charts.
- Annual Charts.
- Goal Charts.
- Investment Charts.
- Footer Summary.

Optimized for printing.

---

# Chart Dynamic Range Architecture

Every chart references dynamic named ranges.

Never reference fixed ranges.

### Example Named Ranges

- `rngCashFlow`
- `rngExpenses`
- `rngSavings`
- `rngNetWorth`
- `rngInvestments`
- `rngGoals`

Charts grow automatically.

---

# Chart Theme Mapping

Charts inherit FinanceOS themes.

## Light Mode

- White background.
- Navy labels.
- Slate gridlines.

## Dark Mode

- Charcoal background.
- White labels.
- Muted gridlines.

Theme updates every dashboard chart.

---

# Chart Color Mapping

Semantic colors remain identical.

| Purpose | Color Token |
|---------|-------------|
| Income | Success |
| Expense | Danger |
| Savings | Emerald |
| Investment | Purple |
| Forecast | Blue |
| Goal Progress | Accent |
| Debt | Amber |

Never use Google default palettes.

---

# Chart Legend Standards

Legend always appears below charts.

Displays:

- Label.
- Color Chip.
- Value (optional).

Horizontal layout only.

---

# Chart Insight Footer

Every chart includes one insight sentence.

Examples:

> Savings increased 18% compared to last month.

> Dining exceeded budget by ₹2,300.

> Emergency runway improved from 3.1 to 4.2 months.

Insight footer is mandatory.

---

# Dashboard Empty States

Dashboard never appears empty.

Examples:

- Add your first transaction.
- Record your income.
- Create a savings goal.
- Add investments to unlock analytics.

Charts display placeholders instead of errors.

---

# Mobile Dashboard Mapping

Google Sheets Mobile adapts dashboard.

### Mobile Order

1. KPI Carousel.
2. Cash Flow Chart.
3. Spending Chart.
4. Goals.
5. Insights.
6. Navigation Chips.

Single-column layout.

---

# Tablet Dashboard Mapping

Tablet uses two-column layout.

- KPI cards in grid.
- Charts side by side.
- Goal cards below.

Landscape optimized.

---

# Dashboard Refresh Behavior

Dashboard refreshes automatically after:

- New transaction.
- Goal update.
- Investment update.
- EMI update.
- Settings change.
- Currency change.

No manual refresh action.

---

# Performance Rules

Dashboard must remain responsive.

Requirements:

- Maximum four hero charts.
- Reuse helper ranges.
- Avoid duplicate chart datasets.
- Collapse unused analytics into worksheet-specific charts.

---

# Cursor Implementation Rules

Cursor must:

1. Recreate Excel dashboard layout exactly.
2. Use Google Sheets charts inside FinanceOS card containers.
3. Connect every chart to dynamic named ranges.
4. Preserve KPI hierarchy.
5. Preserve insight footer below every chart.
6. Preserve light/dark theme compatibility.
7. Keep dashboard performant on desktop and mobile.

---

# Frozen Decisions (Version 1)

The following dashboard decisions are locked.

- Four hero charts.
- Six hero KPI cards.
- Dashboard section order.
- Dynamic chart ranges.
- Shared semantic colors.
- Shared chart hierarchy with Excel.
- Mandatory insight footer.
- Automatic dashboard refresh behavior.

---

# Version History

## Version 1.0

Official FinanceOS Google Sheets dashboard and chart specification defining hero dashboard layout, KPI hierarchy, chart mapping, prediction dashboard, investment analytics, goal visualization, dynamic chart architecture, theme mapping, and performance rules.

---

**End of Document**

**File:** `docs/design/google-sheets/03_CHARTS_AND_DASHBOARD_MAPPING.md`
