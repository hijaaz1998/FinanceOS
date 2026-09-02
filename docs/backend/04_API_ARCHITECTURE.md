# 04_API_ARCHITECTURE.md

## FinanceOS — Complete API Architecture & Endpoint Specification (V1)

**Document ID:** BACKEND-04

**Version:** 1.0 (Official V1)

**Status:** Frozen API Architecture

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Purpose

This document defines the complete REST API architecture for FinanceOS.

It specifies:

- API folder structure.
- Route naming conventions.
- Request/response standards.
- Authentication rules.
- Authorization rules.
- Validation standards.
- Pagination.
- Filtering.
- Sorting.
- Error handling.
- Health endpoints.
- Customer APIs.
- Admin APIs.
- Operations Center APIs.
- Analytics APIs.
- Download APIs.
- Integration APIs.
- Cursor implementation standards.

This document is the **single source of truth** for every backend endpoint.

---

# Dependencies

## Parent Backend Documents

- `00_BACKEND_MASTER.md`
- `01_SUPABASE_DATABASE_ARCHITECTURE.md`
- `02_AUTH_AND_SECURITY.md`
- `03_STORAGE_ARCHITECTURE.md`

## Referenced Documents

- Entire `/docs/web/user`
- Entire `/docs/web/admin`
- `11_OPERATIONS_CENTER_AND_INTEGRATIONS.md`

---

# API Technology (Frozen)

| Setting | Value |
|--------|-------|
| Framework | Next.js Route Handlers |
| Runtime | Node.js |
| API Style | REST |
| Response Format | JSON |
| Validation | Shared Schemas |
| Authentication | JWT via Supabase |
| Authorization | Middleware + RBAC |
| Versioning | V1 (No URL Version Prefix) |

---

# API Philosophy

FinanceOS APIs are **resource-oriented**.

Rules:

- Every endpoint represents a business resource.
- Business logic lives in Services.
- APIs only orchestrate requests and responses.
- Validation occurs before service execution.
- Every response follows one global contract.

---

# API Folder Structure

```text id="ubvtgp"
app/api/

auth/
customers/
orders/
payments/
checkout/
downloads/
licenses/
products/
releases/
coupons/
emails/
notifications/
analytics/
operations/
admin/
webhooks/
health/
system/
```

Every folder contains Route Handlers.

---

# Endpoint Naming Convention

Rules:

- Lowercase.
- Hyphen-separated.
- Plural resources.
- Nested resources when ownership exists.
- No verbs except action endpoints.

---

## Examples

```text id="a8zdd5"
/api/orders
/api/orders/{id}
/api/orders/{id}/invoice

/api/products
/api/products/{slug}
/api/products/{slug}/releases

/api/releases/latest

/api/customers/profile

/api/checkout/create-session

/api/downloads/workbook

/api/webhooks/stripe
```

Frozen convention.

---

# HTTP Method Standards

| Method | Purpose |
|--------|---------|
| GET | Fetch |
| POST | Create |
| PUT | Replace |
| PATCH | Partial Update |
| DELETE | Soft Delete |

No GET mutations.

---

# Global Response Format

## Success Response

```json id="nmnhx2"
{
  "success": true,
  "message": "Success",
  "data": {},
  "meta": {}
}
```

---

## Error Response

```json id="gc4rhh"
{
  "success": false,
  "error": {
    "code": "ORDER_NOT_FOUND",
    "message": "Order not found.",
    "details": {}
  }
}
```

Mandatory format.

---

# HTTP Status Code Standards

| Status | Meaning |
|--------|---------|
| 200 | Success |
| 201 | Resource Created |
| 204 | Empty Success |
| 400 | Validation Error |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 409 | Conflict |
| 422 | Business Rule Failed |
| 429 | Rate Limited |
| 500 | Internal Error |

No custom status codes.

---

# Authentication Categories

| API Type | Authentication |
|----------|----------------|
| Public | None |
| Customer | Required |
| Admin | Admin |
| Super Admin | Super Admin |

Every endpoint belongs to one category.

---

# API Middleware Pipeline

```text id="u08xjd"
Incoming Request
      │
Middleware
      │
JWT Validation
      │
Role Validation
      │
Request Validation
      │
Route Handler
      │
Business Service
      │
Database / External API
      │
Response Formatter
```

