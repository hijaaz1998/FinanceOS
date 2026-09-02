# 01_ADMIN_LAYOUT_AND_NAVIGATION.md

## FinanceOS — Admin Portal Layout, Navigation & UI Architecture Specification

**Document ID:** WEB-ADMIN-01

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Admin Layout & Navigation)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/admin`

---

## Dependencies

- `00_ADMIN_MASTER.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`
- `docs/design/02_COMPONENT_LIBRARY.md`
- `docs/design/03_EXCEL_UI_SYSTEM.md`
- `docs/design/04_CHART_UI_GUIDELINES.md`
- `docs/design/07_DARK_LIGHT_THEME_SYSTEM.md`

---

# Purpose

This document defines the complete **layout architecture, navigation system, page structure, reusable admin components, tables, filters, search system, responsive behavior, and interaction patterns** for the FinanceOS Admin Portal.

It is the UI blueprint for every admin page.

This document is the **single source of truth** for Cursor when building the Admin Portal interface.

---

# Admin UI Philosophy

FinanceOS Admin Portal is an **internal business operating system**, not a marketing website.

The interface should feel like:

- Stripe Dashboard
- Supabase Dashboard
- Linear
- Vercel Dashboard
- Notion Admin

Design priorities:

- Dense information.
- Extremely readable.
- Fast navigation.
- Minimal clicks.
- Consistent across every module.

---

# Admin Layout Architecture

Every admin page uses one shared application shell.

```text
┌───────────────────────────────────────────────────────────────┐
│ Header                                                       │
├───────────────┬───────────────────────────────────────────────┤
│ Sidebar       │ Main Content                                 │
│ Navigation    │                                               │
│               │ Dashboard / Tables / Charts / Forms          │
│               │                                               │
├───────────────┴───────────────────────────────────────────────┤
│ Footer (Small System Footer)                                 │
└───────────────────────────────────────────────────────────────┘
```

This layout never changes.

---

# Admin Shell Components

| Component | Purpose |
|----------|---------|
| Sidebar | Primary navigation. |
| Header | Search, notifications, profile. |
| Breadcrumb | Current page hierarchy. |
| Main Content | Page content. |
| Floating Actions | Context actions. |
| Footer | Version and system status. |

All pages reuse this shell.

---

# Admin Navigation Hierarchy

```text
Overview

Customers
    ├── Customer List
    ├── Customer Profile
    ├── Downloads
    └── Licenses

Orders
    ├── Orders
    ├── Refunds
    └── Invoices

Products
    ├── Releases
    ├── Versions
    ├── Downloads
    └── Changelog

Payments
    ├── Razorpay
    ├── Stripe
    ├── Coupons
    └── PPP Pricing

Emails
    ├── Templates
    ├── Notifications
    └── Delivery Logs

Analytics
    ├── Revenue
    ├── Customers
    ├── Marketing
    └── Downloads

Content Library
    ├── Screenshots
    ├── Social Images
    └── Assets

Settings
```

Frozen navigation tree.

---

# Sidebar Specification

Sidebar width:

**280px**

Persistent on desktop.

---

## Sidebar Sections

| Section | Purpose |
|--------|---------|
| Logo Area | FinanceOS Admin branding. |
| Primary Navigation | Main modules. |
| Divider | Separate business tools. |
| Secondary Navigation | Settings. |
| Bottom Area | Admin profile & logout. |

---

## Sidebar Item Design

Every navigation item contains:

- Lucide icon.
- Label.
- Active indicator.
- Hover background.
- Notification badge (optional).

---

## Active Navigation Behavior

Current page displays:

- Accent-colored indicator bar.
- Accent background.
- Bold label.
- Icon accent color.

Only one active page.

---

## Collapsible Sidebar

Desktop supports collapse.

### Expanded

280px.

### Collapsed

80px.

Icons remain visible.

Hover tooltip displays labels.

---

## Mobile Sidebar

Replaced by slide-out drawer.

Opens from left.

Contains full navigation tree.

---

# Header Specification

Header remains sticky.

Height:

**72px**

Always visible.

---

## Header Components

| Component | Purpose |
|----------|---------|
| Breadcrumb | Current location. |
| Global Search | Search customers/orders/etc. |
| Notification Bell | Admin alerts. |
| Theme Toggle | Dark/Light mode. |
| Admin Avatar | Profile menu. |

---

## Breadcrumb Rules

Examples:

```text
Dashboard

