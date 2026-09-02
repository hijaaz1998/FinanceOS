# 00_BACKEND_MASTER.md

## FinanceOS — Complete Backend Architecture Master Specification (V1)

**Document ID:** BACKEND-00

**Version:** 1.0 (Official V1)

**Status:** Frozen Architecture Specification

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Document Purpose

This document is the **master backend specification** for FinanceOS.

It defines the complete backend architecture that powers:

- FinanceOS Website
- Customer Dashboard
- Admin Portal
- Operations Center
- Payment System
- Email System
- Workbook Distribution System
- Analytics Infrastructure

This document acts as the **backend equivalent** of:

- `00_DESIGN_MASTER.md`
- `00_ADMIN_MASTER.md`

Every backend document inside `/docs/backend` inherits rules defined here.

This document is written for **Cursor implementation**. No implementation decisions should contradict this specification.

---

# Document Dependencies

## Depends On

### Design Documentation

- `design/00_DESIGN_MASTER.md`
- `design/01_DESIGN_SYSTEM.md`
- `design/04_CHART_UI_GUIDELINES.md`
- `design/06_DASHBOARD_CARD_SYSTEM.md`

### Excel Documentation

- Entire `/docs/excel` folder.

### Website Documentation

- Entire `/docs/web/user` folder.

### Admin Documentation

- Entire `/docs/web/admin` folder.

---

## Backend Documents Created From This Master

```text
/docs/backend
│
├── 00_BACKEND_MASTER.md                 ← THIS FILE
├── 01_SUPABASE_DATABASE_ARCHITECTURE.md
├── 02_AUTH_AND_SECURITY.md
├── 03_STORAGE_ARCHITECTURE.md
├── 04_API_ARCHITECTURE.md
├── 05_WEBHOOK_ARCHITECTURE.md
├── 06_PAYMENT_GATEWAY_ARCHITECTURE.md
├── 07_EMAIL_SYSTEM_ARCHITECTURE.md
├── 08_OPERATIONS_CENTER_BACKEND.md
├── 09_BACKGROUND_JOBS_AND_CRON.md
├── 10_ENVIRONMENT_VARIABLES_AND_SECRETS.md
├── 11_DATABASE_RLS_AND_PERMISSIONS.md
└── 12_BACKEND_IMPLEMENTATION_CHECKLIST.md
```

---

# Backend Version Policy

| Item | Policy |
|------|--------|
| Backend Version | V1 |
| Database Version | PostgreSQL 16 |
| Framework Version | Next.js 15 App Router |
| Runtime | Node.js LTS |
| Database Provider | Supabase |
| Hosting Provider | Vercel Pro |
| ORM | Supabase Client (No Prisma in V1) |
| Language | TypeScript |
| API Style | REST Route Handlers |

V1 decisions are frozen.

---

# Backend Philosophy

FinanceOS follows a **Backend-as-a-Service + Serverless API** architecture.

Instead of maintaining a separate backend server (Express/NestJS), FinanceOS keeps backend logic inside the Next.js application while Supabase provides infrastructure services.

## Guiding Principles

1. One repository.
2. One deployment.
3. One API layer.
4. Database separated from UI.
5. Business logic separated from API handlers.
6. Security enforced at API and database level.
7. Realtime only where necessary.
8. Background jobs outside request lifecycle.

---

# Technology Stack (Frozen)

## Core Stack

| Layer | Technology |
|-------|------------|
| Frontend | Next.js 15 |
| Backend API | Next.js Route Handlers |
| Database | Supabase PostgreSQL |
| Authentication | Supabase Auth |
| Storage | Supabase Storage |
| Realtime | Supabase Realtime |
| Background Jobs | Supabase Edge Functions |
| Scheduled Jobs | Supabase Cron |
| Deployment | Vercel Pro |

---

## External Services

| Service | Purpose |
|----------|---------|
| Stripe | International Payments |
| Razorpay | India Payments |
| Resend | Transactional Email |
| Meta Marketing API | Ads Analytics |
| Google Analytics Data API | Website Analytics |
| Search Console API | SEO Analytics |
| Sentry | Error Monitoring |
| Vercel Analytics | Performance Monitoring |

All external services communicate through secure backend APIs.

