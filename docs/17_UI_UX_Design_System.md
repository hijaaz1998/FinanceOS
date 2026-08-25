# FinanceOS — UI/UX Design System

**Document ID:** DOC-017

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

This document defines the complete visual design language of FinanceOS Version 1.

The UI/UX Design System applies to:

- Excel Workbook.
- Excel Desktop.
- Excel Web.
- Excel Android.
- Excel iPhone / iPad.
- Future React Web Application.
- Future Mobile Application.
- Admin Panel.

This document ensures every FinanceOS interface looks and behaves consistently.

---

# Design Philosophy

FinanceOS is designed as a **financial operating system**, not a spreadsheet.

The experience should feel:

- Minimal.
- Modern.
- Premium.
- Calm.
- Highly readable.
- Mobile-first.
- Touch-friendly.

The interface should reduce financial anxiety instead of creating complexity.

---

# Core Design Principles (Frozen)

Every FinanceOS screen follows six principles.

| Principle | Meaning |
|-----------|---------|
| Clarity | Important numbers are immediately visible. |
| Hierarchy | Most important information appears first. |
| Consistency | Every component behaves identically everywhere. |
| Simplicity | No unnecessary UI elements. |
| Accessibility | High readability and touch-friendly layouts. |
| Scalability | Same design language across Excel, Web, and Mobile. |

---

# Design Tokens (Frozen)

The design system is built around reusable tokens instead of hardcoded styling.

## Token Categories

| Token Group | Purpose |
|-------------|---------|
| Color Tokens | Financial semantic colors. |
| Typography Tokens | Text hierarchy. |
| Spacing Tokens | Padding and margins. |
| Radius Tokens | Corner rounding. |
| Shadow Tokens | Card elevation. |
| Icon Tokens | Semantic icon usage. |

Future React implementation should reuse the same token names.

---

# Color System (Frozen)

FinanceOS colors communicate financial meaning.

Decoration never overrides semantics.

---

## Primary Color Palette

| Color Role | Purpose |
|------------|---------|
| Primary Blue | FinanceOS brand color. |
| Success Green | Positive financial state. |
| Warning Yellow | Monitoring required. |
| Action Orange | Action recommended soon. |
| Risk Red | Immediate financial risk. |
| Neutral Gray | Secondary information. |
| Surface White | Primary background. |

These roles remain constant across every platform.

---

## Financial Semantic Colors

| Meaning | Used For |
|---------|----------|
| Green | Savings growth, completed goals, healthy metrics. |
| Yellow | Budget nearing limit, runway warning. |
| Orange | Goal delay, increasing debt burden. |
| Red | Critical runway, overspending, financial risk. |
| Blue | Informational KPIs and navigation. |
| Gray | Labels, inactive elements, helper text. |

Semantic meaning is immutable.

---

# Background System (Frozen)

FinanceOS uses layered surfaces.

| Surface | Purpose |
|---------|---------|
| Background | Workbook page. |
| Surface Card | KPI cards. |
| Secondary Surface | Supporting sections. |
| Elevated Surface | Important widgets. |

Cards should visually separate information without clutter.

---

# Typography System (Frozen)

Typography creates information hierarchy.

---

## Text Hierarchy

| Token | Usage |
|-------|-------|
| Display | Net Worth, Total Cash, Health Score. |
| Heading | Section titles. |
| Subheading | Card titles. |
| Body | Descriptions and explanations. |
| Caption | Supporting labels. |

Numbers always receive the highest visual priority.

---

## Typography Rules

- Large bold KPI values.
- Medium-weight section headings.
- Normal-weight descriptive text.
- Small captions only for secondary information.

No decorative fonts.

---

# Number Formatting Rules (Frozen)

Financial values follow consistent formatting.

| Value Type | Display Rule |
|------------|--------------|
| Currency | Currency format from Settings. |
| Percentage | One decimal place unless specified. |
| Months | One decimal place. |
| Whole Numbers | No unnecessary decimals. |
| Dates | Format from Settings worksheet. |

