# FinanceOS — Website Migration Readiness

**Document ID:** DOC-021

**Version:** 1.0

**Status:** **Frozen**

**Owner:** FinanceOS Architecture (ChatGPT + User)

**Repository:** FinanceOS

**Last Updated:** 23 August 2026

---

# Purpose

This document defines the migration strategy from the FinanceOS Excel workbook into a production-grade web application.

The goal is **not to redesign FinanceOS**, but to migrate the existing architecture into software while preserving business logic, formulas, user experience, and deterministic calculations.

This document freezes:

- Migration philosophy.
- Frontend architecture.
- Backend architecture.
- Shared business engine.
- Shared analysis engine.
- Component mapping.
- Database mapping.
- API readiness.
- Cursor implementation expectations.

---

# Migration Philosophy

FinanceOS Version 1 is the canonical financial operating system.

The website is **Version 2**, but it inherits Version 1 instead of replacing it.

The migration principle is:

> Same architecture. Different platform.

Nothing in the website changes the financial logic defined in the Excel workbook.

---

# Migration Objectives

The website should provide:

- Cloud-based FinanceOS experience.
- Authentication.
- Automatic synchronization.
- Mobile-responsive UI.
- Admin-controlled notifications.
- AI explanation layer.
- Multi-device access.

Business calculations remain identical.

---

# Canonical Source Principle

Version 1 Excel documentation remains the source of truth.

Every future implementation references these documents.

| Layer | Canonical Source |
|-------|-------------------|
| Business Logic | Business Engine documentation |
| Financial Interpretation | Analysis Engine documentation |
| Validation | Helpers documentation |
| UI | UI/UX Design System |
| Naming | Naming Conventions |
| Formulas | Formula Standards |

Website implementation cannot diverge without updating documentation.

---

# Migration Architecture Overview

FinanceOS evolves into four independent applications.

| Product | Responsibility |
|---------|----------------|
| Excel Workbook | Financial operating system foundation |
| User Website | Personal finance application |
| Admin Panel | Platform operations |
| Mobile App | Mobile client |

Every product shares the same architecture.

---

# Shared Core Architecture

The shared FinanceOS architecture contains reusable modules.

| Shared Module | Used By |
|--------------|---------|
| Business Engine | Excel, Website, Mobile |
| Analysis Engine | Excel, Website, Mobile |
| Validation Engine | Excel, Website |
| Design System | Excel, Website, Mobile, Admin |
| Naming Standards | Entire ecosystem |

These modules migrate unchanged.

---

# Frontend Architecture (Frozen)

The website frontend follows a React-first architecture.

---

## Frontend Responsibilities

The frontend owns:

- Authentication UI.
- Dashboard UI.
- Transactions UI.
- Goals UI.
- Assets UI.
- Liabilities UI.
- Insights UI.
- Purchase Simulator UI.
- Settings UI.

The frontend never owns financial calculations.

---

## React Page Architecture

| Page | Source Worksheet |
|------|-------------------|
| DashboardPage | Dashboard |
| TransactionsPage | Transactions |
| AccountsPage | Accounts |
| GoalsPage | Goals |
| AssetsPage | Assets |
| LiabilitiesPage | Liabilities |
| InsightsPage | Insights |
| SettingsPage | Settings |

Every worksheet maps directly to one page.

---

## Shared React Components

The design system becomes reusable React components.

| Component | Source |
|-----------|--------|
| KPICard | Dashboard KPI Card |
| GoalCard | Goals Card |
| HealthScoreCard | Financial Health Card |
| CashFlowCard | Cash Flow Card |
| InsightCard | Insights Card |
| AllocationBar | Investment Card |
| ProgressRing | Goal Progress |
| StatusBadge | Badge System |

Component names are frozen.

---

# Mobile-First Frontend Rules

Website follows the same mobile hierarchy defined in DOC-017.

### Mobile Navigation

- Dashboard.
- Transactions.
- Goals.
- Insights.
- Profile.

Navigation is optimized for one-hand usage.

---

### Responsive Layout Rules

Desktop uses multi-column layouts.

Tablet uses hybrid layouts.

Mobile stacks components vertically.

Content hierarchy never changes.

---

# Backend Architecture (Frozen)

The backend owns data persistence and synchronization.

---

## Backend Responsibilities

- User authentication.
- Database storage.
- Sync across devices.
- Notification scheduling.
- Email scheduling.
- AI explanation requests.
- API delivery.

The backend never changes Business Engine calculations.

---

## Backend Layer Separation

