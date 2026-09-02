# 01_SUPABASE_DATABASE_ARCHITECTURE.md

## FinanceOS — Complete Supabase PostgreSQL Database Architecture (V1)

**Document ID:** BACKEND-01

**Version:** 1.0 (Official V1)

**Status:** Frozen Database Architecture

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Purpose

This document defines the **entire PostgreSQL database architecture** for FinanceOS using Supabase.

It is the single source of truth for:

- Database schema.
- Relationships.
- Primary keys.
- Foreign keys.
- Indexes.
- Views.
- Triggers.
- Functions.
- Audit logging.
- Analytics tables.
- Operations Center tables.
- Storage metadata.
- Notification system.
- Release management.
- Licensing system.

Cursor must generate migrations and TypeScript database types from this specification.

---

# Dependencies

## Parent Backend Document

- `00_BACKEND_MASTER.md`

## Referenced Documents

- `03_ORDER_AND_LICENSE_MANAGEMENT.md`
- `04_PRODUCT_RELEASE_MANAGEMENT.md`
- `05_PAYMENT_AND_COUPON_SYSTEM.md`
- `06_EMAIL_AND_NOTIFICATION_CENTER.md`
- `07_ANALYTICS_AND_GROWTH_DASHBOARD.md`
- `08_CONTENT_AND_MEDIA_LIBRARY.md`
- `11_OPERATIONS_CENTER_AND_INTEGRATIONS.md`

---

# Database Technology (Frozen)

| Setting | Value |
|--------|-------|
| Database Engine | PostgreSQL 16 |
| Provider | Supabase |
| Primary Key Type | UUID |
| Timezone | UTC |
| Soft Delete Strategy | `deleted_at` Timestamp |
| Timestamp Fields | `created_at`, `updated_at` |
| Generated Types | Supabase TypeScript |
| ORM | Supabase Client (No Prisma V1) |

---

# Database Design Principles

FinanceOS database follows strict normalization rules.

## Core Principles

- UUID primary keys.
- Foreign key relationships.
- Cascading deletes only where appropriate.
- Soft delete for business entities.
- Immutable audit history.
- No duplicated customer information.
- Derived analytics stored separately.
- Storage metadata separated from storage files.

---

# Database Schema Overview

FinanceOS contains **12 logical schemas**.

| Schema | Purpose |
|--------|---------|
| auth | Supabase Authentication |
| public | Main business tables |
| analytics | Aggregated analytics |
| operations | Operations Center cache |
| audit | Audit logs |
| notifications | Notification system |
| webhooks | Incoming webhook events |
| storage | Supabase buckets metadata |
| reports | Materialized reporting views |
| cron | Scheduled job metadata |
| system | Feature flags and settings |
| cache | Cached third-party API responses |

Only `public` stores transactional business data.

---

# Entity Relationship Overview

```text
profiles
    │
    ├── orders
    │      ├── payments
    │      ├── licenses
    │      ├── downloads
    │      └── invoices
    │
    ├── notifications
    ├── audit_logs
    ├── customer_settings
    └── support_requests

products
    │
    ├── releases
    ├── licenses
    ├── coupons
    ├── media_assets
    └── changelogs
```

This relationship is frozen.

---

# Complete Database Modules

FinanceOS database is divided into modules.

| Module | Tables |
|--------|--------|
| Customer System | 6 |
| Orders & Licensing | 8 |
| Payments | 6 |
| Product Releases | 7 |
| Downloads | 4 |
| Coupon System | 5 |
| Email System | 5 |
| Analytics | 12 |
| Operations Center | 10 |
| Notifications | 5 |
| Audit Logs | 4 |
| System Configuration | 6 |

**Total Estimated Tables: 78**

---

# Customer Module

Purpose:

Store customer identity and preferences.

## Customer Tables

| Table | Purpose |
|-------|---------|
| profiles | Customer profile |
| customer_preferences | Theme, currency, locale |
| customer_addresses | Billing information |
| customer_devices | Trusted devices |
| customer_sessions | Active sessions |
| customer_activity | Activity timeline |

---

## profiles Table

Primary customer table.

### Columns

| Column | Type | Nullable |
|--------|------|----------|
| id | UUID | No |
| auth_user_id | UUID | No |
| full_name | Text | No |
| email | Text | No |
| avatar_url | Text | Yes |
| country | Text | Yes |
| currency | Text | No |
| locale | Text | No |
| account_status | Enum | No |
| created_at | Timestamp | No |
| updated_at | Timestamp | No |
| deleted_at | Timestamp | Yes |

---

### Indexes

- email
- auth_user_id
- country
- account_status

---

### Relationships

| Related Table | Relationship |
|--------------|--------------|
| orders | One-to-many |
| licenses | One-to-many |
| downloads | One-to-many |
| notifications | One-to-many |
| audit_logs | One-to-many |

---

# Customer Preferences Table

Stores dashboard preferences.