Formatting is consistent across Dashboard and Insights.

---

# Spacing System (Frozen)

Spacing improves readability.

---

## Spacing Tokens

| Token | Purpose |
|-------|---------|
| XS | Between labels and values. |
| SM | Between rows. |
| MD | Between sections inside cards. |
| LG | Between cards. |
| XL | Between dashboard sections. |

Spacing values remain reusable design tokens.

---

## Layout Rules

- Equal spacing between dashboard cards.
- Consistent padding inside every card.
- Vertical rhythm preferred over dense layouts.

---

# Radius System (Frozen)

Rounded corners create an application-like appearance.

| Radius Token | Usage |
|--------------|-------|
| Small | Inputs and dropdowns. |
| Medium | Cards. |
| Large | Dashboard widgets. |
| Full | Circular progress indicators and badges. |

Radius values remain consistent workbook-wide.

---

# Shadow System (Frozen)

Shadows indicate visual hierarchy.

| Shadow Level | Usage |
|--------------|-------|
| None | Flat worksheet sections. |
| Soft | Standard cards. |
| Medium | Elevated summary widgets. |
| Strong | Modal or future popup components. |

Excel implementation uses subtle visual separation where shadows are unavailable.

---

# Card System (Frozen)

Cards are the primary UI component of FinanceOS.

---

## Card Types

| Card Type | Purpose |
|-----------|---------|
| KPI Card | Single important metric. |
| Summary Card | Grouped financial information. |
| Progress Card | Goal and budget progress. |
| Insight Card | Financial explanations. |
| Action Card | Quick navigation actions. |
| Preview Card | Recent transactions and insights. |

Every card follows consistent spacing and typography.

---

## KPI Card Rules

Displays:

- One primary number.
- Supporting label.
- Optional trend indicator.

Examples:

- Net Worth.
- Total Cash.
- Monthly Savings.

---

## Progress Card Rules

Displays:

- Progress indicator.
- Percentage.
- Remaining amount.
- Target amount.
- Forecast date.

Used by Goals and Budget.

---

## Summary Card Rules

Displays grouped metrics.

Examples:

- Cash Flow.
- Debt Summary.
- Investments.
- Asset Allocation.

---

## Insight Card Rules

Displays:

- Severity badge.
- Headline.
- Explanation.
- Supporting metric.

Insight Cards remain read-only.

---

# Badge System (Frozen)

Badges communicate compact status.

---

## Badge Types

| Badge | Meaning |
|-------|---------|
| Active | Current entity. |
| Completed | Finished entity. |
| Paused | Temporarily inactive. |
| Healthy | Positive financial state. |
| Warning | Needs monitoring. |
| Critical | Financial risk. |
| Priority | Goal priority. |

Badge colors follow semantic color rules.

---

# Progress Indicator System (Frozen)

Progress indicators visualize completion.

---

## Progress Components

| Indicator | Used In |
|-----------|---------|
| Linear Progress | Goal and spending progress. |
| Circular Progress | Goal completion. |
| Ring Progress | Health score and emergency fund. |
| Allocation Bar | Assets and spending distribution. |

Progress values always come from Business Engine outputs.

---

# Button System (Frozen)

Buttons initiate navigation or actions.

---

## Button Types

| Button | Purpose |
|--------|---------|
| Primary | Main action. |
| Secondary | Supporting action. |
| Outline | Navigation. |
| Text | Lightweight action. |

Excel buttons are implemented through navigation elements where possible.

---

# Icon System (Frozen)

Icons improve recognition, not decoration.

---

## Icon Categories

| Category | Example Usage |
|----------|---------------|
| Cash | Cash Flow |
| Wallet | Accounts |
| Target | Goals |
| Home | Dashboard |
| Shield | Emergency Fund |
| Credit Card | Liabilities |
| Trending Up | Investments |
| Alert Triangle | Financial Warning |
| Calendar | Recurring Commitments |
| Pie Chart | Budget |