| Layer | Responsibility |
|-------|----------------|
| API Layer | Data exchange |
| Business Engine Service | Financial calculations |
| Analysis Service | Financial interpretation |
| Notification Service | Trigger scheduling |
| AI Explanation Service | Natural-language summaries |

Each layer has one responsibility.

---

# Business Engine Migration Strategy

Business Engine formulas become backend calculation services.

---

## Migration Rules

Each `out` output becomes an API output.

Examples:

| Workbook Output | Backend Output |
|----------------|----------------|
| outNetWorth | netWorth |
| outMonthlyIncome | monthlyIncome |
| outMonthlyExpense | monthlyExpense |
| outGoalCompletion | goalCompletion |
| outOutstandingDebt | outstandingDebt |

Business calculations remain deterministic.

---

# Analysis Engine Migration Strategy

Analysis outputs become reusable analytics services.

---

## Migration Rules

Each `analysis` output becomes an analytics endpoint.

Examples:

| Workbook Output | Backend Output |
|----------------|----------------|
| analysisHealthScore | healthScore |
| analysisCashRunway | cashRunway |
| analysisGoalForecast | goalForecast |
| analysisPurchaseStatus | purchaseStatus |
| analysisDebtHealth | debtHealth |

Interpretation logic remains identical.

---

# Database Mapping Strategy

Every workbook table becomes one database table.

| Workbook Table | Database Table |
|---------------|----------------|
| tblTransactions | transactions |
| tblAccounts | accounts |
| tblGoals | goals |
| tblAssets | assets |
| tblLiabilities | liabilities |
| tblRecurringCommitments | recurring_commitments |
| tblIncomeSources | income_sources |
| tblCategories | categories |
| tblSettings | settings |

Table ownership remains unchanged.

---

# Stable Identifier Strategy

Every workbook ID becomes a permanent database identifier.

| Workbook ID | Database Field |
|------------|----------------|
| Account ID | account_id |
| Goal ID | goal_id |
| Transaction ID | transaction_id |
| Asset ID | asset_id |
| Liability ID | liability_id |

IDs never change across platforms.

---

# API Readiness Standards

The website exposes deterministic APIs.

---

## API Categories

| API | Purpose |
|-----|---------|
| Accounts API | Account management |
| Transactions API | Transaction ledger |
| Goals API | Goal management |
| Dashboard API | Dashboard summary |
| Insights API | Financial insights |
| Analysis API | Analysis outputs |
| Settings API | User configuration |

APIs return Business Engine and Analysis Engine outputs.

---

# Validation Migration Strategy

Helpers migrate into backend validation rules.

### Validation Ownership

- Backend validates inputs.
- Frontend displays validation.
- Same validation lists.
- Same dropdown behavior.
- Same dependency rules.

Validation architecture remains centralized.

---

# Authentication Readiness

Authentication is introduced only in the website.

Version 1 workbook has no authentication.

Future authentication responsibilities include:

- Login.
- Registration.
- Password reset.
- Session management.
- User profile.

Authentication does not modify financial architecture.

---

# Cloud Synchronization Readiness

Synchronization belongs only to the backend.

Responsibilities include:

- Multi-device sync.
- Offline sync recovery.
- Version history.
- User preferences.
- Workbook import/export.

Workbook calculations remain unchanged.

---

# Cursor Migration Responsibilities

Cursor migration means rebuilding FinanceOS using the frozen documentation.

Cursor must:

- Preserve architecture.
- Preserve UI hierarchy.
- Preserve naming conventions.
- Preserve Business Engine outputs.
- Preserve Analysis Engine outputs.
- Preserve validation rules.

Migration is implementation, not redesign.

---

# Immutable Decisions in Part A

The following migration architecture decisions are frozen.

- Excel is the canonical Version 1 implementation.
- React inherits Excel architecture.
- Business Engine migrates unchanged.
- Analysis Engine migrates unchanged.
- Database mirrors workbook tables.
- APIs expose deterministic outputs.
- Frontend owns presentation only.
- Backend owns persistence only.

---

# Part A Complete

This section freezes the migration philosophy, frontend architecture, backend architecture, Business Engine migration, Analysis Engine migration, database mapping, API readiness, validation migration, authentication readiness, and Cursor migration responsibilities for FinanceOS Version 2.


---

# Admin Panel Integration Architecture (Frozen)

The Admin Panel is a separate operational application that manages the FinanceOS platform.

It does **not** replace the user website or the Excel workbook.

The Admin Panel manages users, subscriptions, notifications, workbook generation, analytics, and platform configuration.

