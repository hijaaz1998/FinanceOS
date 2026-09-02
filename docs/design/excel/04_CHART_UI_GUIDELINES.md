# FinanceOS — Chart UI Guidelines

**Document ID:** DESIGN-EXCEL-04

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Chart Design Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/excel`

**Dependencies:**
- `00_EXCEL_UI_MASTER.md`
- `01_DASHBOARD_LAYOUT.md`
- `02_WORKSHEET_LAYOUTS.md`
- `03_TABLE_UI_STANDARDS.md`
- `../00_DESIGN_MASTER.md`
- `../01_DESIGN_SYSTEM.md`
- `../02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines the complete chart design language for **FinanceOS V1**.

It establishes how charts look, behave, communicate insights, and remain visually identical across every FinanceOS platform:

- Microsoft Excel
- Google Sheets
- FinanceOS Website
- FinanceOS Admin Dashboard
- FinanceOS Mobile App (Future)

Charts are **decision-making components**, not decorative visuals.

This document is the **single source of truth** for every chart implementation.

---

# Design Philosophy

FinanceOS charts should feel like a modern fintech application rather than default Excel charts.

### Every chart answers one question immediately.

| User Question | Chart Responsibility |
|---------------|----------------------|
| Where is my money going? | Spending Breakdown |
| Am I saving enough? | Savings Trend |
| How long can I survive? | Emergency Runway |
| When will my debt end? | Debt Payoff Forecast |
| What happens if I change something? | Prediction Forecast |

**Clarity over complexity.**

---

# FinanceOS Chart Principles

Every chart must follow these principles.

## Core Rules

- One chart = One primary insight.
- Maximum visual clarity.
- No unnecessary decoration.
- Rounded card containers.
- FinanceOS color palette only.
- High contrast.
- Responsive on every screen.
- Forecasts visually separated from historical data.

---

# Chart Categories

FinanceOS contains six universal chart families.

## 1. KPI Trend Charts

Purpose:

Track financial metrics over time.

Used for:

- Income
- Expenses
- Savings
- Net Worth
- Cash Flow

**Primary Chart:** Line Chart

---

## 2. Cash Flow Charts

Purpose:

Compare inflow vs outflow.

Displays:

- Income
- Expenses
- Remaining Cash Flow
- Monthly Surplus

**Primary Chart:** Area + Line

---

## 3. Spending Breakdown Charts

Purpose:

Understand spending categories.

Displays:

- Food
- Rent
- EMI
- Shopping
- Health
- Utilities
- Travel

**Primary Chart:** Donut Chart

---

## 4. Goal Progress Charts

Purpose:

Track savings goals visually.

Displays:

- Emergency Fund
- House Fund
- Vacation Fund
- Investment Goal

**Primary Chart:** Circular Progress Ring

---

## 5. Debt Analytics Charts

Purpose:

Visualize liabilities.

Displays:

- EMI Distribution
- Interest vs Principal
- Remaining Balance
- Debt Utilization

**Primary Chart:** Stacked Bar

---

## 6. Prediction Charts

Purpose:

Show future financial outcomes.

Displays:

- Savings Forecast
- Runway Forecast
- Retirement Projection
- Debt-Free Timeline
- Cash Flow Forecast

**Primary Chart:** Forecast Line Chart

---

# Dashboard Chart Hierarchy

The FinanceOS dashboard always follows the same order.

## Hero Dashboard Charts

| Order | Chart |
|-------|-------|
| 1 | Cash Flow Forecast |
| 2 | Spending Breakdown |
| 3 | Savings Growth |
| 4 | Net Worth Growth |

Only **4 hero charts** are visible above the fold.

This hierarchy is frozen.

---

# Chart Card Architecture

Every chart lives inside a reusable FinanceOS card.

## Card Layout

1. Chart Icon
2. Chart Title
3. Subtitle
4. Live KPI
5. Chart Visualization
6. Legend
7. Insight Footer

Every platform uses this same layout.

---

# Card Size System

| Size | Usage |
|------|------|
| Small | KPI Mini Charts |
| Medium | Dashboard Widgets |
| Large | Prediction Charts |
| Full Width | Reports & Analytics |

Cursor must use consistent sizing.

---

# Chart Header Rules

Every chart begins with:

- Icon
- Title
- Description
- Time Period

Example:

**Cash Flow Forecast**

"Monthly inflow vs outflow projection."

---

# Subtitle Rules

Subtitle always explains timeframe.

Examples:

