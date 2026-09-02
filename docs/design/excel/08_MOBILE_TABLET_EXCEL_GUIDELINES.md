# FinanceOS — Mobile & Tablet Excel Guidelines

**Document ID:** DESIGN-EXCEL-08

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Mobile & Tablet Compatibility Specification)

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
- `06_KPI_INSIGHT_COMPONENTS.md`
- `07_NAVIGATION_AND_WORKBOOK_ARCHITECTURE.md`
- `../00_DESIGN_MASTER.md`
- `../01_DESIGN_SYSTEM.md`
- `../02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines how **FinanceOS Excel** and **FinanceOS Google Sheets** must behave on **mobile phones** and **tablets**.

It also serves as the design bridge for the future **FinanceOS Mobile App**, ensuring users have a consistent experience across every platform.

This document is the **single source of truth** for responsive spreadsheet behavior.

---

# Design Philosophy

FinanceOS is primarily a desktop financial operating system.

However, users will frequently:

- Open the workbook on their phone.
- Check balances while travelling.
- Add expenses immediately after a purchase.
- Review dashboards on tablets.

The workbook must remain usable without breaking the desktop design.

---

# Mobile Experience Goals

FinanceOS Mobile Excel should allow users to:

- View dashboard KPIs instantly.
- Add transactions in under 30 seconds.
- Check savings goals.
- Review debt status.
- Export reports if needed.

The mobile experience prioritizes **speed over complexity**.

---

# Supported Devices

## Smartphones

- Android Phones
- iPhone

Minimum width support:

- 360px

---

## Tablets

- Android Tablets
- iPad
- Large Foldables

Minimum width support:

- 768px

---

## Desktop Reference

Desktop remains the design reference.

Tablet is an adaptation.

Mobile is a simplified adaptation.

---

# Responsive Design Hierarchy

| Platform | Layout Priority |
|----------|-----------------|
| Desktop | Full Dashboard |
| Tablet | Two-column Dashboard |
| Mobile | Single-column Dashboard |

All platforms share identical branding.

---

# Dashboard Mobile Layout

## Desktop

- Six Hero KPI cards.
- Four Hero Charts.
- Navigation Grid.
- Insights.

## Tablet

- Four KPI cards per view.
- Two charts visible.
- Navigation cards reduced.

## Mobile

- One KPI card per row.
- Swipeable KPI carousel.
- Charts stacked vertically.
- Navigation buttons scroll horizontally.

---

# Mobile KPI Cards

Hero KPI cards become swipeable cards.

Order:

1. Net Worth
2. Monthly Surplus
3. Savings Rate
4. Debt Load
5. Emergency Runway
6. Health Score

Users swipe horizontally.

---

# Mobile Navigation Layout

Navigation becomes icon cards.

Examples:

- Dashboard
- Transactions
- Goals
- Predictions
- Reports

Maximum five primary icons visible.

---

# Mobile Transaction Entry

The transaction sheet becomes a simplified entry form.

## Input Order

1. Date
2. Amount
3. Category
4. Account
5. Payment Method
6. Notes

Everything fits within one screen.

---

# One-Hand Transaction Design

Large tap targets.

Rules:

- Numeric keyboard opens automatically.
- Dropdowns use native mobile pickers.
- Save button remains sticky.

---

# Mobile Table Behavior

Large tables are optimized.

Rules:

- Horizontal scrolling enabled.
- Frozen headers remain visible.
- Only essential columns visible first.

Example Transactions:

Visible first:

- Date
- Amount
- Category
- Account

Secondary columns appear after horizontal scroll.

---

# Tablet Table Behavior

Tablets display:

- More columns.
- Larger charts.
- Two-column KPI layout.

Designed for landscape orientation.

---

# Responsive Column Priority

Every table defines priority.

## Transactions

### Priority 1

- Date
- Amount
- Category
- Account

### Priority 2

- Payment Method
- Merchant
- Notes

### Priority 3

- Internal IDs
- System Columns

---

# Mobile Chart Layout

Charts stack vertically.

Rules:

- One chart per container.
- Larger touch targets.
- Legend below chart.
- Insight footer preserved.

---

# Swipeable Dashboard Sections

Dashboard sections become swipeable.

Examples:

- KPIs
- Charts
- Goals
- Predictions

Desktop remains static.

---

# Mobile Goal Tracker

Goal cards become vertical cards.

Displays:

- Goal Name.
- Progress Ring.
- Saved Amount.
- Remaining Amount.
- ETA.

One goal per card.

---

# Mobile Prediction Engine

Prediction modules become expandable cards.

Examples:

- Emergency Runway.
- EMI Simulator.
- Savings Forecast.
- Retirement Forecast.

Collapsed by default.

---

# Mobile Reports

Reports become downloadable cards.

Examples:

- Monthly Report.
- Annual Report.
- Investment Report.
- Budget Report.

Tap to generate/download.

---

# Mobile Settings Layout

Settings grouped into expandable sections.

- General.
- Currency.
- Dashboard.
- Export.
- About.

Reduces scrolling.

---

# Sticky Action Buttons

Mobile always keeps one primary action visible.

Examples:

- Add Transaction.
- Save Goal.
- Calculate Prediction.
- Export Report.

Button remains fixed at bottom.

---

# Bottom Navigation Mapping (Future App)

| Tab | Destination |
|----|-------------|
| Home | Dashboard |
| Transactions | Transactions |
| Goals | Goals |
| Insights | Predictions |
| Profile | Settings |

Workbook mirrors this terminology.

---

# Tablet Dashboard Layout

Tablet uses two-column layout.

### Left Column

- KPI Cards.
- Goals.

### Right Column

- Charts.
- Insights.

Optimized for iPad landscape.

---

# Responsive Typography Rules

Typography scales by device.

| Device | Scaling |
|--------|---------|
| Desktop | Standard |
| Tablet | Slightly Larger |
| Mobile | Compact Labels + Large Values |

KPI values remain prominent.

---

# Touch Target Standards

Every interactive component follows touch guidelines.

Minimum touch area:

- Buttons.
- Dropdowns.
- Toggles.
- Sliders.

Avoid tiny spreadsheet controls.

---

# Mobile Dropdown Behavior

Dropdowns use native picker behavior.

Examples:

- Category Picker.
- Account Picker.
- Currency Picker.
- Goal Picker.

Search enabled where possible.

---

# Mobile Slider Behavior

Sliders become touch-first.

Examples:

- Savings Slider.
- EMI Slider.
- Income Slider.
- Inflation Slider.

Current value displayed above slider.

---

# Mobile Search Behavior

Search expands full width.

Supports:

- Merchant.
- Account.
- Category.
- Goal.

Clear button always visible.

---

# Mobile Empty States

Every module includes mobile-friendly empty states.

Examples:

> Add your first expense.

> Create your first savings goal.

> Add an investment to unlock predictions.

---

# Mobile Landscape Rules

Landscape enables:

- Two-column KPI cards.
- Wider tables.
- Larger charts.

Portrait remains default.

---

# Google Sheets Mobile Rules

FinanceOS Google Sheets follows identical behavior.

Requirements:

- Frozen headers.
- Dynamic tables.
- Dropdown compatibility.
- Chart readability.

No redesign between Excel and Sheets.

---

# Performance Rules

Mobile workbooks remain lightweight.

Requirements:

- Avoid unnecessary charts on one screen.
- Collapse advanced sections.
- Use dynamic tables instead of huge formatted ranges.

---

# Future Mobile App Mapping

This workbook becomes the blueprint for the FinanceOS app.

| Excel Module | Mobile App Screen |
|--------------|------------------|
| Dashboard | Home |
| Transactions | Transactions |
| Goals | Goals |
| Investments | Investments |
| Predictions | Insights |
| Reports | Reports |
| Settings | Profile |

Names remain identical.

---

# Cursor Implementation Rules

Cursor must:

1. Preserve desktop-first design.
2. Build tablet adaptation.
3. Build mobile adaptation without changing worksheet logic.
4. Keep navigation terminology identical.
5. Prioritize quick transaction entry.
6. Keep KPI hierarchy identical across devices.

---

# Frozen Decisions (Version 1)

The following mobile decisions are locked.

- Desktop-first workbook.
- Tablet two-column adaptation.
- Mobile single-column adaptation.
- Swipeable KPI cards.
- Sticky primary action button.
- Responsive table priorities.
- Shared navigation language across workbook and future app.

---

# Version History

## Version 1.0

Official FinanceOS mobile and tablet specification defining responsive workbook behavior, KPI adaptations, table priorities, touch interactions, dashboard layouts, and the bridge between Excel/Google Sheets and the future FinanceOS mobile application.

---

**End of Document**

**File:** `docs/design/excel/08_MOBILE_TABLET_EXCEL_GUIDELINES.md`
