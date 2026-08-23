# FinanceOS — Master Index

**Document ID:** DOC-000

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

The Master Index is the entry point to the FinanceOS engineering repository.

It defines the documentation hierarchy, reading order, document ownership, versioning strategy, and dependency map for every engineering document inside the repository.

Every developer, AI agent, or contributor working on FinanceOS must begin here before reading any implementation document.

This document does **not** define product logic or workbook behavior. It only explains how the repository documentation is organized.

---

# FinanceOS Documentation Philosophy

FinanceOS follows a **Documentation-First Engineering** workflow.

Every implementation begins with documentation.

The documentation becomes the permanent source of truth for:

* Product vision.
* Architecture decisions.
* Engineering standards.
* Workbook architecture.
* Business rules.
* Formula standards.
* Excel compatibility.
* Future migration planning.

Implementation must always follow documentation.

---

# Documentation Hierarchy

The documentation is organized into five engineering layers.

| Layer           | Purpose                                              |
| --------------- | ---------------------------------------------------- |
| Foundation      | Defines product vision and philosophy.               |
| Architecture    | Defines immutable architecture decisions.            |
| Engineering     | Defines workbook implementation standards.           |
| Implementation  | Defines worksheet-level behavior and business rules. |
| Future Platform | Defines migration path beyond Excel.                 |

---

# Documentation Catalog

## Foundation Documents

| File                       | Status | Purpose                                                |
| -------------------------- | ------ | ------------------------------------------------------ |
| `00_Master_Index.md`       | Frozen | Repository documentation entry point.                  |
| `01_Project_Vision.md`     | Frozen | Vision, mission, and long-term direction of FinanceOS. |
| `02_Product_Philosophy.md` | Frozen | Product design philosophy and guiding principles.      |

---

## Architecture Documents

| File                           | Status | Purpose                                                       |
| ------------------------------ | ------ | ------------------------------------------------------------- |
| `03_Architecture_Decisions.md` | Frozen | AD-001 through AD-010 architecture decisions.                 |
| `04_Engineering_Standards.md`  | Frozen | ES-001 engineering standards for the workbook and repository. |
| `05_Version1_Scope.md`         | Frozen | Defines exactly what belongs in FinanceOS Version 1.          |

---

## Workbook Architecture Documents

| File                             | Status | Purpose                                                       |
| -------------------------------- | ------ | ------------------------------------------------------------- |
| `06_Workbook_Architecture.md`    | Frozen | Overall workbook architecture and worksheet responsibilities. |
| `07_Worksheet_Specifications.md` | Frozen | Specifications for every worksheet.                           |
| `08_Business_Rules.md`           | Frozen | Business rules governing workbook behavior.                   |
| `09_Transactions_Model.md`       | Frozen | Complete transaction model and transaction behavior.          |

---

## Engine Documents

| File                           | Status | Purpose                                      |
| ------------------------------ | ------ | -------------------------------------------- |
| `10_Business_Engine.md`        | Frozen | Core financial engine responsibilities.      |
| `11_Analysis_Engine.md`        | Frozen | Financial analysis calculations and outputs. |
| `12_Dashboard_Architecture.md` | Frozen | Dashboard architecture and metrics.          |
| `13_Insights_Architecture.md`  | Frozen | Insight generation architecture.             |

---

## Workbook Engineering Documents

| File                           | Status | Purpose                                                     |
| ------------------------------ | ------ | ----------------------------------------------------------- |
| `14_Validation_And_Helpers.md` | Frozen | Validation rules, helper tables, and lookup behavior.       |
| `15_Formula_Standards.md`      | Frozen | Formula engineering standards.                              |
| `16_Naming_Conventions.md`     | Frozen | Table names, worksheet names, IDs, ranges, and conventions. |
| `17_UI_UX_Design_System.md`    | Frozen | Excel application UI system and design language.            |
| `18_Excel_Compatibility.md`    | Frozen | Compatibility rules across Excel platforms.                 |

---

## Project Management Documents

| File                                  | Status          | Purpose                                         |
| ------------------------------------- | --------------- | ----------------------------------------------- |
| `19_Current_Implementation_Status.md` | Living Document | Current implementation progress of FinanceOS.   |
| `20_Development_Roadmap.md`           | Living Document | Engineering roadmap and sprint planning.        |
| `21_Website_Migration_Readiness.md`   | Living Document | Migration planning for web and mobile versions. |

---

# Reading Order

Every contributor should read documents in this order.

| Order | Document                      |
| ----- | ----------------------------- |
| 1     | Master Index                  |
| 2     | Project Vision                |
| 3     | Product Philosophy            |
| 4     | Architecture Decisions        |
| 5     | Engineering Standards         |
| 6     | Version 1 Scope               |
| 7     | Workbook Architecture         |
| 8     | Worksheet Specifications      |
| 9     | Business Rules                |
| 10    | Transactions Model            |
| 11    | Business Engine               |
| 12    | Analysis Engine               |
| 13    | Dashboard Architecture        |
| 14    | Insights Architecture         |
| 15    | Validation and Helpers        |
| 16    | Formula Standards             |
| 17    | Naming Conventions            |
| 18    | UI / UX Design System         |
| 19    | Excel Compatibility           |
| 20    | Current Implementation Status |
| 21    | Development Roadmap           |
| 22    | Website Migration Readiness   |

This reading order mirrors the engineering dependency chain.

---

# Documentation Dependency Flow

The repository follows a strict dependency model.

## Foundation

* Project Vision
* Product Philosophy

⬇

## Architecture

* Architecture Decisions
* Engineering Standards
* Version 1 Scope

⬇

## Workbook Architecture

