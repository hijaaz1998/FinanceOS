# FinanceOS — Component Library

**Version:** 1.0  
**Status:** Frozen (V1 Shared UI Components)  
**Owner:** FinanceOS Architecture  
**Repository:** FinanceOS  
**Folder:** `/design`  
**Dependencies:** `00_DESIGN_MASTER.md`, `01_DESIGN_SYSTEM.md`

---

# Purpose

This document defines every reusable user interface component used across the FinanceOS ecosystem.

Components are platform-independent. They describe **what a component is, when it is used, how it behaves, and which platforms use it**.

Every FinanceOS interface must reuse components defined here instead of creating new visual patterns.

This document is the **shared component authority** for Excel, Google Sheets, Website, Admin Dashboard, and Mobile.

---

# Scope

## Included

- KPI Cards.
- Summary Cards.
- Prediction Cards.
- Recommendation Cards.
- Insight Cards.
- Progress Components.
- Chart Containers.
- Tables.
- Buttons.
- Inputs.
- Dropdowns.
- Sliders.
- Navigation Components.
- Status Badges.
- Empty States.
- Loading States.
- Modal Components.
- Toast Components.
- Section Headers.
- Page Headers.
- Metric Chips.

## Excluded

- Excel worksheet layouts.
- Website page layouts.
- Mobile screen layouts.
- Google Sheets layouts.

---

# Component Architecture Principles

FinanceOS components follow these principles:

1. Every component is reusable.
2. Every component has a single responsibility.
3. Every component inherits the Design System.
4. Every component behaves consistently across platforms.
5. Every component supports desktop and mobile adaptation.

---

# Component Categories

FinanceOS components are organized into eight categories.

## Category A — Display Components

Used to display financial information.

Includes:

- KPI Cards.
- Summary Cards.
- Metric Chips.
- Insight Cards.
- Recommendation Cards.

---

## Category B — Input Components

Used for user interaction.

Includes:

- Text Input.
- Currency Input.
- Percentage Input.
- Dropdown.
- Slider.
- Toggle.
- Date Picker.

---

## Category C — Navigation Components

Includes:

- Sidebar Item.
- Top Navigation Item.
- Dashboard Tabs.
- Breadcrumb.
- Mobile Navigation.

---

## Category D — Data Components

Includes:

- Transaction Table.
- Summary Table.
- Asset Table.
- Liability Table.
- Forecast Table.

---

## Category E — Visualization Components

Includes:

- Line Chart.
- Area Chart.
- Bar Chart.
- Donut Chart.
- Progress Ring.
- Progress Bar.

---

## Category F — Feedback Components

Includes:

- Success Badge.
- Warning Badge.
- Risk Badge.
- Loading State.
- Empty State.
- Toast Notification.

---

## Category G — Layout Components

Includes:

- Section Container.
- Dashboard Grid.
- Card Container.
- Modal Container.
- Bottom Sheet.

---

## Category H — Marketing Components

Used on the public website.

Includes:

- Pricing Card.
- Feature Card.
- Testimonial Card.
- FAQ Card.
- CTA Banner.

---

# KPI Card Component

## Purpose

Displays one critical financial metric.

## Used In

- Excel Dashboard.
- Website Dashboard.
- Admin Dashboard.
- Mobile Dashboard.

## Content Structure

Contains:

- Icon.
- Label.
- Primary Metric.
- Trend Indicator.
- Supporting Description.

## Examples

- Financial Health Score.
- Savings.
- Monthly Income.
- Emergency Runway.
- Net Worth.
- Debt Load.

## Behaviour

Updates dynamically whenever source data changes.

---

# Financial Health Card

## Purpose

Shows overall financial health.

## Contains

- Circular Health Score.
- Health Status.
- Trend.
- Recommendation Preview.

Used across every dashboard.

---

# Prediction Card

## Purpose

Displays predictive financial outcomes.

## Examples

- Job Loss Runway.
- EMI Stress Test.
- Goal Completion Forecast.
- Savings Forecast.
- Retirement Forecast.

## Card Behaviour

Prediction always includes:

- Current State.
- Future State.
- Recommendation.

---

# Recommendation Card

## Purpose

Suggests the next financial action.

## Recommendation Types

- Save More.
- Delay Purchase.
- Pay Loan First.
- Reduce Spending.
- Build Emergency Fund.

## Behaviour

Appears after prediction calculations.

---

# Insight Card

## Purpose

Highlights meaningful financial observations.

## Examples

- Spending increased.
- Savings improved.
- Debt ratio decreased.
- Subscription cost rising.

Insights remain informational.

---

# Summary Card

## Purpose

Summarizes a financial category.

## Used For

- Income Summary.
- Expense Summary.
- Asset Summary.
- Liability Summary.
- Investment Summary.

---

# Progress Ring Component

## Purpose

Displays progress visually.

## Used For

- Goal Progress.
- Emergency Fund Progress.
- Savings Target.
- Debt Payoff Progress.
- Budget Usage.

---

# Progress Bar Component

## Purpose

Linear representation of progress.

## Used For

- Monthly Budget.
- Spending Categories.
- Investment Allocation.
- Goal Completion.

---

# Trend Indicator Component

## Purpose

Shows movement compared to previous period.

## States

- Positive.
- Negative.
- Neutral.

Includes:

- Arrow.
- Percentage.
- Time comparison.

---

# Chart Container Component

Every chart lives inside a reusable chart container.

## Includes

- Title.
- Subtitle.
- Chart.
- Legend.
- Insight Footer.

---

# Line Chart Component

Used for time-based financial trends.

Examples:

- Cash Flow.
- Savings Growth.
- Net Worth Growth.

---

# Area Chart Component