Icons remain consistent across every FinanceOS platform.

---

# Input Component Rules (Frozen)

Every editable field follows consistent behavior.

---

## Input Types

| Component | Usage |
|-----------|-------|
| Text Field | Names and notes. |
| Currency Field | Amount entry. |
| Dropdown | Validation selections. |
| Date Picker | Dates. |
| Toggle | Yes / No values. |

Touch-friendly sizing is mandatory.

---

# Navigation Component Rules (Frozen)

Navigation remains simple.

---

## Navigation Elements

- Dashboard.
- Quick Actions.
- Worksheet shortcuts.
- Breadcrumb-ready architecture for future web app.

Version 1 avoids complex menus.

---

# Immutable Decisions in Part A

The following UI/UX decisions are frozen.

- FinanceOS is application-first.
- Cards are the primary UI component.
- Semantic colors communicate financial meaning.
- Typography prioritizes numbers.
- Mobile-first spacing is mandatory.
- Icons are semantic, not decorative.
- Progress indicators are reusable components.
- Design tokens will migrate directly to future applications.

---

# Part A Complete

This section freezes the FinanceOS design philosophy, design tokens, color system, typography, spacing, cards, buttons, icons, inputs, and reusable UI components for Version 1.


---

# Dashboard Layout System (Frozen)

The Dashboard is the primary application interface of FinanceOS.

It should feel like a modern personal finance app rather than an Excel worksheet.

The Dashboard is composed entirely of reusable cards arranged in a consistent visual hierarchy.

---

# Dashboard Layout Philosophy

The Dashboard answers the user's most important financial questions within the first screen.

Priority order never changes.

1. Financial Snapshot.
2. Cash Flow.
3. Goals.
4. Liabilities.
5. Investments.
6. Financial Health.
7. Insights Preview.

This order is frozen for Version 1.

---

# Desktop Dashboard Grid (Frozen)

Desktop uses a responsive multi-column card layout.

## Desktop Sections

| Section | Layout |
|--------|--------|
| Financial Snapshot | Large KPI row |
| Cash Flow | Two-column cards |
| Goals | Full-width progress cards |
| Liabilities | Two-column debt summary |
| Investments | Allocation cards |
| Financial Health | Summary cards |
| Insights Preview | Stacked insight cards |

Cards align to a consistent grid.

---

# Mobile Dashboard Layout (Frozen)

Mobile Dashboard is vertical-first.

Every major card occupies nearly the full screen width.

## Mobile Order

1. Snapshot.
2. Cash Flow.
3. Goals.
4. Financial Health.
5. Liabilities.
6. Investments.
7. Insights.

Scrolling is the primary navigation method.

---

# Card Layout Rules

Every dashboard card follows the same structure.

## Card Anatomy

- Card Title.
- Primary Metric.
- Supporting Metrics.
- Trend Indicator.
- Optional Action.
- Footer Caption.

Spacing remains identical across cards.

---

# Financial Snapshot Layout

Snapshot appears at the very top.

## KPI Cards

Display:

- Total Cash.
- Net Worth.
- Monthly Income.
- Monthly Expense.
- Monthly Savings.

Desktop displays KPIs in a row.

Mobile displays KPIs as vertically stacked cards.

---

# Cash Flow Card Layout

Displays:

- Income.
- Expense.
- Savings.
- Surplus.
- Savings Rate.

Include supporting trend indicators beneath each metric.

---

# Goals Card Layout

Each goal is displayed as an independent progress card.

## Goal Card Components

- Goal Name.
- Saved Amount.
- Target Amount.
- Remaining Amount.
- Circular Progress.
- Forecast Completion Month.
- Priority Badge.

Cards stack vertically.

---

# Liabilities Card Layout

Debt information is summarized through expandable cards.

## Liability Card Components

- Liability Name.
- Outstanding Balance.
- EMI Amount.
- Due Day.
- Institution.
- Status Badge.

