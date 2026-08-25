# FinanceOS — Dashboard Architecture

**Document ID:** DOC-012

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

The Dashboard is the primary user interface of FinanceOS Version 1.

It transforms workbook calculations into a clean, application-like experience inside Microsoft Excel while remaining compatible with:

- Excel Desktop (Windows)
- Excel Desktop (Mac)
- Excel Web
- Excel Android
- Excel iPhone / iPad

The Dashboard never stores business logic. It only presents outputs from the Business Engine and Analysis Engine.

---

# Dashboard Philosophy

FinanceOS should not feel like a spreadsheet.

The Dashboard should feel like a modern personal finance application with large cards, touch-friendly navigation, minimal scrolling, and clear financial priorities.

Every user should understand their financial position within **10 seconds** of opening the workbook.

---

# Dashboard Responsibilities

The Dashboard is responsible for:

- Financial overview.
- Cash flow visualization.
- Net worth overview.
- Goal progress.
- Debt overview.
- Spending overview.
- Financial health indicators.
- Recent activity preview.
- Insight preview.
- Quick navigation to worksheets.

It is **presentation only**.

---

# Dashboard Data Sources

| Source Worksheet | Purpose |
|------------------|---------|
| Business Engine | Financial metrics and KPIs. |
| Analysis Engine | Health indicators and forecasts. |
| Transactions | Recent transaction preview only. |
| Goals | Goal metadata for cards. |
| Settings | Theme, currency, reporting period. |

No calculations originate inside Dashboard.

---

# Dashboard Layout Architecture

Dashboard follows a fixed vertical layout.

## Layout Order

1. Header
2. Financial Snapshot
3. Cash Flow Card
4. Net Worth Card
5. Goals Card
6. Liabilities Card
7. Budget Card
8. Investments Card
9. Financial Health Card
10. Recent Transactions Preview
11. Insights Preview
12. Quick Navigation Footer

This order is frozen.

---

# Dashboard Header

The header provides workbook context.

## Header Components

| Component | Purpose |
|-----------|---------|
| FinanceOS Logo | Product identity. |
| Current Month | Active reporting period. |
| Financial Year | Selected financial year. |
| Currency Badge | Current workbook currency. |
| User Greeting Area | Reserved for future personalization. |

The header remains visible at the top.

---

# Financial Snapshot Card

The Snapshot Card shows the most important financial metrics.

## Metrics Displayed

| Metric | Source |
|--------|--------|
| Total Cash | Business Engine |
| Net Worth | Business Engine |
| Monthly Income | Business Engine |
| Monthly Expense | Business Engine |
| Monthly Savings | Business Engine |
| Savings Rate | Analysis Engine |

These six metrics are the highest-priority KPIs.

---

## Snapshot Design Rules

- Six large KPI cards.
- Currency displayed consistently.
- Positive metrics visually separated from negative metrics.
- Mobile cards stack vertically.

---

# Cash Flow Card

The Cash Flow Card visualizes monthly money movement.

## Card Contents

| Metric | Source |
|--------|--------|
| Income | Business Engine |
| Expense | Business Engine |
| Surplus | Business Engine |
| Fixed Commitments | Business Engine |
| Variable Spending | Business Engine |
| Remaining Cash | Business Engine |

---

## Cash Flow Visual Rules

Display:

- Income section.
- Expense section.
- Remaining Cash summary.
- Monthly surplus indicator.

Charts remain optional in Version 1.

---

# Net Worth Card

The Net Worth Card summarizes wealth.

## Card Contents

| Metric | Source |
|--------|--------|
| Net Worth | Business Engine |
| Total Assets | Business Engine |
| Total Liabilities | Business Engine |
| Cash Position | Business Engine |

---

## Net Worth Display Rules

Display:

- Current Net Worth prominently.
- Asset total.
- Liability total.
- Net Worth monthly change indicator.

---

# Goals Card

The Goals Card provides savings progress.

## Card Contents

Each active goal displays:

- Goal Name.
- Progress Percentage.
- Current Saved Amount.
- Remaining Amount.
- Target Amount.
- Target Date.
- Priority Badge.

---

## Goal Card Rules