---

# High-Level Backend Architecture

```text
                 Users

                    │

      Website / Dashboard / Admin

                    │

           Next.js Frontend (Vercel)

                    │

          Route Handlers (Backend API)

                    │

        Business Services Layer

         ├── Payments
         ├── Orders
         ├── Downloads
         ├── Analytics
         ├── Operations
         ├── Customers
         ├── Coupons
         └── Releases

                    │

               Supabase Layer

      PostgreSQL
      Auth
      Storage
      Realtime
      Edge Functions
      Cron Jobs

                    │

           External Integrations

 Stripe • Razorpay • Meta • GA4
 Search Console • Resend • Sentry
```

This architecture is frozen.

---

# Backend Responsibilities

FinanceOS backend performs all secure operations.

## Website Backend

| Responsibility |
|---------------|
| Customer Authentication |
| PPP Pricing |
| Checkout Creation |
| Coupon Validation |
| Workbook Downloads |
| Profile Updates |

---

## Admin Backend

| Responsibility |
|---------------|
| Customer Management |
| Order Management |
| Product Releases |
| Coupon Management |
| Email Sending |
| Analytics Aggregation |
| Operations Center Data |
| Audit Logging |

---

## System Backend

| Responsibility |
|---------------|
| Payment Verification |
| License Generation |
| Webhook Processing |
| Scheduled Jobs |
| Storage Permissions |
| Security Policies |
| Notification Delivery |

---

# Backend Folder Structure

Repository architecture is frozen.

```text
financeos/

apps/
└── web/
    ├── app/
    ├── components/
    ├── features/
    ├── lib/
    ├── middleware.ts
    ├── services/
    ├── types/
    ├── utils/
    ├── hooks/
    ├── config/
    ├── validations/
    ├── constants/
    └── app/api/

packages/
└── shared/

docs/
└── backend/
```

No separate backend repository.

---

# Backend Source Structure

## App Directory

```text
app/

(auth)

dashboard/

admin/

checkout/

downloads/

api/

layout.tsx

page.tsx
```

App Router architecture is mandatory.

---

## API Directory Structure

```text
app/api/

auth/

checkout/

payments/

orders/

downloads/

customers/

licenses/

products/

releases/

coupons/

analytics/

operations/

emails/

webhooks/

admin/

health/
```

Each folder contains route handlers.

---

# Services Layer Structure

Business logic **never lives inside route handlers**.

```text
services/

auth.service.ts

checkout.service.ts

payment.service.ts

order.service.ts

license.service.ts

download.service.ts

release.service.ts

coupon.service.ts

customer.service.ts

analytics.service.ts

operations.service.ts

email.service.ts

notification.service.ts
```

Route handlers call services.

Services call Supabase or external APIs.

---

# Library Layer

Shared infrastructure code.

```text
lib/

supabase/

stripe/

razorpay/

resend/

meta/

ga4/

search-console/

sentry/

permissions/

ppp/

cache/
```

Each integration has isolated helper utilities.

---

# Validation Layer

Every endpoint validates input.

```text
validations/

auth.schema.ts

checkout.schema.ts

coupon.schema.ts

profile.schema.ts

release.schema.ts

email.schema.ts

analytics.schema.ts
```

No endpoint accepts raw input.

---

# Type Definitions

Global shared types.

```text
types/

database.ts

customer.ts

order.ts

payment.ts

release.ts

coupon.ts

analytics.ts

operations.ts

email.ts
```

Generated database types live separately.

---

# Constants Layer

```text
constants/

routes.ts

roles.ts

permissions.ts

currencies.ts

countries.ts

release-status.ts

email-types.ts

storage-buckets.ts
```

Magic strings prohibited.

---

# Backend Design Principles

## Separation of Concerns

| Layer | Responsibility |
|-------|----------------|
| Route Handler | HTTP Request / Response |
| Service | Business Logic |
| Lib | External SDK Communication |
| Validation | Input Validation |
| Database | Persistence |
| Storage | Files |
| Auth | Identity |

No business logic inside components.

---

# API Design Principles

FinanceOS uses REST.

## Endpoint Naming Rules

```text
/api/orders

/api/orders/{id}

/api/releases

/api/releases/latest

/api/checkout/create-session

/api/webhooks/stripe
```