Highest outstanding liabilities appear first.

---

# Asset Card Layout

Asset cards summarize allocation.

## Asset Card Components

- Total Value.
- Allocation Bar.
- Asset Category.
- Appreciation.
- Current Value.

Allocation percentages use consistent semantic colors.

---

# Financial Health Card Layout

Health Card summarizes overall financial condition.

## Components

- Health Score Ring.
- Savings Health.
- Emergency Health.
- Debt Health.
- Cash Flow Health.
- Goal Health.

Health Score receives the highest emphasis.

---

# Insights Preview Layout

Displays only the highest-priority insights.

## Preview Rules

Maximum five cards.

Each card contains:

- Severity Badge.
- Headline.
- One-line explanation.
- Supporting metric.

Selecting a card opens the Insights worksheet in future applications.

---

# Quick Actions Layout (Frozen)

Quick Actions provide shortcuts to common workflows.

## Version 1 Actions

- Add Transaction.
- Add Goal.
- Add Asset.
- Add Liability.
- Add Income Source.

Desktop places actions beneath Snapshot.

Mobile places actions beneath Snapshot as horizontally scrollable buttons.

---

# Excel Mobile UI Standards (Frozen)

FinanceOS is designed for Excel Android and iPhone.

---

## Mobile Principles

- No horizontal scrolling for dashboard.
- Large touch targets.
- Large dropdown menus.
- Minimal typing required.
- Vertical navigation first.

---

## Touch Target Rules

Interactive elements should remain comfortable for thumb interaction.

Applies to:

- Dropdowns.
- Buttons.
- Goal Cards.
- Insight Cards.
- Filters.

---

## Mobile Table Rules

User-editable tables prioritize:

- Large row height.
- Large dropdowns.
- Currency alignment.
- Sticky headers where supported.

---

# Worksheet Mobile Layout Standards

Every user-facing worksheet follows mobile rules.

## Transactions

Fields appear in logical vertical order.

1. Date.
2. Type.
3. Account.
4. Destination.
5. Amount.
6. Payment Method.
7. Notes.

---

## Accounts

Each account appears as a summary card.

Balance is prominently displayed.

---

## Goals

Goals appear as progress cards.

No horizontal table scrolling required.

---

## Assets

Assets appear as expandable value cards.

---

## Liabilities

Debt cards show EMI and Outstanding Balance first.

---

## Insights

Insights appear as stacked feed cards.

---

# Admin Panel Design Language (Frozen)

The Admin Panel uses the same design tokens as FinanceOS.

It is a separate web application.

---

## Admin Navigation

Primary modules:

- Dashboard.
- Users.
- Workbook Generation.
- Notifications.
- Email Automation.
- Analytics.
- Subscription Plans.
- Support.
- Settings.

Navigation remains left-sidebar on desktop.

Top navigation on mobile.

---

## Admin Dashboard Components

Admin cards summarize platform metrics.

Examples include:

- Total Users.
- Active Workbooks.
- Subscription Revenue.
- Emails Sent.
- Notifications Delivered.

These cards follow FinanceOS KPI design.

---

## Notification Management UI

Admin users manage deterministic notifications.

Notification cards display:

- Category.
- Trigger.
- Severity.
- Delivery Status.
- Last Triggered Time.

---

## Email Automation UI

Displays:

- Weekly Summary Template.
- Monthly Summary Template.
- Goal Progress Template.
- Cash Runway Template.

Templates are preview-only in Version 1.

---

# Responsive Design System (Frozen)

FinanceOS uses one responsive design language.

---

## Breakpoints

| Layout | Purpose |
|--------|---------|
| Mobile | Android / iPhone |
| Tablet | iPad / Android Tablet |
| Desktop | Laptop / Desktop |
| Large Desktop | Wide screens |

Cards reorganize without changing content hierarchy.

---

## Responsive Rules

- KPIs wrap automatically.
- Goal cards stack vertically.
- Tables collapse into cards on mobile.
- Navigation changes layout only.