Frozen lifecycle.

---

# Pagination Standard

Every large list supports pagination.

Query Parameters:

| Parameter | Example |
|----------|---------|
| page | 1 |
| limit | 50 |
| cursor | UUID |

---

## Pagination Response

```json id="ejk3nw"
{
  "success": true,
  "data": [],
  "meta": {
    "page": 1,
    "limit": 50,
    "total": 842,
    "hasNextPage": true
  }
}
```

---

# Sorting Standard

Query:

```text id="dls1td"
sort=created_at

order=desc
```

Supported values:

- asc
- desc

---

# Filtering Standard

Examples:

```text id="zqb5qb"
status=paid

country=IN

currency=USD

product=budget-planner

gateway=stripe
```

Multiple filters supported.

---

# Search Standard

Global search parameter:

```text id="wj6gcr"
search=Hijaaz
```

Search implementation server-side.

---

# Rate Limiting Standard

| Endpoint Type | Limit |
|--------------|-------|
| Auth | Strict |
| Checkout | Medium |
| Downloads | Medium |
| Analytics | High |
| Operations | High |
| Admin Mutations | Medium |

Limits enforced in middleware.

---

# Customer API Module

Purpose:

Customer Dashboard.

## Customer Endpoints

| Endpoint | Method |
|----------|--------|
| /customers/profile | GET |
| /customers/profile | PATCH |
| /customers/preferences | GET |
| /customers/preferences | PATCH |
| /customers/devices | GET |
| /customers/devices/{id} | DELETE |
| /customers/activity | GET |

---

# Orders API Module

Purpose:

Customer orders.

Endpoints:

| Endpoint |
|----------|
| GET /orders |
| GET /orders/{id} |
| GET /orders/{id}/invoice |
| GET /orders/{id}/license |

Supports customer ownership only.

---

# Checkout API Module

Purpose:

Purchase workflow.

Endpoints:

| Endpoint |
|----------|
| POST /checkout/create-session |
| POST /checkout/validate-price |
| POST /checkout/validate-coupon |
| GET /checkout/session/{id} |
| POST /checkout/cancel |

Used by website checkout.

---

# Payments API Module

Purpose:

Payment lifecycle.

Endpoints:

| Endpoint |
|----------|
| GET /payments |
| GET /payments/{id} |
| POST /payments/refund |
| GET /payments/history |
| GET /payments/settlements |

Admin protected.

---

# Downloads API Module

Purpose:

Workbook downloads.

Endpoints:

| Endpoint |
|----------|
| GET /downloads |
| GET /downloads/workbook |
| GET /downloads/history |
| POST /downloads/retry |
| GET /downloads/latest-release |

Signed URL generated server-side.

---

# Licenses API Module

Purpose:

Ownership verification.

Endpoints:

| Endpoint |
|----------|
| GET /licenses |
| GET /licenses/{id} |
| GET /licenses/verify |
| POST /licenses/restore |

Customer only.

---

# Products API Module

Purpose:

Public catalog.

Endpoints:

| Endpoint |
|----------|
| GET /products |
| GET /products/{slug} |
| GET /products/{slug}/releases |
| GET /products/categories |

Public endpoints.

---

# Releases API Module

Purpose:

Version management.

Endpoints:

| Endpoint |
|----------|
| GET /releases/latest |
| GET /releases/{id} |
| POST /releases |
| PATCH /releases/{id} |
| POST /releases/publish |
| POST /releases/archive |

Admin protected.

---

# Coupons API Module

Purpose:

Coupon engine.

Endpoints:

| Endpoint |
|----------|
| POST /coupons/validate |
| GET /coupons |
| POST /coupons |
| PATCH /coupons/{id} |
| DELETE /coupons/{id} |

Validation endpoint public during checkout.

---

# Email API Module

Purpose:

Transactional emails.

Endpoints:

| Endpoint |
|----------|
| GET /emails/logs |
| POST /emails/send-test |
| GET /emails/templates |
| PATCH /emails/templates/{id} |
| GET /emails/events |

Admin only.

---

# Notification API Module

Purpose:

Customer notifications.

Endpoints:

| Endpoint |
|----------|
| GET /notifications |
| PATCH /notifications/read |
| PATCH /notifications/read-all |
| DELETE /notifications/{id} |
| GET /notifications/preferences |

