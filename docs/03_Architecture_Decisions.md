# FinanceOS — Architecture Decisions

**Document ID:** DOC-003

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

This document freezes the architectural decisions for FinanceOS Version 1.

These decisions define how the product is organized, how documentation maps to implementation, how the workbook is structured, and how future web and mobile products inherit the same architecture.

Cursor must never modify this document unless explicitly instructed.

---

# Architecture Philosophy

FinanceOS follows a documentation-first engineering architecture.

The architecture is designed so that:

- Documentation defines the system.
- Excel implements the system.
- Future web and mobile products reuse the same logical structure.

The workbook is the implementation of the architecture—not the architecture itself.

---

# Version 1 Platform Decision (Frozen)

FinanceOS Version 1 is built entirely inside Microsoft Excel.

Excel is chosen because it provides:

- Cross-platform availability.
- Offline capability.
- Mobile compatibility.
- Familiar user experience.
- Fast product iteration.

No code is required for Version 1 functionality.

---

# Long-Term Platform Architecture

FinanceOS is intentionally designed to evolve into multiple products.

## FinanceOS Ecosystem

1. Excel Financial Operating System (Version 1)
2. Customer Website
3. Admin Dashboard
4. AI Assistant Layer
5. React Web Platform
6. Native Mobile Applications

Each future platform shares the same business architecture.

---

# Repository Architecture

The repository is organized into independent domains.

## Root Structure

- `docs/` → Product architecture and specifications.
- `workbook/` → Excel implementation.
- `assets/` → Icons, illustrations, branding.
- `design/` → UI system and design references.
- `scripts/` → Engineering automation only.
- `.cursor/` → Cursor rules and skills.

Every folder has one responsibility.

---

# Documentation Is The Source Of Truth

Every implementation begins inside `docs/`.

Documentation freezes:

- Product behavior.
- Business rules.
- Worksheet responsibilities.
- Table definitions.
- Naming conventions.
- Formula standards.

Workbook implementation references documentation.

---

# Separation Of Responsibilities

FinanceOS separates concerns into layers.

## Layer 1 — Documentation

Defines the system.

## Layer 2 — Workbook Structure

Defines worksheets, tables, ranges, and layout.

## Layer 3 — Business Engine

Implements calculations and financial logic.

## Layer 4 — Analysis Engine

Produces metrics, health scores, forecasting, and insights.

## Layer 5 — Presentation Layer

Dashboards, cards, reports, and visual UI.

No layer should directly replace another layer.

---

# Workbook Architecture (Frozen)

The workbook is divided into independent functional modules.

## Primary Modules

Version 1 worksheets are defined by DOC-007 and DOC-016.

- Settings
- Categories
- Accounts
- Income Sources
- Assets
- Liabilities
- Recurring Commitments
- Transactions
- Goals
- Helpers
- Business Engine
- Analysis Engine
- Dashboard
- Insights

Each module owns its own data.

Budgets are not a Version 1 module. Investments are an Asset Category inside `tblAssets`, not a separate worksheet.

---

# Single Source Of Truth Principle

Every business entity has one authoritative table.

Examples:

- Accounts exist once.
- Transactions exist once.
- Goals exist once.
- Assets exist once.
- Liabilities exist once.

Dashboards read data.

They never become data sources.

---

# Data Flow Architecture

FinanceOS follows a one-directional data flow.

Input → Validation → Storage → Business Engine → Analysis Engine → Dashboard

The dashboard never writes data back into storage.

---

# Business Engine Responsibilities

The Business Engine performs deterministic calculations.

Responsibilities include:

- Cash flow.
- Net worth.
- EMI calculations.
- Savings calculations.
- Goal progress.
- Asset summaries.
- Forecast inputs.

No presentation logic belongs here.

---

# Analysis Engine Responsibilities

The Analysis Engine interprets business outputs.

Responsibilities include:

- Financial Health Score.
- Survival Months.
- Savings Momentum.
- Spending Trends.
- Risk Detection.
- Goal Forecasting.
- Future Scenario Predictions.

Analysis explains data.

It does not modify source data.

---

# Dashboard Responsibilities

The dashboard is a presentation layer.

Responsibilities include:

- KPIs.
- Cards.
- Charts.
- Progress Rings.
- Alerts.
- Monthly summaries.
- Financial insights.

Dashboard calculations should reference engines rather than duplicate logic.

---

# AI Insight Architecture

AI-style insights are deterministic in Version 1.

Examples include:

- "You can survive 4 months if income stops today."
- "This EMI reduces monthly savings by ₹8,000."
- "Goal completion is delayed by 3 months."

Insights are generated from documented calculations.

No external AI API is required.

---

# Prediction Architecture

FinanceOS predictions are simulation-based.

Inputs include:

- Income.
- Expenses.
- Savings.
- Goals.
- Liabilities.
- Planned purchases.

Outputs include future financial scenarios.

Predictions always explain assumptions.

---

# Customer Website Architecture

The customer website is a separate product.

Responsibilities include:

- Landing pages.
- Product onboarding.
- Downloads.
- Account authentication.
- Subscription management.
- Knowledge base.
- Future cloud dashboard.

The website never replaces workbook calculations in Version 1.

---

# Admin Dashboard Architecture

The Admin Dashboard is an internal operating platform.

Responsibilities include:

- Customer management.
- Workbook version management.
- License management.
- Email communication.
- Analytics.
- Feature rollout.
- Documentation publishing.

The admin panel is independent from workbook architecture.

---

# Design System Architecture

All interfaces follow one design language.

Shared across:

- Excel workbook.
- Website.
- Admin dashboard.
- Future mobile app.

Shared principles include:

- Cards.
- Status colors.
- Progress indicators.
- Icons.
- Typography hierarchy.
- Consistent spacing.

---

# Naming Architecture

Names remain stable across every platform.

Examples:

- Worksheet names.
- Table names.
- Named ranges.
- Entity IDs.
- Lookup codes.

The same logical names migrate into React and mobile later.

---

# Compatibility Architecture

Every workbook feature must function in:

- Excel Desktop Windows.
- Excel Desktop Mac.
- Excel Web.
- Excel Android.
- Excel iPhone and iPad.

Unsupported features remain forbidden unless future versions explicitly allow them.

---

# Future Migration Architecture

FinanceOS Version 1 prepares for migration by separating:

- Data.
- Logic.
- Analysis.
- Presentation.

This mirrors future software architecture.

Excel implementation should remain portable.

---

# Immutable Architecture Decisions

The following decisions are frozen for Version 1.

- Documentation-first engineering.
- Excel-first implementation.
- Modular workbook architecture.
- One-directional data flow.
- Single source of truth tables.
- Separate Business Engine and Analysis Engine.
- Dashboard as presentation only.
- Customer Website is part of the ecosystem.
- Admin Dashboard is part of the ecosystem.
- Future migration preserves architecture instead of rewriting it.

---

# Version History

## Version 1.0

Initial architecture decisions created and frozen.