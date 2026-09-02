# 08_CONTENT_AND_MEDIA_LIBRARY.md

## FinanceOS — Content, Asset & Media Library Management Specification

**Document ID:** WEB-ADMIN-08

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Content & Media Library)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/admin`

---

## Dependencies

- `00_ADMIN_MASTER.md`
- `01_ADMIN_LAYOUT_AND_NAVIGATION.md`
- `04_PRODUCT_RELEASE_MANAGEMENT.md`
- `07_ANALYTICS_AND_GROWTH_DASHBOARD.md`
- `docs/web/user/02_LANDING_PAGE_SPECIFICATION.md`
- `docs/web/user/06_PRODUCT_SHOWCASE_SECTIONS.md`
- `docs/web/user/12_SEO_CONTENT_AND_COPY_GUIDELINES.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`

---

# Purpose

This document defines the complete **Content & Media Library** inside the FinanceOS Admin Portal.

The Media Library is the centralized storage and management system for every visual, downloadable, and marketing asset used across the FinanceOS ecosystem.

It manages:

- Product screenshots.
- Dashboard mockups.
- Excel UI images.
- Google Sheets UI images.
- Hero illustrations.
- Open Graph images.
- Logos.
- Icons.
- Social media creatives.
- Marketing assets.
- PDF assets.
- Brand resources.

This document is the **single source of truth** for Cursor when implementing media management.

---

# Media Library Philosophy

FinanceOS follows one asset principle:

> **Every visual asset exists once, is versioned, categorized, and reusable across the website, customer dashboard, marketing, and documentation.**

No duplicate uploads.

Every asset has metadata.

---

# Media Library Objectives

| Objective | Purpose |
|-----------|---------|
| Central Asset Storage | One location for every visual asset. |
| Version Control | Historical asset versions. |
| Marketing Support | Social creatives and promotional assets. |
| Website Support | Hero images, showcase images, Open Graph images. |
| Product Support | Screenshots, release images, workbook previews. |
| SEO Support | Alt text and metadata management. |

---

# Media Library Architecture

```text
Media Library
│
├── Product Assets
├── Website Assets
├── Marketing Assets
├── Social Media Assets
├── Brand Assets
├── Release Assets
├── Documentation Assets
└── Archive
```

Every asset belongs to exactly one primary category.

---

# Media Library Dashboard

Top dashboard provides an overview.

## KPI Cards

| KPI | Description |
|-----|-------------|
| Total Assets | Lifetime uploaded assets. |
| Product Screenshots | Workbook screenshots. |
| Marketing Creatives | Social media creatives. |
| Website Images | Landing page assets. |
| Open Graph Images | SEO/social images. |
| Archived Assets | Historical assets. |

---

# Asset Categories

Version 1 supports **8 asset categories**.

| Category | Purpose |
|----------|---------|
| Product Screenshots | Excel & Google Sheets screenshots. |
| Website Images | Landing page illustrations and visuals. |
| Marketing Creatives | Ads, carousels, banners. |
| Social Media | Instagram, LinkedIn, X, Threads, YouTube. |
| Brand Assets | Logos, icons, colors. |
| Release Assets | Version-specific visuals. |
| Documents | PDFs, guides, thumbnails. |
| Archive | Old versions and retired assets. |

---

# Asset Type System

Each asset has one type.

| Type | Example |
|------|---------|
| Screenshot | Dashboard screenshot |
| Illustration | Hero illustration |
| Banner | Pricing banner |
| Thumbnail | YouTube thumbnail |
| Logo | FinanceOS logo |
| Icon | SVG icon |
| Mockup | Laptop workbook mockup |
| PDF Preview | Workbook preview PDF |

---

# Media Library Navigation

```text
Content Library
│
├── Dashboard
├── Product Screenshots
├── Website Assets
├── Marketing Assets
├── Social Assets
├── Brand Assets
├── Release Assets
├── Documents
└── Archive
```

---

# Asset Table

Master asset table.

## Columns

| Column | Description |
|--------|-------------|
| Asset Preview | Thumbnail |
| Asset Name | Display name |
| Category | Asset category |
| Type | Screenshot / Banner / Logo |
| Version | Linked workbook version |
| Uploaded By | Admin |
| Upload Date | Timestamp |
| Status | Active / Archived |
| Actions | View / Edit |

Sticky header required.

---

# Asset Status System

| Status | Meaning |
|--------|---------|
| Draft | Uploaded but unused. |
| Active | Currently used somewhere. |
| Archived | Historical asset. |
| Deprecated | Replaced by newer asset. |

---

# Product Screenshot Library

Purpose:

Manage screenshots used throughout FinanceOS.

---

# Screenshot Categories

| Category | Count Target |
|----------|--------------|
| Dashboard | Multiple screenshots |
| Transactions | Multiple screenshots |
| Income | Multiple screenshots |
| Expenses | Multiple screenshots |
| Investments | Multiple screenshots |
| Goals | Multiple screenshots |
| Reports | Multiple screenshots |
| Settings | Multiple screenshots |

Every worksheet has dedicated screenshots.

---

# Screenshot Metadata

Every screenshot includes metadata.

| Field | Required |
|------|----------|
| Asset Name | Yes |
| Worksheet | Yes |
| Theme | Yes |
| Version | Yes |
| Alt Text | Yes |
| Resolution | Yes |
| Dimensions | Yes |

---

# Screenshot Naming Convention

Examples.

```text
dashboard_dark_v1_2_0.webp
transactions_light_v1_2_0.webp
goals_dashboard_dark_v1_2_0.webp
reports_summary_light_v1_2_0.webp
```

Naming convention is frozen.

---

# Website Asset Library

Purpose:

Store assets used by the public website.

---

# Website Asset Categories

| Asset | Usage |
|------|-------|
| Hero Background | Landing page |
| Hero Dashboard Preview | Landing page |
| Playground Illustrations | Interactive calculator |
| Pricing Graphics | Pricing page |
| FAQ Illustrations | FAQ page |
| Footer Graphics | Footer |

---

# Hero Asset Rules

Hero assets require:

- Desktop version.
- Tablet version.
- Mobile version.
- Retina resolution.

---

# Open Graph Asset Library

Purpose:

SEO and social previews.

---

# Open Graph Categories

| Page | Image |
|------|-------|
| Homepage | Main preview |
| Pricing | Pricing preview |
| FAQ | FAQ preview |
| About | About preview |
| Dashboard | Dashboard preview |

Every page has dedicated OG image.

---

# Social Media Asset Library

Purpose:

Manage platform-specific creatives.

---

# Platform Categories

| Platform | Formats |
|----------|---------|
| Instagram | Post, Story, Reel Cover |
| LinkedIn | Carousel, Banner |
| YouTube | Thumbnail |
| X | Social Card |
| Threads | Square Image |

---

# Instagram Creative Library

Contains:

- Feed posts.
- Carousel graphics.
- Story graphics.
- Reel covers.

---

# YouTube Asset Library

Contains:

- Thumbnails.
- Channel banners.
- Shorts covers.

---

# LinkedIn Asset Library

Contains:

- Founder posts.
- Carousel slides.
- Product launch banners.

---

# Marketing Creative Library

Purpose:

Store advertising creatives.

---

# Creative Categories

| Category | Usage |
|----------|-------|
| Meta Ads | Facebook & Instagram Ads |
| Google Ads | Display banners |
| Landing Page Ads | Internal campaigns |
| Promotional Banners | Seasonal promotions |

---

# Creative Metadata

Each creative stores:

- Campaign.
- Platform.
- Format.
- Version.
- Status.
- Dimensions.

---

# Brand Asset Library

Purpose:

Manage FinanceOS branding.

---

# Brand Categories

| Category | Assets |
|----------|--------|
| Logos | Primary, secondary, icon-only |
| Icons | App icons, favicon |
| Color Assets | Brand palette |
| Typography Assets | Brand fonts |
| Watermarks | Marketing watermark |

---

# Logo Variants

Version 1 includes:

| Logo | Usage |
|------|-------|
| Primary Logo | Website |
| Dark Logo | Dark backgrounds |
| Light Logo | Light backgrounds |
| Icon Logo | App icon |
| Monochrome Logo | PDFs and watermark |

---

# Icon Library

Purpose:

Central SVG icon storage.

Categories:

- Navigation icons.
- Finance icons.
- Social icons.
- Brand icons.

SVG only.

---

# Release Asset Library

Purpose:

Assets tied to workbook releases.

---

# Release Asset Structure

```text
Release Assets
│
├── V1.0.0
├── V1.1.0
├── V1.2.0
├── V1.2.1
└── Future Releases
```

Each release has dedicated visuals.

---

# Release Asset Contents

Each version contains:

- Hero screenshot.
- Changelog banner.
- What's New image.
- Download thumbnail.
- Release social card.

---

# Documentation Asset Library

Purpose:

Assets used in documentation.

Includes:

- Architecture diagrams.
- Workflow diagrams.
- Icons.
- PDF previews.
- Charts.

---

# Asset Upload Workflow

```text
Upload Asset
     │
