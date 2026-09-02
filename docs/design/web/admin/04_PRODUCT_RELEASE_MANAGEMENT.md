# 04_PRODUCT_RELEASE_MANAGEMENT.md

## FinanceOS — Product Release, Versioning & Download Distribution Specification

**Document ID:** WEB-ADMIN-04

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Product Release Management)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/admin`

---

## Dependencies

- `00_ADMIN_MASTER.md`
- `01_ADMIN_LAYOUT_AND_NAVIGATION.md`
- `03_ORDER_AND_LICENSE_MANAGEMENT.md`
- `docs/web/user/09_CHECKOUT_AND_DOWNLOAD_FLOW.md`
- `docs/web/user/10_CUSTOMER_DASHBOARD.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`

---

# Purpose

This document defines the complete **Product Release Management System** for FinanceOS.

The Admin Portal uses this module to manage:

- Workbook releases.
- Excel versions.
- Google Sheets versions.
- Release notes.
- Changelog publishing.
- Customer update distribution.
- Download replacement.
- Rollback management.

This document is the **single source of truth** for Cursor when implementing product releases.

---

# Release Management Philosophy

FinanceOS releases are **version-controlled product builds**, not file replacements.

Every release creates a permanent historical version while making the newest eligible version available to customers.

Core principle:

> **Never overwrite history. Always publish a new version.**

---

# Release Lifecycle Architecture

```text
Workbook Development Complete
            │
            ▼
Create New Release Draft
            │
            ▼
Upload Excel Workbook
            │
            ▼
Upload Google Sheets Template
            │
            ▼
Write Release Notes
            │
            ▼
Publish Release
            │
            ▼
Notify Eligible Customers
            │
            ▼
Customer Dashboard Updates
```

This workflow is frozen.

---

# Release Module Overview

| Section | Purpose |
|---------|---------|
| Release Dashboard | Release overview and KPIs. |
| Version Library | All workbook versions. |
| Release Builder | Create a new release. |
| Release Notes | Publish changelog. |
| Download Distribution | Update customer downloads. |
| Rollback Center | Restore previous release if necessary. |
| Release Analytics | Track update adoption. |

---

# Release Dashboard

Top dashboard displays release KPIs.

## KPI Cards

| KPI | Description |
|-----|-------------|
| Current Live Version | Latest published version. |
| Total Releases | Lifetime releases. |
| Customers Eligible for Update | Users who can download latest version. |
| Update Downloads | Customers who downloaded latest release. |
| Latest Release Date | Most recent publication date. |
| Rollbacks | Number of rollback events. |

---

# Version Naming Convention

FinanceOS follows semantic versioning.

## Version Format

```text
Major.Minor.Patch
```

Examples:

| Version | Meaning |
|---------|---------|
| V1.0.0 | Launch version. |
| V1.1.0 | New features. |
| V1.2.0 | Feature improvements. |
| V1.2.1 | Bug fix release. |
| V2.0.0 | Major paid upgrade. |

This naming system is frozen.

---

# Release Types

| Release Type | Description |
|--------------|-------------|
| Major Release | New paid generation (V2). |
| Minor Release | Free Version 1 feature update. |
| Patch Release | Bug fixes and improvements. |
| Hotfix | Critical production fix. |

---

# Version Library

Purpose:

Display every published release.

## Version Table

| Column | Description |
|--------|-------------|
| Version | Workbook version. |
| Release Type | Major / Minor / Patch. |
| Status | Draft / Published / Archived. |
| Release Date | Publication timestamp. |
| Eligible Customers | Customer count. |
| Downloads | Downloads for this version. |
| Actions | View Release. |

---

# Version Status System

| Status | Meaning |
|--------|---------|
| Draft | Release not published. |
| Scheduled | Future publication. |
| Published | Live release. |
| Archived | Historical release. |
| Rolled Back | Release withdrawn. |

---

# Release Builder

Purpose:

Create new FinanceOS release.

---

## Release Creation Form

Required fields.

| Field | Required |
|-------|----------|
| Version Number | Yes |
| Release Title | Yes |
| Release Type | Yes |
| Release Date | Auto |
| Release Summary | Yes |
| Excel Workbook | Yes |
| Google Sheets Template | Yes |
| Release Notes | Yes |

---

# Upload Requirements

## Excel Workbook

Requirements:

- `.xlsx`
- Final production build.
- Version embedded in workbook.

---

## Google Sheets Template

Requirements:

- Latest template link.
- Version metadata.
- Customer copy enabled.

---

## File Naming Convention

Excel:

```text
FinanceOS_V1.2.0_Excel.xlsx
```

Google Sheets:

```text
FinanceOS_V1.2.0_GoogleSheets
```

Release Notes:

```text
FinanceOS_V1.2.0_RELEASE_NOTES.md
```

---

# Release Metadata

Every release stores metadata.

| Field | Description |
|------|-------------|
| Version | Semantic version. |
| Build Number | Internal build ID. |
| Release Type | Major / Minor / Patch. |
| Published By | Admin ID. |
| Published Date | Timestamp. |
| Changelog URL | Linked release notes. |

---

# Release Notes System

Purpose:

Explain changes to customers.

---

## Release Notes Structure

Every release contains:

### Summary

Short overview.

### New Features

Checklist.

### Improvements

Checklist.

### Bug Fixes

Checklist.

### Breaking Changes

Only major releases.

---

## Release Notes Markdown Format

Standard format.

```text
# FinanceOS Version 1.2.0