Rules:

- Lowercase.
- Hyphenated.
- Resource-oriented.
- Versionless in V1.

---

# HTTP Method Standards

| Method | Usage |
|--------|------|
| GET | Fetch Data |
| POST | Create Resource |
| PUT | Replace Resource |
| PATCH | Partial Update |
| DELETE | Soft Delete |

No GET mutations.

---

# Response Standard

Every API returns identical response format.

## Success Response

```json
{
  "success": true,
  "data": {},
  "message": "Success"
}
```

## Error Response

```json
{
  "success": false,
  "error": {
    "code": "ORDER_NOT_FOUND",
    "message": "Order does not exist."
  }
}
```

Global API response contract is frozen.

---

# Error Code Standards

| Prefix | Purpose |
|--------|---------|
| AUTH_ | Authentication |
| ORDER_ | Orders |
| PAYMENT_ | Payments |
| LICENSE_ | Licenses |
| DOWNLOAD_ | Downloads |
| COUPON_ | Coupons |
| RELEASE_ | Releases |
| EMAIL_ | Emails |
| ANALYTICS_ | Analytics |
| STORAGE_ | Storage |
| WEBHOOK_ | Webhooks |
| SYSTEM_ | Internal System |

Unique error codes only.

---

# Backend Security Model

Security uses multiple layers.

## Security Layers

| Layer | Technology |
|-------|------------|
| Authentication | Supabase Auth |
| Authorization | API Middleware |
| Row Permissions | Supabase RLS |
| Storage Permissions | Bucket Policies |
| API Secrets | Environment Variables |
| Webhooks | Signature Verification |

Defense-in-depth architecture.

---

# Authentication Strategy

FinanceOS supports:

- Email Login
- Email Signup
- Email Verification
- Password Reset
- Session Refresh
- Logout
- Admin Session
- Customer Session

Social login excluded from V1.

---

# Authorization Model

## Roles

| Role | Access |
|------|--------|
| Customer | Purchased Products |
| Admin | Full Admin Portal |
| Super Admin | Infrastructure Settings |

RBAC is frozen.

---

# Request Lifecycle

```text
User Request

      │

Middleware

      │

Authentication

      │

Authorization

      │

Validation

      │

Route Handler

      │

Business Service

      │

Database / External API

      │

Response Formatter

      │

Client
```

Every API follows this lifecycle.

---

# Middleware Responsibilities

Middleware performs:

- Session validation.
- Admin route protection.
- Security headers.
- Rate limiting.
- Request logging.
- Locale detection.
- PPP country detection.

Middleware contains no business logic.

---

# PPP Pricing Flow

FinanceOS supports Purchasing Power Parity.

Flow:

1. Detect country.
2. Validate override cookie.
3. Fetch PPP rules.
4. Calculate regional price.
5. Apply coupon.
6. Return checkout amount.

Implemented server-side only.

---

# Currency Support

Supported currencies:

| Currency |
|----------|
| INR |
| USD |
| GBP |
| EUR |
| AED |
| SGD |
| AUD |
| CAD |

Prices calculated server-side.

---

# Database Philosophy

Supabase PostgreSQL is source of truth.

Rules:

- UUID primary keys.
- Soft deletes where appropriate.
- Timestamp every table.
- Audit trail for mutations.
- Foreign key relationships everywhere possible.

Detailed schema lives in `01_SUPABASE_DATABASE_ARCHITECTURE.md`.

---

# Storage Philosophy

Supabase Storage stores binary assets only.

Database stores metadata only.

Buckets never store business logic.

---

# Background Jobs Philosophy

Background jobs handle work outside user requests.

Examples:

- Analytics aggregation.
- Cleanup jobs.
- Email retries.
- Webhook retries.
- Release notifications.
- Storage cleanup.

Scheduled jobs never block API responses.

---

# Realtime Philosophy

Realtime used only where value exists.

Used for:

- Operations Center.
- Notifications.
- Download completion.
- Admin dashboard counters.

Historical analytics remain cached.

---

# Caching Strategy Overview