---

# Admin Panel Philosophy

The Admin Panel exists for FinanceOS operations.

| User Website | Admin Panel |
|--------------|-------------|
| Personal finance workspace | Platform management workspace |
| Individual financial data | Platform-wide operational data |
| Dashboard and insights | User management and analytics |
| Personal settings | Global platform settings |

The two applications share the same backend but different permissions.

---

# Admin Panel Module Architecture (Frozen)

The Admin Panel contains independent operational modules.

| Module | Responsibility |
|--------|----------------|
| Dashboard | Platform KPIs |
| Users | User management |
| Workbook Generator | Generate Excel workbooks |
| Notifications | Deterministic notification management |
| Email Automation | Financial email delivery |
| Analytics | Platform metrics |
| Subscription Plans | Plan management |
| Support Center | Customer support |
| Global Settings | Platform configuration |

Module ownership is frozen.

---

# Admin Dashboard Architecture

The Admin Dashboard summarizes FinanceOS platform health.

### Dashboard KPIs

- Total Users
- Active Users
- Active Workbooks
- Workbook Downloads
- Email Deliveries
- Notifications Delivered
- Subscription Revenue
- Daily Active Users

These KPIs are operational, not financial.

---

# User Management Architecture

The Admin Panel manages user accounts.

### User Capabilities

- View users.
- Activate users.
- Suspend users.
- Reset workbook access.
- View subscription status.
- View workbook version.

Admin users never edit financial data directly.

---

# Workbook Generator Architecture

The workbook generator produces personalized FinanceOS workbooks.

### Responsibilities

- Generate workbook template.
- Apply user settings.
- Apply currency preference.
- Apply financial year preference.
- Version workbook.
- Export workbook.

Workbook generation follows Version 1 architecture.

---

# Notification Engine Architecture (Frozen)

The Notification Engine is deterministic.

Notifications originate from Analysis Engine outputs.

---

## Notification Philosophy

Notifications explain financial events already calculated.

They never calculate finances independently.

---

## Notification Categories

| Category | Trigger Source |
|----------|----------------|
| EMI Reminder | Recurring Commitments |
| Goal Milestone | Goal Progress |
| Overspending Alert | Budget Utilization |
| Cash Runway Warning | Cash Runway Analysis |
| Emergency Fund Target | Emergency Coverage |
| Purchase Warning | Purchase Affordability |
| Monthly Summary | Business Engine |
| Weekly Summary | Analysis Engine |

Categories are frozen.

---

## Notification Trigger Flow

Business Engine

↓

Analysis Engine

↓

Notification Rules

↓

Notification Queue

↓

User Delivery

No notification bypasses Analysis Engine.

---

## Notification Severity Levels

| Severity | Meaning |
|----------|---------|
| Green | Informational |
| Yellow | Monitor |
| Orange | Action Recommended |
| Red | Immediate Attention |

Severity follows the same semantic system as Insights.

---

# AI Explanation Layer (Frozen)

The AI layer explains deterministic financial outputs.

It never replaces Business Engine calculations.

---

## AI Layer Responsibilities

- Weekly summaries.
- Monthly summaries.
- Goal explanations.
- Purchase explanations.
- Savings explanations.
- Spending explanations.
- Cash runway explanations.

Every explanation references documented outputs.

---

## AI Input Sources

| Source | Purpose |
|--------|---------|
| Business Engine Outputs | Financial metrics |
| Analysis Engine Outputs | Financial interpretation |
| User Preferences | Personalization |
| Notification Rules | Delivery timing |

AI never reads raw workbook formulas.

---

## AI Output Categories

### Weekly Financial Report

Summarizes:

- Income.
- Expense.
- Savings.
- Goal Progress.
- Health Score.
- Spending Trend.

---

### Monthly Financial Report

Summarizes:

- Net Worth change.
- Cash Flow.
- Goal progress.
- Debt changes.
- Investment allocation.
- Health summary.

---

### Purchase Explanation

Explains:

- Cash remaining.
- Emergency runway impact.
- Goal delay.
- Debt burden change.

---

### Goal Coaching

Explains:

- Progress.
- Delay reason.
- Required contribution.
- Forecast completion month.

---

# Email Automation Architecture (Frozen)

Emails are generated from deterministic financial outputs.

---

## Email Categories

| Email | Trigger |
|-------|----------|
| Weekly Summary | Weekly schedule |
| Monthly Summary | Monthly schedule |
| Goal Milestone | Goal progress |
| Cash Runway Alert | Runway threshold |
| Overspending Alert | Budget threshold |
| Purchase Warning | Purchase simulator |