## What's New

## Improvements

## Bug Fixes

## Download Instructions
```

Stored alongside release.

---

# Changelog Timeline

Newest releases displayed first.

| Version | Summary |
|---------|---------|
| V1.2.1 | Dashboard bug fixes. |
| V1.2.0 | New prediction engine. |
| V1.1.0 | Investment improvements. |
| V1.0.0 | Launch version. |

---

# Publish Release Workflow

```text
Draft Ready
     │
Validation
     │
Publish Confirmation
     │
Version Live
     │
Customer Downloads Updated
     │
Emails Sent
```

---

# Publish Validation Rules

Before publishing:

- Excel uploaded.
- Google Sheets uploaded.
- Release notes completed.
- Version unique.
- Files validated.

Publish blocked if validation fails.

---

# Publish Confirmation Modal

Displays:

- Version number.
- Release type.
- Customer count affected.
- Confirmation checkbox.
- Publish button.

Requires confirmation.

---

# Download Distribution System

Purpose:

Automatically update eligible downloads.

---

## Distribution Rules

After publishing:

| Customer Version | Download Available |
|------------------|--------------------|
| V1.0 | Latest Version |
| V1.1 | Latest Version |
| V1.2 | Latest Version |
| V2 | Depends on upgrade policy |

---

## Eligible Customer Rules

Eligible if:

- Active Version 1 license.
- License not revoked.
- Refund not completed.

---

# Customer Dashboard Update Flow

After publishing:

- Dashboard banner updated.
- Download button updated.
- Release notes visible.
- Changelog timeline updated.

No manual customer action required.

---

# Version Notification Flow

Customers receive:

1. Dashboard notification.
2. Email notification.
3. Download available badge.

---

# Download Replacement Rules

Customers always download latest eligible build.

Old releases remain archived.

Customers can still download previous versions if enabled.

---

# Previous Version Archive

Purpose:

Historical downloads.

## Archive Table

| Version | Status |
|---------|--------|
| V1.2.1 | Latest |
| V1.2.0 | Previous |
| V1.1.0 | Archived |
| V1.0.0 | Archived |

Admin controls visibility.

---

# Rollback Center

Purpose:

Restore previous release.

---

## Rollback Workflow

```text
Select Previous Version
        │
Confirmation Modal
        │
Rollback Published
        │
Downloads Reverted
        │
