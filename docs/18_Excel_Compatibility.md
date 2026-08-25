# FinanceOS — Excel Compatibility Standards

**Document ID:** DOC-018

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

This document defines the official Excel compatibility requirements for FinanceOS Version 1.

FinanceOS is designed as an **Excel-first financial operating system** that must work consistently across all supported Microsoft Excel platforms.

This document freezes:

- Supported Excel platforms.
- Approved Excel features.
- Forbidden Excel features.
- Formula compatibility rules.
- Table behavior.
- Mobile compatibility.
- Performance expectations.
- Cursor implementation restrictions.

---

# Compatibility Philosophy

FinanceOS must behave as **one product** regardless of where it is opened.

The workbook should provide the same financial calculations, navigation, validations, and dashboard experience on desktop, web, and mobile.

Platform-specific behavior is not allowed unless explicitly documented.

---

# Officially Supported Platforms (Frozen)

FinanceOS Version 1 officially supports the following Microsoft Excel environments.

| Platform | Support Status |
|----------|----------------|
| Excel Desktop — Windows | Full Support |
| Excel Desktop — macOS | Full Support |
| Excel for Web | Full Support |
| Excel Android | Full Support |
| Excel iPhone / iPad | Full Support |

These five environments are mandatory targets.

---

# Platform Compatibility Matrix (Frozen)

| Feature | Windows | Mac | Web | Android | iPhone/iPad |
|--------|---------|-----|-----|---------|-------------|
| Excel Tables | Yes | Yes | Yes | Yes | Yes |
| Structured References | Yes | Yes | Yes | Yes | Yes |
| XLOOKUP | Yes | Yes | Yes | Yes | Yes |
| FILTER | Yes | Yes | Yes | Yes | Yes |
| UNIQUE | Yes | Yes | Yes | Yes | Yes |
| SORT | Yes | Yes | Yes | Yes | Yes |
| LET | Yes | Yes | Yes | Yes | Yes |
| Data Validation | Yes | Yes | Yes | Yes | Yes |
| Conditional Formatting | Yes | Yes | Partial | Partial | Partial |
| Named Ranges | Yes | Yes | Yes | Yes | Yes |

FinanceOS uses only cross-platform supported functionality.

---

# Approved Excel Features (Frozen)

The following Excel features are approved for FinanceOS Version 1.

## Data Structures

- Excel Tables.
- Structured References.
- Named Ranges.
- Dynamic Arrays.
- Data Validation Lists.
- Conditional Formatting.
- Cell Protection.
- Sheet Protection.

These features are part of the workbook architecture.

---

## Approved Formula Families

### Lookup

- XLOOKUP

### Logical

- IF
- IFERROR
- AND
- OR
- NOT

### Dynamic Arrays

- FILTER
- UNIQUE
- SORT
- SEQUENCE

### Aggregation

- SUM
- SUMIFS
- COUNTIFS
- AVERAGEIFS
- MAXIFS
- MINIFS

### Date

- TODAY
- YEAR
- MONTH
- DAY
- EDATE
- EOMONTH

### Text

- TEXT
- TEXTJOIN
- CONCAT
- LEFT
- RIGHT
- MID

### Organization

- LET

These functions are approved across every FinanceOS worksheet.

---

# Forbidden Excel Features (Frozen)

FinanceOS intentionally avoids features that reduce compatibility.

## Automation Features

The following are prohibited.

- VBA Macros.
- Office Scripts.
- Power Automate workbook logic.
- ActiveX Controls.
- COM Add-ins.

Version 1 contains no executable automation.

---

## Formula Restrictions

Avoid using:

- OFFSET for dynamic ranges.
- INDIRECT for validation architecture.
- CELL for workbook logic.
- INFO for workbook behavior.
- NOW for financial calculations.
- RAND and RANDBETWEEN for deterministic calculations.

FinanceOS prioritizes deterministic outputs.

---

## UI Restrictions

Do not depend on:

- Floating controls.
- Desktop-only form controls.
- ActiveX buttons.
- Macro buttons.
- Custom task panes.

Excel Web and Mobile compatibility takes priority.

---

# Excel Table Standards (Frozen)

Excel Tables are mandatory for every business entity.

## Table Rules

- One table per worksheet entity.
- Structured references only.
- Automatic expansion enabled.
- Header row required.
- Totals row optional.
- Blank rows outside table.

Tables are the workbook's primary data structure.

---

# Structured Reference Standards (Frozen)

Every calculation references table columns.

## Approved Pattern

`tblTransactions[Amount]`

## Forbidden Pattern

`Transactions!H:H`

Structured references expand automatically with new records.

---

# Dynamic Array Compatibility Rules

Dynamic arrays are allowed only when supported across all target platforms.

## Approved Usage

- Validation outputs.
- Lookup outputs.
- Dashboard preview lists.
- Helper worksheet calculations.

## Restrictions

Do not build workbook navigation around spill ranges.

Keep spill outputs inside Helpers whenever possible.

---