- Highest priority goals appear first.
- Completed goals appear below active goals.
- Mobile displays one goal card per row.

---

# Liabilities Card

The Liabilities Card summarizes debt obligations.

## Card Contents

| Metric | Source |
|--------|--------|
| Outstanding Debt | Business Engine |
| Monthly EMI | Business Engine |
| Active Liabilities | Business Engine |
| Debt Burden | Analysis Engine |

---

## Liability Display Rules

Display debt cards grouped by liability.

Each card includes:

- Outstanding Balance.
- EMI Amount.
- Due Day.
- Status.

---

# Budget Card

The Budget Card measures spending against planned limits.

## Card Contents

| Metric | Source |
|--------|--------|
| Budget Allocated | Business Engine |
| Budget Spent | Business Engine |
| Remaining Budget | Business Engine |
| Utilization Percentage | Business Engine |

---

## Budget Display Rules

Display progress indicators for major spending categories.

Highlight overspending visually.

---

# Investments Card

The Investments Card summarizes owned assets.

## Card Contents

| Metric | Source |
|--------|--------|
| Total Investment Value | Business Engine |
| Gold Value | Business Engine |
| Mutual Fund Value | Business Engine |
| Stock Value | Business Engine |
| Appreciation | Business Engine |

---

## Investment Display Rules

Display category totals before individual assets.

Show appreciation separately.

---

# Financial Health Card

The Financial Health Card summarizes Analysis Engine outputs.

## Card Contents

| Metric | Source |
|--------|--------|
| Financial Health Score | Analysis Engine |
| Savings Health | Analysis Engine |
| Emergency Health | Analysis Engine |
| Debt Health | Analysis Engine |
| Cash Flow Health | Analysis Engine |

This card becomes the primary financial status area.

---

# Dashboard Interaction Principles

Version 1 interactions remain lightweight.

Supported interactions include:

- Dropdown filters.
- Navigation buttons.
- Hyperlinks to worksheets.
- Scrollable card layout.
- Dynamic updates through formulas.

No VBA or Office Scripts.

---

# Mobile Dashboard Rules

Dashboard is designed mobile-first.

## Mobile Principles

- Vertical scrolling only.
- Full-width cards.
- Large touch targets.
- Minimal horizontal scrolling.
- Readable typography at phone scale.

---

# Immutable Decisions in Part A

The following Dashboard architecture decisions are frozen.

- Dashboard is presentation only.
- Dashboard consumes Business Engine and Analysis Engine outputs.
- Financial Snapshot always appears first.
- Dashboard uses vertically stacked application-style cards.
- Mobile layout is mandatory.
- No business calculations exist inside Dashboard.

---

# Part A Complete

This section freezes the Dashboard architecture, layout hierarchy, primary cards, data ownership, interaction philosophy, and mobile design principles.


---

# Dashboard Filter Architecture (Frozen)

The Dashboard supports lightweight filtering without changing underlying workbook data.

Filters only change the **presentation layer**.

Business Engine calculations remain the source of truth.

---

## Reporting Period Filter

Users can switch the reporting period across the workbook.

### Supported Reporting Views

| Filter | Purpose |
|--------|---------|
| Current Month | Default dashboard view. |
| Previous Month | Month-over-month comparison. |
| Current Financial Year | Annual overview. |
| Previous Financial Year | Annual comparison. |
| Custom Month (Future Ready) | Reserved for future versions. |

The Reporting Period filter affects Dashboard cards and Insights only.

---

## Account Filter

Users may filter Dashboard metrics by account.

### Supported Views

- All Accounts (Default)
- Individual Account
- Cash Accounts
- Bank Accounts
- Wallet Accounts

Filtering changes presentation only.

---

## Goal Filter

Users can focus on specific goals.

### Supported Views

- All Goals
- Active Goals
- Completed Goals
- High Priority Goals

---

## Category Filter

Users can filter spending cards by category.

Examples:

- Food & Dining
- Shopping
- Travel
- Utilities
- Entertainment

---

# Quick Actions Section (Frozen)

The Dashboard includes a lightweight Quick Actions section for common workflows.

Quick Actions navigate users to worksheets instead of editing data directly.

---

## Version 1 Quick Actions