Rollback Notification Logged
```

---

# Rollback Rules

Rollback:

- Updates customer download links.
- Keeps release history.
- Does not delete releases.

Rollback events logged permanently.

---

# Rollback Confirmation Modal

Shows:

- Current version.
- Target version.
- Customers affected.
- Confirmation checkbox.

---

# Release Analytics Dashboard

Purpose:

Track adoption.

## KPI Cards

| KPI | Description |
|-----|-------------|
| Eligible Customers | Can update. |
| Update Downloads | Downloaded latest version. |
| Adoption Rate | Percentage updated. |
| Email Open Rate | Update email engagement. |
| Dashboard Update Clicks | Customer interaction. |

---

# Version Adoption Chart

Line chart.

Displays:

- Release Day.
- Day 1 downloads.
- Week 1 downloads.
- Month adoption.

---

# Download Distribution Analytics

Track:

| Metric | Description |
|--------|-------------|
| Excel Downloads | Count |
| Google Sheets Copies | Count |
| Failed Downloads | Errors |
| Retry Downloads | Successful retries |

---

# Release Activity Timeline

Events include:

- Draft created.
- Workbook uploaded.
- Release published.
- Notification sent.
- Rollback executed.

Chronological timeline.

---

# Bulk Release Actions

| Action | Applies To |
|--------|------------|
| Archive Releases | Historical versions |
| Export Changelog | Selected releases |
| Resend Update Email | Latest release |
| Restore Archived Version | Archived releases |

---

# Export Release Data

Supported exports.

| Format | Version 1 |
|--------|-----------|
| CSV | Yes |
| Excel | Yes |
| Markdown | Yes |

---

# Storage Architecture

Supabase Storage folders.

```text
storage/
│
├── releases/
│   ├── v1.0.0/
│   ├── v1.1.0/
│   ├── v1.2.0/
│   └── v1.2.1/
│
├── excel/
├── google-sheets/
├── release-notes/
└── assets/
```

Every release stored independently.

---

# Empty States

Examples.

## No Releases

"No workbook releases published yet."

## No Drafts

"No release drafts available."

---

# Loading States

Skeleton loaders for:

- Version library.
- Release notes.
- Analytics.
- Rollback center.

---

# Responsive Behavior

## Desktop

Full release management tables.

## Tablet

Compact tables.

## Mobile

Release cards replace tables.

Publishing recommended on desktop.

---

# Accessibility Rules

Release management supports:

- Keyboard navigation.
- Accessible forms.
- Accessible tables.
- Accessible timeline.
- Focus management.

---

# Performance Targets

| Interaction | Target |
|------------|--------|
| Version Library Load | Under 500ms |
| Publish Release | Under 2 seconds |
| Rollback Action | Under 2 seconds |
| Release Analytics Refresh | Under 1 second |

---

# Database Fields Referenced

## Releases Table

| Field | Purpose |
|------|---------|
| Release ID | Primary identifier |
| Version | Semantic version |
| Release Type | Major / Minor / Patch |
| Status | Draft / Published |
| Published Date | Timestamp |
| Build Number | Internal build |

## Downloads Metadata

| Field | Purpose |
|------|---------|
| Latest Eligible Version | Customer updates |
| Download Count | Analytics |
| Notification Sent | Email tracking |

---

# Cursor Components

| Component | Used In |
|-----------|---------|
| ReleaseTable | Version library |
| ReleaseBuilderForm | Create release |
| ReleaseNotesEditor | Changelog |
| PublishModal | Publish workflow |
| RollbackModal | Rollback workflow |
| VersionTimeline | Changelog page |
| AdoptionChart | Analytics |
| DownloadAnalyticsCard | Dashboard |

---

# Cursor Implementation Rules

Cursor must:

1. Build semantic version management.
2. Create reusable release builder.
3. Upload Excel and Google Sheets assets separately.
4. Publish release only after validation.
5. Update customer download eligibility automatically.
6. Generate release timeline.
7. Support rollback without deleting history.
8. Track version adoption analytics.

---

# Frozen Decisions (Version 1)

The following Product Release decisions are locked.

- Semantic versioning (Major.Minor.Patch).
- Separate Excel and Google Sheets release assets.
- Release drafts before publishing.
- Automatic Version 1 customer updates.
- Permanent release history.
- Rollback instead of overwrite.
- Release notes stored as Markdown.
- Customer dashboard update banner after release.

---

# Version History

## Version 1.0

Official FinanceOS Product Release Management specification defining semantic versioning, release builder workflow, workbook uploads, changelog system, download distribution, rollback architecture, version adoption analytics, storage architecture, and Cursor implementation rules.

---

**End of Document**

**File:** `04_PRODUCT_RELEASE_MANAGEMENT.md`
