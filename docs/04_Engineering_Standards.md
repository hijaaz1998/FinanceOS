# FinanceOS — Engineering Standards

**Document ID:** DOC-004

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

This document defines the engineering standards for FinanceOS Version 1.

Every worksheet, Excel table, formula, named range, dashboard component, documentation file, website module, admin dashboard module, and future application must follow these standards.

These standards are considered **frozen** until explicitly revised.

---

# Engineering Philosophy

FinanceOS prioritizes:

- Predictability over cleverness.
- Readability over complexity.
- Maintainability over shortcuts.
- Documentation over assumptions.
- Compatibility over platform-specific features.

Every engineering decision should optimize for long-term maintainability.

---

# Documentation-First Engineering

Every implementation follows this sequence.

1. Documentation is created.
2. Documentation is reviewed.
3. Documentation is frozen.
4. Workbook implementation begins.
5. Validation is completed.
6. Git checkpoint is created.

Implementation must never start before documentation exists.

---

# Single Source Of Truth

Every important object has exactly one owner.

| Object | Source of Truth |
|--------|------------------|
| Architecture | `docs/03_Architecture_Decisions.md` |
| Product philosophy | `docs/02_Product_Philosophy.md` |
| Worksheet responsibilities | `docs/07_Worksheet_Specifications.md` |
| Business rules | `docs/08_Business_Rules.md` |
| Workbook structure | `docs/06_Workbook_Architecture.md` |
| Formula rules | `docs/15_Formula_Standards.md` |

No duplicate ownership.

---

# Module Isolation

Every FinanceOS module should have one responsibility.

Examples include:

- Accounts.
- Transactions.
- Goals.
- Liabilities.
- Investments.
- Dashboard.
- Insights.
- Settings.

Modules communicate through documented relationships.

Modules should not duplicate business logic.

---

# Stable IDs

Every business entity requires a permanent ID.

Examples:

- Account ID.
- Transaction ID.
- Goal ID.
- Liability ID.
- Category ID.
- Income Source ID.

IDs are immutable once created.

Never regenerate IDs.

Never reuse deleted IDs.

---

# Worksheet Responsibilities

Each worksheet owns one primary responsibility.

Worksheets should not become "miscellaneous" pages.

Responsibilities remain documented and frozen.

---

# Excel Table Standards

Every structured dataset should use an Excel Table.

Benefits include:

- Structured references.
- Dynamic expansion.
- Mobile compatibility.
- Safer formulas.
- Cleaner validation.

No major dataset should exist as loose ranges.

---

# Column Standards

Every table follows consistent ordering.

Preferred order:

1. Stable ID.
2. Primary Name.
3. Category.
4. Status.
5. Dates.
6. Amounts.
7. Relationships.
8. Notes.
9. Metadata.

IDs always appear first.

---

# Required vs Optional Fields

Every field must be classified.

Required fields cannot be empty.

Optional fields never break formulas.

Validation rules enforce required fields.

---

# Formula Standards

Every formula should be:

- Deterministic.
- Readable.
- Compatible.
- Error-safe.

Use `IFERROR` where appropriate.

Avoid deeply nested formulas when helper calculations improve readability.

Detailed standards are documented separately.

---

# Named Range Standards

Named ranges are used only for:

- Global settings.
- Lookup tables.
- Dashboard references.
- Validation lists.
- Constants.

Never create unnecessary named ranges.

---

# Lookup Standards

All lookup values originate from lookup tables.

Examples:

- Categories.
- Account Types.
- Goal Status.
- Transaction Types.
- Currency Settings.

Hardcoded dropdown values are discouraged.

---

# Validation Standards

Every user input should be validated.

Validation includes:

- Required fields.
- Allowed values.
- Numeric ranges.
- Date ranges.
- Relationship integrity.

Invalid inputs should fail safely.

---

# Error Handling Standards

Errors should never appear as raw Excel errors in the UI.

Prefer:

- Blank states.
- Friendly messages.
- Status indicators.
- Validation warnings.

Users should understand why something failed.

---

# Dashboard Standards

Dashboard components never contain source data.

Dashboards only consume:

- Business Engine outputs.
- Analysis Engine outputs.
- Lookup tables.
- Settings.

Presentation stays separate from storage.

---

# Performance Standards

FinanceOS must remain responsive.

Guidelines include:

- Avoid volatile functions unless necessary.
- Avoid duplicated calculations.
- Reuse helper outputs.
- Avoid unnecessary array recalculations.

Performance matters on mobile devices.

---

# Compatibility Standards

Version 1 supports:

- Excel Desktop (Windows)
- Excel Desktop (Mac)
- Excel Web
- Excel Android
- Excel iPhone / iPad

Every engineering decision should preserve compatibility.

---

# Forbidden Engineering Features

Do not use:

- VBA.
- Macros.
- Office Scripts.
- Power Query.
- Power Pivot.
- External APIs.
- Desktop-only plugins.
- COM Add-ins.

Unless future versions explicitly approve them.

---

# Design Standards

FinanceOS should feel like software.

Guidelines include:

- Card layouts.
- Consistent spacing.
- Large touch targets.
- Accessible colors.
- Minimal spreadsheet appearance.

Design consistency is mandatory.

---

# Documentation Standards

Every documentation file contains:

- Version.
- Status.
- Owner.
- Repository.
- Last Updated.
- Purpose.
- Frozen sections where applicable.
- Version History.

Every major document follows the same structure.

---

# Git Standards

Git checkpoints represent meaningful progress.

Commit after:

- One completed document.
- One worksheet implementation.
- One dashboard milestone.
- One feature milestone.
- One validation milestone.

Avoid giant commits.

---

# Change Approval Standards

Cursor must ask before:

- Changing architecture.
- Renaming worksheets.
- Changing business logic.
- Modifying calculations.
- Adding new entities.
- Deleting existing structures.

Implementation waits for approval.

---

# Testing Standards

Every completed implementation should verify:

- Formula correctness.
- Validation correctness.
- Table integrity.
- Lookup integrity.
- Mobile compatibility.
- Dashboard outputs.

Testing is part of implementation.

---

# Future Migration Standards

Excel architecture should remain portable.

Future implementations in React, TypeScript, mobile, and backend should reuse:

- Entity names.
- IDs.
- Business rules.
- Module boundaries.
- Documentation structure.

Migration should reuse architecture rather than redesign it.

---

# Immutable Engineering Standards

The following standards are frozen.

- Documentation-first engineering.
- Stable IDs.
- Single source of truth.
- Excel Tables for structured datasets.
- Separate business and presentation layers.
- Compatibility across Desktop, Web, and Mobile.
- Git checkpoint workflow.
- Approval before architectural changes.

---

# Version History

## Version 1.0

Initial Engineering Standards created and frozen.