# 05_INTERACTIVE_FINANCE_PLAYGROUND.md

## FinanceOS — Interactive Finance Playground Specification

**Document ID:** WEB-USER-05

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Interactive Finance Playground Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/user`

**Dependencies:**

- `00_WEB_MASTER.md`
- `01_INFORMATION_ARCHITECTURE.md`
- `02_LANDING_PAGE_SPECIFICATION.md`
- `03_COMPONENT_LIBRARY.md`
- `04_ANIMATIONS_AND_MICROINTERACTIONS.md`
- `docs/design/excel/06_KPI_INSIGHT_COMPONENTS.md`
- `docs/design/excel/07_PREDICTION_ENGINE_UI.md`
- `docs/design/google-sheets/03_CHARTS_AND_DASHBOARD_MAPPING.md`

---

# Purpose

The Interactive Finance Playground is the **highest-value conversion feature** on the FinanceOS website.

Instead of only showing screenshots, visitors interact with a live mini version of FinanceOS before purchasing.

The playground demonstrates the power of FinanceOS in under **60 seconds** without requiring login or signup.

This document is the **single source of truth** for Cursor when building the interactive simulator.

---

# Playground Philosophy

The playground is **not the full product**.

It is a guided financial simulator that answers one question:

> **"What would my financial life look like inside FinanceOS?"**

The visitor experiences FinanceOS immediately.

---

# Business Objective

The playground exists to increase conversions.

## Goals

| Goal | Purpose |
|-------|---------|
| Increase Time on Page | Interactive experience. |
| Demonstrate Dashboard | Live KPI updates. |
| Show Prediction Engine | Forecast results instantly. |
| Create Emotional Impact | Visualize financial future. |
| Drive Purchase CTA | Unlock complete FinanceOS. |

---

# Playground Placement

The playground is the **third section** of the landing page.

Page flow:

1. Hero.
2. Social Proof.
3. **Interactive Playground**.
4. Why FinanceOS.
5. Product Showcase.

It appears before pricing.

---

# Playground Layout

Desktop layout uses a **two-column application interface**.

## Left Panel

Finance inputs.

## Right Panel

Live FinanceOS dashboard.

This resembles a real application.

---

# Playground Height

| Device | Height |
|--------|--------|
| Desktop | 850–950px |
| Tablet | Auto |
| Mobile | Stacked |

The section should feel immersive.

---

# Playground User Flow

Visitor journey:

1. Enter salary.
2. Add expenses.
3. Add EMI.
4. Add savings goal.
5. Watch dashboard update.
6. View prediction cards.
7. Click Buy FinanceOS.

No authentication required.

---

# Playground Modules

The playground contains **6 interactive modules**.

| Module | Purpose |
|--------|---------|
| Income Simulator | Monthly earnings. |
| Expense Simulator | Spending inputs. |
| Savings Simulator | Savings goals. |
| Prediction Simulator | Future projections. |
| Dashboard Preview | Live FinanceOS UI. |
| Conversion CTA | Purchase FinanceOS. |

---

# Playground State Architecture

Version 1 is entirely client-side.

No data is stored.

Session resets on refresh.

---

# Initial Playground State

Default example values.

| Field | Default |
|-------|---------|
| Salary | ₹60,000 |
| Rent | ₹15,000 |
| Food | ₹8,000 |
| Transport | ₹3,000 |
| Entertainment | ₹2,500 |
| EMI | ₹6,000 |
| Savings Goal | ₹300,000 |
| Emergency Fund | ₹50,000 |

Shows realistic demo immediately.

---

# Finance Input Panel

Purpose:

Collect financial inputs.

The panel behaves like a premium settings panel.

---

# Salary Input Component

Primary input.

## Controls

- Number Input.
- Slider.
- Currency formatting.

### Range

₹0–₹10,00,000+

Updates dashboard instantly.

---

# Expense Input Components

Users edit monthly expenses.

## Categories

- Rent
- Groceries
- Dining
- Transport
- Shopping
- Entertainment
- Utilities
- Healthcare
- Education
- Miscellaneous

Every category uses slider + input.

---

# Expense Summary Card

Displays:

- Total Expenses.
- Remaining Income.
- Spending Percentage.

Updates continuously.

---

# EMI Simulator Input

Purpose:

Show debt impact.

Inputs:

- Monthly EMI.
- Remaining Loan.
- Interest Rate (optional demo).

Outputs update prediction cards.

---

# Savings Goal Input

Inputs:

- Goal Amount.
- Monthly Contribution.

Goal examples:

- Emergency Fund.
- Bike.
- Laptop.
- Vacation.
- House.

---

# Emergency Fund Input

Inputs:

- Current Emergency Savings.

Outputs:

- Emergency Runway.
- Recommendation.
- Health Score contribution.

---

# Income Frequency Toggle

Version 1 supports:

- Monthly
- Yearly (converted internally)

Optional toggle.

---

# Currency Display

Playground respects PPP region.

Version 1 demo defaults to India.

Future localization supported.

---

# Live Dashboard Preview

Right panel recreates FinanceOS Dashboard.

### Sections

- KPI Cards.
- Cash Flow Chart.
- Spending Donut.
- Goal Card.
- Health Score Ring.
- Insight Card.

Mini version only.

---

# Dashboard KPI Cards

Exactly **6 KPI Cards**.

| KPI | Description |
|-----|-------------|
| Net Monthly Surplus | Income minus expenses. |
| Savings Rate | Monthly savings percentage. |
| Total Expenses | Spending total. |
| Emergency Runway | Months covered. |
| Financial Health Score | Composite score. |
| Goal ETA | Estimated completion month. |

Updates live.

---

# Cash Flow Chart

Displays:

- Income.
- Expenses.
- Surplus.

Animated area chart.

Real-time updates.

---

# Spending Donut Chart

Displays category distribution.

Top categories only.

Legend updates instantly.

---

# Goal Progress Card

Displays:

- Goal progress.
- Target amount.
- Saved amount.
- ETA.
- Progress bar.

Updates while moving sliders.

---

# Health Score Ring

Purpose:

Emotional conversion feature.

Displays score from **0–100**.

### Score Bands

| Score | Status |
|-------|--------|
| 90–100 | Excellent |
| 75–89 | Healthy |
| 60–74 | Improving |
| 40–59 | Needs Attention |
| Below 40 | High Risk |

Color changes automatically.

---

# Financial Health Inputs

Health Score depends on:

- Savings Rate.
- Expense Ratio.
- EMI Load.
- Emergency Fund.
- Goal Contribution.

Weighted calculation.

---

# Insight Recommendation Card

Shows one intelligent recommendation.

Examples:

- Increase emergency savings by ₹8,000.
- Dining exceeds healthy spending.
- You could save ₹3,200/month.
- You'll reach your goal 4 months earlier.

Always positive and actionable.

---

# Prediction Preview Module

Purpose:

Show FinanceOS intelligence.

Contains **4 prediction cards**.

---

# Emergency Runway Card

Displays:

- Months remaining.
- Healthy target.
- Recommendation.

Mini forecast chart included.

---

# Savings Forecast Card

Displays projected savings after:

- 6 Months.
- 1 Year.
- 3 Years.

Animated line chart.

---

# Goal Completion Forecast

Displays:

- Estimated completion month.
- Time remaining.
- Progress trend.

Updates instantly.

---

# EMI Impact Forecast

Displays:

- Debt-free month.
- Interest saved if EMI increases.
- Monthly stress indicator.

Mini comparison chart.

---

# Scenario Simulator

Visitors compare two financial scenarios.

## Current Scenario

Existing inputs.

## Better Scenario

Suggested improvements.

Example:

Increase savings ₹3,000/month.

Dashboard updates side-by-side.

---

# What-If Cards

Preset buttons.

Examples:

- Salary +10%
- Salary +25%
- Expenses -15%
- EMI +₹2,000
- Save Extra ₹5,000

One-click simulation.

---

# Preset Personas

Visitors can load sample profiles.

### Personas

- College Student.
- Software Engineer.
- Freelancer.
- Married Couple.
- Entrepreneur.

Entire dashboard updates.

---

# Mini Reports Preview

Preview card.

Displays:

- Monthly Report.
- Expense Breakdown.
- Savings Summary.
- Financial Health.

CTA:

Unlock Full Reports.

---

# Theme Toggle

Playground supports:

- Dark Theme.
- Light Theme.

Dashboard transitions smoothly.

---

# Excel / Google Sheets Toggle

Visitors preview both editions.

### Toggle Options

- Excel
- Google Sheets

Dashboard frame changes.

Calculations remain identical.

---

# Live UI Behaviors

Every interaction updates:

- KPI Cards.
- Charts.
- Progress Bars.
- Insights.
- Health Score.
- Predictions.

No manual refresh.

---

# Animation Rules

Interactions animate within **250ms**.

Includes:

- Counter animations.
- Chart transitions.
- Progress updates.
- Ring updates.

Never animate the entire dashboard.

---

# Conversion CTA Placement

CTA appears below predictions.

### Content

Headline:

**Ready to unlock the complete FinanceOS experience?**

Includes:

- Excel Included.
- Google Sheets Included.
- Instant Download.
- One-Time Purchase.

Primary button only.

---

# Locked Feature Preview

Purpose:

Create curiosity.

Blurred preview cards.

Examples:

- Retirement Planner.
- Investment Forecast.
- Wealth Projection.
- Yearly Reports.
- 20+ Worksheets.

Overlay says:

**Available in the full FinanceOS workbook.**

---

# Conversion Psychology Rules

After interaction:

Show personalized message.

Examples:

- You could save ₹48,000 more this year.
- You'll reach your goal 7 months sooner.
- Your emergency fund covers only 2.1 months.

CTA follows insight immediately.

---

# Playground Responsiveness

## Desktop

Split application layout.

## Tablet

Inputs above dashboard.

## Mobile

Inputs collapse into accordion sections.

Dashboard becomes stacked cards.

---

# Accessibility Rules

Must support:

- Keyboard sliders.
- Numeric inputs.
- Screen readers.
- Reduced motion.
- High contrast.

---

# Performance Rules

Playground performance targets.

| Metric | Target |
|--------|--------|
| Input Response | Under 100ms |
| KPI Update | Under 150ms |
| Chart Animation | Under 250ms |
| Prediction Update | Under 300ms |

Everything remains client-side.

---

# Technical Architecture

Cursor builds playground using reusable components.

## Components Required

- SalarySlider
- ExpenseSlider
- KpiCard
- HealthScoreRing
- CashFlowChart
- DonutChart
- GoalProgressCard
- PredictionCard
- InsightCard
- ScenarioButton

All components reusable.

---

# Data Architecture

Local state only.

State includes:

- Income
- Expenses
- EMI
- Savings Goal
- Emergency Savings
- Theme
- Persona

No API required.

---

# Cursor Implementation Rules

Cursor must:

1. Build playground as a standalone React module.
2. Keep calculations client-side.
3. Reuse FinanceOS dashboard components.
4. Animate only changed values.
5. Support preset personas.
6. Support What-If simulation buttons.
7. Keep playground fully responsive.
8. Connect CTA to pricing page.

---

# Frozen Decisions (Version 1)

The following playground decisions are locked.

- Third landing page section.
- Two-column application layout.
- Six dashboard KPI cards.
- Four prediction preview cards.
- Health Score ring visualization.
- Preset personas.
- What-If scenario simulator.
- Excel/Google Sheets preview toggle.
- Local-only calculations.
- Purchase CTA after interaction.

---

# Version History

## Version 1.0

Official FinanceOS Interactive Finance Playground specification defining live financial simulator architecture, inputs, dashboard preview, prediction preview, health score system, scenario simulator, personas, conversion strategy, responsiveness, accessibility, performance targets, and Cursor implementation rules.

---

**End of Document**

**File:** `05_INTERACTIVE_FINANCE_PLAYGROUND.md`