# Data Validation Standards (Frozen)

FinanceOS uses centralized validation powered by Helpers.

## Validation Types

| Validation | Supported |
|-----------|-----------|
| Dropdown Lists | Yes |
| Date Validation | Yes |
| Whole Number Validation | Yes |
| Decimal Validation | Yes |
| Custom Formula Validation | Limited |
| Dependent Dropdowns | Yes |

Dependent dropdowns must remain mobile compatible.

---

# Conditional Formatting Standards (Frozen)

Conditional formatting communicates financial meaning only.

## Approved Uses

- Goal progress.
- Spending analysis.
- Debt warning.
- Health indicators.
- Runway status.
- Overspending alerts.

Formatting never changes workbook calculations.

---

## Compatibility Rules

If conditional formatting is unsupported on a platform, calculations must remain readable without it.

Colors supplement labels.

---

# Worksheet Protection Standards (Frozen)

Protection must work consistently across platforms.

## Protected Worksheets

- Helpers.
- Business Engine.
- Analysis Engine.

## Partially Protected Worksheets

- Dashboard.
- Transactions.
- Goals.
- Accounts.
- Assets.
- Liabilities.
- Categories.
- Income Sources.
- Settings.

Users edit only designated cells.

---

# Mobile Compatibility Standards (Frozen)

FinanceOS is mobile-first.

## Mobile Requirements

- Vertical scrolling preferred.
- Large dropdown targets.
- Large row heights.
- Minimal horizontal scrolling.
- Readable KPI cards.
- Goal cards stack vertically.

Every user-facing worksheet follows these rules.

---

# Excel Web Compatibility Standards (Frozen)

Excel Web must behave identically to Desktop for supported features.

## Requirements

- Dynamic arrays supported.
- Tables editable.
- Data validation functional.
- Named ranges functional.
- Dashboard readable.
- Protection respected.

No web-specific formulas are allowed.

---

# Performance Standards (Frozen)

The workbook should remain responsive with realistic financial datasets.

## Target Capacity

| Entity | Target Capacity |
|--------|-----------------|
| Transactions | 50,000+ |
| Accounts | 100+ |
| Assets | 500+ |
| Liabilities | 200+ |
| Goals | 200+ |
| Commitments | 500+ |

Performance optimization is mandatory.

---

## Performance Rules

- Use structured references.
- Reuse Business Engine outputs.
- Avoid duplicate lookups.
- Avoid volatile functions.
- Centralize validation outputs.
- Keep calculations deterministic.

---

# Offline Compatibility Standards (Frozen)

FinanceOS must function without internet connectivity.

## Offline Features

- Transactions.
- Dashboard.
- Goals.
- Assets.
- Liabilities.
- Analysis Engine.
- Insights.
- Validation.
- Conditional formatting.

Internet is not required for Version 1 calculations.

---

# File Sharing Standards (Frozen)

The workbook must remain portable between users.

## Sharing Requirements

- No external workbook links.
- No external data sources.
- No Power Query dependencies.
- No cloud-only formulas.
- No connector dependencies.

The workbook is completely self-contained.

---

# Workbook Version Compatibility

FinanceOS Version 1 is designed for modern Microsoft 365 Excel.

## Supported Version Family

- Microsoft Excel 365.
- Microsoft Excel Web.
- Microsoft Excel Mobile.

Older perpetual Excel versions are not guaranteed.

---

# Cursor Excel Implementation Rules

Cursor must:

- Use Excel Tables for every entity.
- Use structured references everywhere.
- Use named ranges from Helpers.
- Use only approved Excel functions.
- Never generate VBA.
- Never generate Office Scripts.
- Never generate ActiveX controls.
- Preserve cross-platform compatibility.

Compatibility is a hard requirement.

---

# Migration Readiness Standards (Frozen)

The Excel workbook is the canonical implementation for future platforms.

| Excel Feature | Future Platform Mapping |
|--------------|-------------------------|
| Tables | Database Tables |
| Named Ranges | API Models |
| Business Engine | Backend Calculation Service |
| Analysis Engine | Analytics Service |
| Dashboard | React Dashboard |
| Insights | AI Explanation Layer |

Excel remains the reference implementation.

---

# Immutable Compatibility Decisions

The following compatibility decisions are permanently frozen.

- FinanceOS supports Windows, Mac, Web, Android, and iPhone Excel.
- VBA is prohibited.
- Office Scripts are prohibited.
- ActiveX is prohibited.
- Excel Tables are mandatory.
- Structured references are mandatory.
- Named ranges are mandatory.
- Mobile compatibility is mandatory.
- Offline functionality is mandatory.
- Workbook sharing requires no external dependencies.

---

# Version History

## Version 1.0 — Initial Freeze

The complete Excel Compatibility Standards for FinanceOS Version 1 have been frozen.

This document defines supported platforms, approved Excel features, forbidden features, performance standards, protection rules, mobile compatibility, and migration readiness.

---

**End of Document — DOC-018 Excel Compatibility Standards Version 1.0**