Emails reuse AI explanation templates.

---

## Email Delivery Flow

Analysis Engine

↓

AI Explanation Layer

↓

Email Template Engine

↓

Delivery Service

Templates never calculate financial metrics.

---

# Deterministic Prediction Ecosystem (Frozen)

FinanceOS includes prediction experiences across applications.

---

## Supported Predictions

| Prediction | Source |
|------------|--------|
| Cash Runway | Analysis Engine |
| Goal Completion | Analysis Engine |
| Purchase Affordability | Analysis Engine |
| Savings Projection | Business Engine |
| Debt Burden Projection | Analysis Engine |
| Emergency Coverage Projection | Analysis Engine |

Predictions remain reproducible.

---

## Prediction Presentation Rules

Predictions always include:

- Current metric.
- Projected metric.
- Reason.
- Financial impact.

Users can trace every prediction to workbook calculations.

---

# Deployment Architecture (Frozen)

FinanceOS evolves into multiple deployable applications.

---

## Deployment Targets

| Application | Deployment |
|-------------|------------|
| Excel Workbook | Downloadable product |
| User Website | Cloud deployment |
| Admin Panel | Internal web application |
| Mobile App | Android & iOS apps |

Every deployment shares the same backend architecture.

---

## Environment Strategy

| Environment | Purpose |
|-------------|---------|
| Development | Cursor implementation |
| Testing | QA validation |
| Staging | Beta environment |
| Production | Public FinanceOS release |

Environment separation is mandatory.

---

# Security Architecture Readiness (Frozen)

Security belongs to the future backend.

---

## Authentication Responsibilities

- User identity.
- Session management.
- Password management.
- Account recovery.
- Device management.

Workbook remains authentication-free.

---

## Authorization Philosophy

Permissions depend on application role.

| Role | Access |
|------|--------|
| User | Personal finances |
| Admin | Platform operations |
| Support | Support tools only |

Role separation is immutable.

---

## Data Ownership Rules

Users own:

- Transactions.
- Goals.
- Assets.
- Liabilities.
- Settings.

Platform owns:

- Subscription status.
- Notification preferences.
- Email preferences.
- Analytics metadata.

Financial ownership remains user-specific.

---

# Import / Export Architecture (Frozen)

Website supports workbook interoperability.

---

## Import

Import Version 1 workbook into FinanceOS account.

---

## Export

Export current FinanceOS account into workbook format.

Workbook format remains backward compatible.

---

## Version Compatibility Rules

Versioned workbook exports include:

- Workbook Version.
- Schema Version.
- Generated Timestamp.
- Compatibility Version.

Migration remains deterministic.

---

# Cursor Website Migration Rules

Cursor must preserve:

- Worksheet ownership.
- Business Engine outputs.
- Analysis Engine outputs.
- UI Design Tokens.
- Naming conventions.
- Validation architecture.
- Dashboard hierarchy.

Cursor may change technology, never architecture.

---

# Migration Completion Checklist

Website migration is complete only when:

### Frontend

- Dashboard complete.
- Transactions complete.
- Goals complete.
- Assets complete.
- Liabilities complete.
- Insights complete.

### Backend

- Business Engine service complete.
- Analysis Engine service complete.
- Authentication complete.
- Database complete.

### Platform

- Notifications complete.
- Email automation complete.
- Admin Panel connected.

---

# Immutable Migration Decisions

The following migration decisions are permanently frozen.

### Architecture

- Excel is Version 1 canonical implementation.
- Website inherits workbook architecture.
- Business Engine migrates unchanged.
- Analysis Engine migrates unchanged.

### Admin Panel

- Separate operational application.
- Shared backend.
- Different permissions.

### AI Layer

- AI explains calculations.
- AI never replaces calculations.
- AI consumes deterministic outputs only.

### Notifications

- Triggered by Analysis Engine.
- Severity matches Insights.
- Deterministic delivery rules.

### Deployment

- Workbook, Website, Admin Panel, and Mobile App are separate products.
- Shared architecture across every platform.

---

# Version History

## Version 1.0 — Initial Freeze

The complete Website Migration Readiness architecture for FinanceOS has been frozen.

This document defines migration strategy, React architecture, backend mapping, admin panel integration, notification engine, AI explanation layer, deployment readiness, security boundaries, and migration completion rules.

---

**End of Document — DOC-021 Website Migration Readiness Version 1.0**