- Last 12 Months
- Current Financial Year
- Predicted Until March 2027
- This Month

Never omit timeframe.

---

# Insight Footer (Mandatory)

Every chart ends with one actionable insight.

Examples:

> Savings improved by ₹4,800 this month.

> Dining exceeded budget by 18%.

> Emergency runway increased from 3.2 to 4.1 months.

> Paying ₹5,000 extra monthly removes debt 8 months earlier.

Charts become decision tools.

---

# Line Chart Standards

Purpose:

Show continuous trends.

## Used For

- Savings Growth
- Net Worth
- Income Growth
- Expense Trend
- Investment Growth

### Rules

- Smooth curve.
- Rounded endpoints.
- Current month highlighted.
- Previous months muted.
- Forecast begins with dotted transition.

---

# Area Chart Standards

Purpose:

Display accumulated financial movement.

### Used For

- Cash Flow
- Monthly Balance
- Investment Value

### Rules

- Gradient fill.
- No border shadows.
- Forecast region lighter opacity.

---

# Forecast Region Standards

Forecasts must always be visually separated.

### Historical Region

- Solid line.
- Solid fill.

### Forecast Region

- Dashed continuation.
- Gradient fade.
- Confidence shading.

Users instantly distinguish prediction from history.

---

# Bar Chart Standards

Purpose:

Compare categories.

### Used For

- Expense Categories
- Income Sources
- Monthly Spending
- Investment Allocation

### Rules

- Rounded bars.
- Equal spacing.
- Largest category highlighted.

---

# Horizontal Bar Standards

Purpose:

Rank financial items.

### Used For

- Top Expenses
- Top Income Sources
- Highest Debt
- Largest Investments

Rules:

- Longest bar first.
- Compact labels.
- Percentage shown at end.

---

# Stacked Bar Standards

Purpose:

Show composition.

### Used For

- EMI Principal vs Interest.
- Income Allocation.
- Budget Allocation.
- Debt Distribution.

Rules:

- Maximum four stacked segments.
- Legend below chart.

---

# Donut Chart Standards

Purpose:

Expense distribution.

### Displays

- Category %
- Amount
- Total Spending

### Rules

- Maximum eight slices.
- Center shows total amount.
- Small legend below.

---

# Progress Ring Standards

Purpose:

Show progress toward financial goals.

### Used For

- Emergency Fund
- Savings Goal
- Debt Payoff
- Retirement Goal

### Displays

- Completion %
- Saved Amount
- Remaining Amount
- ETA

Used throughout FinanceOS.

---

# Semi-Circle Progress Gauge

Purpose:

Display health score.

### Used For

- Financial Health Score.
- Budget Health.
- Debt Health.

Gauge values:

- 0–39 Critical.
- 40–59 Warning.
- 60–79 Stable.
- 80–100 Excellent.

---

# Mini KPI Charts

Purpose:

Show quick movement inside KPI cards.

Used inside:

- Dashboard cards.
- Mobile cards.
- Admin summary cards.

Rules:

- Sparkline only.
- No axes.
- Current point highlighted.

---

# Prediction Timeline Charts

Purpose:

Show financial future.

### Used For

- Debt-Free Date.
- Retirement Date.
- Goal Completion Date.

Rules:

- Timeline begins today.
- Future milestones labeled.
- Current month marker visible.

---

# Emergency Runway Visualization

Purpose:

Show survival duration.

Displays:

- Current Savings.
- Monthly Burn.
- Predicted Runway Months.

Includes projected depletion timeline.

---

# Cash Flow Forecast Visualization

Purpose:

Project future monthly balance.

Displays:

- Historical balance.
- Future prediction.
- Safe threshold.
- Negative threshold.

---

# Debt Payoff Visualization

Purpose:

Compare repayment strategies.

Displays:

- Current EMI.
- Increased EMI.
- Debt-free timeline difference.
- Interest saved.

---

# Savings Forecast Visualization

Purpose:

Future savings growth.

Displays:

- Current savings.
- Monthly contribution.
- Future savings value.
- Milestone markers.

---

# Retirement Projection Visualization

Purpose:

Estimate retirement readiness.

Displays:

- Portfolio growth.
- Inflation-adjusted target.
- Retirement gap.
- Target completion year.

---

# What-If Scenario Visualization

Purpose:

Compare financial decisions.

Examples:

- Salary Increase.
- EMI Increase.
- Rent Change.
- Investment Increase.

Displays baseline vs scenario comparison.

---

# Color Token Rules

FinanceOS charts inherit colors from the Design System.