Metadata Validation
     │
Category Assignment
     │
Thumbnail Generation
     │
Asset Published
```

Every upload requires metadata.

---

# Upload Validation Rules

Required validation.

| Validation | Required |
|-----------|----------|
| Supported File Type | Yes |
| Asset Name | Yes |
| Category | Yes |
| Alt Text | Yes |
| Dimensions | Yes |
| Duplicate Check | Yes |

---

# Supported File Types

| Format | Version 1 |
|--------|-----------|
| PNG | Yes |
| WEBP | Yes |
| SVG | Yes |
| JPG | Yes |
| PDF | Yes |
| GIF | Yes |
| MP4 | Future |

---

# Image Optimization Rules

Assets automatically optimized.

Rules:

- Generate WebP.
- Generate thumbnails.
- Preserve original.
- Store dimensions.
- Store file size.

---

# Asset Versioning Rules

Assets support historical versions.

Example:

```text
dashboard_dark_v1_1_0.webp
dashboard_dark_v1_2_0.webp
dashboard_dark_v1_2_1.webp
```

Old assets archived.

---

# Replace Asset Workflow

```text
Upload New Version
       │
Mark Old Asset Deprecated
       │
Update References
       │
Archive Previous Version
```

Never overwrite originals.

---

# Asset Usage Tracking

Every asset tracks usage.

Displays:

- Website pages.
- Product showcase.
- Release notes.
- Marketing campaigns.
- Emails.

One asset may be used in multiple places.

---

# Asset Detail Drawer

Displays:

- Preview.
- Metadata.
- Resolution.
- File size.
- Usage locations.
- Version history.
- Download button.

---

# Asset Search System

Search supports:

| Search | Example |
|--------|---------|
| Asset Name | dashboard_dark |
| Worksheet | Goals |
| Version | V1.2.0 |
| Category | Product Screenshot |
| Campaign | Launch Week |

---

# Asset Filter System

Filters include:

| Filter | Options |
|--------|---------|
| Category | Screenshot / Logo / Banner |
| Theme | Dark / Light |
| Version | Workbook version |
| Format | PNG / SVG / WEBP |
| Status | Active / Archived |

---

# Asset Tags

Version 1 tags.

| Tag | Purpose |
|-----|----------|
| Dashboard | Worksheet screenshot |
| Hero | Landing page |
| Social | Marketing |
| Release | Product release |
| Brand | Branding asset |

Multiple tags allowed.

---

# Asset Preview Page

Displays:

- Large preview.
- Metadata sidebar.
- Related assets.
- Version history.
- Usage references.

---

# Bulk Asset Actions

| Action | Applies To |
|--------|------------|
| Archive Assets | Selected assets |
| Export Assets | Download originals |
| Generate Thumbnails | Images |
| Update Metadata | Selected assets |

---

# Export Asset Library

Supported exports.

| Format | Version 1 |
|--------|-----------|
| ZIP | Yes |
| CSV Metadata | Yes |
| Excel Metadata | Yes |

---

# Archive System

Purpose:

Store retired assets.

Archive contains:

- Old screenshots.
- Old logos.
- Previous release banners.
- Deprecated creatives.

Assets remain searchable.

---

# Media Storage Architecture

```text
storage/
│
├── product/
├── website/
├── social/
├── marketing/
├── releases/
├── brand/
├── documentation/
└── archive/
```

Folders are frozen.

---

# Empty States

Examples.

## No Assets

"No media assets uploaded."

## No Brand Assets

"Brand assets will appear here."

---

# Loading States

Skeleton loaders for:

- Asset grid.
- Asset table.
- Preview drawer.
- Search results.

---

# Responsive Behavior

## Desktop

Grid + table views.

## Tablet

Compact grid.

## Mobile

Asset cards only.

---

# Accessibility Rules

Media Library supports:

- Accessible asset previews.
- Keyboard navigation.
- Alt text validation.
- Focus indicators.
- Screen reader labels.

---

# Performance Targets

| Interaction | Target |
|------------|--------|
| Asset Search | Under 300ms |
| Asset Preview | Under 500ms |
| Thumbnail Generation | Under 2 seconds |
| Metadata Update | Under 300ms |

---

# Database Fields Referenced

## Media Assets Table

| Field | Purpose |
|------|---------|
| Asset ID | Primary identifier |
| Asset Name | Display name |
| Category | Library grouping |
| Version | Workbook version |
| Status | Lifecycle |
| Alt Text | SEO accessibility |
| Dimensions | Image metadata |
| Created At | Upload timestamp |

---

# Cursor Components

| Component | Used In |
|-----------|---------|
| AssetTable | Table view |
| AssetGrid | Grid gallery |
| AssetPreviewDrawer | Asset details |
| UploadAssetModal | Upload workflow |
| MetadataEditor | Asset editing |
| AssetUsageCard | Usage tracking |
| VersionHistoryPanel | Asset history |
| TagFilterBar | Filtering |

---

# Cursor Implementation Rules

Cursor must:

1. Build one centralized media library.
2. Version every uploaded asset.
3. Store metadata for every asset.
4. Track asset usage across the application.
5. Generate optimized thumbnails.
6. Support grid and table views.
7. Archive deprecated assets instead of deleting them.
8. Support ZIP and metadata exports.

---

# Frozen Decisions (Version 1)

The following Content & Media Library decisions are locked.

- Centralized media storage.
- Eight asset categories.
- Versioned screenshots.
- WebP optimization.
- Metadata required for every asset.
- Asset usage tracking.
- Archive instead of deletion.
- Shared asset search and filtering.
- Separate release asset storage.

---

# Version History

## Version 1.0

Official FinanceOS Content & Media Library specification defining asset categories, upload workflows, versioning, metadata, branding assets, release assets, marketing creatives, storage architecture, search, filtering, exports, and Cursor implementation standards.

---

**End of Document**

**File:** `08_CONTENT_AND_MEDIA_LIBRARY.md`
