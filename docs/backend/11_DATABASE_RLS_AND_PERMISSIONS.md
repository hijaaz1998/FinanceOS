# 11_DATABASE_RLS_AND_PERMISSIONS.md

## FinanceOS — Complete Row Level Security (RLS), Permissions & Access Control Specification (V1)

**Document ID:** BACKEND-11

**Version:** 1.0 (Official V1)

**Status:** Frozen Database Security Architecture

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Purpose

This document defines the complete **Row Level Security (RLS)** and permissions architecture for FinanceOS.

It specifies:

- PostgreSQL Row Level Security policies.
- Customer permissions.
- Admin permissions.
- Super Admin permissions.
- Storage bucket permissions.
- API permission matrix.
- Operations Center permissions.
- Analytics permissions.
- Notification permissions.
- Audit log permissions.
- Feature flag permissions.
- Service Role usage.
- SQL policy structure.
- Cursor implementation rules.

This document is the **single source of truth** for all database access control inside FinanceOS.

---

# Dependencies

## Parent Backend Documents

- `00_BACKEND_MASTER.md`
- `01_SUPABASE_DATABASE_ARCHITECTURE.md`
- `02_AUTH_AND_SECURITY.md`
- `03_STORAGE_ARCHITECTURE.md`
- `04_API_ARCHITECTURE.md`

## Referenced Documents

- `09_ADMIN_SECURITY_AND_ROLES.md`
- `11_OPERATIONS_CENTER_AND_INTEGRATIONS.md`
- `10_ENVIRONMENT_VARIABLES_AND_SECRETS.md`

## Referenced Integration Documents

- /docs/integrations/09_SUPABASE_SERVICES.md

---

# RLS Philosophy

FinanceOS follows **defense-in-depth security**.

Security is enforced at three layers:

| Layer | Responsibility |
|--------|----------------|
| Middleware | Authentication |
| API Services | Authorization |
| PostgreSQL RLS | Data Isolation |

Even if an API has a bug, RLS prevents unauthorized data access.

---

# Permission Hierarchy

```text
Super Admin
      │
      ▼
   Admin
      │
      ▼
  Customer
```

Inheritance flows downward.

Customers never inherit admin permissions.

---

# Authentication Context

Supabase automatically injects:

- Auth User ID
- JWT Claims
- Session
- Role Metadata

RLS policies reference authenticated user context.

---

# Permission Model Overview

FinanceOS uses **RBAC + RLS**.

## RBAC

Role determines capabilities.

## RLS

Row determines visibility.

Example:

Customer role can query `orders`, but only rows belonging to that customer.

---

# User Roles (Frozen)

| Role | Purpose |
|------|---------|
| customer | FinanceOS customer |
| admin | Internal administrator |
| super_admin | FinanceOS owner |

Stored in `profiles.role`.

---

# Global Permission Categories

| Category | Examples |
|----------|----------|
| Read | View resources |
| Create | Insert records |
| Update | Modify owned records |
| Delete | Soft delete |
| Manage | Administrative actions |

Permissions are enforced in APIs and RLS.

---

# Customer RLS Policy

Customers may only access resources they own.

## Accessible Resources

| Table | Access |
|-------|--------|
| profiles | Own row |
| orders | Own rows |
| licenses | Own rows |
| downloads | Own rows |
| invoices | Own rows |
| notifications | Own rows |
| customer_preferences | Own row |
| customer_devices | Own devices |

No cross-customer visibility.

---

# Profiles RLS

## Customer

| Action | Allowed |
|--------|---------|
| SELECT | Own profile |
| UPDATE | Own editable fields |
| DELETE | No |
| INSERT | Managed by signup flow |

Restricted fields cannot be updated directly.

---

# Editable Profile Fields

Customers may update:

- Name.
- Avatar.
- Locale.
- Currency.
- Timezone.
- Notification preferences.

Cannot update:

- Role.
- Email verification.
- Account status.

---

# Orders RLS

Customer policy:

- Read own orders.
- Never update orders.
- Never delete orders.

Orders are immutable customer records.

---

# Licenses RLS

Customers may:

- Read owned licenses.
- Verify download eligibility.
- Cannot modify licenses.

License generation handled by backend.

---

# Downloads RLS

Customers may:

- Read download history.
- Request signed download URL.
- Cannot insert download records manually.

Download logging handled by backend.

