# 03_STORAGE_ARCHITECTURE.md

## FinanceOS — Complete Supabase Storage Architecture & File Management Specification (V1)

**Document ID:** BACKEND-03

**Version:** 1.0 (Official V1)

**Status:** Frozen Storage Architecture

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Purpose

This document defines the complete file storage architecture for FinanceOS using **Supabase Storage**.

It specifies:

- Storage bucket architecture.
- Workbook version storage.
- Media Library storage.
- Invoice storage.
- Avatar storage.
- Signed URL generation.
- Upload pipeline.
- Download security.
- CDN strategy.
- File naming conventions.
- Version lifecycle.
- Cleanup jobs.
- Storage permissions.
- Backup and recovery strategy.

This document is the **single source of truth** for every uploaded or downloadable file in FinanceOS.

---

# Dependencies

## Parent Backend Documents

- `00_BACKEND_MASTER.md`
- `01_SUPABASE_DATABASE_ARCHITECTURE.md`
- `02_AUTH_AND_SECURITY.md`

## Referenced Documents

- `04_PRODUCT_RELEASE_MANAGEMENT.md`
- `08_CONTENT_AND_MEDIA_LIBRARY.md`
- `03_ORDER_AND_LICENSE_MANAGEMENT.md`
- `11_OPERATIONS_CENTER_AND_INTEGRATIONS.md`

---

# Storage Technology (Frozen)

| Setting | Value |
|--------|-------|
| Provider | Supabase Storage |
| CDN | Supabase CDN |
| Bucket Visibility | Private by Default |
| URL Type | Signed URLs |
| Metadata Storage | PostgreSQL |
| File Versioning | FinanceOS Release System |
| File Naming | UUID + Semantic Path |

---

# Storage Philosophy

FinanceOS separates **files** from **business data**.

| Business Data | File Storage |
|--------------|-------------|
| Orders | Workbook XLSX files |
| Customers | Avatars |
| Products | Thumbnails |
| Releases | Excel workbook builds |
| Invoices | PDF invoices |
| Marketing Assets | Images & videos |

PostgreSQL stores metadata only.

Supabase Storage stores binary assets.

---

# Storage Architecture Overview

```text id="b1x3o9"
Supabase Storage

│
├── releases/
├── media-library/
├── invoices/
├── avatars/
├── marketing-assets/
├── temporary/
├── exports/
├── backups/
└── system-assets/
```

Every bucket has independent permissions.

---

# Storage Bucket Inventory

| Bucket | Visibility | Purpose |
|--------|------------|---------|
| releases | Private | Excel workbook releases |
| media-library | Private | Admin uploaded images/files |
| avatars | Private | Customer profile images |
| invoices | Private | PDF invoices |
| marketing-assets | Private | Landing page assets |
| exports | Private | CSV/PDF exports |
| temporary | Private | Temporary uploads |
| backups | Private | Backup assets |
| system-assets | Public | Static branding assets |

---

# Bucket Permission Matrix

| Bucket | Customer | Admin | Super Admin |
|--------|----------|-------|-------------|
| releases | Signed Download | Upload/Delete | Full |
| media-library | Read Purchased Assets | Upload/Delete | Full |
| avatars | Read Own Avatar | Read All | Full |
| invoices | Read Own Invoice | Read All | Full |
| marketing-assets | Read Public Assets | Upload/Delete | Full |
| exports | Read Own Export | Read All | Full |
| temporary | Own Upload Only | Full | Full |
| backups | None | None | Full |
| system-assets | Public Read | Upload/Delete | Full |

Permissions enforced by RLS + Storage Policies.

---

# Releases Bucket

Purpose:

Store every downloadable workbook version.

## Folder Structure

```text id="mwwb8y"
releases/

budget-planner/

v1.0.0/

v1.0.1/

v1.1.0/

v2.0.0/

wealth-dashboard/

v1.0.0/

v1.1.0/
```

Every workbook has version folders.

---

# Release File Naming Convention

Example:

```text id="htio5h"
budget-planner-v1.0.0.xlsx

budget-planner-v1.0.1.xlsx

wealth-dashboard-v1.1.0.xlsx
```

Rules:

- Lowercase.
- Hyphen-separated.
- Semantic version.
- Extension preserved.

No spaces.

---

# Release Metadata

Database stores:

| Field | Description |
|------|-------------|
| release_id | UUID |
| storage_path | Storage location |
| version | Semantic version |
| checksum | SHA256 hash |
| file_size | Bytes |
| uploaded_at | Timestamp |
| uploaded_by | Admin UUID |

Files never queried directly.

---

# Release Upload Pipeline

```text id="mqdyaz"
Admin Uploads Workbook
        │
Validation
        │
Virus Scan (Future Ready)
        │
Upload to Storage
        │
Metadata Stored
        │
Release Published
```

Publishing is separate from uploading.

---

# Workbook Version Lifecycle

States:

| Status | Meaning |
|--------|---------|
| Draft | Uploaded only |
| Published | Customer available |
| Archived | Hidden |
| Deprecated | Old release retained |

Archived releases remain downloadable if licensed.

---

# Download Security Architecture

Downloads never expose bucket URLs directly.

## Flow

```text id="w4qppw"
Customer Request
      │
License Validation
      │
Generate Signed URL
      │
Download Starts
      │
Download Logged
```

Signed URLs expire.

---

# Signed URL Policy

| Property | Value |
|----------|-------|
| Expiration | 5 Minutes |
| Single Resource | Yes |
| Generated Server Side | Yes |
| Customer Auth Required | Yes |

URLs never cached permanently.

---

# License Validation Before Download

Checks include:

- Authenticated.
- License active.
- Product ownership.
- Release availability.
- Download permissions.

Only then generate signed URL.

---

# Download Logging

Every download creates database record.

Stored:

- Customer.
- Product.
- Release.
- Device.
- Browser.
- IP Hash.
- Timestamp.

Used for analytics.

---

# Media Library Bucket

Purpose:

Admin uploads reusable assets.

## Asset Types

| Type |
|------|
| PNG |
| JPG |
| SVG |
| WEBP |
| MP4 |
| GIF |
| PDF |
| ZIP |

Only approved MIME types accepted.

---

# Media Library Folder Structure

```text id="1hldmv"
media-library/

screenshots/

hero/

dashboard/

features/

icons/

logos/

social/

email/

blog/
```

Folders map to CMS categories.

---

# Media Metadata

Database table stores:

- filename.
- alt text.
- category.
- dimensions.
- uploaded_by.
- uploaded_at.
- tags.

Supports searching.

---

# Image Optimization Strategy

Images stored once.

Generated versions:

| Variant | Usage |
|---------|-------|
| Original | Archive |
| Thumbnail | Grid |
| Medium | Cards |
| Large | Hero |

Optimization handled before upload when possible.

---

# Avatar Bucket

Purpose:

Customer avatars.

## Folder Structure

```text id="txrmmb"
avatars/

customer_uuid/

avatar.webp
```

One avatar per customer.

---

# Avatar Rules

| Rule | Value |
|------|-------|
| Max Size | 2 MB |
| Preferred Format | WEBP |
| Square Crop | Yes |
| Auto Resize | Yes |

Old avatars replaced.

---

# Invoice Bucket

Purpose:

Store generated invoices.

## Folder Structure

```text id="p7txx9"
invoices/

2026/

01/

invoice_1001.pdf
```

Organized by year/month.

---

# Invoice File Rules

- Immutable.
- Never overwritten.
- Linked to order.
- Customer-only access.

---

# Marketing Assets Bucket

Purpose:

Website marketing resources.

Contains:

- Hero illustrations.
- Feature images.
- Product screenshots.
- Testimonials.
- Launch graphics.
- Social previews.

Admin-managed only.

---

# Exports Bucket

Purpose:

Temporary exported reports.

Examples:

- Revenue CSV.
- Customer CSV.
- Analytics PDF.
- Orders XLSX.

---

# Export Lifecycle

```text id="vbdzbe"
Admin Requests Export
        │
File Generated
        │
Stored in exports/
        │
Signed URL
        │
Download
        │
Auto Cleanup
```

Exports expire automatically.

---

# Temporary Bucket

Purpose:

Staging uploads.

Examples:

- Workbook draft.
- Avatar before crop.
- Image editor upload.
- CSV imports.

Files cleaned automatically.

---

# Temporary File Rules

| Rule | Value |
|------|-------|
| Lifetime | 24 Hours |
| Public Access | Never |
| Cleanup | Scheduled Job |

---

# Backup Bucket

Purpose:

Long-term backup assets.