| Data | Cache Policy |
|------|--------------|
| Releases | Cached |
| Products | Cached |
| Pricing | Cached |
| Customer Profile | Short Cache |
| Revenue Widgets | 30 Seconds |
| Operations KPIs | 30 Seconds |
| Search Console | Hourly |
| GA4 | Minute Cache |

Caching rules expanded later.

---

# Logging Philosophy

Every critical action logged.

## Logged Events

- Login.
- Logout.
- Purchase.
- Refund.
- Download.
- Release Publish.
- Coupon Created.
- Admin Update.
- Webhook Received.
- Email Sent.

Logs immutable.

---

# Audit Trail Rules

Admin actions recorded.

Audit includes:

- Actor.
- Resource.
- Action.
- Previous Value.
- New Value.
- Timestamp.
- IP.
- User Agent.

Never editable.

---

# Integration Philosophy

External services accessed only through backend.

Never expose:

- Stripe Secret Key.
- Razorpay Secret.
- Resend Key.
- Meta Token.
- GA4 Credentials.
- Search Console Credentials.
- Sentry Auth Token.

Secrets remain server-side.

---

# Environment Configuration Philosophy

Environment variables categorized into:

- Public.
- Server.
- Build.
- Production Only.
- Development Only.

No secrets committed to Git.

---

# Performance Targets

| Operation | Target |
|-----------|--------|
| API Response | Under 300ms |
| Database Query | Under 150ms |
| Authentication | Under 250ms |
| Download URL Generation | Under 200ms |
| Checkout Session Creation | Under 500ms |
| Operations Dashboard | Under 1 second |

Targets are V1 performance requirements.

---

# Scalability Targets

FinanceOS backend designed for:

| Metric | Target |
|--------|--------|
| Registered Users | 100,000+ |
| Active Customers | 50,000+ |
| Orders | Millions |
| Downloads | Millions |
| Storage Assets | Unlimited Buckets |
| Admin Users | Hundreds |

No architecture changes required for V1 scale.

---

# Monitoring Strategy

System health monitored using:

- Sentry.
- Vercel Monitoring.
- Supabase Logs.
- Operations Center.
- Audit Logs.

Central monitoring dashboard defined later.

---

# Documentation Rules

Every backend document must include:

- Purpose.
- Dependencies.
- Architecture.
- Folder structure.
- Database relationships.
- Security considerations.
- Cursor implementation rules.
- Frozen V1 decisions.

All backend documentation follows identical formatting.

---

# Frozen V1 Backend Decisions

## Technology

- Next.js 15 App Router.
- TypeScript only.
- Supabase PostgreSQL.
- Supabase Auth.
- Supabase Storage.
- Supabase Realtime.
- Supabase Edge Functions.
- Supabase Cron.
- Vercel Pro hosting.

## Architecture

- Single repository.
- No separate Express backend.
- Backend implemented using Route Handlers.
- Business logic isolated inside Services layer.
- REST API architecture.
- Server-side validation mandatory.
- JWT authentication through Supabase.
- Row Level Security enabled.

## Integrations

- Stripe.
- Razorpay.
- Resend.
- Meta Marketing API.
- Google Analytics Data API.
- Google Search Console API.
- Sentry.
- Vercel Monitoring.

These are the official V1 integrations.

---

# Cursor Implementation Notes

Cursor must treat this document as the backend architecture contract.

Implementation must:

- Follow folder structure exactly.
- Keep services isolated.
- Keep API handlers thin.
- Never expose secrets client-side.
- Generate database types from Supabase.
- Use shared validation schemas.
- Use shared response formatter.
- Respect authentication middleware.
- Respect RLS policies.
- Respect storage permissions.

No implementation may deviate from this master specification without updating backend documentation.

---

# Next Document

**01_SUPABASE_DATABASE_ARCHITECTURE.md**

This document defines:

- Complete PostgreSQL schema.
- ER diagrams.
- Every table.
- Every column.
- Foreign keys.
- Indexes.
- Views.
- Materialized views.
- Triggers.
- Functions.
- Migrations.
- Data lifecycle.
- Soft delete strategy.
- Analytics tables.
- Operations Center tables.
- Audit tables.
- Notification tables.
- Release version tables.
- Download licensing tables.

Target size: **150+ pages** (largest database specification in FinanceOS V1).
