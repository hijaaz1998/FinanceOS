# FinanceOS — Google Sheets Master Specification

**Document ID:** DESIGN-GSHEETS-00

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Google Sheets Master Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/google-sheets`

**Dependencies:**
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`
- `docs/design/02_COMPONENT_LIBRARY.md`
- `docs/design/excel/00_EXCEL_UI_MASTER.md`
- `docs/design/excel/12_EXCEL_IMPLEMENTATION_CHECKLIST.md`

---

# Purpose

This document defines the complete **Google Sheets design foundation** for FinanceOS Version 1.

FinanceOS is released as **two equal products**:

1. **Microsoft Excel Edition (.xlsx)**
2. **Google Sheets Edition**

Both products must provide **the same user experience, design language, financial logic, prediction engine, and reports**.

The only differences are implementation details required by Google Sheets.

This document is the **master reference** for every Google Sheets-specific document.

---

# FinanceOS Product Architecture

## Version 1 Deliverables

| Platform | Version | Status |
|----------|---------|--------|
| Microsoft Excel | V1 | Primary Build |
| Google Sheets | V1 | Equal Feature Build |
| FinanceOS Website | V1 | Marketing + Checkout |
| Admin Dashboard | V1 | Business Management |

Google Sheets is **not** a simplified version.

It is a fully supported FinanceOS platform.

---

# Google Sheets Philosophy

FinanceOS Google Sheets follows one rule:

> **Everything users can do in Excel, they should also be able to do in Google Sheets whenever technically possible.**

The goal is **feature parity**, not visual parity at the expense of usability.

---

# Design Principles

FinanceOS Google Sheets must:

- Look like FinanceOS Excel.
- Feel like FinanceOS Excel.
- Behave like FinanceOS Excel.
- Export cleanly to Excel.
- Import cleanly from Excel.
- Work on desktop and mobile Google Sheets.

Users should never feel they purchased an inferior version.

---

# Relationship with Excel

Google Sheets inherits approximately **80%** of the Excel design system.

## Inherited Directly

- Design System.
- Color Tokens.
- Typography hierarchy.
- KPI Cards.
- Worksheet layouts.
- Component Library.
- Chart hierarchy.
- Navigation hierarchy.
- Financial logic.
- Prediction architecture.

## Google Sheets Overrides

- Formula syntax differences.
- Conditional formatting rules.
- Dropdown implementation.
- Dynamic tables.
- Protected ranges.
- Mobile behavior.
- Export/synchronization behavior.

Only these overrides are documented in this folder.

---

# Google Sheets Folder Structure

```text
docs/
└── design/
    └── google-sheets/
        ├── 00_GSHEETS_MASTER.md
        ├── 01_GSHEETS_UI_MAPPING.md
        ├── 02_DYNAMIC_TABLES_AND_VALIDATION.md
        ├── 03_CHARTS_AND_DASHBOARD_MAPPING.md
        ├── 04_FORMULA_COMPATIBILITY.md
        ├── 05_EXPORT_AND_SYNC_ARCHITECTURE.md
        ├── 06_PERFORMANCE_AND_LIMITATIONS.md
        └── 07_GSHEETS_IMPLEMENTATION_CHECKLIST.md
```

This structure is frozen for Version 1.

---

# Version 1 Feature Parity Matrix

| Feature | Excel | Google Sheets |
|---------|-------|---------------|
| Dashboard | ✅ | ✅ |
| Dynamic KPI Cards | ✅ | ✅ |
| Dynamic Tables | ✅ | ✅ |
| Income Tracker | ✅ | ✅ |
| Expense Tracker | ✅ | ✅ |
| Asset Tracker | ✅ | ✅ |
| Liability Tracker | ✅ | ✅ |
| Goal Tracker | ✅ | ✅ |
| Investment Tracker | ✅ | ✅ |
| Prediction Engine | ✅ | ✅ |
| Reports | ✅ | ✅ |
| Dark Theme | ✅ | ✅ |
| Light Theme | ✅ | ✅ |
| PPP Currency System | ✅ | ✅ |
| Excel Export | — | ✅ |
| Google Sheets Export | ✅ | — |

Feature parity is mandatory.

---

# Google Sheets User Experience Goals

A Google Sheets customer should be able to:

- Open the workbook instantly.
- Add transactions immediately.
- Use every dropdown.
- View interactive dashboard.
- Generate reports.
- Export to Excel.
- Continue using the workbook without setup.

No manual configuration after purchase.

---

# Workbook Architecture

Google Sheets workbook mirrors Excel worksheet order.

## Visible Worksheets

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

This order is frozen.

---

# Hidden Helper Sheets

Hidden sheets remain identical to Excel.

Examples:

- Categories.
- Currency Mapping.
- PPP Mapping.
- Validation Lists.
- Dashboard Helper.
- Prediction Helper.
- Reports Helper.
- Charts Helper.
- Version Control.