---

# Analytics API Module

Purpose:

Admin analytics dashboard.

Endpoints:

| Endpoint |
|----------|
| GET /analytics/revenue |
| GET /analytics/customers |
| GET /analytics/products |
| GET /analytics/downloads |
| GET /analytics/marketing |
| GET /analytics/email |
| GET /analytics/countries |
| GET /analytics/devices |
| GET /analytics/sources |

Returns aggregated metrics.

---

# Operations Center API Module

Purpose:

Operations Center dashboard.

Endpoints:

| Endpoint |
|----------|
| GET /operations/dashboard |
| GET /operations/services |
| GET /operations/payments |
| GET /operations/marketing |
| GET /operations/emails |
| GET /operations/database |
| GET /operations/storage |
| GET /operations/deployments |
| GET /operations/errors |
| GET /operations/webhooks |
| GET /operations/alerts |

Largest API module.

---

# Admin API Module

Purpose:

Admin Portal actions.

Endpoints include:

- Customer CRUD.
- Order management.
- Release publishing.
- Coupon management.
- Content uploads.
- Feature flags.
- Audit exports.

Admin protected.

---

# Health API Module

Purpose:

System monitoring.

Endpoints:

| Endpoint |
|----------|
| GET /health |
| GET /health/database |
| GET /health/storage |
| GET /health/email |
| GET /health/payments |
| GET /health/integrations |

Operations Center consumes these.

---

# Webhook API Module

Purpose:

Receive external events.

Endpoints:

| Endpoint |
|----------|
| POST /webhooks/stripe |
| POST /webhooks/razorpay |
| POST /webhooks/resend |
| POST /webhooks/meta |

Public endpoints with signature verification.

---

# System API Module

Purpose:

Application settings.

Endpoints:

| Endpoint |
|----------|
| GET /system/settings |
| PATCH /system/settings |
| GET /system/features |
| PATCH /system/features |

Super Admin only.

---

# Request Validation Rules

Every mutation validates:

- Body.
- Params.
- Query.
- Authentication.
- Authorization.

Validation before service execution.

---

# Error Code Naming

Examples:

| Code |
|------|
| AUTH_INVALID_SESSION |
| ORDER_ALREADY_REFUNDED |
| PAYMENT_SIGNATURE_FAILED |
| COUPON_EXPIRED |
| DOWNLOAD_LICENSE_INVALID |
| RELEASE_NOT_PUBLISHED |
| STORAGE_UPLOAD_FAILED |

Codes centralized.

---

# Idempotency Rules

Required for:

- Checkout creation.
- Refund requests.
- Webhook processing.
- Email sending.

Duplicate requests return previous result.

---

# API Logging Rules

Logged information:

- Endpoint.
- Method.
- Duration.
- Status.
- User ID.
- Request ID.
- Error Code.

PII excluded where unnecessary.

---

# API Timeout Targets

| Endpoint Category | Target |
|------------------|--------|
| Auth | 250ms |
| Checkout | 500ms |
| Downloads | 300ms |
| Analytics | 800ms |
| Operations | 1000ms |
| Health | 200ms |

---

# Cursor Implementation Rules

Cursor must:

- Keep Route Handlers thin.
- Call services only.
- Use shared validation schemas.
- Return standard response format.
- Use centralized error codes.
- Implement pagination consistently.
- Enforce authentication middleware.
- Enforce RBAC server-side.
- Log API duration.

---

# Frozen V1 Decisions

- REST API architecture.
- Next.js Route Handlers only.
- No GraphQL.
- No version prefix (`/v1`).
- Standard response contract.
- Shared pagination/filter/sort/search format.
- Middleware-first security.
- Approximately 130–150 endpoints across FinanceOS.

All API architecture decisions are frozen for V1.

---

# Next Document

**05_WEBHOOK_ARCHITECTURE.md**

The next backend specification defines:

- Stripe webhook verification.
- Razorpay webhook verification.
- Resend webhook processing.
- Meta Conversion API events.
- Webhook retry system.
- Idempotency.
- Webhook logging.
- Dead-letter queue.
- Operations Center webhook monitoring.
- Security signatures.
- Retry scheduler.
- Cursor webhook implementation rules.
