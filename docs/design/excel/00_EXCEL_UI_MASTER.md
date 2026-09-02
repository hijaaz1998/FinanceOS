# FinanceOS — Excel UI Master

**Document ID:** DESIGN-EXCEL-00
**Version:** 1.0
**Status:** Frozen (V1 Excel UI Constitution)
**Owner:** FinanceOS Architecture
**Repository:** FinanceOS
**Folder:** `/docs/design/excel`
**Dependencies:**
- `../00_DESIGN_MASTER.md`
- `../01_DESIGN_SYSTEM.md`
- `../02_COMPONENT_LIBRARY.md`

---

# Purpose

This document is the master reference for the Microsoft Excel implementation of FinanceOS Version 1.

It defines how FinanceOS transforms Microsoft Excel into a premium desktop financial operating system.

This is **not** a worksheet layout document.

Instead, it defines:

- Excel experience philosophy.
- Workbook architecture.
- Navigation model.
- Global Excel UI rules.
- Excel implementation governance.
- References to every Excel UI document.

Every Excel-specific document inside `/docs/design/excel/` inherits this file.

---

# Scope

## Included

- Workbook experience.
- Navigation philosophy.
- Sheet architecture.
- Desktop-first behavior.
- Mobile compatibility philosophy.
- UI governance.
- Workbook protection philosophy.
- Excel design inheritance rules.

## Excluded

This document does **not** define:

- Dashboard layout.
- Worksheet layouts.
- Table styling.
- Charts.
- Inputs.
- Conditional formatting.

These belong to dedicated Excel UI documents.

---

# Excel Product Philosophy

FinanceOS is designed to feel like a financial desktop application built inside Excel.

The workbook should never feel like a spreadsheet template downloaded from the internet.

### User Experience Goals

Users should immediately experience:

- A beautiful dashboard.
- Large financial metrics.
- Smooth navigation.
- Minimal spreadsheet interface.
- Clear financial insights.
- Premium visual hierarchy.

Excel becomes the rendering engine — not the user experience.

---

# Workbook Identity

FinanceOS Workbook Identity is frozen for Version 1.

| Area | Decision |
|------|----------|
| Primary Theme | Premium Dark UI |
| Experience | Desktop Application |
| Navigation | Sidebar-style navigation cards |
| Landing Screen | Dashboard |
| Spreadsheet Feel | Hidden as much as possible |
| Design Style | Premium SaaS / Fintech |

Every worksheet must reinforce this identity.

---

# Workbook Architecture

The workbook is divided into three layers.

## Layer 1 — User Experience

Visible worksheets.

Examples:

- Dashboard.
- Transactions.
- Income.
- Expenses.
- Goals.
- Reports.

## Layer 2 — Business Logic

Calculation sheets.

Examples:

- Prediction calculations.
- Financial engine.
- Goal engine.
- PPP calculations.

Hidden from users.

## Layer 3 — System Sheets

Internal workbook infrastructure.

Examples:

- Categories.
- Dropdown values.
- Currency mapping.
- Token tables.
- Helper formulas.

Always hidden.

---

# Workbook Opening Experience

Whenever FinanceOS opens:

1. Dashboard loads.
2. Current month loads.
3. Health Score loads.
4. KPI cards load.
5. Navigation shortcuts become visible.

No raw data should appear first.

---

# Navigation Philosophy

FinanceOS replaces worksheet hunting with guided navigation.

Navigation methods include:

### Primary Navigation

Dashboard shortcut cards.

### Secondary Navigation

Worksheet tabs (for advanced users).

### Context Navigation

Buttons and links between worksheets.

Users should reach any major section within two clicks.

---

# Permanent Worksheet Order

Version 1 worksheet order is frozen.

1. Dashboard
2. Transactions
3. Income
4. Expenses
5. Assets
6. Liabilities
7. Goals
8. Investments
9. Predictions
10. Reports
11. Settings

Hidden sheets appear after visible sheets.

---

# Workbook Environment Rules

FinanceOS modifies Excel's default appearance.

## Gridlines

Hidden on dashboard and experience sheets.

## Headings

Hidden where appropriate.

## Zoom

Optimized for 100–110%.

## Freeze Panes

Applied to long scrolling worksheets.

## Formula Bar

Visible.

FinanceOS supports advanced users without exposing backend complexity.

---

# Excel Experience Standards

Every worksheet follows the same experience hierarchy.

1. Page Header.
2. Summary Section.
3. Primary Cards.
4. Charts.
5. Tables.
6. Insights.
7. Actions.

Users should always understand where they are.

---

# Desktop First Philosophy

FinanceOS Version 1 is optimized for desktop.

Supported resolutions include:

- Laptop.
- Desktop monitor.
- Wide monitor.

Critical information remains visible without excessive scrolling.

---

# Mobile Compatibility Philosophy

Excel Mobile is supported but not redesigned.

Rules include:

- KPI cards stack vertically.
- Tables remain scrollable.
- Charts resize proportionally.
- Navigation remains usable.

Detailed mobile behavior is defined separately.

---

# Workbook Protection Philosophy

Users edit only intended inputs.

Three editable states exist.

| Cell Type | Behavior |
|-----------|----------|
| Editable | User input allowed. |
| Formula | Locked and protected. |
| System | Hidden or protected. |

Protection should improve experience, not restrict ownership.

---

# Cross Platform Consistency

Excel is the design reference for:

- Google Sheets.
- Interactive Website.
- Mobile App.

Every future platform mirrors Excel's visual hierarchy.

Excel remains the source UI.

---

# Excel UI Document Map

This document references the implementation documents below.

| Document | Responsibility |
|----------|----------------|
| `01_DASHBOARD_LAYOUT.md` | Dashboard experience. |
| `02_WORKSHEET_LAYOUTS.md` | Every worksheet layout. |
| `03_TABLE_UI_STANDARDS.md` | Tables, headers, filters, cells. |
| `04_CHART_UI_GUIDELINES.md` | Chart styling. |
| `05_INPUT_COMPONENTS.md` | Inputs, dropdowns, sliders. |
| `06_CONDITIONAL_FORMATTING.md` | Financial state formatting. |
| `07_NAVIGATION_AND_SHEETS.md` | Workbook navigation. |
| `08_MOBILE_EXCEL_GUIDELINES.md` | Excel mobile adaptation. |

This structure keeps Cursor focused on one responsibility at a time.

---

# Cursor Implementation Rules

Cursor must always load this document before implementing any Excel UI.

Rules:

1. Never introduce default Excel styling.
2. Every worksheet follows FinanceOS hierarchy.
3. Shared components come from `02_COMPONENT_LIBRARY.md`.
4. Colors and typography come from `01_DESIGN_SYSTEM.md`.
5. Worksheet-specific layouts come from implementation documents only.

---

# Frozen Excel Decisions (V1)

The following are locked:

- Dashboard-first experience.
- Desktop application look and feel.
- Hidden helper architecture.
- Premium dark-first interface.
- Shared navigation hierarchy.
- Cross-platform visual consistency.

These decisions cannot change during Version 1 implementation.

---

# Version History

## Version 1.0

Initial Excel UI Master document establishing workbook philosophy, architecture, navigation model, implementation governance, and document dependencies for FinanceOS Version 1.

---

**End of Document — `docs/design/excel/00_EXCEL_UI_MASTER.md`**
