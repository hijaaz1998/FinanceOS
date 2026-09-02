# FinanceOS — Export & Sync Architecture (Excel ↔ Google Sheets)

**Document ID:** DESIGN-GSHEETS-05

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Export & Synchronization Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/google-sheets`

**Dependencies:**
- `00_GSHEETS_MASTER.md`
- `01_GSHEETS_UI_MAPPING.md`
- `02_DYNAMIC_TABLES_AND_VALIDATION.md`
- `03_CHARTS_AND_DASHBOARD_MAPPING.md`
- `04_FORMULA_COMPATIBILITY.md`
- `docs/design/excel/12_EXCEL_IMPLEMENTATION_CHECKLIST.md`

---

# Purpose

This document defines the complete **export architecture**, **synchronization rules**, **version compatibility**, and **user workflow** between Microsoft Excel and Google Sheets for FinanceOS Version 1.

FinanceOS customers purchase **one product** but receive **two workbook formats** that remain compatible throughout Version 1.

This document is the **single source of truth** for Cursor when implementing export and synchronization behavior.

---

# Export Philosophy

FinanceOS is **offline-first**.

Users own their financial data.

There is **no FinanceOS server** storing workbook data in Version 1.

### Core Principles

- User data always remains inside their workbook.
- Excel and Google Sheets remain compatible.
- Export never changes financial calculations.
- Formatting should survive exports whenever possible.
- Protected areas remain protected.

---

# FinanceOS Export Ecosystem

## Supported Export Formats (Version 1)

| Source | Destination | Supported |
|--------|-------------|-----------|
| Excel | Google Sheets | ✅ |
| Google Sheets | Excel | ✅ |
| Excel | PDF | ✅ |
| Google Sheets | PDF | ✅ |
| Excel | CSV | ✅ |
| Google Sheets | CSV | ✅ |

All exports are user initiated.

---

# Version Compatibility Matrix

FinanceOS maintains version compatibility.

| Excel Version | Google Sheets Version | Compatible |
|---------------|-----------------------|------------|
| V1.0 | V1.0 | ✅ |
| V1.1 | V1.1 | ✅ |
| V1.2 | V1.2 | ✅ |
| V2.x | V1.x | ❌ |
| V3.x | V1.x | ❌ |

Only matching major versions are guaranteed compatible.

---

# Workbook Identity

Every FinanceOS workbook contains hidden metadata.

## Version Metadata

Stored inside hidden **Version_Control** sheet.

Contains:

- Workbook Version.
- Build Number.
- Release Date.
- Workbook Platform.
- Theme Version.
- Prediction Engine Version.

Used for compatibility verification.

---

# Export Architecture Overview

FinanceOS export follows four stages.

## Stage 1 — Validate Workbook

Verify:

- Version.
- Required sheets.
- Protected ranges.
- Named ranges.
- Hidden helper sheets.

---

## Stage 2 — Preserve Structure

Preserve:

- Worksheet order.
- Themes.
- Dropdowns.
- Charts.
- Named ranges.
- Protected ranges.

---

## Stage 3 — Export

Generate requested format.

---

## Stage 4 — Verify Output

Ensure exported workbook opens correctly.

---

# Excel → Google Sheets Workflow

### User Flow

1. Open FinanceOS Excel.
2. Select Export.
3. Choose Google Sheets.
4. Upload workbook to Google Drive.
5. Open as Google Sheets.

Workbook remains functional.

---

# Excel → Google Sheets Requirements

Must preserve:

- Worksheet order.
- Table formatting.
- Charts.
- Conditional formatting.
- Named ranges.
- Dropdowns.
- Hidden helper sheets.

Theme compatibility preserved.

---

# Google Sheets → Excel Workflow

### User Flow

1. Open FinanceOS Google Sheets.
2. File → Download → Excel.
3. Workbook downloads.
4. Open in Microsoft Excel.

No additional configuration required.

---

# Google Sheets → Excel Requirements

Must preserve:

- Formulas.
- Charts.
- Tables.
- Themes.
- Validation.
- Protected helper sheets where supported.

---

# Export Center Architecture

FinanceOS includes an Export Center inside Reports and Settings.

### Export Options

- Excel Workbook (.xlsx)
- Google Sheets Copy
- PDF Report
- CSV Transactions
- CSV Investments
- CSV Goals

Future exports added in Version 2.

---

# PDF Export Architecture

PDF exports generate printable reports.

## Included

- Dashboard Summary.
- KPI Cards.
- Cash Flow Chart.
- Spending Chart.
- Goal Summary.
- Investment Summary.
- Financial Health Score.
- Footer.

Always uses Light Theme.

---

# CSV Export Architecture

CSV exports are data-only.

Supported exports:

- Transactions.
- Income.
- Expenses.
- Goals.
- Investments.
- Assets.
- Liabilities.

No charts or formatting.

---

# Google Sheets Copy Workflow

FinanceOS Google Sheets is distributed as a **template**.

### User Flow

1. Open template.
2. Create personal copy.
3. Rename workbook.
4. Begin using FinanceOS.

Master template remains unchanged.

---

# Workbook Ownership Rules

Users always work inside their own copy.

Never edit the master workbook.

Benefits:

- Formula safety.
- Template safety.
- Easy updates.

---

# Hidden Sheet Preservation Rules

Exports must preserve hidden sheets.

Hidden sheets remain:

- Hidden.
- Protected.
- Functional.

Users should not lose helper architecture.

---

# Protected Range Preservation

Protected ranges must remain protected after export whenever platform supports it.

Protected areas:

- Formula columns.
- Helper sheets.
- Dashboard helpers.
- Prediction helpers.
- Version control.

---

# Named Range Preservation

Named ranges are mandatory.

Examples:

- `rngTransactions`
- `rngGoals`
- `rngExpenses`
- `rngSavings`

Exports preserve names.

---

# Dynamic Table Preservation

Tables continue functioning after export.

Requirements:

- Auto-expanding behavior.
- Validation.
- Totals.
- Conditional formatting.

---

# Theme Preservation

Theme metadata transfers.

### Light Mode

Preserved.

### Dark Mode

Preserved where supported.

PDF ignores dark mode.

---

# Currency Preservation

Export preserves:

- Currency symbol.
- Currency formatting.
- PPP region.
- Financial year.

No conversion during export.

---

# PPP Region Metadata

Workbook stores selected PPP region.

Examples:

- India
- USA
- UK
- UAE
- Europe

Exports preserve region.

---

# Financial Year Preservation

Financial year settings transfer.

Supported:

- Calendar Year.
- India Financial Year.

Reports remain consistent.

---

# Chart Preservation Rules

Charts remain embedded after export.

Requirements:

- Titles preserved.
- Colors preserved.
- Dynamic ranges preserved.
- Legends preserved.
- Insight footer preserved.

---

# Dashboard Preservation Rules

Dashboard layout must remain identical after export.

Verify:

- KPI cards.
- Charts.
- Navigation cards.
- Theme.
- Insights.

---

# Prediction Engine Preservation

Prediction engine continues working after export.

Verify:

- Inputs.
- Charts.
- Recommendations.
- Timelines.
- Health score.

---

# Formula Integrity Verification

After export verify:

- No broken references.
- No missing named ranges.
- No circular references.
- No #REF errors.

Workbook must remain functional.

---

# Version Compatibility Warning

If workbook versions differ:

Display warning.

Example:

> This workbook was created using FinanceOS V1.2. Please update your template for full compatibility.

Reserved for future update workflow.

---

# Future Update Architecture (Version 2)

Planned update workflow.

### Update Checker

- Detect workbook version.
- Notify newer version.
- Preserve user data.
- Migrate compatible sheets.

Not implemented in Version 1.

---

# Backup Strategy

FinanceOS encourages backups.

### Recommended Backups

- Monthly workbook backup.
- Quarterly archive.
- Year-end archive.

No automatic cloud backup in Version 1.

---

# Multi-Device Workflow

Users can use FinanceOS across devices.

### Supported Devices

- Windows Excel.
- Mac Excel.
- Google Sheets Desktop.
- Android Google Sheets.
- iPhone Google Sheets.
- Tablet Google Sheets.

Workbook behaves consistently.

---

# Sharing Rules

Version 1 sharing is manual.

### Safe Sharing

- PDF Reports.
- CSV Exports.

### Unsafe Sharing

- Editable workbook with personal financial data.

Users should duplicate workbook before sharing.

---

# Collaboration Rules

Version 1 is designed for **single-user ownership**.

Not supported:

- Live collaborative editing.
- Shared financial editing.
- Multiple simultaneous editors.

Reserved for Version 2.

---

# Security During Export

Exports never expose hidden logic.

Hidden sheets remain hidden.

Formula protection preserved where possible.

No internal IDs exposed in reports.

---

# Import Architecture

FinanceOS accepts imported data.

### Supported Imports

- Bank CSV.
- Transaction CSV.
- Previous FinanceOS CSV.

Imported data flows into FinanceOS tables.

---

# Import Validation Rules

Imported rows receive:

- Validation.
- Formatting.
- Formula propagation.
- Dashboard inclusion.

Invalid rows highlighted.

---

# Export Performance Rules

Cursor must optimize exports.

Requirements:

- Lightweight workbook.
- Preserve formatting.
- Avoid duplicate helper sheets.
- Preserve hidden architecture.

---

# Export QA Checklist

Verify after every export.

### Workbook

- Opens successfully.
- No missing sheets.
- Correct worksheet order.

### Dashboard

- KPI values correct.
- Charts visible.
- Theme correct.

### Tables

- Validation works.
- Dropdowns work.
- Totals work.

### Prediction

- Simulators work.
- Charts update.
- Health score updates.

---

# Cursor Implementation Rules

Cursor must:

1. Preserve workbook identity during export.
2. Preserve hidden helper sheets.
3. Preserve named ranges.
4. Preserve dynamic table behavior.
5. Preserve prediction engine functionality.
6. Preserve dashboard appearance.
7. Verify workbook integrity after export.

---

# Frozen Decisions (Version 1)

The following export decisions are locked.

- Offline-first architecture.
- Bidirectional Excel ↔ Google Sheets compatibility.
- Protected helper sheets preserved.
- Named ranges preserved.
- Dynamic tables preserved.
- Theme metadata preserved.
- PDF uses Light Theme only.
- Single-user workbook ownership.
- Manual backup workflow.

---

# Version History

## Version 1.0

Official FinanceOS export and synchronization specification defining Excel ↔ Google Sheets compatibility, workbook metadata, export workflows, PDF architecture, CSV exports, protected ranges, version compatibility, and QA verification rules.

---

**End of Document**

**File:** `docs/design/google-sheets/05_EXPORT_AND_SYNC_ARCHITECTURE.md`
