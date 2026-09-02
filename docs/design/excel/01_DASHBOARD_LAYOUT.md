# FinanceOS — Dashboard Layout Specification

**Document ID:** DESIGN-EXCEL-01
**Version:** 1.0
**Status:** Frozen (V1 Dashboard Blueprint)
**Owner:** FinanceOS Architecture
**Repository:** FinanceOS
**Folder:** `/docs/design/excel`
**Dependencies:**
- `00_EXCEL_UI_MASTER.md`
- `../00_DESIGN_MASTER.md`
- `../01_DESIGN_SYSTEM.md`
- `../02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines the complete layout, hierarchy, spacing, interactions, and visual behavior of the FinanceOS Dashboard worksheet.

The Dashboard is the **homepage of FinanceOS** and the first screen users see when opening the workbook.

This document is the visual blueprint for recreating the Dashboard across:

- Microsoft Excel.
- Google Sheets.
- Interactive Website (same hierarchy).
- Mobile App Dashboard (adapted layout).

The Dashboard should feel identical across every platform.

---

# Dashboard Design Vision

The Dashboard is not a reporting page.

It is the user's **Financial Command Center**.

Within **5 seconds**, the user must understand:

- Where their money stands.
- Whether they are financially healthy.
- What needs attention.
- What action to take next.

The Dashboard should create the feeling:

> "Everything about my finances is under control."

---

# Dashboard Experience Goals

## Primary Goals

The Dashboard answers four questions immediately.

1. **How healthy am I financially?**
2. **How much money do I have available?**
3. **What is my biggest financial risk?**
4. **What should I do next?**

Everything else is secondary.

---

## Emotional Design Goals

FinanceOS Dashboard should feel:

- Calm.
- Premium.
- Professional.
- Intelligent.
- Predictive.
- Personalized.

Never overwhelming.

---

# Dashboard Canvas

The Dashboard is divided into **8 visual zones**.

---

## Zone 01 — Hero Header

Purpose:

Create a premium first impression.

Contains:

- FinanceOS Logo.
- Current Month.
- Personalized greeting.
- Current Financial Status Badge.
- Last Updated timestamp.

This occupies the full dashboard width.

---

## Zone 02 — Primary KPI Cards

Purpose:

Display the six most important financial metrics.

Cards displayed:

- Net Worth.
- Monthly Income.
- Monthly Expenses.
- Savings This Month.
- Emergency Runway.
- Financial Health Score.

Rules:

- Largest visual section.
- Equal card sizing.
- Icons always visible.
- Trend shown beneath value.

This section is always above the fold.

---

## Zone 03 — Financial Health Hero

Purpose:

Dedicated centerpiece.

Contains:

- Large circular Health Score.
- Health category label.
- Monthly improvement percentage.
- One-line financial summary.

Examples:

- Healthy.
- Stable.
- Needs Attention.
- Critical.

Only one hero card exists on the dashboard.

---

## Zone 04 — Cash Flow Overview

Purpose:

Explain money movement.

Contains:

- Income vs Expenses comparison.
- Monthly Savings.
- Remaining Cash Flow.
- Income trend.

Visual layout:

Left side:

Cash Flow Summary Card.

Right side:

Income vs Expense Chart.

---

## Zone 05 — Prediction Engine Preview

Purpose:

Preview FinanceOS intelligence.

Prediction cards displayed:

- Job Loss Survival Runway.
- EMI Stress Test.
- Savings Forecast.
- Goal Completion Forecast.

Each prediction card contains:

- Current value.
- Forecast value.
- Recommendation badge.

Prediction cards are interactive on Web and App.

---

## Zone 06 — Smart Recommendations

Purpose:

Tell users what to do next.

Maximum visible cards:

Three.

Priority:

1. Critical Recommendation.
2. High Impact Recommendation.
3. Opportunity Recommendation.

Each recommendation includes:

- Priority Badge.
- Recommendation Title.
- Why it matters.
- Expected impact.

---

## Zone 07 — Financial Goals Snapshot

Purpose:

Show active goals.

Visible goals:

Maximum four.

Each goal contains:

- Progress Ring.
- Amount Saved.
- Remaining Amount.
- Estimated Completion Month.

Users navigate to Goals worksheet from here.

---

## Zone 08 — Quick Navigation

Purpose:

Navigate the workbook like software.

Navigation cards:

- Transactions.
- Income.
- Expenses.
- Assets.
- Liabilities.
- Investments.
- Reports.
- Settings.

Cards behave like application launchers.

---

# Dashboard Grid System

Dashboard follows a consistent layout grid.

## Horizontal Structure

Desktop:

12-column layout.

Tablet:

8-column layout.

Mobile Excel:

Single-column stacking.

---

## Vertical Rhythm

Order is fixed.

1. Header.
2. KPI Cards.
3. Health Hero.
4. Cash Flow.
5. Predictions.
6. Recommendations.
7. Goals.
8. Navigation.

No section may change order in Version 1.

---

# Dashboard Spacing Rules

Dashboard uses the Design System spacing tokens.

Rules:

- Large spacing between zones.
- Medium spacing between cards.
- Small spacing inside cards.

Whitespace is intentional.

No crowded layouts.

---

# Hero Header Specification

Contains:

### Left

- FinanceOS Logo.
- Dashboard title.
- Greeting.

### Right

- Current Month.
- Last Sync.
- Financial Status Badge.

Header remains visible when scrolling on future web version.

---

# KPI Card Layout Specification

Every KPI card contains:

1. Icon.
2. Metric Name.
3. Primary Value.
4. Trend.
5. Small description.

Examples:

Net Worth.

₹2,45,600

▲ 8.3%

Compared to last month.

---

## KPI Card Priority Order

Version 1 order is frozen.

1. Financial Health.
2. Net Worth.
3. Monthly Savings.
4. Monthly Income.
5. Monthly Expenses.
6. Emergency Runway.

Never reorder without Version update.

---

# Financial Health Hero Specification

Largest dashboard component.

Contains:

### Left

Circular Health Score.

### Center

Health label.

### Right

Financial summary.

Below:

Progress toward healthier finances.

This component visually anchors the dashboard.

---

# Cash Flow Card Specification

Displays:

- Total Income.
- Total Expenses.
- Remaining Balance.
- Savings Rate.

Includes one visual trend chart.

---

# Monthly Trend Chart Specification

Chart displays:

- Income.
- Expenses.
- Savings.

Rules:

- Current month highlighted.
- Previous months faded.
- Smooth lines.
- Compact legend.

---

# Prediction Cards Specification

Every prediction card follows identical structure.

### Header

Prediction title.

### Center

Forecast metric.

### Footer

Recommendation badge.

Prediction cards include:

- Runway.
- EMI Risk.
- Savings Forecast.
- Goal ETA.

---

# Job Loss Runway Card

Displays:

- Current runway.
- Safe months.
- Remaining months.
- Emergency status.

Recommendation appears below.

---

# EMI Stress Card

Displays:

- Current EMI Ratio.
- Proposed EMI simulation.
- Safe / Caution / Risk verdict.

Supports interactive simulation on Website.

---

# Savings Forecast Card

Displays:

- Current savings.
- Forecast after selected months.
- Monthly increase.

Includes mini trend.

---

# Goal Forecast Card

Displays:

- Goal.
- Completion estimate.
- Progress.
- Required monthly contribution.

---

# Recommendation Cards

Recommendation cards follow three severity levels.

## Critical

Immediate attention.

## Warning

Needs improvement.

## Opportunity

Optimization suggestion.

Maximum one card per severity.

---

# Goals Snapshot Section

Displays four goal cards.

Each contains:

- Goal icon.
- Goal name.
- Saved amount.
- Remaining amount.
- Progress ring.
- ETA.

---

# Quick Navigation Cards

Navigation cards launch worksheets.

Cards include:

- Icon.
- Name.
- Description.

Examples:

Transactions

"Add and manage every transaction."

---

# Dashboard Containers

Every dashboard section lives inside reusable containers.

Containers include:

- Section title.
- Subtitle.
- Content.
- Footer insight.

Rounded container required.

---

# Dashboard Typography Hierarchy

Dashboard typography follows Design System.

Hierarchy:

- Greeting.
- Section Heading.
- KPI Value.
- Subtitle.
- Caption.
- Trend.

Financial values receive highest emphasis.

---

# Dashboard Color Hierarchy

Color usage priority:

1. Background.
2. KPI Cards.
3. Accent Cards.
4. Charts.
5. Status Colors.

Only FinanceOS design tokens allowed.

---

# Dashboard Icons

Icons appear only inside:

- KPI Cards.
- Navigation Cards.
- Prediction Cards.
- Recommendation Cards.
- Goals Cards.

Icons reinforce information.

Never decorate.

---

# Dashboard Charts

Dashboard supports maximum four visible charts.

Allowed charts:

- Cash Flow Trend.
- Expense Breakdown.
- Savings Growth.
- Net Worth Growth.

Avoid dashboard clutter.

---

# Dashboard Empty States

Examples:

No transactions.

Message:

"Add your first transaction to activate your dashboard."

No goals.

Message:

"Create your first savings goal."

Every empty state includes a CTA.

---

# Dashboard Conditional Formatting

Dashboard responds to financial health.

Examples:

Health improves.

KPI trends update.

Budget exceeded.

Recommendation appears.

Runway drops below threshold.

Prediction card becomes warning state.

Formatting is informative, never alarming.

---

# Dashboard Mobile Adaptation

Excel Mobile behavior.

Rules:

- Hero stacks vertically.
- KPI cards become two-column grid.
- Charts become swipeable sections.
- Recommendations remain visible.
- Navigation cards stack vertically.

Same hierarchy preserved.

---

# Dashboard Print Rules

Dashboard exports professionally.

Includes:

- Header.
- KPI cards.
- Health Score.
- Charts.
- Recommendations.

Print hides navigation cards.

---

# Dashboard Performance Rules

Dashboard loads instantly.

Rules:

- Lightweight formulas.
- Limited volatile functions.
- Charts reference helper tables.
- KPI calculations cached through helper sheets.

Performance takes priority over visual effects.

---

# Cursor Implementation Rules

Cursor must follow these rules.

1. Dashboard always opens first.
2. Zones remain in frozen order.
3. KPI cards inherit Component Library.
4. Colors inherit Design System.
5. Dashboard mirrors future Website hierarchy.
6. Google Sheets dashboard mirrors this layout.
7. Mobile dashboard inherits this layout responsively.

---

# Dashboard Design References

This dashboard is visually inspired by:

- FinanceOS Brand Identity.
- Premium fintech SaaS dashboards.
- Lovable dark landing page direction selected for FinanceOS.
- Minimal financial operating systems.

Excel implementation should recreate this experience without exposing spreadsheet behavior.

---

# Frozen Dashboard Decisions — Version 1

Version 1 locks:

- Eight dashboard zones.
- Six primary KPI cards.
- Health Score hero placement.
- Prediction preview section.
- Recommendation section.
- Goals snapshot section.
- Quick navigation launcher cards.

Future versions may extend the dashboard but cannot change this hierarchy.

---

# Version History

## Version 1.0

Initial dashboard blueprint defining the complete FinanceOS homepage layout, visual hierarchy, prediction preview system, KPI architecture, navigation experience, chart placement, recommendation engine preview, goals snapshot, and responsive adaptation rules.

---

**End of Document — `docs/design/excel/01_DASHBOARD_LAYOUT.md`**
