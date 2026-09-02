# 07_ANALYTICS_AND_GROWTH_DASHBOARD.md

## FinanceOS — Business Analytics, Revenue Intelligence & Growth Dashboard Specification

**Document ID:** WEB-ADMIN-07

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Analytics & Growth Dashboard)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/admin`

---

## Dependencies

- `00_ADMIN_MASTER.md`
- `02_CUSTOMER_MANAGEMENT.md`
- `03_ORDER_AND_LICENSE_MANAGEMENT.md`
- `04_PRODUCT_RELEASE_MANAGEMENT.md`
- `05_PAYMENT_AND_COUPON_SYSTEM.md`
- `06_EMAIL_AND_NOTIFICATION_CENTER.md`
- `docs/web/user/07_PRICING_AND_PPP_SYSTEM.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/04_CHART_UI_GUIDELINES.md`
- `docs/design/06_DASHBOARD_CARD_SYSTEM.md`

---

# Purpose

This document defines the complete **Analytics & Growth Dashboard** inside the FinanceOS Admin Portal.

The dashboard is the command center for monitoring the health and growth of the FinanceOS business.

It tracks:

- Revenue.
- Customers.
- Sales.
- Downloads.
- Product adoption.
- Coupons.
- Marketing performance.
- Email engagement.
- Conversion funnel.
- Business KPIs.

This document is the **single source of truth** for Cursor when implementing analytics.

---

# Analytics Philosophy

FinanceOS analytics answer one question:

> **"How is the business performing, and what action should be taken next?"**

Analytics are designed for decision-making, not reporting.

Every metric must be actionable.

---

# Dashboard Objectives

| Objective | Purpose |
|-----------|---------|
| Revenue Intelligence | Monitor sales and revenue growth. |
| Customer Intelligence | Understand customer acquisition and retention. |
| Product Intelligence | Track workbook adoption and downloads. |
| Marketing Intelligence | Measure campaign performance. |
| Operational Intelligence | Detect failures and anomalies quickly. |

---

# Analytics Dashboard Architecture

```text
Analytics Dashboard
│
├── Executive Overview
├── Revenue Analytics
├── Customer Analytics
├── Download Analytics
├── Product Adoption Analytics
├── Marketing Analytics
├── Email Analytics
├── Coupon Analytics
├── Conversion Funnel
└── Operational Health
```

All analytics live under `/admin/analytics`.

---

# Executive Overview Dashboard

The first screen contains a complete business snapshot.

## KPI Cards

| KPI | Description |
|-----|-------------|
| Lifetime Revenue | Total business revenue. |
| Monthly Revenue | Revenue this month. |
| Today's Revenue | Revenue today. |
| Active Customers | Paying customers. |
| Conversion Rate | Website visitor → purchase. |
| Latest Workbook Version | Current live release. |
| Version Adoption Rate | Customers on latest version. |
| Refund Rate | Refund percentage. |

---

# Executive Dashboard Layout

Order of sections.

1. KPI Cards.
2. Revenue Trend.
3. Conversion Funnel.
4. Customer Growth.
5. Download Activity.
6. Marketing Snapshot.
7. Operational Alerts.

---

# Date Range Selector

Every analytics widget supports one shared date selector.

## Options

| Option | Description |
|--------|-------------|
| Today | Current day. |
| Last 7 Days | Rolling week. |
| Last 30 Days | Rolling month. |
| Last 90 Days | Quarter. |
| This Year | Calendar year. |
| Custom Range | Manual dates. |

Changing the selector refreshes all widgets.

---

# Revenue Analytics

Purpose:

Track revenue across every dimension.

---

# Revenue KPI Cards

| KPI | Description |
|-----|-------------|
| Gross Revenue | Before refunds. |
| Net Revenue | After refunds. |
| Refund Amount | Total refunds. |
| Average Order Value | Revenue ÷ Orders. |
| Revenue Growth | Percentage growth. |
| Monthly Recurring Revenue | Reserved for V2. |

---

# Revenue Trend Chart

Primary chart.

Displays:

- Daily revenue.
- Weekly revenue.
- Monthly revenue.

Chart type:

**Line Chart**

---

# Revenue by Country

Bar chart.

| Country | Metric |
|---------|--------|
| India | Revenue |
| USA | Revenue |
| UK | Revenue |
| Europe | Revenue |

Countries sorted descending.

---

# Revenue by Currency

Pie chart.

Segments:

- INR.
- USD.
- GBP.
- EUR.

Shows percentage contribution.

---

# Revenue by Gateway

Stacked bar chart.

| Gateway | Revenue |
|---------|---------|
| Razorpay | INR Revenue |
| Stripe | International Revenue |

---

# Revenue Heatmap

Future-ready calendar heatmap.

Displays:

- Daily revenue intensity.
- Purchase frequency.

Reserved for Version 2.

---

# Customer Analytics

Purpose:

Measure customer acquisition and retention.

---

# Customer KPI Cards

| KPI | Description |
|-----|-------------|
| Total Customers | Lifetime accounts. |
| Paying Customers | Purchased customers. |
| New Customers Today | Daily registrations. |
| New Customers This Month | Monthly registrations. |
| Verified Accounts | Email verified customers. |
| Returning Customers | Multiple purchases (future). |

---

# Customer Growth Chart

Line chart.

Displays cumulative customer growth over time.

---

# Customer Acquisition by Country

Bar chart.

Shows customer count by country.

---

# Customer Verification Rate

Donut chart.

Segments:

- Verified.
- Pending.

---

# Customer Activity Chart

Area chart.

Tracks:

- Daily logins.
- Dashboard activity.
- Download activity.

---

# Customer Retention Metrics

Version 1 metrics.

| Metric | Description |
|--------|-------------|
| Active Last 7 Days | Dashboard activity. |
| Active Last 30 Days | Dashboard activity. |
| Downloaded Latest Version | Update adoption. |

---

# Download Analytics

Purpose:

Track workbook downloads.

---

# Download KPI Cards

| KPI | Description |
|-----|-------------|
| Total Downloads | Lifetime downloads. |
| Downloads Today | Daily downloads. |
| Excel Downloads | Excel workbook downloads. |
| Google Sheets Copies | Template copies. |
| Failed Downloads | Download failures. |
| Download Success Rate | Success percentage. |

---

# Download Trend Chart

Line chart.

Tracks downloads over time.

---

# Platform Distribution Chart

Donut chart.

Segments:

- Excel.
- Google Sheets.

---

# Version Download Chart

Bar chart.

Downloads grouped by version.

| Version | Downloads |
|---------|-----------|
| V1.2.1 | Count |
| V1.2.0 | Count |
| V1.1.0 | Count |
| V1.0.0 | Count |

---

# Download Country Table

Shows downloads by region.

| Country | Excel | Google Sheets | Total |
|---------|-------|---------------|------|

---

# Product Adoption Analytics

Purpose:

Track latest workbook adoption.

---

# Adoption KPI Cards

| KPI | Description |
|-----|-------------|
| Eligible Customers | Can update. |
| Updated Customers | Downloaded latest version. |
| Adoption Rate | Percentage updated. |
| Pending Updates | Customers yet to update. |

---

# Adoption Curve

Line chart.

Tracks adoption after release.

Timeline:

- Day 1.
- Day 7.
- Day 30.

---

# Version Adoption Table

| Version | Active Users | Adoption % |
|---------|--------------|-----------|

---

# Marketing Analytics

Purpose:

Monitor website growth and campaign performance.

---

# Marketing KPI Cards

| KPI | Description |
|-----|-------------|
| Landing Page Visitors | Visitors. |
| Pricing Page Views | Intent visitors. |
| Playground Users | Interactive users. |
| Checkout Started | Checkout sessions. |
| Purchases Completed | Successful purchases. |
| Conversion Rate | Visitors → Purchases. |

---

# Traffic Source Breakdown

Bar chart.

Sources:

- Direct.
- Organic Search.
- Instagram.
- YouTube.
- LinkedIn.
- Referral.

Future ad sources supported.

---

# Landing Page Funnel

Conversion funnel.

```text
Landing Page Visitors
        │
