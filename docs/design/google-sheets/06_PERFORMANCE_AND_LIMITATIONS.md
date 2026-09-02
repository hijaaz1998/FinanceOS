# FinanceOS — Performance, Protection & Platform Limitations (Google Sheets)

**Document ID:** DESIGN-GSHEETS-06

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Performance, Protection & Platform Limitations Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/google-sheets`

**Dependencies:**
- `00_GSHEETS_MASTER.md`
- `01_GSHEETS_UI_MAPPING.md`
- `02_DYNAMIC_TABLES_AND_VALIDATION.md`
- `03_CHARTS_AND_DASHBOARD_MAPPING.md`
- `04_FORMULA_COMPATIBILITY.md`
- `05_EXPORT_AND_SYNC_ARCHITECTURE.md`
- `docs/design/excel/03_TABLE_UI_STANDARDS.md`
- `docs/design/excel/12_EXCEL_IMPLEMENTATION_CHECKLIST.md`

---

# Purpose

This document defines the complete **performance optimization strategy**, **worksheet protection architecture**, **Google Sheets limitations**, **security rules**, and **engineering best practices** for FinanceOS Version 1.

Google Sheets has different technical limitations than Microsoft Excel. FinanceOS must be engineered specifically to remain fast, reliable, secure, and scalable inside Google Sheets.

This document is the **single source of truth** for Cursor when optimizing FinanceOS Google Sheets.

---

# Performance Philosophy

FinanceOS should remain responsive even after years of usage.

### Version 1 Performance Targets

| Target | Goal |
|--------|------|
| Workbook Open Time | Less than 5 seconds |
| Dashboard Refresh | Less than 1 second |
| Transaction Entry | Instant |
| Prediction Update | Less than 2 seconds |
| Report Generation | Less than 3 seconds |

Performance is a product feature.

---

# Performance Architecture

FinanceOS is divided into four performance layers.

| Layer | Responsibility |
|-------|----------------|
| UI Layer | Dashboard, cards, charts. |
| Data Layer | User tables and inputs. |
| Helper Layer | Calculations and mappings. |
| Export Layer | Reports and downloads. |

Only helper sheets perform heavy calculations.

---

# Workbook Size Strategy

FinanceOS is optimized for long-term usage.

## Version 1 Capacity Targets

| Data Type | Target Capacity |
|-----------|-----------------|
| Transactions | 25,000+ |
| Income Records | 10,000+ |
| Expense Records | 25,000+ |
| Goal Records | 1,000+ |
| Investment Records | 5,000+ |
| Assets | 2,000+ |
| Liabilities | 2,000+ |

The workbook should remain usable without manual cleanup.

---

# Dynamic Table Performance Rules

Dynamic tables must avoid excessive formatting.

### Requirements

- One formatting template.
- One totals row.
- Dynamic named ranges.
- Validation inherited automatically.
- No formatting copied manually.

This keeps sheet size small.

---

# Formula Optimization Rules

Cursor must optimize every formula.

## Rules

- Reuse helper calculations.
- Avoid repeated lookups.
- Avoid nested IF chains where unnecessary.
- Prefer lookup tables.
- Use named ranges.
- Use helper columns for repeated calculations.

---

# Heavy Formula Isolation

Heavy calculations must live inside helper sheets.

Examples:

- Health Score.
- Prediction Engine.
- Dashboard KPIs.
- Financial Year mapping.
- PPP calculations.

UI sheets display outputs only.

---

# Dashboard Performance Rules

Dashboard must remain lightweight.

## Rules

- Maximum 4 hero charts.
- Maximum 12 KPI cards.
- Maximum 3 insight cards.
- Maximum 9 navigation cards.

Avoid additional analytics on the home screen.

---

# Chart Performance Rules

Google Sheets charts can become slow.

FinanceOS rules:

- Reuse chart ranges.
- Avoid duplicate charts.
- Avoid full-column chart references.
- Use dynamic named ranges only.

---

# Conditional Formatting Optimization

Conditional formatting is expensive.

### Rules

- Apply only to table ranges.
- Never apply entire column formatting.
- Reuse formatting rules.
- Use helper columns for complex logic.

---

# Named Range Optimization

Named ranges improve maintainability.

### Rules

- Every lookup uses named ranges.
- Charts reference named ranges.
- Validation references named ranges.
- Reports reference named ranges.

No duplicated range definitions.

---

# Hidden Helper Sheet Architecture

Hidden sheets power FinanceOS.

## Helper Sheets

- Categories
- Currency Mapping
- PPP Mapping
- Dashboard Helper
- Prediction Helper
- Reports Helper
- Validation Lists
- Version Control

Users never edit these sheets.

---

# Protected Range Strategy

Google Sheets supports protected ranges.

FinanceOS protection levels.

## Level 1 — Editable

User inputs only.

Examples:

- Transactions.
- Income.
- Expenses.
- Goals.
- Investments.

---

## Level 2 — Semi-Protected

Settings controlled by dropdowns.

Examples:

- Currency.
- Theme.
- Financial Year.
- PPP Region.

---

## Level 3 — Fully Protected

Internal workbook logic.

Examples:

- Helper formulas.
- Prediction outputs.
- Version metadata.
- Named range tables.

---

# Sheet Visibility Rules

| Sheet Type | Visibility |
|------------|------------|
| User Worksheets | Visible |
| Helper Sheets | Hidden |
| Version Control | Hidden |
| Validation Lists | Hidden |

No helper sheet appears in navigation.

---

# Formula Protection Rules

Formula columns are protected.

Examples:

- Running Balance.
- Net Worth.
- Savings Rate.
- Progress Percentage.
- Financial Health Score.

Users can copy values but cannot overwrite formulas.

---

# Dashboard Protection Rules

Dashboard cells are read-only except interactive controls.

Editable dashboard controls include:

- Month Selector.
- Year Selector.
- Theme Selector.
- Currency Selector.
- Scenario Inputs.

Everything else is protected.

---

# Prediction Engine Protection

Prediction engine contains editable simulation inputs and protected outputs.

Editable:

- Salary.
- Expenses.
- EMI.
- Inflation.
- Savings.

Protected:

- Forecast tables.
- Timeline calculations.
- Recommendation engine.

---

# Report Protection Rules

Reports are read-only.

Users export reports instead of editing them.

---

# Google Sheets Technical Limitations

FinanceOS acknowledges platform limitations.

## Unsupported Behaviors in Version 1

- VBA macros.
- Excel Power Query.
- PivotCharts with identical formatting.
- Dynamic Shapes.
- ActiveX Controls.

Cursor must avoid these features.

---

# Google Sheets Replacement Strategy

| Excel Feature | Google Sheets Strategy |
|--------------|------------------------|
| VBA | Native formulas only |
| Power Query | Helper sheets |
| Form Controls | Dropdowns & Checkboxes |
| Shapes | Drawing Buttons |
| Named Tables | Named Ranges |

This keeps feature parity.

---

# Apps Script Policy (Version 1)

**FinanceOS Version 1 uses zero Apps Script.**

Reason:

- Easier distribution.
- No authorization prompts.
- Better compatibility.
- Lower maintenance.

Apps Script reserved for Version 2.

---

# Mobile Performance Rules

Google Sheets mobile has limited rendering.

Requirements:

- Simplified dashboard.
- Limited visible charts.
- Essential columns first.
- Smaller helper calculations loaded automatically.

---

# Memory Optimization Rules

Avoid excessive workbook memory usage.

### Rules

- Remove unused formatting.
- Avoid merged cells inside tables.
- Limit chart duplication.
- Keep helper sheets compact.

---

# Large Transaction Optimization

Transactions worksheet optimized for long histories.

### Rules

- Dynamic ranges.
- Helper month columns.
- Filter before chart generation.
- Summary tables reference filtered helpers.

---

# Lookup Optimization

Do not perform repeated XLOOKUP calls across thousands of rows.

Strategy:

- Helper lookup columns.
- Cached lookup tables.
- Shared named ranges.

---

# Prediction Engine Optimization

Prediction engine calculations isolated.

Modules calculate independently.

Examples:

- Savings Forecast.
- EMI Forecast.
- Retirement Forecast.

Avoid recalculating unrelated modules.

---

# Chart Helper Optimization

Dedicated helper sheet prepares chart datasets.

Benefits:

- Cleaner dashboard.
- Smaller formulas.
- Faster chart refresh.
- Easier debugging.

---

# Error Recovery Architecture

FinanceOS must recover gracefully.

### Error Types

- Missing Category.
- Invalid Date.
- Deleted Helper Value.
- Empty Dashboard.
- Unsupported Currency.

Users receive friendly guidance instead of spreadsheet errors.

---

# Data Integrity Rules

FinanceOS prevents corruption.

### Rules

- Required validation.
- Protected formulas.
- Hidden helpers.
- Named ranges only.
- Controlled settings.

---

# Backup Recommendations

Users retain ownership of workbook.

Recommended backups:

- Monthly Backup.
- Quarterly Archive.
- Year-End Archive.
- Before Major Updates.

---

# Version Metadata Protection

Version_Control sheet stores:

- Version.
- Build.
- Theme Version.
- Prediction Version.
- Export Version.

Never user editable.

---

# Security Model

FinanceOS security is workbook-level.

### Protect

- Formulas.
- Helper sheets.
- Named ranges.
- Metadata.

### Do Not Protect

- User financial inputs.
- Goals.
- Investments.
- Settings dropdowns.

---

# Sharing Safety Guidelines

Recommended sharing:

- PDF Reports.
- CSV Data.

Avoid sharing editable workbook containing personal finances.

---

# Import Safety Rules

Imported data must pass validation before entering FinanceOS tables.

Invalid rows highlighted.

Protected sheets remain untouched.

---

# Cursor Optimization Checklist

Cursor must:

1. Never use Apps Script in Version 1.
2. Never use VBA-dependent logic.
3. Keep dashboard lightweight.
4. Protect helper sheets.
5. Use named ranges everywhere.
6. Keep formulas inside helper sheets where possible.
7. Preserve mobile compatibility.
8. Preserve export compatibility.

---

# Future Version Placeholders

## Version 2

- Apps Script automation.
- Auto backups.
- Live sync.
- Multi-user collaboration.

## Version 3

- AI categorization.
- SMS parsing.
- Banking integrations.
- Cloud sync.

Version 1 architecture must remain compatible with future upgrades.

---

# Frozen Decisions (Version 1)

The following engineering decisions are locked.

- Zero Apps Script.
- Zero VBA.
- Hidden helper sheet architecture.
- Protected formula columns.
- Protected dashboard outputs.
- Named range architecture.
- Dynamic table optimization.
- Chart helper sheet architecture.
- Workbook-level security model.
- Offline-first performance strategy.

---

# Version History

## Version 1.0

Official FinanceOS Google Sheets performance, protection, and limitation specification defining optimization architecture, protected ranges, helper sheet strategy, platform limitations, security model, memory optimization, dashboard performance, and Cursor engineering rules.

---

**End of Document**

**File:** `docs/design/google-sheets/06_PERFORMANCE_AND_LIMITATIONS.md`
