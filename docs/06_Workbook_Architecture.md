# FinanceOS — Workbook Architecture

**Document ID:** DOC-006

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

This document defines the architecture of the FinanceOS Excel workbook.

It freezes:

- Workbook layers.
- Worksheet structure.
- Navigation flow.
- Worksheet responsibilities.
- Data ownership.
- Table ownership.
- Cross-sheet communication.

Every worksheet created later must follow this architecture.

Cursor must never redesign this architecture without approval.

---

# Workbook Philosophy

FinanceOS Version 1 is an application built inside Microsoft Excel.

The workbook should feel like software instead of a spreadsheet.

Architecture is designed around four principles:

1. Modular worksheets.
2. Single source of truth.
3. One-directional data flow.
4. Mobile-friendly navigation.

---

# Workbook Layer Architecture

The workbook is divided into four logical layers.

## Layer 1 — Setup Layer

Responsible for onboarding and configuration.

Contains:

- Settings.
- Categories.
- Lookup values (owned by Helpers).
- Configuration tables.

---

## Layer 2 — Data Layer

Responsible for storing financial information.

Contains:

- Accounts.
- Income Sources.
- Transactions.
- Goals.
- Liabilities.
- Recurring Commitments.
- Assets.

No dashboard logic belongs here.

---

## Layer 3 — Engine Layer

Responsible for calculations.

Contains:

- Business Engine.
- Analysis Engine.
- Helpers (validation lists, lookup outputs, named ranges, and intermediate helper outputs only).

Users rarely interact directly with this layer.

---

## Layer 4 — Presentation Layer

Responsible for displaying information.

Contains:

- Dashboard.
- Insights.
- Monthly summaries.
- Reports.
- Visual indicators.

Presentation consumes engine outputs only.

---

# Workbook Navigation Structure

Users move through FinanceOS in a guided order.

| Order | Worksheet Group | Purpose |
|-------|-----------------|---------|
| 1 | Settings | Preferences and configuration |
| 2 | Accounts | Financial resources |
| 3 | Income Sources | Income lookup |
| 4 | Transactions | Daily money movement |
| 5 | Goals | Savings objectives |
| 6 | Liabilities | Debt management |
| 7 | Recurring Commitments | Scheduled obligations |
| 8 | Assets | Wealth tracking |
| 9 | Dashboard | Financial overview |
| 10 | Insights | AI-style explanations |

Navigation follows a financial journey.

---

# Worksheet Groups

## Onboarding Group

Purpose:

Prepare FinanceOS for first use.

Potential worksheets include:

- Settings

---

## Core Finance Group

Primary user interaction.

Contains:

- Accounts
- Income Sources
- Transactions
- Categories
- Goals
- Liabilities
- Recurring Commitments
- Assets

This is where users enter data.

---

## Engine Group

Hidden or protected engineering worksheets.

Examples:

- Helpers
- Business Engine
- Analysis Engine

Users should rarely edit these.

---

## Dashboard Group

Presentation worksheets.

Examples:

- Dashboard
- Insights

Read-only for most users.

---

## Insights Group

AI-style analysis worksheets.

Examples:

- Insights

These consume Business Engine and Analysis Engine outputs.

---

# Primary Worksheets (Frozen)

FinanceOS Version 1 includes these worksheet responsibilities.

| Worksheet | Responsibility |
|-----------|----------------|
| Settings | Global configuration |
| Categories | Category definitions |
| Accounts | Financial accounts |
| Income Sources | Income lookup |
| Assets | Asset and investment-category tracking |
| Liabilities | Debt tracking |
| Recurring Commitments | Scheduled obligations |
| Transactions | Money movement |
| Goals | Savings goals |
| Helpers | Validation lists, lookup outputs, named ranges, and intermediate helper outputs |
| Business Engine | Deterministic financial calculations |
| Analysis Engine | Financial interpretation |
| Dashboard | Financial overview |
| Insights | AI-style financial analysis |

Worksheet names remain frozen after specification.

---

# Single Source Of Truth Worksheets

Every major entity belongs to one worksheet.

| Entity | Owner Worksheet |
|---------|-----------------|
| Accounts | Accounts |
| Income Sources | Income Sources |
| Transactions | Transactions |
| Goals | Goals |
| Liabilities | Liabilities |
| Recurring Commitments | Recurring Commitments |
| Assets | Assets |
| Categories | Categories |

Dashboard never owns entities.

---

# Data Ownership Rules

Only owner worksheets may create or modify entities.

Other worksheets may read data through references.

Example:

Transactions may reference Accounts.

Accounts never duplicate Transactions.

---

# Cross Worksheet Relationships

Relationships use IDs instead of names whenever possible.

Examples include:

- Account ID.
- Category ID.
- Goal ID.
- Liability ID.

Relationships remain stable even if names change.

---

# Lookup Worksheet Architecture

Lookup tables live on the Helpers worksheet.

Helpers own lookup lists, lookup outputs, named ranges, and intermediate helper outputs.

Examples:

- Categories.
- Account Types.
- Goal Status.
- Liability Types.
- Payment Methods.
- Frequency Values.

Every dropdown references lookup tables.

---

# Validation Worksheet Architecture

Validation outputs live on the Helpers worksheet.

Helpers contain:

- Dropdown sources.
- Allowed values.
- Helper validation ranges.
- Status lists.

Users should not edit validation worksheets directly.

---

# Business Engine Worksheets

Business Engine performs deterministic calculations.

Responsibilities include:

- Cash flow summaries.
- Net worth calculations.
- Goal calculations.
- Liability calculations.
- Asset summaries.

Business Engine contains reusable outputs.

---

# Analysis Engine Worksheets

Analysis Engine converts business outputs into insights.

Examples:

- Survival Months.
- Spending Momentum.
- Savings Rate.
- Goal Delay Predictions.
- Financial Health Score.

Analysis worksheets never modify raw data.

---

# Dashboard Architecture

Dashboard is a visual presentation layer.

Dashboard components include:

- KPI cards.
- Charts.
- Progress indicators.
- Alerts.
- Monthly summaries.
- Health score.
- Goal progress.
- Spending summaries.

Dashboard formulas reference Engine worksheets.

---

# Insights Architecture

Insights explain financial reality.

Outputs include:

- Warnings.
- Opportunities.
- Predictions.
- Recommendations based on deterministic rules.
- Trend explanations.

Insights are generated from documented business logic.

---

# Worksheet Protection Strategy

FinanceOS protects engineering integrity.

Protection levels include:

| Worksheet Type | Editable |
|---------------|----------|
| Input worksheets | Yes |
| Settings | Partial |
| Helpers | No |
| Business Engine | No |
| Analysis Engine | No |
| Dashboard | Limited |
| Insights | Read-only |

Protection preserves workbook stability.

---

# Mobile Architecture

Every worksheet must remain usable on phones.

Guidelines include:

- Vertical scrolling.
- Large input fields.
- Minimal horizontal scrolling.
- Card-based layout.
- Touch-friendly controls.

No worksheet should require desktop-only interaction.

---

# Workbook Design Zones

Each worksheet follows a consistent layout.

1. Header.
2. Navigation.
3. Status indicators.
4. Main content.
5. Helper information.
6. Footer/version.

Every worksheet shares the same visual rhythm.

---

# Hidden Engineering Worksheets

Engineering worksheets may be hidden.

Purpose:

- Lookup values (Helpers).
- Intermediate helper outputs (Helpers).
- Validation lists (Helpers).
- Financial calculations (Business Engine).

Hidden sheets remain documented.

---

# Workbook Dependency Flow

Workbook dependency is one-directional.

Settings
↓
Helpers
↓
Input Worksheets
↓
Business Engine
↓
Analysis Engine
↓
Dashboard / Insights

Dependencies should never flow backwards.

---

# Workbook Expansion Strategy

Future worksheets must fit existing architecture.

New worksheets require:

1. Documentation update.
2. Worksheet specification.
3. Architecture approval.
4. Git checkpoint.

No miscellaneous worksheets.

---

# Future Migration Readiness

Workbook architecture mirrors future software modules.

| Workbook Layer | Future Software Layer |
|----------------|----------------------|
| Settings | Configuration Service |
| Accounts | Accounts Module |
| Transactions | Transactions Service |
| Business Engine | Business Logic Layer |
| Analysis Engine | AI / Analytics Layer |
| Dashboard | Frontend UI |
| Insights | AI Experience Layer |

Migration should preserve responsibilities.

---

# Immutable Workbook Architecture Decisions

The following decisions are frozen.

- Four-layer workbook architecture.
- Modular worksheet ownership.
- Single source of truth entities.
- One-directional worksheet dependencies.
- Dashboard as presentation only.
- Separate Business Engine and Analysis Engine.
- Hidden engineering worksheets for helpers.
- Mobile-first worksheet layouts.
- Stable worksheet responsibilities.

---

# Version History

## Version 1.0

Initial Workbook Architecture created and frozen.