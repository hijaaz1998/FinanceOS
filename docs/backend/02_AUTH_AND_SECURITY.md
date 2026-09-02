# 02_AUTH_AND_SECURITY.md

## FinanceOS — Authentication, Authorization & Security Architecture (V1)

**Document ID:** BACKEND-02

**Version:** 1.0 (Official V1)

**Status:** Frozen Authentication & Security Specification

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Purpose

This document defines the complete authentication, authorization, session management, and security architecture for FinanceOS.

It covers:

- Customer authentication.
- Admin authentication.
- Session lifecycle.
- JWT architecture.
- Middleware security.
- Role-Based Access Control (RBAC).
- API authorization.
- Password reset.
- Email verification.
- Device management.
- Security headers.
- Rate limiting.
- CSRF protection.
- Account recovery.
- Audit security events.

This is the **single source of truth** for all authentication and security implementation.

---

# Dependencies

## Parent Backend Documents

- `00_BACKEND_MASTER.md`
- `01_SUPABASE_DATABASE_ARCHITECTURE.md`

## Referenced Documents

- `09_ADMIN_SECURITY_AND_ROLES.md`
- `11_OPERATIONS_CENTER_AND_INTEGRATIONS.md`
- `10_ADMIN_IMPLEMENTATION_CHECKLIST.md`

---

# Authentication Stack (Frozen)

| Layer | Technology |
|--------|------------|
| Identity Provider | Supabase Auth |
| Authentication Method | Email + Password |
| Session Tokens | JWT |
| Session Storage | Secure HTTP Cookies |
| Password Hashing | Managed by Supabase |
| Refresh Tokens | Supabase |
| MFA Support | Architecture Ready (Disabled V1) |
| OAuth Providers | Deferred (V2) |

---

# Authentication Philosophy

FinanceOS uses **Supabase Auth** as the identity provider.

Authentication is separated from authorization.

| Authentication | Authorization |
|---------------|--------------|
| Who is the user? | What can the user access? |

Supabase answers identity.

FinanceOS backend answers permissions.

---

# User Types

FinanceOS supports three user roles.

## Customer

Permissions:

- Login.
- Purchase products.
- Download purchased workbooks.
- Manage profile.
- View invoices.
- Receive notifications.

No admin access.

---

## Admin

Permissions:

- Full Admin Portal.
- Customer management.
- Order management.
- Analytics.
- Product releases.
- Coupon system.
- Operations Center.

Cannot modify infrastructure secrets.

---

## Super Admin

Permissions:

Everything Admin can do plus:

- Environment settings.
- Integration configuration.
- Feature flags.
- Webhook management.
- Security settings.
- Deployment monitoring.

Reserved for FinanceOS owner.

---

# Role Hierarchy

```text
Super Admin
     │
     ▼
   Admin
     │
     ▼
 Customer
```

Inheritance is one-directional.

---

# Authentication Flow Overview

```text
Visitor
   │
Sign Up / Login
   │
Supabase Auth
   │
JWT Session
   │
Middleware Validation
   │
Route Authorization
   │
Protected Resource
```

This lifecycle is frozen.

---

# Customer Sign-Up Flow

## Registration Steps

1. Customer enters email.
2. Customer enters password.
3. Customer enters full name.
4. Backend validates input.
5. Supabase creates auth user.
6. Profile row created.
7. Verification email sent.
8. Customer verifies email.
9. Session activated.

---

# Registration Validation Rules

| Field | Validation |
|-------|------------|
| Full Name | Required, 2–80 chars |
| Email | Valid email format |
| Password | Minimum 12 characters |
| Country | Optional during signup |
| Currency | Auto-detected |

Passwords never stored in application database.

---

# Password Policy

## Requirements

| Rule | Value |
|------|-------|
| Minimum Length | 12 |
| Maximum Length | 128 |
| Uppercase Required | Yes |
| Lowercase Required | Yes |
| Number Required | Yes |
| Special Character | Yes |
| Spaces Allowed | Yes |

Weak passwords rejected.

---

# Email Verification

Verification required before account activation.

## Verification Flow

```text
Signup
   │
Verification Email
   │
Verification Link
   │
Supabase Confirms Email
   │
Profile Activated
```

Customers cannot download products until email verified.

---

# Login Flow

## Customer Login

1. Email.
2. Password.
3. Supabase validates credentials.
4. JWT issued.
5. Session cookie created.
6. Middleware authenticates future requests.

---

# Admin Login Flow

Admins use the same authentication provider.

Additional checks:

- Role must equal Admin or Super Admin.
- Middleware verifies role.
- Unauthorized users redirected.

Admin routes never rely on client-side role checks.

---

# Session Architecture

## Session Storage

| Property | Value |
|----------|-------|
| Cookie Type | HTTP Only |
| Secure | Yes |
| SameSite | Lax |
| Accessible by JS | No |
| Expiration | Managed by Supabase |

Sessions survive refresh.

---

# JWT Lifecycle

```text
Login
  │
Access Token
  │
Authenticated Requests
  │
Refresh Token
  │
New Access Token
  │
Logout
  │
Session Destroyed
```

Managed automatically.

---

# Session Refresh Policy

Sessions refresh silently.

Rules:

- Refresh before expiration.
- Invalid refresh logs user out.
- Expired session redirects to login.

No manual refresh implementation.

---

# Logout Flow

Logout performs:

- Invalidate refresh token.
- Remove session cookie.
- Clear cached profile.
- Record logout event.
- Redirect to homepage.

---

# Forgot Password Flow

## Steps

1. Customer enters email.
2. Resend reset email.
3. Customer opens secure link.
4. Password reset page.
5. Password updated.
6. Previous sessions revoked.

Reset tokens expire.

---

# Password Reset Security Rules

- Single-use token.
- Expiration enforced.
- HTTPS only.
- Cannot reuse current password.
- Logs password reset event.

---

# Account Recovery

Supports:

- Password reset.
- Email verification resend.
- Contact support fallback.

No security questions.

---

# Email Change Flow

Customer changes email.

Process:

1. Verify current session.
2. Send confirmation to new email.
3. Verify ownership.
4. Update auth user.
5. Update profile.

Requires password confirmation.

---

# Password Change Flow

Requires:

- Current password.
- New password.
- Strength validation.

All existing sessions revoked except current session.

---

# Authentication Middleware

Purpose:

Protect server routes.

## Middleware Responsibilities

| Responsibility |
|---------------|
| Read JWT |
| Validate Session |
| Attach User |
| Detect Role |
| Protect Routes |
| Redirect Unauthorized |

Middleware executes before route handlers.

---

# Protected Route Matrix

## Customer Routes

| Route | Authentication |
|-------|----------------|
| Dashboard | Required |
| Downloads | Required |
| Orders | Required |
| Profile | Required |
| Notifications | Required |

---

## Admin Routes

| Route | Role Required |
|-------|---------------|
| Admin Dashboard | Admin |
| Customers | Admin |
| Orders | Admin |
| Analytics | Admin |
| Operations Center | Admin |
| Settings | Super Admin |

---

# API Authorization Rules

Every API endpoint declares permissions.

Example categories:

| Category | Access |
|----------|--------|
| Public | No auth |
| Customer | Authenticated customer |
| Admin | Admin |
| Super Admin | Super Admin |

Authorization happens server-side.

---

# Role-Based Access Control (RBAC)

Roles stored inside profile metadata.

## Permission Categories

- Customers.
- Orders.
- Products.
- Coupons.
- Analytics.
- Emails.
- Releases.
- Operations.
- Settings.
- Audit Logs.

Permissions mapped later.

---

# Permission Naming Convention

```text
customer.read

customer.update

orders.read

orders.update

analytics.read

analytics.export

operations.manage

settings.manage
```

Consistent permission names.

---

# Customer Authorization Rules

Customers may only access:

- Their own profile.
- Their own orders.
- Their own licenses.
- Their own downloads.
- Their own invoices.
- Their own notifications.

Enforced by RLS and APIs.

---

# Admin Authorization Rules

Admins may access all customer resources.

Exceptions:

- Cannot access environment secrets.
- Cannot modify Super Admin role.
- Cannot delete audit logs.

---

# Super Admin Authorization Rules

Super Admin only.

Capabilities:

- Integration tokens.
- Feature flags.
- Deployment settings.
- Secret rotation.
- Webhook management.

Reserved account list.

---

# Session Device Tracking

FinanceOS tracks devices.

## Stored Information

| Field |
|------|
| Device Name |
| Browser |
| Operating System |
| Country |
| Last Active |
| IP Hash |

Visible in customer security settings.

---

# Trusted Device Rules

Devices marked trusted after successful login.

Customer may revoke devices.

Revocation destroys session.

---

# Concurrent Session Rules

| Rule | Value |
|------|-------|
| Multiple Devices | Allowed |
| Multiple Browsers | Allowed |
| Session Revocation | Supported |
| Force Logout All | Supported |

---

# Session Timeout Policy

