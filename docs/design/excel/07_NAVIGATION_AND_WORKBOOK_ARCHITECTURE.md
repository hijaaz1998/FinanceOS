# FinanceOS — Navigation & Workbook Architecture

**Document ID:** DESIGN-EXCEL-07

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Navigation & Workbook Architecture Specification)

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
- `../00_DESIGN_MASTER.md`
- `../01_DESIGN_SYSTEM.md`
- `../02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines the **navigation system and workbook architecture** for FinanceOS Version 1.

FinanceOS is designed to feel like a **desktop financial operating system**, not a collection of Excel sheets. Users should always know where they are, what section they're viewing, and where to go next.

This document is the single source of truth for navigation across:

- Microsoft Excel
- Google Sheets
- FinanceOS Website
- FinanceOS Admin Dashboard
- FinanceOS Mobile App (Future)

---

# Navigation Philosophy

FinanceOS replaces traditional worksheet navigation with **guided navigation**.

### User Experience Goals

A user should never need to:

- Search through worksheet tabs.
- Scroll endlessly to find a section.
- Wonder where calculations happen.
- See helper or backend sheets.

Navigation should feel similar to a SaaS dashboard.

---

# FinanceOS Navigation Hierarchy

The workbook has **three navigation layers**.

## Layer 1 — Primary Navigation

Main product sections.

- Dashboard
- Transactions
- Income
- Expenses
- Assets
- Liabilities
- Goals
- Investments
- Predictions
- Reports
- Settings

---

## Layer 2 — Context Navigation

Navigation inside worksheets.

Examples:

- View Transactions
- Open Prediction Engine
- Open Reports
- Back to Dashboard

Appears inside cards and action buttons.

---

## Layer 3 — System Navigation

Hidden workbook infrastructure.

Examples:

- Categories
- Lookup Tables
- Currency Mapping
- PPP Tables
- Formula Helpers

Users never interact with these sheets.

---

# Official Workbook Sheet Order

This sheet order is frozen for FinanceOS V1.

| Order | Worksheet | User Visible |
|-------|-----------|--------------|
| 01 | Dashboard | ✅ |
| 02 | Transactions | ✅ |
| 03 | Income | ✅ |
| 04 | Expenses | ✅ |
| 05 | Assets | ✅ |
| 06 | Liabilities | ✅ |
| 07 | Goals | ✅ |
| 08 | Investments | ✅ |
| 09 | Prediction Engine | ✅ |
| 10 | Reports | ✅ |
| 11 | Settings | ✅ |

Helper sheets come after all visible worksheets.

---

# Hidden Workbook Sheets

These sheets power FinanceOS.

| Sheet | Purpose |
|-------|---------|
| Categories | Dropdown values. |
| Currency_Map | Currency symbols & exchange rules. |
| PPP_Map | Purchasing Power Parity mapping. |
| Validation | Input validation lists. |
| Prediction_Helper | Prediction calculations. |
| Dashboard_Helper | KPI calculations. |
| Charts_Helper | Dynamic chart ranges. |
| Reports_Helper | Report calculations. |
| Version_Control | Workbook metadata. |

All helper sheets remain hidden and protected.

---

# Workbook Opening Experience

Whenever FinanceOS opens:

1. Dashboard becomes active.
2. Current month loads automatically.
3. KPI cards calculate.
4. Health score refreshes.
5. Prediction cards refresh.
6. Navigation cards become available.

Users never land on raw data sheets.

---

# Dashboard Navigation Cards

Dashboard contains navigation launchers.

## Navigation Grid

| Card | Destination |
|------|-------------|
| Transactions | Transactions Sheet |
| Income | Income Sheet |
| Expenses | Expenses Sheet |
| Assets | Assets Sheet |
| Liabilities | Liabilities Sheet |
| Goals | Goals Sheet |
| Investments | Investments Sheet |
| Predictions | Prediction Engine |
| Reports | Reports Sheet |
| Settings | Settings Sheet |

Cards act like application icons.

---

# Navigation Card Layout

Every navigation card contains:

- Icon.
- Page Name.
- One-line Description.
- Optional Badge.

Example:

**Transactions**

Track every income, expense, and transfer.

---

# Quick Action Navigation

Dashboard includes quick actions.

Examples:

- Add Expense
- Add Income
- Add Investment
- Create Goal
- Run EMI Simulator
- Export Monthly Report

Quick actions reduce clicks.

---

# Worksheet Header Navigation

Every worksheet header contains navigation controls.

### Left

- Back to Dashboard.
- Current Worksheet Icon.
- Worksheet Title.

### Right

- Current Month.
- Search (where applicable).
- Export Button.

---

# Previous / Next Navigation

Every worksheet ends with navigation shortcuts.

### Footer Layout

- Previous Section.
- Dashboard.
- Next Section.

Example:

Expenses → Dashboard → Assets.

Users can navigate sequentially.

---

# Breadcrumb Navigation (Website & Mobile Ready)

Future platforms inherit breadcrumb navigation.

Example:

Dashboard → Investments → Portfolio Details

Excel uses simplified navigation cards instead.

---

# Sticky Navigation Rules

Website and Mobile use sticky navigation.

Excel does not use sticky sidebar.

Instead:

- Frozen header.
- Navigation buttons remain visible near top.

---

# Section Jump Navigation

Large worksheets include section jump cards.

Examples:

### Transactions

- Add Transaction
- Monthly Summary
- Transaction History

### Investments

- Holdings
- Allocation
- Monthly Investments

### Reports

- Monthly Report
- Annual Report
- Export Center

---

# Dashboard Floating Shortcuts (Future Website)

Reserved for Website version.

Floating actions:

- Add Transaction.
- Add Goal.
- Prediction Simulator.
- Download Report.

Not used in Excel.

---

# Search Navigation

Search exists in large worksheets.

Supports navigation to:

- Merchant
- Account
- Goal
- Investment
- Loan
- Transaction

Future Website uses global search.

---

# Global Workbook Search (Future)

Future FinanceOS Web supports searching:

- Transactions.
- Goals.
- Investments.
- Reports.
- Customers (Admin).
- Orders (Admin).

Excel version uses worksheet-level search.

---

# Workbook Tab Visibility Rules

Visible tabs are simplified.

Rules:

- Hide helper tabs.
- Keep user tabs grouped.
- No blank worksheets.
- No temporary worksheets.

Workbook feels curated.

---

# Sheet Naming Standards

Sheet names remain user friendly.

Never use technical names.

### Approved Names

- Dashboard
- Transactions
- Income
- Expenses
- Assets
- Liabilities
- Goals
- Investments
- Predictions
- Reports
- Settings

Backend names remain hidden.

---

# Navigation Icons

Each worksheet has a permanent icon.

| Worksheet | Icon Purpose |
|-----------|--------------|
| Dashboard | Home |
| Transactions | Wallet |
| Income | Arrow Down |
| Expenses | Arrow Up |
| Assets | Shield/Bank |
| Liabilities | Credit Card |
| Goals | Target |
| Investments | Trending Up |
| Predictions | Sparkles |
| Reports | File |
| Settings | Gear |

Icons remain consistent across every platform.

---

# Notification Badges

Navigation cards may contain badges.

Examples:

- New Recommendation.
- Goal Completed.
- Budget Warning.
- Prediction Alert.
- Update Available.

Badges never exceed one per card.

---

# Status Indicators

Navigation can communicate health.

Examples:

- Green Dot → Healthy.
- Yellow Dot → Needs Review.
- Red Dot → Action Required.

Dashboard updates these automatically.

---

# Settings Navigation Groups

Settings are grouped into categories.

### General

- Currency.
- PPP Region.
- Financial Year.

### Personalization

- Theme.
- Dashboard Preferences.
- Categories.

### Export

- Excel Export.
- Google Sheets Export.
- PDF.

### About

- Version.
- Support.
- License.

---

# Reports Navigation Groups

Reports organized into modules.

- Monthly Reports.
- Quarterly Reports.
- Annual Reports.
- Goal Reports.
- Investment Reports.
- Export Center.

---

# Prediction Navigation Groups

Prediction worksheet sections.

- Emergency Runway.
- EMI Simulator.
- Savings Forecast.
- Retirement Projection.
- Scenario Simulator.

---

# Admin Navigation Mapping (Future)

Admin dashboard mirrors workbook hierarchy.

| Admin Section | Purpose |
|--------------|---------|
| Dashboard | Business KPIs |
| Orders | Purchases |
| Customers | Users |
| Downloads | Product Downloads |
| Email Automation | Purchase Emails |
| Meta Ads | Marketing Analytics |
| Reports | Revenue Reports |
| Settings | Platform Settings |

Navigation language stays identical.

---

# Website Navigation Mapping

Landing website navigation.

- Home
- Features
- Dashboard Preview
- Predictions
- Excel + Google Sheets
- Pricing
- FAQ
- Buy FinanceOS

Same terminology as workbook.

---

# Mobile Navigation Mapping

Bottom navigation.

| Tab | Purpose |
|----|---------|
| Home | Dashboard |
| Transactions | Transactions |
| Goals | Goals |
| Insights | Predictions |
| Profile | Settings |

Future app inherits workbook names.

---

# Export Navigation

Export actions always live inside Reports and Settings.

Supported exports:

- Excel
- Google Sheets
- PDF
- CSV

Future cloud sync appears here.

---

# Sync Navigation (Future)

Future synchronization center.

Displays:

- Excel Connected.
- Google Sheets Connected.
- Mobile Connected.
- Last Sync Time.

Reserved for V2.

---

# Accessibility Rules

Navigation supports:

- Keyboard shortcuts.
- Visible focus states.
- High contrast.
- Large clickable areas.
- Screen reader labels (Website/App).

---

# Cursor Implementation Rules

Cursor must:

1. Preserve worksheet order exactly.
2. Hide helper sheets.
3. Dashboard opens first.
4. Navigation cards use shared component library.
5. Worksheet headers always include Dashboard shortcut.
6. Footer navigation exists on every worksheet.
7. Icons remain identical across all FinanceOS platforms.

---

# Frozen Decisions (Version 1)

The following navigation decisions are locked.

- Dashboard-first experience.
- Eleven visible worksheets.
- Hidden helper architecture.
- Navigation launcher cards.
- Previous / Dashboard / Next footer navigation.
- Shared worksheet headers.
- Shared icons across Excel, Sheets, Website, Admin, and Mobile.
- Settings and Reports as standalone modules.

---

# Version History

## Version 1.0

Official FinanceOS navigation architecture defining workbook hierarchy, worksheet order, hidden helper sheets, dashboard navigation cards, section navigation, future website/admin/mobile navigation mapping, accessibility rules, and Cursor implementation standards.

---

**End of Document**

**File:** `docs/design/excel/07_NAVIGATION_AND_WORKBOOK_ARCHITECTURE.md`
