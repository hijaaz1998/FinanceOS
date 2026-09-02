# FinanceOS — Google Sheets UI Mapping

**Document ID:** DESIGN-GSHEETS-01

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Google Sheets UI Mapping Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/google-sheets`

**Dependencies:**
- `00_GSHEETS_MASTER.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`
- `docs/design/02_COMPONENT_LIBRARY.md`
- `docs/design/excel/00_EXCEL_UI_MASTER.md`
- `docs/design/excel/01_DASHBOARD_LAYOUT.md`
- `docs/design/excel/02_WORKSHEET_LAYOUTS.md`
- `docs/design/excel/06_KPI_INSIGHT_COMPONENTS.md`

---

# Purpose

This document defines how the **FinanceOS Excel UI** is recreated inside **Google Sheets**.

It is **not a redesign**. It maps every visual component from Excel into its Google Sheets equivalent while preserving the same FinanceOS identity.

This document is the **single source of truth** for Google Sheets UI implementation.

---

# Google Sheets UI Philosophy

FinanceOS Google Sheets must feel like a **native FinanceOS application**, not a standard spreadsheet.

### User Experience Goals

- Same layout as Excel.
- Same navigation.
- Same KPI hierarchy.
- Same dashboard structure.
- Same charts.
- Same themes.
- Same premium appearance.

Users should instantly recognize FinanceOS regardless of platform.

---

# UI Mapping Principles

Every Excel component has a Google Sheets equivalent.

| Excel Component | Google Sheets Component |
|----------------|-------------------------|
| KPI Card | Merged Cell KPI Card |
| Dashboard Card | Rounded Card Layout |
| Navigation Card | Hyperlinked Card Button |
| Table | Protected Dynamic Range |
| Chart Card | Embedded Chart Container |
| Progress Ring | Chart + KPI Combination |
| Insight Card | Styled Cell Block |
| Button | Drawing / Image Button |

The component purpose never changes.

---

# Workbook Layout Mapping

Google Sheets mirrors the Excel workbook layout exactly.

## Worksheet Order

1. Dashboard
2. Transactions
3. Income
4. Expenses
5. Assets
6. Liabilities
7. Goals
8. Investments
9. Prediction Engine
10. Reports
11. Settings

No worksheet order changes are allowed.

---

# Dashboard UI Mapping

The Dashboard is recreated one-to-one.

## Dashboard Structure

### Hero Section

- FinanceOS Logo
- Welcome Header
- Current Month
- Financial Health Badge

### KPI Section

Six Hero KPI cards.

### Chart Section

Four Hero Charts.

### Navigation Section

Launcher cards.

### Insight Section

Recommendations.

Layout hierarchy remains identical.

---

# Hero KPI Card Mapping

Google Sheets recreates Excel KPI cards using merged cells and conditional formatting.

Each Hero KPI card contains:

- Icon
- Label
- Large Value
- Delta Indicator
- Subtitle

No spreadsheet gridlines are visible inside cards.

---

# Secondary KPI Card Mapping

Used throughout worksheets.

Examples:

- Income Summary
- Expense Summary
- Goal Summary
- Investment Summary

Smaller version of Hero KPI cards.

---

# Dashboard Grid System

Google Sheets uses a consistent 12-column layout.

## Desktop Layout

- KPI Row
- Chart Grid
- Navigation Grid
- Insight Cards

All cards align to the same spacing system.

---

# Card Container Mapping

Every FinanceOS card follows identical styling.

## Container Rules

- Rounded corners.
- Internal padding.
- Border token.
- Surface background.
- Consistent spacing.

Google Sheets uses merged cells to simulate containers.

---

# Navigation Card Mapping

Dashboard navigation cards become clickable buttons.

Destinations:

- Transactions
- Income
- Expenses
- Assets
- Goals
- Investments
- Predictions
- Reports
- Settings

Cards include icons and descriptions.

---

# Worksheet Header Mapping

Every worksheet header contains:

### Left

- FinanceOS Icon
- Worksheet Name
- Dashboard Shortcut

### Right

- Current Month
- Current Year
- Export Shortcut

Header height remains consistent across worksheets.

---

# Sticky Header Mapping

Google Sheets freezes:

- Header Row.
- Navigation Row (where applicable).

Users always see worksheet context.

---

# Table UI Mapping

Tables inherit FinanceOS table standards.

## Features

- Rounded appearance.
- Zebra rows.
- Sticky headers.
- Dynamic totals row.
- Filter enabled.
- Search supported.

Gridlines hidden in presentation mode.

---

# Editable Cell Mapping

Editable cells use FinanceOS input styling.

Visual indicators:

- Soft background.
- Accent border on selection.
- Required field indicator.
- Input placeholder row.

Users instantly recognize editable areas.

---

# Formula Cell Mapping

Formula cells remain visually distinct.

Rules:

- Muted surface.
- Protected range.
- Value visible.
- Formula hidden where appropriate.

---

# Dropdown Mapping

Google Sheets dropdown chips mirror FinanceOS categories.

Examples:

### Expense Category

- Food
- Rent
- EMI
- Shopping
- Travel

### Account

- HDFC
- SBI
- Cash
- Credit Card

Dropdown colors match FinanceOS semantic tokens.

---

# Search Bar Mapping

Large worksheets include a search component.

Supports searching:

- Merchant
- Category
- Account
- Goal
- Investment

Search appears at the top of worksheet tables.

---

# Filter Mapping

Filters remain visible in every major table.

Supported filters:

- Date
- Category
- Account
- Currency
- Status
- Payment Method

Filter styling matches FinanceOS theme.

---

# KPI Badge Mapping

Metric badges appear inside KPI cards and tables.

Examples:

- Growing
- Stable
- Warning
- High Risk
- Completed

Badges use consistent colors and rounded chips.

---

# Insight Card Mapping

Recommendation cards become styled merged-cell containers.

Structure:

- Icon
- Title
- Recommendation
- Action Footer

Appears beneath charts.

---

# Goal Card Mapping

Goals become vertical FinanceOS cards.

Displays:

- Goal Name
- Target Amount
- Saved Amount
- Progress Bar
- ETA

Cards align inside the Goals worksheet.

---

# Progress Bar Mapping

Google Sheets uses conditional formatting bars.

Supported for:

- Savings Goals
- Budget Usage
- Debt Payoff
- Emergency Fund

Progress colors inherit semantic tokens.

---

# Chart Container Mapping

Charts never float directly on worksheets.

Every chart sits inside a FinanceOS card container.

Container includes:

- Chart Title
- Subtitle
- Chart
- Legend
- Insight Footer

---

# Dashboard Chart Layout Mapping

Dashboard charts remain in identical order.

1. Cash Flow
2. Spending Breakdown
3. Savings Growth
4. Net Worth Growth

No layout changes.

---

# Prediction Module Mapping

Prediction worksheet is divided into FinanceOS cards.

Modules:

- Emergency Runway
- EMI Simulator
- Savings Forecast
- Retirement Forecast
- Scenario Simulator

Each module is visually separated.

---

# Reports UI Mapping

Reports become printable FinanceOS pages.

Sections include:

- Report Header
- KPI Summary
- Charts
- Insights
- Footer

Light Theme is default for exports.

---

# Settings UI Mapping

Settings worksheet is divided into categories.

## Sections

- Currency
- Theme
- Financial Year
- PPP Region
- Export
- About

Each section uses FinanceOS settings cards.

---

# Theme Mapping

Google Sheets supports two themes.

## Light Mode

- White surfaces.
- Navy headers.
- Slate cards.

## Dark Mode

- Charcoal surfaces.
- Dark cards.
- White typography.

Theme switching updates the entire workbook.

---

# Typography Mapping

Google Sheets follows FinanceOS typography hierarchy.

| Component | Typography Level |
|----------|------------------|
| Workbook Title | H1 |
| Worksheet Title | H2 |
| Section Title | H3 |
| KPI Value | Display |
| Body Text | Body |
| Helper Text | Caption |

Never use inconsistent font sizes.

---

# Spacing Mapping

FinanceOS spacing remains identical.

## Standard Units

- Card Padding
- Section Gap
- KPI Gap
- Chart Gap
- Table Gap

Cursor must preserve spacing ratios.

---

# Icon Mapping

Every worksheet uses permanent icons.

| Worksheet | Icon |
|-----------|------|
| Dashboard | Home |
| Transactions | Wallet |
| Income | Arrow Down |
| Expenses | Arrow Up |
| Assets | Shield |
| Liabilities | Credit Card |
| Goals | Target |
| Investments | Trending Up |
| Predictions | Sparkles |
| Reports | File |
| Settings | Gear |

Icons never change across platforms.

---

# Mobile Google Sheets Mapping

Google Sheets mobile uses responsive adaptations.

### Mobile Dashboard

- Swipe KPI cards.
- Vertical charts.
- Navigation chips.
- Sticky action button row.

Tables prioritize essential columns.

---

# Tablet Google Sheets Mapping

Tablet layout mirrors desktop with larger spacing.

Supports landscape-first dashboard.

---

# Accessibility Mapping

Google Sheets preserves FinanceOS accessibility rules.

Requirements:

- High contrast.
- Visible focus cells.
- Color + icon indicators.
- Readable charts.
- Consistent navigation.

---

# Cursor UI Implementation Rules

Cursor must:

1. Build Google Sheets using the Excel layout as the visual reference.
2. Preserve worksheet spacing and hierarchy.
3. Use merged cells only for visual containers.
4. Keep tables fully functional beneath UI styling.
5. Ensure every KPI card and navigation card matches Excel proportions.
6. Never redesign FinanceOS components specifically for Google Sheets.

---

# Frozen Decisions (Version 1)

The following UI decisions are locked.

- Dashboard layout identical to Excel.
- Six Hero KPI cards.
- Four Hero charts.
- Eleven visible worksheets.
- Shared typography hierarchy.
- Shared icon system.
- Shared spacing system.
- Shared theme system.
- Shared navigation architecture.

Google Sheets is visually consistent with Excel while respecting platform limitations.

---

# Version History

## Version 1.0

Official FinanceOS Google Sheets UI mapping specification defining the complete visual translation of Excel UI components into Google Sheets while preserving layout hierarchy, KPI cards, dashboard structure, themes, navigation, charts, typography, spacing, and accessibility.

---

**End of Document**

**File:** `docs/design/google-sheets/01_GSHEETS_UI_MAPPING.md`