| Field | Description |
|------|-------------|
| Theme | Light / Dark / System |
| Currency | Preferred display currency |
| Locale | Language |
| Timezone | User timezone |
| Email Preferences | Marketing / Updates |

One row per customer.

---

# Orders Module

Purpose:

Every purchase made by customers.

## Tables

| Table |
|------|
| orders |
| order_items |
| invoices |
| licenses |
| downloads |
| refunds |
| chargebacks |
| payment_attempts |

---

## orders Table

### Columns

| Column | Type |
|--------|------|
| id | UUID |
| profile_id | UUID |
| order_number | Text |
| product_id | UUID |
| payment_gateway | Enum |
| subtotal | Numeric |
| discount | Numeric |
| tax | Numeric |
| total | Numeric |
| currency | Text |
| payment_status | Enum |
| order_status | Enum |
| created_at | Timestamp |
| updated_at | Timestamp |

---

### Order Status Enum

- Pending
- Paid
- Failed
- Refunded
- Cancelled

Frozen values.

---

### Relationships

| Table | Relationship |
|-------|--------------|
| payments | One-to-many |
| licenses | One-to-many |
| invoices | One-to-one |
| downloads | One-to-many |

---

# Licenses Table

Purpose:

Control workbook ownership.

### Fields

| Field | Description |
|------|-------------|
| license_key | UUID |
| customer_id | Owner |
| product_id | Purchased workbook |
| release_id | Accessible version |
| download_limit | Integer |
| downloads_used | Integer |
| active | Boolean |
| expires_at | Timestamp (future subscriptions) |

Supports unlimited V1 updates.

---

# Downloads Table

Every workbook download recorded.

### Columns

| Column | Description |
|--------|-------------|
| download_id | UUID |
| license_id | UUID |
| release_id | Workbook version |
| downloaded_at | Timestamp |
| device | Browser |
| ip_address | Text |
| download_status | Enum |

Never delete download history.

---

# Payments Module

Purpose:

Store Stripe and Razorpay transactions.

## Tables

| Table |
|------|
| payments |
| payment_gateways |
| payment_events |
| refunds |
| settlements |
| webhook_events |

---

## payments Table

### Columns

| Column | Description |
|--------|-------------|
| id | UUID |
| order_id | UUID |
| gateway | Stripe / Razorpay |
| gateway_payment_id | External payment ID |
| amount | Numeric |
| currency | Text |
| status | Enum |
| payment_method | Text |
| country | Text |
| metadata | JSONB |
| created_at | Timestamp |

---

### Status Enum

- Created
- Authorized
- Captured
- Failed
- Refunded
- Cancelled

Frozen.

---

## Refunds Table

Tracks refunds independently.

Fields include:

- refund amount.
- refund reason.
- processed by.
- gateway refund ID.
- completed timestamp.

---

## Settlements Table

Tracks Razorpay settlement lifecycle.

Fields include:

- settlement ID.
- bank reference.
- settlement status.
- settlement amount.
- settlement date.

---

# Products Module

Purpose:

Workbook catalog.

## Tables

| Table |
|------|
| products |
| releases |
| changelogs |
| release_assets |
| release_notes |
| release_downloads |
| product_versions |

---

## products Table

Contains master workbook.

### Fields

- product name.
- slug.
- description.
- category.
- status.
- thumbnail.
- latest release ID.

---

## releases Table

Stores every workbook version.

### Fields

| Field | Description |
|------|-------------|
| version | v1.0.0 |
| build_number | Integer |
| release_date | Timestamp |
| changelog | Markdown |
| storage_path | Workbook file |
| file_size | Integer |
| checksum | SHA256 |

Supports rollback.

---

## Changelog Table

Stores markdown release notes.

Referenced by customer dashboard.

---

# Coupon Module

Purpose:

Coupon engine.

## Tables

| Table |
|------|
| coupons |
| coupon_usage |
| coupon_products |
| coupon_countries |
| coupon_campaigns |

---

## coupons Table

### Columns

- code
- description
- type
- percentage
- fixed_amount
- starts_at
- expires_at
- usage_limit
- active

---

### Coupon Type Enum

- Percentage
- Fixed
- Free Shipping (future)
- Bundle Discount (future)

---

# Email Module

Purpose:

Email history.

## Tables

| Table |
|------|
| email_templates |
| email_logs |
| email_events |
| suppression_list |
| email_campaigns |

---

## email_logs Table

Stores every transactional email.

Fields include:

- template.
- recipient.
- status.
- provider ID.
- delivered timestamp.
- opened timestamp.
- clicked timestamp.

---

# Notification Module

Purpose:

In-app notifications.

## Tables

| Table |
|------|
| notifications |
| notification_preferences |
| notification_events |
| notification_reads |
| notification_templates |

Supports customer and admin notifications.

---

# Analytics Module

Purpose:

Aggregated reporting.

## Tables