* Workbook Architecture
* Worksheet Specifications
* Business Rules
* Transactions Model

⬇

## Engines

* Business Engine
* Analysis Engine
* Dashboard Architecture
* Insights Architecture

⬇

## Engineering Standards

* Validation and Helpers
* Formula Standards
* Naming Conventions
* UI / UX Design System
* Excel Compatibility

⬇

## Project Management

* Implementation Status
* Development Roadmap
* Website Migration Readiness

Implementation always flows downward.

No lower-level document may redefine a higher-level document.

---

# Frozen Documents vs Living Documents

FinanceOS distinguishes between immutable specifications and evolving project documents.

## Frozen Documents

Frozen documents require explicit architectural approval before modification.

These include:

* Project Vision
* Product Philosophy
* Architecture Decisions
* Engineering Standards
* Version 1 Scope
* Workbook Architecture
* Worksheet Specifications
* Business Rules
* Transactions Model
* Business Engine
* Analysis Engine
* Dashboard Architecture
* Insights Architecture
* Validation and Helpers
* Formula Standards
* Naming Conventions
* UI / UX Design System
* Excel Compatibility

Changes to frozen documents require:

1. Architectural review.
2. Documentation update.
3. Git checkpoint.

---

## Living Documents

Living documents evolve during development.

These include:

* Current Implementation Status
* Development Roadmap
* Website Migration Readiness

Living documents may be updated whenever implementation progresses.

---

# Source of Truth Rules

Each engineering topic has exactly one owning document.

| Topic                      | Source of Truth          |
| -------------------------- | ------------------------ |
| Vision                     | Project Vision           |
| Product Principles         | Product Philosophy       |
| Architecture               | Architecture Decisions   |
| Engineering Standards      | Engineering Standards    |
| Workbook Structure         | Workbook Architecture    |
| Worksheet Responsibilities | Worksheet Specifications |
| Business Logic             | Business Rules           |
| Transaction Logic          | Transactions Model       |
| Formula Rules              | Formula Standards        |
| Validation Rules           | Validation and Helpers   |
| Naming Rules               | Naming Conventions       |
| UI Rules                   | UI / UX Design System    |
| Compatibility              | Excel Compatibility      |

Cursor must never duplicate ownership across documents.

---

# Repository Folder Ownership

| Folder            | Purpose                                         |
| ----------------- | ----------------------------------------------- |
| `docs/`           | Engineering documentation and specifications.   |
| `workbook/`       | FinanceOS Excel workbook and workbook assets.   |
| `assets/`         | Icons, logos, illustrations, and design assets. |
| `design/`         | UI references and design explorations.          |
| `scripts/`        | Repository automation scripts only.             |
| `.cursor/rules/`  | Permanent Cursor operating rules.               |
| `.cursor/skills/` | Cursor implementation workflow skills.          |

---

# Versioning Rules

Every documentation file follows the same metadata format.

Required metadata:

* Document ID
* Version
* Status
* Owner
* Repository
* Last Updated

Major architectural revisions increment the document version.

Minor formatting changes do not create a new architecture version.

---

# Documentation Update Workflow

Every documentation change follows this workflow.

1. Update documentation.
2. Review documentation.
3. Freeze documentation if architectural.
4. Commit documentation.
5. Push documentation.
6. Begin implementation.

Documentation always precedes implementation.

---

# Git Checkpoint Philosophy

Every major documentation milestone becomes a Git checkpoint.

Examples:

| Checkpoint            | Commit Message                                       |
| --------------------- | ---------------------------------------------------- |
| Repository Foundation | Sprint 0: Initialize FinanceOS repository foundation |
| Cursor Rulebook       | Sprint 0: Add permanent FinanceOS Cursor rulebook    |
| Grill Skill           | Sprint 1: Complete Grill Before Build Cursor skill   |
| Master Index          | Sprint 1: Complete Master Index documentation        |
| Project Vision        | Sprint 1: Complete Project Vision documentation      |
| Product Philosophy    | Sprint 1: Complete Product Philosophy documentation  |

The repository should always be recoverable at any documentation milestone.

---

# Documentation Ownership

## Product Architecture

Owned by:

* User
* ChatGPT (Architecture)

Responsibilities:

* Vision.
* Architecture.
* Business rules.
* Engineering decisions.
* Scope.

---

## Implementation

Owned by:

* Cursor
* User

Responsibilities:

* Markdown formatting.
* Workbook implementation.
* Excel engineering.
* Validation.
* Formulas.
* Documentation formatting.

Cursor does not own architecture.

---

# AI Workflow Inside FinanceOS

FinanceOS uses two permanent AI roles.

## ChatGPT

Acts as:

* Product Architect.
* Systems Designer.
* Engineering Decision Maker.
* Documentation Author.

## Cursor

Acts as:

* Engineering Implementation Agent.
* Repository Assistant.
* Excel Builder.
* Refactoring Assistant.
* Validation Assistant.

Cursor follows the Rulebook and Skills before implementation.

---

# Current Repository State

| Area                     | Status      |
| ------------------------ | ----------- |
| Repository Structure     | Complete    |
| Cursor Rulebook          | Complete    |
| Grill Before Build Skill | Complete    |
| Documentation            | In Progress |
| Workbook Engineering     | Not Started |
| Dashboard Engineering    | Not Started |
| Website Migration        | Planning    |

This section is informational only.

---

# Change Log

## Version 1.0

* Initial Master Index created.
* Documentation hierarchy established.
* Reading order defined.
* Dependency flow defined.
* Source-of-truth ownership established.
* Versioning workflow established.
* Git checkpoint strategy documented.

---

**End of Document — DOC-000 Master Index Version 1.0**
