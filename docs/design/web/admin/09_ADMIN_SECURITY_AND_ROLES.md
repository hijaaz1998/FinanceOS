# 09_ADMIN_SECURITY_AND_ROLES.md

## FinanceOS — Admin Authentication, Security, Roles & Audit System Specification

**Document ID:** WEB-ADMIN-09

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Admin Security & Roles)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/admin`

---

## Dependencies

- `00_ADMIN_MASTER.md`
- `01_ADMIN_LAYOUT_AND_NAVIGATION.md`
- `02_CUSTOMER_MANAGEMENT.md`
- `03_ORDER_AND_LICENSE_MANAGEMENT.md`
- `04_PRODUCT_RELEASE_MANAGEMENT.md`
- `05_PAYMENT_AND_COUPON_SYSTEM.md`
- `06_EMAIL_AND_NOTIFICATION_CENTER.md`
- `docs/web/user/08_AUTH_AND_USER_ACCOUNTS.md`
- `docs/web/user/13_PERFORMANCE_ACCESSIBILITY_SECURITY.md`
- `docs/design/00_DESIGN_MASTER.md`

---

# Purpose

This document defines the complete **Admin Security Architecture** for FinanceOS.

It covers:

- Admin authentication.
- Authorization and permissions.
- Role-based access control (RBAC).
- Protected routes.
- Session management.
- Audit logging.
- Sensitive actions.
- Security monitoring.
- Login history.
- Security settings.

This document is the **single source of truth** for Cursor when implementing admin security.

---

# Security Philosophy

The Admin Portal controls the entire FinanceOS business.

Security follows one principle:

> **Every sensitive action must be authenticated, authorized, and permanently logged.**

There is no anonymous or shared admin access.

Every action is attributable to one administrator.

---

# Security Objectives

| Objective | Purpose |
|-----------|---------|
| Secure Authentication | Protect admin accounts. |
| Route Protection | Prevent unauthorized access. |
| Role-Based Permissions | Control access by role. |
| Audit Logging | Record every critical action. |
| Session Security | Secure login sessions. |
| Threat Detection | Detect suspicious activity. |

---

# Security Architecture

```text id="mv0x2u"
Admin Login
     │
     ▼
Supabase Authentication
     │
     ▼
Admin Verification
     │
     ▼
Role Authorization
     │
     ▼
Protected Admin Portal
     │
     ▼
Audit Logging
```

This authentication flow is frozen.

---

# Admin Authentication System

Version 1 uses **Supabase Authentication**.

Authentication includes:

- Email login.
- Password login.
- Email verification.
- Secure sessions.
- Password reset.
- Logout.

No social login in Version 1.

---

# Authentication Workflow

```text id="f2mbiq"
Admin Login
     │
Credentials Verified
     │
Session Created
     │
Admin Dashboard
     │
Session Refresh
     │
Logout
```

---

# Admin Login Requirements

Every admin account requires:

| Requirement | Required |
|------------|----------|
| Email Address | Yes |
| Password | Yes |
| Email Verified | Yes |
| Admin Role Assigned | Yes |

---

# Admin Login Page

Route:

```text id="pfx0ux"
/admin/login
```

Contains:

- FinanceOS Admin branding.
- Email field.
- Password field.
- Show password toggle.
- Forgot password.
- Login button.

---

# Password Policy

Admin passwords require:

| Rule | Requirement |
|------|-------------|
| Minimum Length | 8 characters |
| Uppercase Letter | Required |
| Lowercase Letter | Required |
| Number | Required |
| Special Character | Required |

Weak passwords rejected.

---

# Password Reset Workflow

```text id="vu2jzz"
Forgot Password
      │
Email Sent
      │
Reset Link
      │
Create New Password
      │