## Semantic Colors

| Purpose | Usage |
|---------|------|
| Positive | Savings, Growth |
| Warning | Budget Risk |
| Danger | Debt, Overspending |
| Forecast | Prediction Region |
| Neutral | Historical Data |

Never use random Excel palette colors.

---

# Gradient Rules

FinanceOS gradients are subtle.

Allowed:

- Blue → Cyan.
- Purple → Blue.
- Green → Emerald.
- Orange → Amber.

Never use rainbow gradients.

---

# Axis Standards

### X-Axis

- Month abbreviations.
- Quarterly labels when needed.
- Timeline labels.

### Y-Axis

- Currency formatting.
- Percentage formatting.
- Compact notation for large values.

---

# Gridline Standards

Gridlines must be minimal.

Rules:

- Horizontal only.
- Very low opacity.
- No vertical clutter.

---

# Legend Standards

Legend always appears below chart.

Rules:

- Horizontal layout.
- Color chip.
- Label.
- Value (optional).

---

# Tooltip Standards (Website & App)

Interactive charts display:

- Date.
- Value.
- Difference.
- Percentage Change.

Tooltips follow FinanceOS card styling.

---

# Empty State Standards

Charts never appear blank.

Examples:

**Savings Chart**

> Add your first savings transaction.

**Expense Chart**

> Record expenses to unlock category insights.

**Forecast Chart**

> Enter at least three months of transactions.

---

# Loading State Standards

Charts load with skeleton placeholders.

Rules:

- Rounded placeholder.
- Animated shimmer.
- Same size as final chart.

---

# Excel Chart Standards

Excel is the design reference.

Requirements:

- Rounded containers.
- Hidden default chart borders.
- FinanceOS fonts.
- FinanceOS spacing.
- Dynamic ranges linked to tables.

---

# Google Sheets Standards

Google Sheets mirrors Excel.

Requirements:

- Same layout.
- Same spacing.
- Same colors.
- Same legends.
- Dynamic chart ranges.

---

# Website Chart Standards

Website charts become interactive.

Features:

- Hover Tooltips.
- Smooth animations.
- Live updates.
- Dark Theme.

Libraries must follow FinanceOS styling.

---

# Admin Dashboard Chart Standards

Admin charts visualize business metrics.

Examples:

- Sales.
- Revenue.
- Conversion Rate.
- ROAS.
- Downloads.
- Email Opens.

Same design language.

---

# Mobile App Chart Standards

Mobile charts become swipeable cards.

Rules:

- One chart per card.
- Large touch targets.
- Insight footer preserved.

---

# Chart Accessibility Standards

Every chart supports:

- High contrast.
- Color-independent meaning.
- Keyboard navigation (Website).
- Screen reader labels (Website/App).

---

# Dynamic Data Rules

Charts automatically expand with FinanceOS tables.

Requirements:

- Linked to structured tables.
- New rows update charts automatically.
- Google Sheets mirrors behavior.

No manual chart range updates.

---

# Performance Rules

Cursor must optimize charts.

Rules:

- Dynamic named ranges.
- No volatile chart formulas.
- No duplicate charts.
- Reuse chart templates.

Workbook remains lightweight.

---

# Cursor Implementation Rules

Cursor must:

1. Use FinanceOS chart containers.
2. Use Design System colors only.
3. Use dynamic table ranges.
4. Separate historical and forecast regions.
5. Include insight footer.
6. Keep dashboard hierarchy identical across platforms.

---

# Cross Platform Mapping

| Excel | Google Sheets | Website | Admin | Mobile |
|-------|---------------|---------|-------|--------|
| Native Chart | Native Chart | Interactive Chart | Live Chart | Swipeable Card |

Excel remains the visual reference.

---

# Frozen Decisions (Version 1)

The following chart decisions are locked for FinanceOS V1.

- Four dashboard hero charts.
- Six chart families.
- Rounded chart containers.
- Forecast confidence shading.
- Progress ring design.
- Semi-circle health gauge.
- Insight footer on every chart.
- Dynamic chart ranges.
- Cross-platform identical chart hierarchy.
- FinanceOS color token system.

---

# Version History

## Version 1.0

Initial official FinanceOS chart design specification defining chart philosophy, hierarchy, dashboard rules, prediction visualization, accessibility, dynamic chart behavior, and implementation rules across Excel, Google Sheets, Website, Admin Dashboard, and Mobile.

---

**End of Document**

**File:** `docs/design/excel/04_CHART_UI_GUIDELINES.md`