Business logic never changes.

---

# Accessibility Standards (Frozen)

FinanceOS prioritizes readability.

---

## Accessibility Rules

- High contrast text.
- Semantic colors never communicate meaning alone.
- Icons always have text labels.
- Large touch targets.
- Consistent spacing.
- Readable typography hierarchy.

Accessibility is mandatory.

---

## Color Accessibility Rules

Every financial state includes:

- Color.
- Badge.
- Label.

Examples:

Green + Healthy Badge

Red + Critical Badge

Users should never rely only on color.

---

# Empty State Design (Frozen)

Every screen has a defined empty state.

---

## Examples

### Goals

"No goals created yet."

### Transactions

"No transactions available."

### Assets

"Start tracking your assets."

### Insights

"No financial insights available yet."

Empty states encourage action without overwhelming users.

---

# Loading State Standards (Frozen)

Future web applications use loading placeholders.

Version 1 Excel uses placeholder cards where calculations are unavailable.

Loading visuals never replace actual values.

---

# Error State Standards (Frozen)

User-facing errors remain understandable.

Examples include:

- Invalid transaction.
- Missing required field.
- Invalid dropdown selection.
- Workbook configuration missing.

Error messages explain the issue without exposing formulas.

---

# Animation Philosophy (Frozen)

Excel Version 1 contains no required animations.

Future Web and Mobile applications use subtle motion only.

---

## Approved Future Animations

- Progress ring completion.
- Card fade-in.
- Insight appearance.
- Navigation transitions.
- Success confirmation.

Animation never communicates financial meaning.

---

# Icon Usage Rules (Frozen)

Icons remain consistent across every platform.

One icon represents one financial concept everywhere.

Examples:

- Wallet always means Accounts.
- Target always means Goals.
- Shield always means Emergency Fund.
- Pie Chart always means Budget.

Icons never change meaning between Excel and Web.

---

# Component Reuse Rules

Every reusable UI component should exist once.

Reusable components include:

- KPI Card.
- Goal Card.
- Progress Ring.
- Summary Card.
- Insight Card.
- Badge.
- Allocation Bar.
- Section Header.

Future React implementation should map directly to these components.

---

# UI Migration Mapping (Frozen)

Excel UI components become React components later.

| Excel UI | Future React Component |
|----------|------------------------|
| KPI Card | KPICard |
| Goal Progress Card | GoalCard |
| Health Ring | HealthScoreCard |
| Insight Card | InsightCard |
| Dashboard Section | DashboardSection |
| Allocation Bar | AllocationBar |
| Badge | StatusBadge |

Migration names remain consistent.

---

# Cursor UI Implementation Rules

Cursor must:

- Use the frozen Dashboard hierarchy.
- Reuse design tokens.
- Reuse semantic colors.
- Reuse card layouts.
- Preserve typography hierarchy.
- Preserve mobile-first layouts.
- Never invent additional dashboard sections without approval.

---

# Version 1 Immutable UI Decisions

The following UI decisions are permanently frozen.

### Dashboard

- Snapshot appears first.
- Goals use progress cards.
- Insights use stacked cards.
- Financial Health uses a ring summary.

### Mobile

- Vertical scrolling is primary navigation.
- Cards replace wide tables.
- Large touch targets are mandatory.

### Admin Panel

- Same design tokens as FinanceOS.
- Separate application architecture.
- Sidebar navigation on desktop.

### Accessibility

- Semantic colors plus labels.
- High readability.
- Consistent spacing and typography.

### Migration

- Excel UI maps directly to React components.
- Design tokens migrate unchanged.

---

# Version History

## Version 1.0 — Initial Freeze

The complete UI/UX Design System for FinanceOS Version 1 has been frozen.

This document defines dashboard hierarchy, card layouts, mobile layouts, admin panel design language, responsive behavior, accessibility standards, reusable UI components, and migration mapping.

---

**End of Document — DOC-017 UI/UX Design System Version 1.0**