Contains:

- Release snapshots.
- Media snapshots.
- Migration exports.

Only Super Admin access.

---

# System Assets Bucket

Purpose:

Public static assets.

Examples:

- Logos.
- Favicons.
- Open Graph images.
- Manifest icons.

Public CDN enabled.

---

# File Upload Validation

Validation required before storage.

## Allowed File Sizes

| Type | Limit |
|------|-------|
| Workbook | 50 MB |
| Image | 10 MB |
| Avatar | 2 MB |
| PDF | 20 MB |
| Video | 100 MB |
| CSV | 25 MB |

Rejected server-side.

---

# MIME Validation

Allowed MIME types explicitly defined.

Unknown MIME types rejected.

Extension alone is insufficient.

---

# Storage Path Standards

Storage paths use semantic hierarchy.

Rules:

- lowercase.
- hyphen-separated.
- UUID folders where ownership matters.
- Version folders for releases.

---

# Storage Metadata Table

Database stores:

| Metadata |
|----------|
| bucket |
| path |
| owner_id |
| size |
| mime_type |
| checksum |
| created_at |

Never trust storage filename alone.

---

# File Ownership Rules

| File Type | Owner |
|-----------|-------|
| Workbook | Product Release |
| Avatar | Customer |
| Invoice | Customer Order |
| Marketing Asset | Admin |
| Export | Admin User |

Ownership determines permissions.

---

# CDN Strategy

Supabase CDN serves:

- Images.
- PDFs.
- XLSX downloads.
- Static assets.

Private buckets require signed URLs.

---

# Cache Strategy

| Asset | Cache |
|-------|-------|
| Logos | Long Cache |
| Hero Images | Long Cache |
| Avatars | Medium Cache |
| Workbooks | No Permanent Public Cache |
| Invoices | Private Cache |

Cache controlled through headers.

---

# File Replacement Rules

| Asset | Replacement |
|-------|-------------|
| Avatar | Replace Existing |
| Workbook Draft | Replace Draft |
| Published Workbook | New Version Only |
| Invoice | Never Replace |
| Marketing Image | Versioned |

Immutable release files.

---

# Cleanup Jobs

Scheduled cleanup removes:

- Temporary uploads.
- Expired exports.
- Orphaned avatars.
- Unused thumbnails.
- Failed uploads.

Cleanup never deletes releases.

---

# Storage Analytics

Operations Center tracks:

| Metric |
|--------|
| Bucket Usage |
| Total Files |
| Storage Growth |
| Largest Files |
| Downloads Today |
| Bandwidth Usage |

Displayed in Operations Center.

---

# Storage Backup Strategy

Daily backup includes:

- Metadata export.
- Release manifest.
- Media manifest.

Binary backups handled by provider.

---

# Restore Strategy

Restore supports:

- Workbook rollback.
- Deleted media restore.
- Avatar recovery.
- Invoice recovery.

Metadata restored before files.

---

# Security Policies

Storage access always validated.

Rules:

- Customers cannot list buckets.
- Customers cannot enumerate files.
- Signed URLs generated server-side.
- Bucket names never exposed publicly.
- Service Role never client-side.

---

# Cursor Implementation Rules

Cursor must:

- Create buckets exactly as specified.
- Implement storage policies before uploads.
- Generate signed URLs server-side.
- Store metadata in PostgreSQL.
- Never expose storage secrets.
- Validate MIME type and file size.
- Implement cleanup cron jobs.
- Keep release files immutable.

---

# Frozen V1 Decisions

- Eight storage buckets.
- Private-by-default storage.
- Signed URLs for downloads.
- Immutable workbook releases.
- Version folders for products.
- Metadata stored in PostgreSQL.
- Cleanup via scheduled jobs.
- CDN for public assets only.
- Avatar replacement allowed.
- Invoice replacement prohibited.

All storage architecture decisions are frozen for V1.

---

# Next Document

**04_API_ARCHITECTURE.md**

The next backend specification defines:

- Complete REST API architecture.
- 120–150 FinanceOS endpoints.
- Request/response schemas.
- Pagination.
- Filtering.
- Sorting.
- Error handling.
- Validation.
- Middleware pipeline.
- Customer APIs.
- Admin APIs.
- Operations Center APIs.
- Analytics APIs.
- Download APIs.
- Health check APIs.
- Cursor API implementation standards.
