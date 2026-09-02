# 10_ENVIRONMENT_VARIABLES_AND_SECRETS.md

## FinanceOS — Environment Variables, Secrets Management & Configuration Architecture (V1)

**Document ID:** BACKEND-10

**Version:** 1.0 (Official V1)

**Status:** Frozen Environment Configuration

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Purpose

This document defines the complete environment configuration architecture for FinanceOS.

It specifies:

- Environment variable structure.
- Public vs private secrets.
- Vercel environment configuration.
- Supabase credentials.
- Stripe credentials.
- Razorpay credentials.
- Resend credentials.
- Meta Marketing API tokens.
- Google Analytics credentials.
- Search Console credentials.
- Sentry credentials.
- Feature flag configuration.
- Secret rotation policy.
- Local development configuration.
- Production deployment configuration.
- Cursor implementation rules.

This document is the **single source of truth** for configuration and secrets management across FinanceOS.

---

# Dependencies

## Parent Backend Documents

- `00_BACKEND_MASTER.md`
- `02_AUTH_AND_SECURITY.md`
- `06_PAYMENT_GATEWAY_ARCHITECTURE.md`
- `07_EMAIL_SYSTEM_ARCHITECTURE.md`
- `08_OPERATIONS_CENTER_BACKEND.md`

---

## Referenced Integration Documents

- /docs/integrations/01_STRIPE_INTEGRATION.md
- /docs/integrations/02_RAZORPAY_INTEGRATION.md
- /docs/integrations/03_META_MARKETING_API.md
- /docs/integrations/04_GOOGLE_ANALYTICS_4.md
- /docs/integrations/05_GOOGLE_SEARCH_CONSOLE.md
- /docs/integrations/06_RESEND_EMAIL_API.md
- /docs/integrations/07_SENTRY_MONITORING.md
- /docs/integrations/08_VERCEL_DEPLOYMENT_API.md
- /docs/integrations/09_SUPABASE_SERVICES.md

---

# Environment Philosophy

FinanceOS separates configuration into **four security levels**.

| Level | Description |
|--------|-------------|
| Public | Safe for browser exposure. |
| Server | Backend-only secrets. |
| Infrastructure | Deployment/runtime secrets. |
| Development | Local-only configuration. |

**Rule:** Only variables prefixed with `NEXT_PUBLIC_` may be exposed to the browser.

Everything else remains server-side.

---

# Environment Architecture Overview

```text id="k4uw5q"
Local Development (.env.local)
            │
GitHub Repository (No Secrets)
            │
Vercel Environment Variables
            │
Next.js Server Runtime
            │
Supabase Edge Functions
            │
Third-Party Services
```

Secrets never exist in the Git repository.

---

# Environment Files (Frozen)

```text id="mmo9nv"
.env.example          ← Template (committed)

.env.local            ← Local development

.env.production       ← Reference only (never committed)

.env.test             ← Automated testing
```

Only `.env.example` is committed.

---

# Environment Categories

| Category | Prefix |
|----------|--------|
| Public Website | `NEXT_PUBLIC_` |
| Supabase | `SUPABASE_` |
| Stripe | `STRIPE_` |
| Razorpay | `RAZORPAY_` |
| Resend | `RESEND_` |
| Meta | `META_` |
| Google Analytics | `GA4_` |
| Search Console | `GSC_` |
| Sentry | `SENTRY_` |
| Vercel | `VERCEL_` |
| FinanceOS Internal | `FINANCEOS_` |

Naming convention is frozen.

---

# Public Environment Variables

Safe for client-side usage.

## Website Configuration

```env
NEXT_PUBLIC_APP_NAME=
NEXT_PUBLIC_APP_URL=
NEXT_PUBLIC_SUPPORT_EMAIL=
NEXT_PUBLIC_DEFAULT_CURRENCY=
NEXT_PUBLIC_DEFAULT_LOCALE=
NEXT_PUBLIC_RELEASE_CHANNEL=
```

These contain no secrets.

---

# Public Supabase Variables