| Session Type | Timeout |
|-------------|---------|
| Customer | Supabase Managed |
| Admin | Shorter inactivity timeout |
| Super Admin | Highest security timeout |

Idle timeout enforced.

---

# Login Rate Limiting

Limits brute-force attempts.

| Window | Limit |
|--------|-------|
| 15 Minutes | 5 Failed Attempts |
| 1 Hour | Temporary Lock |
| Repeated Abuse | Longer cooldown |

Logged as security events.

---

# Security Event Logging

Events recorded:

- Login success.
- Login failure.
- Password reset.
- Email verification.
- Logout.
- Device added.
- Device removed.
- Session revoked.
- Role changed.

Stored in audit schema.

---

# CSRF Protection

FinanceOS uses:

- SameSite cookies.
- CSRF validation for mutations.
- Origin validation.
- POST protection.

Applies to authenticated routes.

---

# XSS Protection

Rules:

- Escape rendered content.
- Sanitize markdown.
- No dangerous HTML rendering.
- CSP enabled.

Admin editor sanitizes content.

---

# SQL Injection Protection

Protection strategy:

- Supabase parameterized queries.
- Validation schemas.
- No raw SQL from user input.

---

# Security Headers

Headers enabled globally.

| Header |
|--------|
| Content-Security-Policy |
| X-Frame-Options |
| Referrer-Policy |
| Permissions-Policy |
| Strict-Transport-Security |
| X-Content-Type-Options |

Applied through middleware.

---

# Content Security Policy

Only approved origins allowed.

Includes:

- FinanceOS.
- Stripe.
- Razorpay.
- Resend.
- Supabase.
- Vercel.

No wildcard origins.

---

# CORS Policy

Public APIs:

Limited origins.

Admin APIs:

FinanceOS domain only.

No unrestricted CORS.

---

# API Secret Management

Secrets never exposed client-side.

Categories:

- Stripe Secret.
- Razorpay Secret.
- Supabase Service Role.
- Resend API Key.
- Meta Token.
- GA4 Credentials.
- Search Console Credentials.
- Sentry Auth Token.

Server-only environment variables.

---

# Admin Impersonation Policy

V1 Decision:

**Not supported.**

Future versions may include secure impersonation with audit logging.

---

# Feature Flag Security

Only Super Admin may change flags.

Every change logged.

---

# Audit Integrity Rules

Audit records:

- Immutable.
- Timestamped.
- Actor recorded.
- Previous value stored.
- New value stored.

Deletion prohibited.

---

# Account Deletion Policy

Customer deletion is soft delete.

Data retained for legal/business records.

Downloads and orders preserved.

---

# Security Monitoring

Operations Center monitors:

- Failed logins.
- Locked accounts.
- Password reset spikes.
- API abuse.
- Invalid tokens.
- Webhook failures.

Feeds Operations alerts.

---

# Security Alerts

Alert categories:

| Severity | Example |
|----------|---------|
| Critical | Suspicious admin login |
| High | Repeated failed login |
| Medium | New device login |
| Low | Password changed |

Visible to admins.

---

# Future Security (V2 Ready)

Architecture supports:

- MFA.
- Passkeys.
- Google Login.
- Apple Login.
- GitHub Login.
- Organization accounts.

Not enabled in V1.

---

# Frozen V1 Decisions

## Authentication

- Email/password only.
- Email verification required.
- Password reset supported.
- JWT sessions managed by Supabase.
- HTTP-only secure cookies.

## Authorization

- Three roles.
- RBAC server-side.
- Middleware protection.
- RLS protection.

## Security

- CSP enabled.
- CSRF protection.
- Rate limiting.
- Trusted devices.
- Audit logging.
- Secret management through environment variables.

All decisions frozen for V1.

---

# Cursor Implementation Rules

Cursor must:

- Use Supabase Auth only.
- Never store passwords.
- Never expose JWT manually.
- Protect admin routes with middleware.
- Validate role server-side.
- Use shared permission constants.
- Log security events.
- Revoke sessions securely.
- Implement trusted device management.

---

# Next Document

**03_STORAGE_ARCHITECTURE.md**

The next backend specification defines:

- Supabase Storage bucket architecture.
- Workbook version storage.
- Media Library storage.
- Invoice storage.
- Avatar storage.
- Signed URL generation.
- CDN strategy.
- File naming conventions.
- Upload pipeline.
- Download security.
- Storage lifecycle.
- Cleanup jobs.
- Backup strategy.
- Version rollback storage.
- Storage permissions and RLS.