| Action | Destination Worksheet |
|--------|------------------------|
| Add Transaction | Transactions |
| Add Goal | Goals |
| Add Asset | Assets |
| Add Liability | Liabilities |
| Add Account | Accounts |
| Add Recurring Commitment | Recurring Commitments |

Quick Actions are implemented using workbook navigation.

---

# Recent Transactions Preview (Frozen)

The Dashboard displays a preview of the most recent completed transactions.

---

## Preview Rules

Display the latest completed transactions only.

### Preview Fields

| Field | Source |
|-------|--------|
| Date | Transactions |
| Category | Transactions |
| Destination | Transactions |
| Amount | Transactions |
| Account | Transactions |

---

## Preview Rules

- Maximum 5 recent transactions on Dashboard.
- Sorted by Transaction Date (newest first).
- Cancelled transactions excluded.
- Pending transactions excluded.

Users navigate to Transactions for the full history.

---

# Insights Preview (Frozen)

The Dashboard displays a preview of the highest-priority financial insights.

---

## Preview Fields

| Field | Source |
|-------|--------|
| Severity Badge | Analysis Engine |
| Insight Title | Insights |
| Short Explanation | Insights |
| Category | Insights |

---

## Preview Rules

Display the top five highest-priority active insights.

Priority order:

1. Red
2. Orange
3. Yellow
4. Green

Users navigate to the Insights worksheet for full explanations.

---

# Dashboard Navigation System (Frozen)

The Dashboard is the navigation hub of FinanceOS.

---

## Navigation Destinations

| Dashboard Section | Worksheet |
|-------------------|-----------|
| Snapshot | Business Engine |
| Cash Flow | Transactions |
| Goals | Goals |
| Liabilities | Liabilities |
| Investments | Assets |
| Budget | Categories |
| Insights | Insights |
| Settings | Settings |

Navigation never edits workbook data.

---

# UI Component System (Frozen)

Dashboard uses reusable interface components across the workbook.

---

## Primary Components

### KPI Card

Displays one primary financial metric.

Examples:

- Net Worth
- Total Cash
- Monthly Savings

### Progress Card

Displays progress toward a measurable goal.

Examples:

- Goal Completion
- Budget Utilization
- Emergency Fund Progress

### Summary Card

Displays grouped financial information.

Examples:

- Asset Allocation
- Debt Distribution
- Spending Breakdown

### Insight Card

Displays deterministic financial explanations.

Examples:

- Savings improving.
- Cash runway declining.
- Goal delayed.

---

# Badge System (Frozen)

Badges provide compact status indicators.

---

## Badge Types

| Badge | Meaning |
|-------|---------|
| Active | Currently active. |
| Completed | Finished. |
| Paused | Temporarily inactive. |
| Healthy | Positive financial condition. |
| Warning | Needs monitoring. |
| Critical | Immediate attention recommended. |

Badges remain consistent across the workbook.

---

# Progress Indicator System (Frozen)

Progress indicators appear throughout FinanceOS.

---

## Supported Progress Types

| Progress Type | Used In |
|--------------|---------|
| Goal Progress | Goals Card |
| Budget Progress | Budget Card |
| Savings Progress | Emergency Fund |
| Investment Allocation | Investment Card |
| Debt Payoff Progress | Liability Card |

Version 1 uses Excel conditional formatting to render progress indicators.

---

# Color System (Frozen)

Dashboard colors communicate financial meaning.

---

## Semantic Colors

| Color Meaning | Usage |
|---------------|-------|
| Green | Healthy, positive progress. |
| Yellow | Monitor. |
| Orange | Action recommended. |
| Red | Financial risk. |
| Blue | Informational metrics. |
| Gray | Secondary information. |

Colors are semantic, not decorative.

---

# Typography & Spacing Rules (Frozen)

Dashboard typography should prioritize readability.

---

## Typography Principles

- Large KPI numbers.
- Medium section titles.
- Smaller supporting labels.
- Consistent spacing between cards.

---

## Spacing Principles

- Cards separated by consistent vertical spacing.
- Internal padding consistent across all cards.
- Touch-friendly spacing for mobile devices.

---

# Mobile Layout Architecture (Frozen)