```env
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
```

Used by client SDK.

**Important:** `ANON_KEY` is public but protected by RLS.

---

# Server-Only Supabase Variables

```env
SUPABASE_SERVICE_ROLE_KEY=
SUPABASE_JWT_SECRET=
SUPABASE_DB_URL=
SUPABASE_PROJECT_ID=
```

Never exposed to client.

Service Role bypasses RLS.

---

# Stripe Environment Variables

## Public

```env
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=
```

Used for hosted checkout initialization.

## Private

```env
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=
STRIPE_API_VERSION=
```

Server-only.

---

# Razorpay Environment Variables

## Public

```env
NEXT_PUBLIC_RAZORPAY_KEY_ID=
```

Client checkout initialization.

## Private

```env
RAZORPAY_KEY_SECRET=
RAZORPAY_WEBHOOK_SECRET=
```

Server-only.

---

# Resend Environment Variables

```env
RESEND_API_KEY=
RESEND_WEBHOOK_SECRET=
RESEND_FROM_EMAIL=
RESEND_REPLY_TO_EMAIL=
```

Used by Email Service.

---

# Meta Marketing Environment Variables

```env
META_ACCESS_TOKEN=
META_AD_ACCOUNT_ID=
META_PIXEL_ID=
META_APP_SECRET=
META_VERIFY_TOKEN=
```

All server-side.

---

# Google Analytics Environment Variables

```env
GA4_PROPERTY_ID=
GA4_CLIENT_EMAIL=
GA4_PRIVATE_KEY=
GA4_PROJECT_ID=
```

Used for Analytics worker.

---

# Search Console Environment Variables

```env
GSC_CLIENT_EMAIL=
GSC_PRIVATE_KEY=
GSC_SITE_URL=
```

Used by SEO synchronization worker.

---

# Sentry Environment Variables

```env
NEXT_PUBLIC_SENTRY_DSN=
SENTRY_AUTH_TOKEN=
SENTRY_ORG=
SENTRY_PROJECT=
```

Client DSN is public.

Auth token is private.

---

# Vercel Environment Variables

```env
VERCEL_TEAM_ID=
VERCEL_PROJECT_ID=
VERCEL_API_TOKEN=
```

Used for deployment monitoring.

Super Admin only.

---

# FinanceOS Internal Variables

```env
FINANCEOS_APP_ENV=
FINANCEOS_PPP_ENABLED=
FINANCEOS_RELEASE_CHANNEL=
FINANCEOS_DEFAULT_TIMEZONE=
FINANCEOS_STORAGE_REGION=
```

Internal configuration flags.

---

# Feature Flag Variables

Used during development.

Examples:

```env
FINANCEOS_FEATURE_OPERATIONS_CENTER=true
FINANCEOS_FEATURE_ANALYTICS=true
FINANCEOS_FEATURE_MARKETING=true
FINANCEOS_FEATURE_RELEASE_NOTIFICATIONS=true
```

Feature flags also stored in database.

---

# Development Environment

`.env.local`

Contains:

- Local Supabase project.
- Test Stripe keys.
- Test Razorpay keys.
- Test Resend domain.

Never shared publicly.

---

# Production Environment

Managed entirely in **Vercel Environment Variables**.

Environments:

- Production
- Preview
- Development

Each environment has independent secrets.

---

# Preview Environment Rules

Preview deployments use:

- Preview Supabase.
- Stripe Test Mode.
- Razorpay Test Mode.
- Resend Sandbox Domain.

Never sends production emails.

---

# Test Environment Rules

Automated tests use:

- Local database.
- Fake webhook secrets.
- Fake API keys.
- Mock storage.

No real payments.

---

# Secret Rotation Policy

Secrets rotated on schedule.

| Secret | Rotation |
|--------|----------|
| Stripe Secret | Every 90 Days |
| Razorpay Secret | Every 90 Days |
| Resend API Key | Every 90 Days |
| Meta Token | When regenerated |
| GA4 Key | Annual |
| Search Console Key | Annual |
| Service Role Key | Emergency Only |