---

# Notifications RLS

Customer permissions:

| Action | Allowed |
|--------|---------|
| Read | Own notifications |
| Update | Mark as read |
| Delete | Soft delete own notification |

Cannot modify notification content.

---

# Customer Preferences RLS

One row per customer.

Permissions:

- Read own preferences.
- Update own preferences.
- No delete.

---

# Customer Devices RLS

Permissions:

- Read own devices.
- Delete trusted device.
- No insert/update manually.

Managed by authentication service.

---

# Admin RLS Philosophy

Admins require broader visibility.

Admin bypasses customer ownership policies for operational tables.

Still restricted from infrastructure tables.

---

# Admin Accessible Tables

| Table | Access |
|-------|--------|
| profiles | Read all |
| orders | Read/update all |
| licenses | Read/update all |
| downloads | Read all |
| products | Full CRUD |
| releases | Full CRUD |
| coupons | Full CRUD |
| notifications | Read/create all |
| analytics | Read all |
| operations | Read all |

---

# Admin Restrictions

Admins cannot:

- Read service role secrets.
- Modify super_admin accounts.
- Delete audit history.
- Access backups bucket.
- Change integration secrets.

---

# Super Admin RLS

Super Admin permissions:

Everything Admin plus:

- Environment settings.
- Feature flags.
- Integration configuration.
- Secret rotation.
- Webhook replay.
- Backup management.

Highest privilege role.

---

# Service Role Usage

Service Role bypasses RLS.

Allowed only inside:

- Edge Functions.
- Background Workers.
- Server Services.
- Migration scripts.

Never client-side.

---

# Public Table Policies

Some tables are readable without authentication.

| Table | Policy |
|-------|--------|
| products | Public Read |
| releases (published only) | Public Read |
| product_categories | Public Read |
| public_settings | Public Read |

Draft releases hidden.

---

# Products RLS

Public:

- Read active products.

Admin:

- Create.
- Update.
- Archive.

Customers cannot modify products.

---

# Releases RLS

Public:

- Read published release metadata.

Customers:

- Read latest release if licensed.

Admins:

- Full CRUD.

Draft releases hidden from customers.

---

# Coupons RLS

Customers:

- Cannot list coupons.
- Can validate coupon through API.

Admins:

- Full CRUD.

Coupon visibility stays server-side.

---

# Analytics Schema Permissions

Analytics tables are admin-only.

| Role | Access |
|------|--------|
| Customer | None |
| Admin | Read |
| Super Admin | Read/Manage |

Aggregation workers use Service Role.

---

# Operations Schema Permissions

Operations Center data.

| Role | Access |
|------|--------|
| Customer | None |
| Admin | Read |
| Super Admin | Read/Manage |

Manual sync requires Super Admin for integrations.

---

# Audit Schema Permissions

Audit logs are immutable.

Permissions:

| Role | Access |
|------|--------|
| Customer | None |
| Admin | Read |
| Super Admin | Read |
| Service Role | Insert |

Updates and deletes prohibited.

---

# Email Schema Permissions

Customers:

- Read own email history (future support).
- No template access.

Admins:

- Read logs.
- Manage templates.
- Queue emails.

Super Admin:

- Manage provider settings.

---

# Notification Schema Permissions

Notifications isolated by owner.

Admins can create notifications for customers.

Customers cannot create arbitrary notifications.

---

# Webhook Schema Permissions

Webhook tables are private.

| Role | Access |
|------|--------|
| Customer | None |
| Admin | Read |
| Super Admin | Read |
| Service Role | Insert/Update |

---

# Storage Bucket Permissions

## Releases Bucket

Customer:

- Download licensed release through signed URL only.

Admin:

- Upload.
- Archive.

Super Admin:

- Delete old releases.

---

## Media Library Bucket

Customer:

- Read assets referenced in purchased content.

Admin:

- Upload.
- Replace.
- Delete.

---

## Avatar Bucket

Customer:

- Read/write own avatar.

Admin:

- Read all avatars.

Super Admin:

- Full management.

---

## Invoice Bucket

Customer:

- Read own invoices.

Admin:

- Read all invoices.

Delete prohibited.

---

## Marketing Assets Bucket

Public:

- Read optimized public assets.

Admin:

- Upload.
- Replace.
- Archive.

---

## Exports Bucket

Customers:

- Read own exports.