Dashboard follows a single-column responsive layout.

---

## Mobile Card Order

1. Snapshot
2. Cash Flow
3. Financial Health
4. Goals
5. Liabilities
6. Budget
7. Investments
8. Recent Transactions
9. Insights

Priority order is frozen.

---

## Mobile Design Rules

- Full-width cards.
- Large dropdowns.
- Large buttons.
- No horizontal scrolling.
- High contrast progress indicators.

---

# Dashboard → Web Application Mapping (Frozen)

Dashboard architecture is designed to migrate directly into the FinanceOS web application.

---

## Module Mapping

| Excel Dashboard | Future Web Dashboard |
|-----------------|----------------------|
| Snapshot Cards | Home Dashboard KPIs |
| Cash Flow Card | Cash Flow Widget |
| Goals Card | Goals Widget |
| Liability Card | Debt Widget |
| Budget Card | Budget Widget |
| Investments Card | Portfolio Widget |
| Health Card | Health Widget |
| Insights Preview | AI Insights Feed |

UI hierarchy remains identical across platforms.

---

# Dashboard → Mobile Application Mapping (Frozen)

Mobile application follows the Dashboard card architecture.

---

## Mobile Sections

| Excel Section | Mobile Screen |
|--------------|---------------|
| Dashboard | Home |
| Goals | Goals Screen |
| Cash Flow | Cash Flow Screen |
| Investments | Portfolio Screen |
| Liabilities | Debt Screen |
| Insights | Insights Feed |

The Excel dashboard becomes the prototype for the mobile app.

---

# Dashboard → Admin Panel Relationship (Frozen)

The Admin Panel is **not** part of the Excel workbook.

It is a separate web application.

---

## Admin Panel Responsibilities

The Admin Panel manages:

- Users.
- Authentication.
- Subscription plans.
- AI email automation.
- Notifications.
- Workbook generation status.
- Analytics.
- Support tickets.

The Dashboard remains the end-user financial interface.

This separation is immutable.

---

# Cursor Implementation Rules (Dashboard)

Cursor must:

- Build Dashboard from reusable cards.
- Read Business Engine outputs only.
- Read Analysis Engine outputs only.
- Preserve card order.
- Preserve mobile-first layout.
- Preserve semantic color usage.
- Never place business calculations inside Dashboard.

---

# Dashboard Protection Rules

The Dashboard is partially protected.

### Editable

- Reporting filters.
- Navigation controls.
- Interactive dropdowns.

### Protected

- KPI formulas.
- Summary cards.
- Health metrics.
- Progress calculations.
- Insight previews.

Users cannot accidentally modify dashboard formulas.

---

# Dashboard Immutable Rules Matrix

| Rule Category | Immutable Decision |
|---------------|--------------------|
| Dashboard Role | Presentation only. |
| Calculations | Owned by Business Engine. |
| Analysis | Owned by Analysis Engine. |
| Navigation | Dashboard is workbook home. |
| Mobile Layout | Mandatory. |
| Quick Actions | Navigate only. |
| Recent Transactions | Preview only. |
| Insights Preview | Preview only. |
| Admin Panel | Separate web application. |

---

# Version 1 Dashboard Freeze

The following Dashboard decisions are permanently frozen.

### User Experience

- Dashboard is application-first.
- Spreadsheet appearance should be minimized.
- Cards are the primary UI component.

### Navigation

- Dashboard is the workbook entry point.
- Quick Actions navigate to user worksheets.

### Compatibility

- Desktop, Web, Android, iPhone, and iPad supported.
- No VBA.
- No Office Scripts.
- No desktop-only UI components.

### Migration Readiness

- Dashboard structure maps directly to the future React web application.
- Mobile app preserves Dashboard hierarchy.
- Admin Panel remains a separate product sharing the same Business Engine concepts.

---

# Version History

## Version 1.0 — Initial Freeze

The complete Dashboard Architecture for FinanceOS Version 1 has been frozen.

This document defines layout hierarchy, filters, navigation, reusable UI components, mobile architecture, semantic design system, and migration mapping for the future web application and admin panel.

---

**End of Document — DOC-012 Dashboard Architecture Version 1.0**