Users never interact with these sheets.

---

# Design Identity Rules

Google Sheets inherits FinanceOS branding.

### Must Match Excel

- Layout spacing.
- Card hierarchy.
- KPI order.
- Icons.
- Colors.
- Charts.
- Tables.
- Navigation names.

### May Adapt

- Borders.
- Shadows.
- Conditional formatting implementation.
- Dropdown styling limitations.

---

# Theme Compatibility

Google Sheets supports both FinanceOS themes.

## Theme Options

- Light Mode.
- Dark Mode.

Theme switching is controlled from the Settings worksheet.

Theme changes affect:

- Dashboard.
- Tables.
- Charts.
- KPI Cards.
- Navigation cards.

---

# Dynamic Workbook Behavior

Google Sheets workbook behaves like a financial application.

Examples:

- KPI cards refresh automatically.
- Charts refresh automatically.
- Prediction engine recalculates automatically.
- Dynamic tables grow automatically.
- Reports update automatically.

No refresh button.

---

# Currency & PPP Architecture

FinanceOS Google Sheets fully supports PPP pricing architecture.

Supported currencies include:

- INR
- USD
- GBP
- EUR
- AED

Future currencies can be added through helper sheets without changing workbook logic.

---

# Excel ⇄ Google Sheets Compatibility Philosophy

FinanceOS maintains **bidirectional compatibility**.

### Excel → Google Sheets

Formatting preserved.

### Google Sheets → Excel

Formatting preserved.

Users can move between platforms without rebuilding the workbook.

---

# Mobile Compatibility Philosophy

Google Sheets must remain usable inside:

- Android Google Sheets.
- iPhone Google Sheets.
- Tablet Google Sheets.

Priority actions:

- Dashboard viewing.
- Expense entry.
- Goal updates.
- Prediction viewing.

---

# Performance Philosophy

Google Sheets has different performance characteristics than Excel.

FinanceOS optimizes for:

- Faster calculations.
- Lightweight formatting.
- Efficient ranges.
- Minimal duplicated formulas.
- Protected helper sheets.

Performance takes priority over decorative formatting.

---

# Security Philosophy

Google Sheets edition is distributed as a **protected template**.

Rules:

- Formula sheets protected.
- Helper sheets hidden.
- User input areas editable.
- Internal mappings locked.
- Workbook structure protected where appropriate.

Users cannot accidentally break FinanceOS.

---

# Export Philosophy

Exports supported in Version 1:

### Excel Export

Preserves:

- Formatting.
- Dropdowns.
- Charts.
- Themes.
- Reports.

### Google Sheets Copy

Users create their own editable copy before using FinanceOS.

---

# Sync Philosophy

Version 1 synchronization is **manual export/import**.

Version 2 introduces cloud synchronization.

Version 1 documents prepare the architecture without implementing cloud sync.

---

# Cursor Implementation Principles

Cursor must treat Google Sheets as an independent implementation using shared FinanceOS architecture.

### Cursor Responsibilities

1. Read Excel design documents first.
2. Apply Google Sheets overrides only where documented.
3. Preserve worksheet hierarchy.
4. Preserve visual hierarchy.
5. Preserve formulas through compatibility mappings.
6. Preserve exports between both platforms.

---

# Documentation Rules

Every Google Sheets document must:

- Reference Excel documentation instead of duplicating it.
- Document only Google Sheets-specific behavior.
- Keep implementation concise.
- Avoid conflicting design instructions.

This keeps the repository maintainable.

---

# Version Boundaries

## Included in Version 1

- Feature parity with Excel.
- Export compatibility.
- Prediction engine.
- Dynamic dashboard.
- Dynamic tables.
- Reports.
- Themes.

## Deferred to Version 2

- Apps Script automation.
- Cloud synchronization.
- Shared live workbook.
- Multi-user collaboration features.

## Deferred to Version 3

- Mobile banking sync.
- AI categorization.
- AI prediction assistant.

---

# Frozen Decisions (Version 1)

The following architecture decisions are locked.

- Google Sheets is an equal product to Excel.
- 11 visible worksheets.
- Shared design system.
- Shared prediction engine.
- Shared PPP currency architecture.
- Shared KPI hierarchy.
- Shared navigation hierarchy.
- Manual Excel ⇄ Google Sheets export.
- Hidden helper sheet architecture.

No Version 2 functionality may enter the Google Sheets V1 build.

---

# Version History

## Version 1.0

Initial master specification establishing Google Sheets as a first-class FinanceOS platform, defining feature parity with Excel, shared architecture, workbook hierarchy, PPP currency support, export philosophy, performance goals, and documentation structure.

---

**End of Document**

**File:** `docs/design/google-sheets/00_GSHEETS_MASTER.md`