Pricing Page
        │
Playground Used
        │
Checkout Started
        │
Payment Completed
```

---

# Conversion KPI Table

| Funnel Stage | Conversion |
|--------------|------------|
| Landing → Pricing | % |
| Pricing → Playground | % |
| Playground → Checkout | % |
| Checkout → Purchase | % |

---

# Playground Analytics

Tracks:

- Slider interactions.
- Calculator usage.
- CTA clicks.
- Unlock conversion.

---

# Coupon Analytics

Purpose:

Measure coupon performance.

---

# Coupon KPI Cards

| KPI | Description |
|-----|-------------|
| Active Coupons | Current coupons. |
| Redemption Count | Total uses. |
| Coupon Revenue | Revenue influenced. |
| Discount Value | Total discounts given. |

---

# Coupon Performance Chart

Bar chart.

Coupons ranked by usage.

---

# Coupon Conversion Table

| Coupon | Uses | Revenue | Conversion |
|--------|------|---------|-----------|

---

# Email Analytics

Purpose:

Track communication performance.

---

# Email KPI Cards

| KPI | Description |
|-----|-------------|
| Emails Sent | Count. |
| Delivery Rate | % |
| Open Rate | % |
| Click Rate | % |
| Bounce Rate | % |
| Failed Emails | Count. |

---

# Email Engagement Chart

Line chart.

Tracks:

- Opens.
- Clicks.
- Deliveries.

---

# Template Performance Table

| Template | Open % | Click % |
|----------|--------|---------|

---

# Version Update Campaign Analytics

Tracks:

- Update emails sent.
- Opens.
- Download clicks.
- Completed downloads.

---

# Operational Health Dashboard

Purpose:

Detect system issues.

---

# Health KPI Cards

| KPI | Description |
|-----|-------------|
| Payment Gateway Status | Healthy / Issue. |
| Email Service Status | Healthy / Issue. |
| Download Service Status | Healthy / Issue. |
| Supabase Status | Healthy / Issue. |
| Failed Payments | Count. |
| Failed Downloads | Count. |

---

# Operational Alerts Panel

Displays alerts.

Examples:

- Failed webhook.
- Storage unavailable.
- Email delivery issue.
- Refund processing failure.

Newest alerts first.

---

# Business Intelligence Widgets

Widgets include:

- Top countries.
- Top coupon.
- Best performing release.
- Fastest adoption release.
- Highest revenue day.

---

# Revenue Leaderboards

Tables include:

## Top Revenue Days

| Date | Revenue |
|------|---------|

## Top Revenue Countries

| Country | Revenue |
|---------|---------|

## Top Campaigns

| Campaign | Revenue |
|----------|---------|

---

# Forecast Widgets (Version 1)

Simple forecast cards.

| Forecast | Description |
|----------|-------------|
| Monthly Revenue Projection | Based on current pace. |
| Expected Downloads | Current trend. |
| Expected Customers | Growth trend. |

AI forecasting reserved for future.

---

# Dashboard Refresh Rules

| Widget | Refresh |
|--------|---------|
| KPIs | Real-time |
| Revenue Charts | Every minute |
| Downloads | Every minute |
| Emails | Every minute |
| Marketing | Every 5 minutes |

---

# Export Analytics

Supported exports.

| Format | Version 1 |
|--------|-----------|
| CSV | Yes |
| Excel | Yes |
| PNG Charts | Yes |
| PDF Report | Future |

---

# Analytics Report Generator

Generate downloadable reports.

Options:

- Revenue Report.
- Customer Report.
- Download Report.
- Coupon Report.
- Marketing Report.

---

# Empty States

Examples.

## No Revenue

"No revenue available for selected period."

## No Campaign Data

"No marketing activity available."

---

# Loading States

Skeleton loaders for:

- Charts.
- KPI cards.
- Tables.
- Funnel.

---

# Responsive Behavior

## Desktop

Two-column analytics grid.

## Tablet

Single-column chart layout.

## Mobile

Cards stacked vertically.

---

# Accessibility Rules

Analytics support:

- Accessible charts.
- Keyboard navigation.
- Table alternatives.
- Focus indicators.
- Reduced motion.

---

# Performance Targets

| Interaction | Target |
|------------|--------|
| Dashboard Load | Under 1 second |
| Chart Refresh | Under 500ms |
| Date Filter Refresh | Under 700ms |
| Export Report | Under 3 seconds |

---

# Database Fields Referenced

## Analytics Views

| View | Purpose |
|------|---------|
| Revenue Summary | KPI calculations |
| Customer Summary | Growth metrics |
| Downloads Summary | Download analytics |
| Coupon Summary | Coupon analytics |
| Email Summary | Communication metrics |

---

# Cursor Components

| Component | Used In |
|-----------|---------|
| AnalyticsKPIGrid | Dashboard |
| RevenueLineChart | Revenue analytics |
| FunnelChart | Marketing funnel |
| CountryRevenueChart | Geography |
| AdoptionChart | Product releases |
| CouponPerformanceChart | Coupons |
| EmailEngagementChart | Email analytics |
| OperationalAlertCard | System health |
| AnalyticsDateFilter | Entire dashboard |

---

# Cursor Implementation Rules

Cursor must:

1. Build one centralized analytics dashboard.
2. Use reusable chart components from Design System.
3. Synchronize date filters across widgets.
4. Separate operational metrics from marketing metrics.
5. Build exportable reports.
6. Track product adoption separately from downloads.
7. Display operational alerts prominently.
8. Optimize dashboard for real-time KPI updates.

---

# Frozen Decisions (Version 1)

The following Analytics decisions are locked.

- Executive overview dashboard.
- Shared global date filter.
- Revenue, customer, download, marketing, email, coupon analytics.
- Conversion funnel visualization.
- Product adoption dashboard.
- Operational health monitoring.
- CSV/Excel analytics exports.
- No AI forecasting in Version 1.

---

# Version History

## Version 1.0

Official FinanceOS Analytics & Growth Dashboard specification defining executive KPIs, revenue intelligence, customer analytics, download analytics, marketing funnel, email analytics, coupon analytics, operational monitoring, exports, and Cursor implementation standards.

---

**End of Document**

**File:** `07_ANALYTICS_AND_GROWTH_DASHBOARD.md`