Session Invalidated
```

Old sessions revoked.

---

# Email Verification Rules

Admin account must verify email before access.

Verification required only once.

Unverified admins cannot access dashboard.

---

# Session Management

Admin sessions are protected.

---

## Session Rules

| Rule | Value |
|------|-------|
| HTTPS Only | Yes |
| Secure Cookies | Yes |
| Refresh Tokens | Yes |
| Automatic Session Refresh | Yes |
| Logout Invalidates Session | Yes |

---

# Session Timeout

Version 1 timeout policy.

| Event | Timeout |
|------|---------|
| Inactive Session | 30 minutes |
| Active Session | Refresh automatically |
| Password Changed | Force logout everywhere |

---

# Multi-Device Sessions

Version 1 supports multiple devices.

Each session logged independently.

Future "Log Out Other Devices" reserved.

---

# Route Protection

Every `/admin/*` route is protected.

Protected routes include:

```text id="kfw9z9"
/admin
/admin/customers
/admin/orders
/admin/payments
/admin/releases
/admin/analytics
/admin/settings
```

Middleware required.

---

# Unauthorized Access Flow

```text id="w56xg0"
User Visits Admin Route
         │
Session Missing
         │
Redirect to Login
```

Unauthorized access logged.

---

# Authorization System (RBAC)

Version 1 supports **role-based authorization**.

---

# Role Model

## Version 1 Roles

| Role | Access |
|------|--------|
| Super Admin | Full access. |

Version 2 reserved roles:

- Support Admin.
- Marketing Admin.
- Finance Admin.
- Read Only Admin.

Architecture prepared now.

---

# Permission Matrix

Version 1 permission model.

| Module | Super Admin |
|--------|-------------|
| Dashboard | Full |
| Customers | Full |
| Orders | Full |
| Payments | Full |
| Coupons | Full |
| Releases | Full |
| Emails | Full |
| Analytics | Full |
| Content Library | Full |
| Settings | Full |

---

# Future Permission Matrix

Reserved.

| Module | Support | Marketing | Finance |
|--------|---------|-----------|--------|
| Customers | Yes | Read | Read |
| Orders | Limited | Read | Full |
| Payments | Read | Read | Full |
| Analytics | Read | Full | Full |

Not implemented in V1.

---

# Admin User Management

Purpose:

Manage internal administrators.

---

# Admin Table

| Column | Description |
|--------|-------------|
| Admin Name | Display name |
| Email | Login email |
| Role | Super Admin |
| Status | Active / Disabled |
| Last Login | Timestamp |
| Created Date | Account creation |
| Actions | View Profile |

---

# Admin Profile Page

Displays:

- Name.
- Email.
- Role.
- Created date.
- Last login.
- Session count.
- Activity summary.

---

# Admin Status System

| Status | Meaning |
|--------|---------|
| Active | Can access admin portal. |
| Disabled | Login blocked. |
| Pending | Email verification pending. |

---

# Admin Creation Workflow

```text id="qep5v0"
Create Admin
      │
Assign Role
      │
Verification Email Sent
      │
Admin Activates Account
```

Version 1 only Super Admin creation.

---

# Disable Admin Workflow

```text id="yqq9vw"
Disable Admin
      │
Confirmation Modal
      │
Sessions Revoked
      │
Access Removed
```

Audit log generated.

---

# Audit Logging System

Purpose:

Track every sensitive admin action.

Audit logs are immutable.

---

# Audit Log Dashboard

Top KPIs.

| KPI | Description |
|-----|-------------|
| Actions Today | Total admin actions. |
| Failed Login Attempts | Security metric. |
| Sensitive Actions | Refunds, releases, coupons. |
| Active Sessions | Current sessions. |

---

# Audit Log Table

| Column | Description |
|--------|-------------|
| Timestamp | Action time |
| Admin | Administrator |
| Module | Customers / Orders / Releases |
| Action | Action performed |
| Object | Customer / Order / Coupon |
| Result | Success / Failed |

---

# Logged Actions

Version 1 logs these actions.

## Authentication

- Login.
- Logout.
- Password reset.
- Password changed.

## Customers

- Disable customer.
- Enable customer.
- Resend verification.
- Restore downloads.

## Orders

- Refund approved.
- Refund rejected.
- Invoice resent.

## Payments

- Coupon created.
- Coupon disabled.
- PPP price updated.

## Releases

- Release created.
- Release published.
- Rollback executed.

## Emails

- Broadcast scheduled.
- Broadcast cancelled.
- Retry failed email.

## Settings

- Theme changed.
- Environment updated (future).
- Admin created.

---

# Sensitive Action Confirmation

Confirmation required for:

| Action | Confirmation |
|--------|--------------|
| Publish Release | Yes |
| Refund Customer | Yes |
| Disable Customer | Yes |
| Disable Admin | Yes |
| Rollback Release | Yes |
| Delete Coupon | Yes |

---

# Confirmation Modal Rules

Displays:

- Action summary.
- Object affected.
- Warning message.
- Confirmation button.

Requires explicit confirmation.

---

# Security Event Timeline

Tracks security events.

Examples:

- Login successful.
- Login failed.
- Password changed.
- Session expired.
- Admin disabled.

Chronological order.

---

# Login History

Purpose:

Track administrator logins.

---

# Login History Table

| Column | Description |
|--------|-------------|
| Timestamp | Login time |
| Admin | Email |
| Country | Region only |
| Device | Browser/Device |
| Status | Success / Failed |

IP addresses are not displayed.

---

# Failed Login Detection

Security panel displays:

| Metric | Description |
|--------|-------------|
| Failed Attempts Today | Count |
| Failed Attempts This Week | Count |
| Locked Accounts | Future |
| Suspicious Activity | Future |

---

# Suspicious Activity Rules

Events flagged.

Examples:

- Multiple failed logins.
- New device login.
- Password reset followed by login.
- Session token mismatch.

Logged for review.

---

# Session Monitor

Purpose:

View active admin sessions.

---

# Active Session Table

| Column | Description |
|--------|-------------|
| Session ID | Identifier |
| Admin | Logged-in admin |
| Started At | Login time |
| Last Active | Timestamp |
| Device | Browser |
| Status | Active |

---

# Session Actions

| Action | Version 1 |
|--------|-----------|
| Revoke Session | Yes |
| Revoke All Sessions | Future |
| View Session | Yes |

---

# Revoke Session Workflow

```text id="qzzqnm"
Revoke Session
      │
Confirmation
      │
Session Deleted
      │
Admin Logged Out
```

---

# Security Settings Page

Contains security preferences.

---

## Security Settings

| Setting | Version 1 |
|---------|-----------|
| Session Timeout | Configurable |
| Password Policy | Enabled |
| Email Verification | Required |
| Login Notifications | Enabled |
| Audit Logging | Enabled |

---

# Security Notifications

Admins receive notifications for:

- New admin login.
- Failed login attempts.
- Password changed.
- New admin account created.
- Release rollback executed.

---

# Environment Security (Read Only)

Displays environment health.

| Secret | Visible |
|--------|----------|
| Supabase URL | Masked |
| Stripe Keys | Masked |
| Razorpay Keys | Masked |
| SMTP Keys | Masked |

Secrets never displayed fully.

---

# Middleware Security Rules

Middleware validates:

1. Session exists.
2. Session valid.
3. User role valid.
4. Route permission valid.

Reject unauthorized requests.

---

# API Authorization Rules

Every admin API endpoint checks:

- Authenticated user.
- Role.
- Session validity.
- CSRF protection (future).

---

# CSRF Protection

Prepared architecture.

Future implementation reserved.

---

# Rate Limiting

Admin authentication endpoints.

| Endpoint | Limit |
|----------|-------|
| Login | Limited attempts |
| Password Reset | Limited attempts |
| Email Verification | Limited attempts |

---

# Security Dashboard Alerts

Alert examples.

| Alert | Severity |
|-------|----------|
| Failed Login Spike | High |
| Payment Webhook Failure | High |
| Email Service Failure | Medium |
| Download Service Failure | Medium |
| Session Expiration | Low |

---

# Security Export System

Export audit logs.

Supported formats.

| Format | Version 1 |
|--------|-----------|
| CSV | Yes |
| Excel | Yes |
| PDF | Future |

---

# Empty States

Examples.

## No Audit Logs

"No audit events recorded."

## No Active Sessions

"No active administrator sessions."

---

# Loading States

Skeleton loaders for:

- Audit logs.
- Login history.
- Session monitor.
- Admin table.

---

# Responsive Behavior

## Desktop

Full audit dashboard.

## Tablet

Reduced columns.

## Mobile

Cards replace tables.

---

# Accessibility Rules

Supports:

- Accessible tables.
- Keyboard navigation.
- Focus indicators.
- Accessible confirmation dialogs.
- Accessible login forms.

---

# Performance Targets

| Interaction | Target |
|------------|--------|
| Admin Login | Under 1 second |
| Audit Log Search | Under 300ms |
| Session Revoke | Under 500ms |
| Security Dashboard Load | Under 800ms |

---

# Database Fields Referenced

## Admin Users

| Field | Purpose |
|------|---------|
| Admin ID | Primary identifier |
| Email | Authentication |
| Role | Authorization |
| Status | Account state |
| Last Login | Security history |

## Audit Logs

| Field | Purpose |
|------|---------|
| Audit ID | Primary identifier |
| Admin ID | Actor |
| Module | Area affected |
| Action | Logged action |
| Timestamp | Event time |

## Sessions

| Field | Purpose |
|------|---------|
| Session ID | Active session |
| Device | Browser/device |
| Last Active | Session activity |
| Status | Active/Revoked |

---

# Cursor Components

| Component | Used In |
|-----------|---------|
| AdminLoginForm | Login page |
| AdminTable | User management |
| AuditLogTable | Audit dashboard |
| SessionTable | Session monitor |
| SecurityAlertCard | Security dashboard |
| LoginHistoryTable | Login history |
| ConfirmationModal | Sensitive actions |
| SecuritySettingsCard | Settings page |

---

# Cursor Implementation Rules

Cursor must:

1. Protect all `/admin` routes with middleware.
2. Implement Supabase authentication.
3. Implement role-based authorization architecture.
4. Record immutable audit logs.
5. Build login history dashboard.
6. Build active session monitor.
7. Require confirmation for sensitive actions.
8. Never expose secrets to the frontend.

---

# Frozen Decisions (Version 1)

The following Admin Security decisions are locked.

- Supabase authentication.
- Super Admin role only.
- Protected admin middleware.
- Immutable audit logs.
- Session timeout policy.
- Sensitive action confirmation.
- Login history tracking.
- Session monitoring.
- Masked environment secrets.

---

# Version History

## Version 1.0

Official FinanceOS Admin Security & Roles specification defining authentication architecture, RBAC permissions, protected routes, audit logging, session management, login history, security dashboard, sensitive action workflows, and Cursor implementation standards.

---

**End of Document**

**File:** `09_ADMIN_SECURITY_AND_ROLES.md`