Document every rotation.

---

# Secret Ownership

| Secret | Owner |
|--------|-------|
| Stripe | Super Admin |
| Razorpay | Super Admin |
| Meta | Super Admin |
| GA4 | Super Admin |
| Search Console | Super Admin |
| Sentry | Super Admin |
| Vercel | Super Admin |

Admins cannot view secrets.

---

# Environment Validation

Application validates required variables during startup.

Missing required variables:

- Fail build.
- Fail deployment.
- Log configuration error.

No partial startup.

---

# Required Variable Validation

Critical secrets required:

- Supabase URL.
- Supabase Service Role.
- Stripe Secret.
- Razorpay Secret.
- Resend API Key.

Startup blocked if missing.

---

# Optional Variable Validation

Optional services:

- Meta API.
- Search Console.
- GA4.
- Sentry.

Features disabled gracefully if absent.

---

# Environment Loader Rules

Configuration loaded once.

Pattern:

- Validate.
- Parse.
- Freeze.
- Export typed config.

No scattered `process.env` usage.

---

# Typed Configuration Layer

`config/env.ts`

Responsibilities:

- Parse environment.
- Validate types.
- Provide typed exports.
- Prevent undefined access.

Single configuration source.

---

# Secret Usage Rules

Secrets may only be used inside:

- Route Handlers.
- Services.
- Edge Functions.
- Background Workers.

Never imported into React components.

---

# Client Environment Rules

React components may only access:

- `NEXT_PUBLIC_*`

Attempting to access server secret is prohibited.

---

# API Key Storage Rules

Never store secrets inside:

- Database.
- Storage.
- GitHub.
- Client bundle.
- Logs.
- Analytics payloads.

Secrets exist only in environment configuration.

---

# Logging Redaction Policy

Logs must redact:

- API keys.
- Tokens.
- JWT secrets.
- Passwords.
- Cookies.
- Authorization headers.

Redaction mandatory.

---

# Deployment Environment Matrix

| Environment | Stripe | Razorpay | Emails |
|-------------|--------|----------|--------|
| Local | Test | Test | Sandbox |
| Preview | Test | Test | Sandbox |
| Production | Live | Live | Production |

No production keys in preview.

---

# Environment Security Rules

- HTTPS required in production.
- Secure cookies enabled.
- Service Role unavailable client-side.
- Secrets encrypted by Vercel.
- Least privilege for third-party credentials.

---

# Backup & Recovery Rules

Maintain secure backup of:

- Stripe webhook secret.
- Razorpay webhook secret.
- Meta token.
- GA4 service account.
- Search Console service account.

Stored outside repository.

---

# Secret Rotation Procedure

1. Generate new secret.
2. Add to Vercel.
3. Deploy.
4. Verify.
5. Remove old secret.
6. Audit rotation.

Zero downtime rotation.

---

# Cursor Implementation Rules

Cursor must:

- Create typed `env.ts`.
- Validate required variables.
- Separate public/server variables.
- Never expose secrets client-side.
- Use environment variables inside services only.
- Redact secrets in logs.
- Support Preview/Production environments.
- Follow naming conventions exactly.

---

# Frozen V1 Decisions

- Vercel manages production secrets.
- `.env.example` committed.
- `.env.local` ignored.
- `NEXT_PUBLIC_*` only for browser.
- Service Role server-only.
- Separate Preview and Production environments.
- Typed configuration loader.
- Secret rotation documented.
- Redacted logging.

All environment configuration decisions are frozen for V1.

---

# Next Document

**11_DATABASE_RLS_AND_PERMISSIONS.md**

The next backend specification defines:

- Complete Row Level Security architecture.
- Storage bucket policies.
- Customer permissions.
- Admin permissions.
- Super Admin permissions.
- API permission matrix.
- Storage RLS.
- Audit RLS.
- Notification RLS.
- Operations Center permissions.
- Feature flag permissions.
- Cursor SQL policy implementation rules.
