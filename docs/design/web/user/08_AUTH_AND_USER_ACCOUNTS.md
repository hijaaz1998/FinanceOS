# 08_AUTH_AND_USER_ACCOUNTS.md

## FinanceOS — Authentication, User Accounts & License Management Specification

**Document ID:** WEB-USER-08

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Authentication & User Account System)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/user`

**Dependencies:**

- `00_WEB_MASTER.md`
- `01_INFORMATION_ARCHITECTURE.md`
- `07_PRICING_AND_PPP_SYSTEM.md`
- `09_CHECKOUT_AND_DOWNLOAD_FLOW.md`
- `10_CUSTOMER_DASHBOARD.md`
- `docs/design/00_DESIGN_MASTER.md`

---

# Purpose

This document defines the complete **authentication, account management, purchase ownership, and license system** for FinanceOS Version 1.

The authentication system exists to:

- Deliver purchased products securely.
- Allow unlimited future downloads.
- Verify purchases.
- Manage user accounts.
- Prepare the platform for future subscriptions.

This document is the **single source of truth** for Cursor when building authentication and account management.

---

# Authentication Philosophy

FinanceOS authentication is **ownership-first**, not community-first.

Users create an account because they purchased FinanceOS.

The account exists to protect downloads and updates — **not to lock the spreadsheet behind an online service.**

---

# Authentication Goals

| Goal | Purpose |
|------|---------|
| Secure Purchases | Only verified customers download products. |
| Unlimited Downloads | Customers can re-download anytime. |
| Version Updates | Access future Version 1 releases. |
| Account Recovery | Restore purchases with email login. |
| License Ownership | One account owns one purchase history. |

---

# Authentication Architecture

Version 1 uses **email/password authentication**.

| Authentication Method | Version |
|-----------------------|---------|
| Email + Password | ✅ Version 1 |
| Magic Link | Reserved V2 |
| Google Login | Reserved V2 |
| Apple Login | Reserved V2 |
| GitHub Login | Not Planned |

Email authentication is the only login method in Version 1.

---

# Authentication Provider

Version 1 authentication provider is **Supabase Auth**.

Supabase manages:

- Users.
- Password hashing.
- Email verification.
- Password reset.
- Session management.
- JWT authentication.

This provider is frozen for Version 1.

---

# User Account Lifecycle

FinanceOS account lifecycle contains **8 stages**.

| Stage | Description |
|-------|-------------|
| Visitor | Browses website. |
| Signup Started | Creates account. |
| Email Verification Pending | Verification email sent. |
| Verified User | Email verified. |
| Checkout Started | Purchase initiated. |
| Customer | Purchase completed. |
| Download Eligible | Downloads unlocked. |
| Returning Customer | Login restores purchases. |

---

# Account Creation Flow

## Signup Flow

Landing Page

↓

Signup

↓

Email Verification

↓

Login

↓

Checkout

↓

Customer Dashboard

Signup can happen before or during checkout.

---

# Signup Page Specification

Signup page contains:

### Required Fields

- Full Name.
- Email Address.
- Password.
- Confirm Password.
- Terms & Privacy Checkbox.

### Optional Fields

- Country.
- Referral Code (Future).

---

# Signup Validation Rules

Validation occurs before submission.

## Rules

- Name required.
- Valid email required.
- Password minimum length.
- Password confirmation required.
- Terms checkbox required.

Errors shown inline.

---

# Password Requirements

Version 1 password policy.

| Requirement | Rule |
|------------|------|
| Minimum Length | 8 characters |
| Uppercase | Recommended |
| Lowercase | Required |
| Number | Required |
| Symbol | Recommended |

Password strength indicator shown.

---

# Password Strength Indicator

Displays three levels.

| Strength | Color |
|----------|-------|
| Weak | Red |
| Medium | Amber |
| Strong | Green |

Updates while typing.

---

# Email Verification Flow

Every account must verify email.

## Verification Steps

1. User signs up.
2. Verification email sent.
3. User clicks verification link.
4. Email becomes verified.
5. Dashboard access enabled.

Purchase requires verified email.

---

# Email Verification Page

Displays:

- Success icon.
- Verification confirmation.
- Continue to Login button.

If expired, resend verification.

---

# Login Page Specification

Login page contains:

- Email.
- Password.
- Remember Me.
- Forgot Password.
- Login Button.
- Create Account link.

Minimal layout.

---

# Login Validation Rules

Errors displayed for:

- Invalid email.
- Incorrect password.
- Unverified email.
- Locked session.

No generic server errors shown.

---

# Remember Me Behavior

Optional checkbox.

Session duration increases when enabled.

No persistent login on shared devices recommendation.

---

# Forgot Password Flow

Flow:

Login

↓

Forgot Password

↓

Email Input

↓

Reset Email

↓

New Password

↓

Login

Entire flow handled through Supabase.

---

# Password Reset Page

Contains:

- New Password.
- Confirm Password.
- Password Strength Indicator.
- Update Password Button.

Shows success state afterward.

---

# Session Management

Version 1 uses secure sessions.

## Session Rules

- Automatic refresh.
- Logout clears session.
- Expired sessions redirect to Login.

Session persistence handled securely.

---

# Protected Routes

The following routes require authentication.

| Route | Protection |
|-------|------------|
| /dashboard | Yes |
| /downloads | Yes |
| /account | Yes |
| /checkout/success | Yes |

Public pages remain accessible.

---

# Route Guard Behavior

If user is unauthenticated:

Redirect to Login.

After login:

Return user to original destination.

---

# Customer Account Model

Every customer account contains:

## Personal Information

- Full Name.
- Email.
- Country.
- Account Created Date.

## Purchase Information

- Order ID.
- Purchase Date.
- Product Version.
- Currency.
- Region.

---

# Account Dashboard Summary

Top account cards.

Displays:

- Products Owned.
- Downloads Available.
- Current Version.
- Latest Version.
- Purchase Date.

---

# License Architecture

FinanceOS Version 1 uses **account-based ownership**, not machine activation.

### License Rules

- One purchase belongs to one account.
- Unlimited downloads for owner.
- Multiple personal devices allowed.

No serial keys.

---

# License Identifier

Each purchase generates:

- Order ID.
- License ID.
- Customer ID.

Stored in database.

Never shown publicly unless needed.

---

# Download Eligibility Rules

Users can download if:

- Email verified.
- Payment successful.
- Product attached to account.

Otherwise download button hidden.

---

# Purchase Linking Rules

If purchase email already has account:

Purchase attaches automatically.

If account doesn't exist:

User prompted to create account.

No duplicate purchases created.

---

# Returning Customer Flow

Returning customer:

Login

↓

Dashboard

↓

Downloads

↓

Latest Version

Entire purchase history restored.

---

# Account Recovery Rules

Customers recover purchases using email.

### Recovery Includes

- Previous purchases.
- Download history.
- Version eligibility.

No manual support required in normal cases.

---

# Logout Behavior

Logout performs:

- Session cleared.
- JWT revoked.
- Protected pages inaccessible.
- Redirect Home.

---

# Account Settings Page

Sections include:

### Personal Information

- Name.
- Email.
- Country.

### Security

- Change Password.
- Logout.

### Purchases

- View Orders.
- View Downloads.

---

# Change Password Flow

Authenticated users can update password.

Requires:

- Current Password.
- New Password.
- Confirmation.

Shows success toast.

---

# Change Email Policy

Version 1 allows email change with verification.

Flow:

- New email entered.
- Verification email.
- Confirmation required.
- Purchases transferred.

---

# Country Settings

Country stored for:

- PPP pricing.
- Payment gateway.
- Currency display.

User can update country.

---

# Account Deletion Policy

Version 1 supports account deletion.

### Flow

- Confirmation modal.
- Password confirmation.
- Final warning.

Deletes account metadata.

Purchase restoration handled via support if applicable.

---

# Purchase History Section

Displays previous purchases.

Fields include:

- Product.
- Purchase Date.
- Price Paid.
- Currency.
- Order Status.

Newest first.

---

# Invoice History

Customer downloads invoices anytime.

Each invoice card includes:

- Invoice Number.
- Purchase Date.
- Download PDF.

---

# Download History

Displays download events.

Fields:

- Workbook Version.
- Download Date.
- Platform.
- Download Button.

---

# Latest Version Notification

Dashboard banner appears when newer Version 1 exists.

Example:

FinanceOS V1.2 is available.

Download Update button shown.

---

# Device Ownership Rules

Version 1 allows multiple personal devices.

Supported:

- Desktop.
- Laptop.
- Tablet.
- Mobile.

No activation limit enforced.

---

# Duplicate Purchase Detection

If same email purchases twice:

System recognizes customer.

Rules handled during checkout.

Avoid duplicate ownership records.

---

# Authentication Error States

UI handles:

- Invalid credentials.
- Expired session.
- Email not verified.
- Account not found.
- Too many attempts.

Friendly messages only.

---

# Rate Limiting Rules

Protect authentication endpoints.

Limits include:

- Login attempts.
- Signup attempts.
- Password reset requests.

Helps prevent abuse.

---

# Security Rules

Authentication security requirements.

### Required

- HTTPS.
- Secure cookies.
- Password hashing.
- Email verification.
- CSRF protection.
- Session expiration.

Never expose JWT to client storage unnecessarily.

---

# User Database Schema

User record contains:

- User ID.
- Email.
- Name.
- Country.
- Created Date.
- Verified Status.
- Latest Login.
- Purchase Status.

Minimal Version 1 schema.

---

# Customer Metadata Schema

Purchase metadata contains:

- Customer ID.
- License ID.
- Order ID.
- Product Version.
- Purchase Currency.
- Payment Provider.
- Download Eligibility.

---

# Authentication Analytics Events

Track events.

### Events

- Signup Started.
- Signup Completed.
- Email Verified.
- Login Success.
- Login Failed.
- Password Reset Requested.
- Logout.
- Account Deleted.

No sensitive information stored in analytics.

---

# Responsive Authentication Layout

## Desktop

Centered authentication card.

## Tablet

Compact card.

## Mobile

Full-width authentication form.

---

# Accessibility Rules

Authentication supports:

- Keyboard navigation.
- Password visibility toggle.
- Accessible error messages.
- Focus indicators.
- Screen reader labels.

Mandatory.

---

# Future Authentication Architecture

Reserved for Version 2.

### Planned

- Google Login.
- Apple Login.
- Magic Link.
- Passkeys.
- Two-Factor Authentication.

Not implemented in Version 1.

---

# Cursor Implementation Rules

Cursor must:

1. Implement Supabase email/password authentication.
2. Require email verification.
3. Protect dashboard and download routes.
4. Create reusable auth components.
5. Store purchase ownership in account metadata.
6. Build account settings page.
7. Build purchase history page.
8. Support password reset flow.

---

# Frozen Decisions (Version 1)

The following authentication decisions are locked.

- Supabase Auth provider.
- Email/password authentication only.
- Email verification mandatory.
- Account-based license ownership.
- Unlimited downloads for customers.
- Multiple personal devices allowed.
- Protected dashboard routes.
- Account recovery through email.
- Password reset via email.
- Future social login reserved for Version 2.

---

# Version History

## Version 1.0

Official FinanceOS authentication and user account specification defining signup, login, email verification, password reset, session management, protected routes, license ownership, purchase recovery, account settings, security rules, accessibility, analytics events, and Cursor implementation standards.

---

**End of Document**

**File:** `08_AUTH_AND_USER_ACCOUNTS.md`