Dashboard / Customers

Dashboard / Customers / Customer Profile

Dashboard / Products / Releases
```

Auto-generated from route.

---

## Global Search

Search available from header.

Supports instant search.

---

## Search Categories

Search across:

| Entity | Searchable |
|--------|------------|
| Customer | Name, email. |
| Order | Order ID. |
| License | License ID. |
| Coupon | Coupon code. |
| Invoice | Invoice number. |
| Version | Workbook version. |

Single search input.

---

## Search Result Dropdown

Grouped results.

```text
Customers
Orders
Coupons
Invoices
Versions
```

Click navigates directly.

---

# Notification Center

Bell icon opens notification drawer.

---

## Notification Categories

| Category | Example |
|----------|---------|
| Success | Release published. |
| Warning | Failed payment. |
| Error | Email delivery failed. |
| Info | New customer registered. |

---

## Notification Drawer Layout

Contains:

- Icon.
- Title.
- Timestamp.
- CTA button (optional).

Newest first.

---

# Admin Profile Menu

Dropdown includes:

- Admin Profile.
- Preferences.
- Theme.
- Logout.

Future:

Team management.

---

# Page Container Rules

Every page follows:

- Max width: 1440px.
- Responsive padding.
- Scroll only content area.
- Sticky header.

---

# Page Header Component

Every page begins with a standard page header.

Contains:

| Element | Description |
|---------|-------------|
| Page Title | H1 |
| Description | Short explanation |
| Primary Action | Button |
| Secondary Action | Optional |

Example:

Customers

Manage every FinanceOS customer.

---

# Page Action Bar

Below page header.

Contains:

- Filters.
- Date picker.
- Export.
- Refresh.
- Search.

Reusable component.

---

# KPI Card Grid

Admin KPI cards reuse Design System.

Desktop:

4 columns.

Tablet:

2 columns.

Mobile:

1 column.

---

## KPI Card Anatomy

Contains:

- Label.
- Value.
- Trend.
- Icon.
- Mini chart (optional).

---

# Table System

Tables are the most important admin component.

Every table follows one standard.

---

## Admin Table Structure

| Feature | Requirement |
|---------|-------------|
| Sticky Header | Yes |
| Sticky First Column | Where needed |
| Sortable Columns | Yes |
| Filter Row | Optional |
| Pagination | Yes |
| Row Selection | Yes |
| Bulk Actions | Yes |

---

## Table Density

Three density modes.

| Mode | Height |
|------|---------|
| Compact | 44px |
| Comfortable | 52px |
| Spacious | 60px |

Default:

Comfortable.

---

## Table Toolbar

Toolbar above table contains:

- Search.
- Filters.
- Export.
- Column visibility.
- Refresh.

Shared across portal.

---

## Table Pagination

Pagination appears bottom-right.

Controls:

- Previous.
- Next.
- Page numbers.
- Rows per page.

---

## Bulk Actions

Appears after selecting rows.

Examples:

- Export.
- Delete.
- Send Email.
- Activate Coupon.
- Archive.

---

# Filter Drawer

Advanced filters open in side drawer.

Filter groups:

- Date.
- Country.
- Currency.
- Version.
- Payment.
- Status.

Reusable component.

---

# Status Badge System

Shared badges.

| Status | Color |
|--------|-------|
| Active | Green |
| Pending | Yellow |
| Failed | Red |
| Refunded | Orange |
| Archived | Gray |
| Draft | Blue |

Same badge everywhere.

---

# Empty State Component

Every module has empty state.

Contains:

- Illustration.
- Title.
- Description.
- CTA.

---

# Loading States

Skeleton loaders required.

Components:

- KPI cards.
- Tables.
- Charts.
- Forms.
- Search results.

---

# Form Layout System

Admin forms use two-column layout.

Mobile stacks vertically.

---

## Form Field Width Rules

| Type | Width |
|------|-------|
| Text | Full |
| Select | Half |
| Date | Half |
| Number | Half |
| Textarea | Full |

---

# Modal System

Reusable modal sizes.

| Size | Width |
|------|-------|
| Small | 420px |
| Medium | 600px |
| Large | 800px |
| Full | 1000px |

---

## Confirmation Modal Rules

Required for:

- Refund.
- Delete coupon.
- Publish release.
- Delete asset.
- Disable customer.

---

# Drawer System

Side drawers used instead of modals for editing large objects.

Examples:

- Customer profile.
- Order details.
- Coupon editing.
- Release details.

---

# Tabs Component

Used inside detail pages.

Example customer page:

Overview

Orders

Downloads

Invoices

Activity

---

# Chart Layout Rules

Charts follow Design System.

Allowed charts:

- Revenue Line.
- Bar.
- Pie.
- Donut.
- Area.
- KPI Sparkline.

---

# Chart Grid Rules

Desktop:

2-column charts.

Mobile:

Single-column.

---

# Responsive Layout Rules

| Screen | Behavior |
|--------|----------|
| Desktop | Sidebar visible |
| Tablet | Sidebar collapsible |
| Mobile | Drawer navigation |

Tables become scrollable containers.

---

# Theme Rules

Admin supports:

- Dark Theme.
- Light Theme.

Theme preference stored per admin.

---

# Keyboard Shortcuts (Version 1)

Reserved shortcuts.

| Shortcut | Action |
|----------|--------|
| `/` | Focus Search |
| `Esc` | Close modal |
| `Ctrl + K` | Search (future) |
| `Ctrl + /` | Shortcuts help (future) |

---

# Animation Rules

Admin animations remain subtle.

Allowed:

- Fade.
- Slide.
- Scale.
- Skeleton shimmer.

Avoid decorative animations.

---

# Accessibility Rules

Admin UI supports:

- Keyboard navigation.
- Screen readers.
- Focus indicators.
- Accessible tables.
- Accessible charts.
- Reduced motion.

---

# Cursor Component Inventory

Cursor builds reusable components.

| Component | Used In |
|-----------|---------|
| AdminSidebar | Every page |
| AdminHeader | Every page |
| Breadcrumbs | Every page |
| PageHeader | Every module |
| KPIGrid | Dashboard |
| DataTable | All modules |
| FilterDrawer | Tables |
| SearchBar | Header |
| NotificationDrawer | Header |
| StatusBadge | Everywhere |
| EmptyState | Every module |
| LoadingSkeleton | Every module |

---

# Cursor Implementation Rules

Cursor must:

1. Build one reusable admin shell.
2. Keep sidebar persistent.
3. Use shared table component across portal.
4. Use shared filter system.
5. Use shared modal and drawer system.
6. Reuse Design System tokens.
7. Support responsive admin layout.
8. Maintain accessibility across all components.

---

# Frozen Decisions (Version 1)

The following Admin Layout decisions are locked.

- 280px sidebar.
- Sticky 72px header.
- Global search in header.
- Notification drawer.
- Reusable page header.
- Shared data table architecture.
- Shared filter drawer.
- Shared modal system.
- Desktop/tablet/mobile responsive admin shell.
- Dark/Light theme support.

---

# Version History

## Version 1.0

Official FinanceOS Admin layout specification defining application shell, navigation hierarchy, sidebar behavior, header system, search architecture, notification drawer, table system, filters, responsive layout, reusable UI components, accessibility, and Cursor implementation standards.

---

**End of Document**

**File:** `01_ADMIN_LAYOUT_AND_NAVIGATION.md`