| Table |
|------|
| analytics_daily_revenue |
| analytics_products |
| analytics_customers |
| analytics_downloads |
| analytics_marketing |
| analytics_email |
| analytics_geo |
| analytics_devices |
| analytics_sources |
| analytics_conversion |
| analytics_retention |
| analytics_exports |

No transactional writes here.

Aggregated periodically.

---

# Operations Module

Purpose:

Live Operations Center.

## Tables

| Table |
|------|
| operations_service_health |
| operations_kpis |
| operations_api_cache |
| operations_sync_logs |
| operations_alerts |
| operations_deployments |
| operations_errors |
| operations_webhook_health |
| operations_marketing_cache |
| operations_email_cache |

Cache tables refreshed by background jobs.

---

# Audit Module

Purpose:

Immutable admin history.

## Tables

| Table |
|------|
| audit_logs |
| audit_entities |
| audit_changes |
| audit_exports |

Every admin action logged.

---

# Webhooks Module

Purpose:

Incoming webhook payloads.

## Tables

| Table |
|------|
| webhook_events |
| webhook_failures |
| webhook_retries |
| webhook_logs |

Never delete webhook history.

---

# Storage Metadata Module

Purpose:

Reference Supabase Storage.

## Tables

| Table |
|------|
| media_assets |
| storage_files |
| storage_usage |
| storage_cleanup_jobs |

Stores metadata only.

Files remain in buckets.

---

# System Configuration Module

Purpose:

Global application settings.

## Tables

| Table |
|------|
| app_settings |
| feature_flags |
| ppp_rules |
| currencies |
| countries |
| environments |

Used by admin settings.

---

# Primary UUID Strategy

Every business table uses UUID.

Rules:

- Generated server-side.
- Never sequential IDs.
- Never expose internal database IDs publicly.

---

# Timestamp Standards

Every table contains:

| Field |
|------|
| created_at |
| updated_at |

Soft-delete tables also include:

- deleted_at

Audit tables omit `updated_at`.

---

# Soft Delete Policy

Soft delete required for:

- customers
- products
- coupons
- releases
- media assets

Hard delete prohibited for business history.

---

# Foreign Key Rules

Examples:

| Parent | Child |
|--------|-------|
| profiles | orders |
| orders | payments |
| orders | licenses |
| products | releases |
| releases | downloads |
| coupons | coupon_usage |

Cascade only for lookup tables.

---

# Indexing Strategy

Indexes required on:

- foreign keys.
- email.
- order number.
- payment ID.
- license key.
- release version.
- coupon code.
- created_at timestamps.
- webhook event IDs.

Composite indexes defined later.

---

# JSONB Usage Rules

JSONB allowed only for:

- webhook payloads.
- payment metadata.
- analytics cache.
- external API cache.

Business entities remain relational.

---

# Materialized Views (V1)

Materialized views planned for reporting.

Examples:

- daily revenue summary.
- top products.
- customer lifetime value.
- download leaderboard.

Refreshed by cron.

---

# Trigger Strategy

Triggers perform:

- updated_at automation.
- audit logging.
- analytics enqueue.
- notification creation.
- webhook logging.

Business validation remains in services.

---

# Database Functions

Functions planned for:

- increment downloads.
- validate license.
- generate invoice number.
- update analytics cache.
- archive notifications.

Stored procedures limited to database-specific logic.

---

# Backup Strategy

Supabase backups:

- Daily (Pro).
- Point-in-time recovery (future).

FinanceOS never relies solely on application logs.

---

# Data Retention Policy

| Table | Retention |
|-------|-----------|
| Orders | Permanent |
| Payments | Permanent |
| Downloads | Permanent |
| Audit Logs | Permanent |
| Notifications | 2 Years |
| Analytics Cache | 90 Days |
| Webhook Payloads | 180 Days |
| Sync Logs | 90 Days |

---

# Cursor Migration Rules

Cursor must:

- Create schemas first.
- Create enums before tables.
- Create parent tables before child tables.
- Add indexes after tables.
- Add triggers after indexes.
- Generate TypeScript types after migrations.

Migration order is frozen.

---

# Frozen V1 Decisions

- PostgreSQL 16.
- UUID primary keys everywhere.
- Soft deletes for business entities.
- Immutable audit history.
- Separate analytics schema.
- Separate operations schema.
- Separate webhook schema.
- JSONB only for external metadata.
- Materialized views for reporting.
- 78 planned tables in V1 architecture.

---

# Next Document

**02_AUTH_AND_SECURITY.md**

The next backend specification defines:

- Supabase Authentication architecture.
- Customer authentication flow.
- Admin authentication flow.
- JWT lifecycle.
- Refresh tokens.
- Password reset.
- Email verification.
- Session management.
- Middleware protection.
- RBAC (Customer, Admin, Super Admin).
- MFA-ready architecture.
- API authorization middleware.
- Security headers.
- Rate limiting.
- CSRF strategy.
- Secure cookie policy.
- Device/session management.
- Account lockout and recovery.