Admins:

- Read generated exports.

Cleanup worker removes expired files.

---

## Temporary Bucket

Owner-only visibility.

Cleanup worker deletes expired files.

---

## Backup Bucket

Only Super Admin and Service Role.

No customer or admin access.

---

# Storage Policy Matrix

| Bucket | Customer | Admin | Super Admin |
|--------|----------|-------|-------------|
| releases | Signed Read | Upload | Full |
| media-library | Read | Full | Full |
| avatars | Own | Read All | Full |
| invoices | Own | Read All | Full |
| exports | Own | Read All | Full |
| temporary | Own | Full | Full |
| backups | None | None | Full |
| system-assets | Public Read | Upload | Full |

Frozen matrix.

---

# Feature Flag Permissions

Feature flags stored in database.

Permissions:

| Role | Access |
|------|--------|
| Customer | Read enabled public flags only |
| Admin | Read |
| Super Admin | Full CRUD |

---

# Environment Settings Permissions

Only Super Admin may:

- Modify API tokens.
- Rotate secrets.
- Enable integrations.
- Change deployment configuration.

---

# Operations Manual Actions

Permissions:

| Action | Admin | Super Admin |
|--------|-------|-------------|
| Refresh Analytics Cache | Yes | Yes |
| Replay Webhook | No | Yes |
| Rotate Secret | No | Yes |
| Manual Sync Provider | Yes | Yes |
| Clear Dead Letter Queue | No | Yes |

---

# Row Ownership Rules

Ownership fields:

| Table | Owner Column |
|-------|--------------|
| profiles | id |
| orders | profile_id |
| licenses | profile_id |
| downloads | profile_id |
| notifications | profile_id |
| customer_preferences | profile_id |

RLS policies use ownership field.

---

# Soft Delete Visibility

Customers never see soft-deleted rows.

Admins may view archived records through filters.

Super Admin may restore archived entities.

---

# API Permission Matrix

| Module | Customer | Admin | Super Admin |
|--------|----------|-------|-------------|
| Profile | Read/Update Own | Read All | Full |
| Orders | Read Own | Read All | Full |
| Products | Read Public | CRUD | CRUD |
| Releases | Read Published | CRUD | CRUD |
| Coupons | Validate | CRUD | CRUD |
| Analytics | None | Read | Manage |
| Operations | None | Read | Manage |
| Settings | None | None | Manage |

Frozen permission matrix.

---

# Database Functions & RLS

Functions executed with security definer only when required.

Examples:

- Generate signed download URL.
- Increment download count.
- Create notification.
- Archive expired export.

Security reviewed individually.

---

# Policy Naming Convention

```text
profiles_select_own

orders_select_customer

orders_admin_manage

notifications_mark_read

releases_public_select
```

Consistent SQL policy naming.

---

# Security Testing Requirements

Every table must have tests for:

- Customer isolation.
- Admin visibility.
- Unauthorized rejection.
- Service role bypass.
- Soft delete visibility.

Cursor must generate RLS tests.

---

# Audit Requirements

Every privileged mutation records:

- Actor.
- Resource.
- Action.
- Previous value.
- New value.
- Timestamp.
- Role.

Immutable audit trail.

---

# Cursor Implementation Rules

Cursor must:

- Enable RLS on every protected table.
- Create policies before exposing APIs.
- Use ownership-based customer policies.
- Keep admin policies separate.
- Never expose Service Role to client.
- Protect storage buckets with policies.
- Generate SQL migrations for policies.
- Test RLS behavior.

---

# Frozen V1 Decisions

- RLS enabled on all business tables.
- RBAC with three roles.
- Ownership-based customer access.
- Admin operational access.
- Super Admin infrastructure access.
- Service Role only server-side.
- Storage bucket policies enforced.
- Immutable audit tables.
- Feature flag restrictions.
- Operations Center admin-only.

All RLS and permission decisions are frozen for V1.

---

# Next Document

**12_BACKEND_IMPLEMENTATION_CHECKLIST.md**

The final backend specification defines:

- Backend implementation roadmap.
- Migration order.
- Supabase setup checklist.
- Storage setup checklist.
- Authentication setup checklist.
- API implementation order.
- Payment implementation order.
- Email implementation order.
- Operations Center implementation order.
- Testing checklist.
- Production readiness checklist.
- Cursor build sequence.