Used for cumulative trends.

Examples:

- Portfolio Growth.
- Emergency Fund Growth.

---

# Bar Chart Component

Used for category comparisons.

Examples:

- Expense Categories.
- Monthly Income Sources.
- Budget Allocation.

---

# Donut Chart Component

Used for proportional distributions.

Examples:

- Expense Breakdown.
- Asset Allocation.
- Income Sources.

---

# Forecast Chart Component

Used only for predictive systems.

Examples:

- Debt-Free Timeline.
- Savings Forecast.
- Retirement Projection.

Prediction charts always include projected sections.

---

# Table Component

FinanceOS tables follow one reusable structure.

## Supported Tables

- Transactions.
- Income.
- Expenses.
- Assets.
- Liabilities.
- Investments.

## Table Features

- Sticky Header.
- Search Ready.
- Sort Ready.
- Filter Ready.
- Status Indicators.

---

# Transaction Row Component

Defines one reusable transaction row.

## Fields

- Date.
- Category.
- Description.
- Account.
- Amount.
- Status.

---

# Asset Card Component

Displays one asset.

Examples:

- Bank Account.
- Cash.
- Gold.
- Crypto.
- Investments.
- Property.

---

# Liability Card Component

Displays one debt account.

Examples:

- Credit Card.
- Home Loan.
- Car Loan.
- Personal Loan.

Includes payoff progress.

---

# Account Selector Component

Allows selecting financial accounts.

Supports:

- Bank.
- Wallet.
- Cash.
- Credit Card.
- UPI.

---

# Currency Input Component

Special financial input.

Supports:

- Local Currency.
- PPP Currency.
- Decimal Formatting.
- Negative Values.

---

# Percentage Input Component

Supports:

- Interest Rate.
- Savings Rate.
- Budget Allocation.
- Investment Return.

---

# Slider Component

Used in prediction engine.

Examples:

- Salary Slider.
- EMI Slider.
- Inflation Slider.
- Savings Slider.

---

# Dropdown Component

Used for categories.

Supports:

- Expense Categories.
- Income Categories.
- Bank Accounts.
- Goal Types.
- Countries.

---

# Toggle Component

Binary financial options.

Examples:

- Essential Expense.
- Include in Forecast.
- Active Goal.

---

# Date Picker Component

Used for:

- Transactions.
- Salary Date.
- Goal Deadline.
- Loan Start Date.

---

# Search Bar Component

Used inside:

- Transactions.
- Assets.
- Goals.
- Admin Dashboard.

---

# Sidebar Navigation Component

Primary desktop navigation.

Used in:

- Excel.
- Website Dashboard.
- Admin Dashboard.

---

# Top Navigation Component

Used on website and admin interfaces.

Contains:

- Logo.
- Navigation.
- CTA.
- User Status.

---

# Tab Navigation Component

Used inside dashboards.

Examples:

- Monthly / Yearly.
- Income / Expenses.
- Assets / Liabilities.

---

# Status Badge Component

FinanceOS has reusable badges.

## Types

- Success.
- Warning.
- Danger.
- Information.
- Prediction.
- Completed.
- Upcoming.

---

# Metric Chip Component

Small reusable metrics.

Examples:

- +12%
- Safe
- High Risk
- 4 Months Left
- Goal On Track

---

# Empty State Component

Used whenever data is unavailable.

Examples:

- No Transactions.
- No Goals.
- No Investments.
- No Loans.

Always includes guidance.

---

# Loading Component

FinanceOS loading system.

Includes:

- Skeleton Cards.
- Skeleton Tables.
- Skeleton Charts.

---

# Toast Notification Component

Used for temporary feedback.

Examples:

- Transaction Added.
- Goal Updated.
- Export Successful.

---

# Modal Component

Reusable overlay.

Examples:

- Add Transaction.
- Edit Goal.
- Loan Details.
- Export Options.

---

# Bottom Sheet Component

Mobile-specific interaction.

Examples:

- Add Expense.
- Quick Filters.
- Category Selection.

---

# Pricing Card Component

Website reusable component.

Includes:

- Price.
- PPP Price.
- Features.
- CTA.

---

# Feature Card Component

Landing page feature display.

Examples:

- Prediction Engine.
- Debt Optimizer.
- Savings Planner.
- Goal Tracker.

---

# FAQ Card Component

Landing page expandable component.

---

# Testimonial Card Component

Used for customer stories.

Supports rating, quote, and profile.

---

# CTA Banner Component

Reusable conversion section.

Used throughout website.

---

# Component Behaviour Rules

All components must:

- Follow Design System tokens.
- Support dark theme.
- Support responsive layouts.
- Maintain consistent spacing.
- Use shared typography hierarchy.

No platform-specific redesigns.

---

# Cursor Implementation Rules

1. Never create duplicate components.
2. Reuse component names exactly.
3. Shared updates happen here first.
4. Platform documents only describe adaptations.

---

# Dependencies

Parent Documents:

- `00_DESIGN_MASTER.md`
- `01_DESIGN_SYSTEM.md`

Referenced By:

- `03_EXCEL_UI_GUIDELINES.md`
- `04_GSHEETS_UI_GUIDELINES.md`
- `/web`
- `/admin`
- `/app`

---

# Frozen Components — Version 1

Version 1 freezes the existence and purpose of every shared FinanceOS component.

Future versions may extend components but must not redefine existing component behaviour.

---

# Version History

## Version 1.0

Initial FinanceOS Component Library defining every reusable UI component shared across Excel, Google Sheets, Website, Admin Dashboard, Mobile Application, and future FinanceOS interfaces.

---

**End of Document — `design/02_COMPONENT_LIBRARY.md` Version 1.0**
