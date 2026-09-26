# T010 — FinanceOS RC1 Dashboard Integration (MASTER Architecture Freeze)

**Document:** T010_DASHBOARD_ARCHITECTURE_REVIEW  
**Workbook:** `workbook/FinanceOS_v1.0.xlsx`  
**Inspected (read-only ZIP/XML):** size `121824` bytes; SHA-256 `13A334B61A9BA336743B5BD154CCED090D02EEDAE492A941AD977BA15ECE0D61`  
**Excel opened or saved:** No  
**XML modified:** No  
**Existing frozen documents modified:** No  
**Commits created:** No  
**Status:** Architecture freeze complete. Implementation is blocked until every PASS Checklist item is satisfied and blocking conflicts are resolved by the user.

Catalog correction (user list vs frozen IDs):

| User label | Frozen document |
| --- | --- |
| DOC-008 | `docs/08_Business_Rules.md` |
| DOC-010 | `docs/10_Business_Engine.md` |
| DOC-011 | `docs/11_Analysis_Engine.md` |
| DOC-012 | `docs/12_Dashboard_Architecture.md` |
| DOC-015 | `docs/15_Formula_Standards.md` |
| DOC-016 | `docs/16_Naming_Conventions.md` |
| ES-001 | `docs/04_Engineering_Standards.md` |
| RC1 log | `docs/testing/RC1_IMPLEMENTATION_LOG.md` |

Companion documents also read (not in the user list, required for Dashboard): DOC-006, DOC-007, DOC-013, DOC-017, DOC-018, DESIGN-EXCEL-01 / 04 / 06, T009 / T009.1 / T009.1.1 review.

Production is frozen through T009 implementation commit `ce5a34e` (`feat(analysis-engine): implement RC1 financial health analysis section`). The RC1 log and DOC-011 Version History still say T009 is not implemented. That lag is documentation debt (C-17). It does not authorize a T005–T009 redesign.

This document freezes **Dashboard consumption and presentation only**. It does not implement cards, charts, or conditional formatting.

---

## 1. Understanding

### Dashboard responsibilities

The Dashboard is the **presentation layer** of FinanceOS RC1.

It is the workbook home screen. It answers, within a few seconds of opening the file:

1. Where does the user stand financially today?
2. Which health dimensions need attention?
3. What is the current-month cash position, goal progress, asset mix, and debt load?

It is **not** a financial engine.

| Layer | Owner | RC1 job |
| --- | --- | --- |
| Business Engine | Mathematics | Income, expenses, savings, balances, assets, liabilities, net worth, goal aggregates, category totals, ratios |
| Analysis Engine | Interpretation | Eight health bands, 0–100 scores, Red/Orange/Yellow/Green severity |
| Dashboard | Visualization only | Cards, colors, charts, progress bars, badges, navigation chrome |
| Insights | Narrative text only | Sentences, headlines, explanations |

Dashboard may **display** a number, band, score, or severity. Dashboard may **format** a number (currency, percent, blank empty-state). Dashboard may **assemble** a card from one engine output per metric.

Dashboard may **not**:

- Recalculate income, expense, savings, savings rate, EMI, outstanding debt, asset value, net worth, goal saved/remaining, or any ratio.
- Classify health bands or scores.
- Write English insight sentences.
- Scan `tblTransactions`, `tblAssets`, `tblGoals`, `tblLiabilities`, or any other entity table.
- Read leftover Analysis Engine Sections 1–9 ledger formulas.
- Invent previous-month net worth, monthly category series, Gold/Stock/MF splits, fixed/variable spend, or forecast values.

### Ownership table

| Output class | Owner | Dashboard may | Dashboard must not |
| --- | --- | --- | --- |
| `B16` Monthly Income, `B22` Expenses, `B29` Savings, `B30` Savings Rate | Business Engine (T005 / T005.2) | Display | Re-sum the ledger |
| `B4` Total Active Account Balance, `B5`–`B9` account-type totals | Business Engine (T005 Account Engine) | Display `B4` as the RC1 cash card **after C-4** | Rebuild from `B6+B7` or `tblAccounts` |
| `B53:B58` Goal Summary | Business Engine (T006) | Display aggregates | Scan `tblGoals`; compute progress % |
| `B41:B46`, `B66`, `B68` | Business Engine (T007) | Display aggregates | Scan `tblLiabilities`; compute EMI or outstanding |
| `B34:B39`, `B70:B75` | Business Engine (T008) | Display `B35` and `B70:B75` | Scan `tblAssets`; split Gold/Stock/MF |
| `B48` Net Worth (`B4+B35−B42`); `B49` placeholder `0`; `B50` = `B35` | Business Engine | Display `B48` | Change the formula; treat `B49` as Liquid Assets |
| `B61:B68` monthly health **inputs** (aliases of BE numbers) | Business Engine | Optional display aliases | Treat as Analysis output |
| Section 10 `B158:D165` bands / scores / severity | Analysis Engine (T009) | Display | Recolor by recomputing bands |
| Insight sentences | Insights worksheet | Show placeholders in RC1 (C-8) | Author copy |
| Validation lists / `FILTER` spills | Helpers | None | Any write (PROD-001) |

One source of truth per metric. If a number exists on Business Engine, Dashboard references that cell (or its `out*` name). If a band/score/severity exists on Analysis Engine Section 10, Dashboard references that cell (or its `analysis*` name).

### Dependency flow

```
User data (Accounts, Transactions, Goals, Assets, Liabilities, Settings)
    → Helpers (validation lists only)
        → Business Engine (T005–T008 mathematics)
            → Analysis Engine Section 10 (T009 interpretation)
                → Dashboard (T010 visualization)
                    → Insights (later — narrative)
```

Dependencies are downward only. Dashboard never writes into engines, entities, Helpers, or Insights. Business Engine never reads Dashboard. Analysis Engine never reads Dashboard.

T009 leftover Analysis Sections 1–9 remain on the hidden sheet and are **not** on this path. They still contain `tblTransactions` aggregations that disagree with T005 / T005.2. T010 must not consume them (C-16).

### RC1 inputs from T005–T009

Official cells Dashboard may bind. Named ranges are listed only where they already exist in the live workbook.

#### T005 — Cash Flow & Account Engine

| Cell | Live label | Meaning | Live name |
| --- | --- | --- | --- |
| `B1` | As-Of Date | Stored serial `13` in the empty book (known fixture) | none |
| `B4` | Total Active Account Balance | Active + Include in Dashboard = Yes | none |
| `B5` | Number of Active Accounts | Same filter | none |
| `B6` | Cash Accounts Total | Account Type = Cash | none |
| `B7` | Savings Accounts Total | Account Type = Savings Bank | none |
| `B8` | Investment Accounts Total | Account Type = Investment Account | none |
| `B9` | Credit Accounts Total | Account Type = Credit Card | none |
| `B16` / `B28` / `B61` | Total Monthly Income | Completed or Reconciled Income only | none |
| `B22` / `B62` | Current Month Expenses | T005.2: Expense, not Transfer/Adjustment, Destination Type ≠ Asset | none |
| `B23` | Previous Month Expenses | T005.2 same rules | none |
| `B24` | Year-to-Date Expenses | Calendar YTD, T005.2 | none |
| `B29` / `B63` | Current Month Savings | `B28 − B22` | none |
| `B30` / `B64` | Savings Rate | `IFERROR(B29/B28,0)` — **ratio**, not ×100 | none |

Status rule already inside those cash totals: **Completed or Reconciled only**. Pending and Cancelled ignored. Transfers and Adjustments stay out of income and expense.

#### T006 — Goal Engine

| Cell | Live label | Meaning | Live name |
| --- | --- | --- | --- |
| `B53` | Total Goal Target Amount | Active + Completed targets | none |
| `B54` | Total Saved Toward Goals | Active + Completed current saved | none |
| `B55` | Remaining Goal Amount | Active remaining only | none |
| `B56` | Active Goal Count | Status = Active | none |
| `B57` | Completed Goal Count | Status = Completed | none |
| `B58` | Goal Completion % | `IFERROR(B54/B53,0)` — **ratio** | none |

Per-goal fields live on `tblGoals` (Name, Target, Current Saved, Remaining, Target Date, Priority, Status). T006 forbids a Goal matrix on Business Engine. T010 hard rules forbid scanning `tblGoals`. Per-goal widgets are therefore **blocked** until C-12 is resolved.

#### T007 — Liability Engine

| Cell | Live label | Meaning | Live name |
| --- | --- | --- | --- |
| `B41` | Total Original Liability | Active only | none |
| `B42` | Total Outstanding Balance | Active only; `MAX(0, …)` | none |
| `B43` | Total Monthly EMI | Active only | none |
| `B44` | Weighted Interest Rate | Active only | none |
| `B45` | Active Liability Count | Status = Active | none |
| `B46` | Liability Payment Total | Lifetime Expense or Transfer, Destination Type Liability, Completed or Reconciled | `outLiabilityPaymentTotal` |
| `B66` | EMI Ratio | `IFERROR(B43/B16,0)` | none |
| `B68` | Debt Ratio | `IFERROR(B42/(B42+B35),0)` | none |

Outstanding Balance remains user-maintained. Per-liability cards require `tblLiabilities`. Same block as goals (C-12).

#### T008 — Asset Engine

| Cell | Live label | Meaning | Live name |
| --- | --- | --- | --- |
| `B34` | Total Purchase Value | Active only | none |
| `B35` | Total Current Value | Official **Total Asset Value** | none |
| `B36` | Total Appreciation Amount | Signed Active total | none |
| `B37` | Weighted Appreciation % | `B36/B34` | none |
| `B38` | Active Asset Count | Status = Active | none |
| `B39` | Asset Purchase Total | Lifetime Expense + Destination Type Asset | `outAssetPurchaseTotal` |
| `B70` | Investment Value | Active category | none |
| `B71` | Physical Asset Value | Active category | none |
| `B72` | Property Value | Active category | none |
| `B73` | Retirement Asset Value | Active category | none |
| `B74` | Cash Equivalent Value | Active category | none |
| `B75` | Other Asset Value | Active category | none |

Status vocabulary: **Active** and **Sold** only. Sold is excluded from `B34:B38` and `B70:B75`. Gold / Stock / Mutual Fund are Asset **Types**, not RC1 official outputs (T009.1 C-9).

#### T009 — Analysis Engine (Section 10 only)

Implemented on hidden `Analysis Engine` `A156:D165`. Cached empty-book bands are `Unavailable`.

| Dimension | Band cell | Live name (band only) | Score cell | Severity cell |
| --- | --- | --- | --- | --- |
| Savings Health | `B158` | `analysisSavingsHealth` | `C158` | `D158` |
| Expense Health | `B159` | `analysisExpenseHealth` | `C159` | `D159` |
| Debt Health | `B160` | `analysisDebtHealth` | `C160` | `D160` |
| Asset Health | `B161` | `analysisAssetHealth` | `C161` | `D161` |
| Goal Health | `B162` | `analysisGoalHealth` | `C162` | `D162` |
| Liquidity Health | `B163` | `analysisLiquidityHealth` | `C163` | `D163` |
| Net Worth Health | `B164` | `analysisNetWorthHealth` | `C164` | `D164` |
| Cash Flow Health | `B165` | `analysisCashFlowHealth` | `C165` | `D165` |

Score and severity names (`analysisSavingsHealthScore`, `analysisSavingsHealthSeverity`, …) are specified in DOC-016 as optional suffixes. They **do not exist** in the live workbook (C-6).

Score / severity mapping already frozen by T009.1 / DOC-008:

| Band | Score | Severity |
| --- | --- | --- |
| Unavailable | blank | blank |
| Critical | 0 | Red |
| Weak | 25 | Orange |
| Moderate | 50 | Yellow |
| Strong or Healthy | 75 | Green |
| Excellent | 100 | Green |

Composite `analysisHealthScore` is **deferred**. Emergency Fund Health is **not** an RC1 dimension.

---

## 2. Documentation Summary

### Existing Dashboard rules (by document)

#### DOC-008 — Business Rules

- Dashboard is presentation only. Business Engine calculates. Analysis Engine interprets. Insights explain.
- Snapshot first: Total Cash, Net Worth, Monthly Income, Monthly Expense, Monthly Savings, Savings Rate.
- Cash Flow card: Income, Expenses, Surplus, Fixed Commitments, Variable Spending, Remaining Cash. No transfers.
- Goals sorted High Priority → nearest Target Date → largest completion %.
- Liabilities sorted highest EMI → nearest due date. Upcoming EMI highlight.
- **Dashboard Rule 7 — Forecast Card** is still in the Dashboard Rules section (pending / remainder-of-month forecast).
- **Dashboard Rule 8** (T009.2): eight official Analysis dimension outputs; unified Health Score deferred; Dashboard never recalculates them.
- **Dashboard Rule 9**: Insights preview maximum **three**; priority Critical → Warning → Opportunity.
- Filters never change calculations.
- Savings Rate numeric rule: Monthly Savings / Monthly Income × 100; negative savings allowed; Dashboard displays warning.
- RC1 health dimension bands, scores, and severity mapping are frozen in the Health Score chapter (T009.1 / T009.1.1).
- Version 1 freeze text: Dashboard owns presentation; Insights own explanations.

#### DOC-010 — Business Engine

- Business Engine never references Dashboard or Insights.
- Dashboard consumes reusable outputs; never recalculates balances, wealth, or goal totals.
- Available Cash = active cash-class accounts. T009.2 note: Liquidity uses `B4`; a dedicated Available Cash output separate from `B4` was **not required for T009**.
- Active accounts need Status = Active **and** Include in Dashboard = Yes for dashboard/account-summary outputs (`B4` already applies this).
- Official asset category totals are `B70:B75`. Dashboard may consume them. Gold/Stock/MF are not listed as official RC1 outputs.
- Fixed Commitments, Variable Spending, Remaining Cash, Forecast Closing Balance, Cash-by-Institution, and Emergency Coverage Input are specified as Version 1 outputs and are **not implemented** on the live Business Engine.
- Health Input Output Metrics table (T009.2) lists the eight T009 BE inputs. Composite score inputs deferred.

#### DOC-011 — Analysis Engine

- Analysis never reads Dashboard or Insights.
- RC1 official outputs: eight health dimension cards. Deferred: unified Health Score card, Cash Runway, Purchase Simulator, Goal Forecast.
- Dashboard consumes scores; Dashboard never recalculates analysis metrics.
- T009.2 Version History still says “T009 implementation has not started.” Live workbook contradicts this (C-17).

#### DOC-012 — Dashboard Architecture

- Presentation only. Six Snapshot KPIs; Savings Rate sourced from **Analysis Engine**.
- Frozen desktop order: Header → Snapshot → Cash Flow → Net Worth → Goals → Liabilities → Assets → Financial Health → Recent Transactions → Insights → Quick Navigation.
- Frozen mobile order: Snapshot → Cash Flow → Financial Health → Goals → Liabilities → Assets → Recent Transactions → Insights.
- Assets card lists Gold / Mutual Fund / Stock / Appreciation.
- Health card lists unified Score + Savings + Emergency + Debt + Cash Flow.
- Recent Transactions: latest **five** completed (not pending/cancelled); fields from Transactions.
- Insights preview: top **five**; Red → Orange → Yellow → Green.
- Filters: reporting period, account, goal, category — presentation only.
- Quick Actions navigate to entity sheets.
- Protection: filters editable; KPI formulas / cards / health / progress / insights protected.
- No VBA / Office Scripts. Mobile-first vertical cards.
- Charts optional in Version 1 for Cash Flow.

#### DOC-015 — Formula Standards

- Dashboard formulas are presentation, formatting, filtering, and card assembly only.
- Snapshot map: Total Cash `outTotalCash`; Net Worth `outNetWorth`; Income `outMonthlyIncome`; Expense `outMonthlyExpense`; Savings `outMonthlySavings`; Savings Rate **`analysisSavingsHealth`**.
- Cash Flow also maps `outFixedCommitments`, `outVariableSpending`.
- Net Worth card maps `outNetWorthChange`.
- Goals map `analysisGoalForecast`, `outGoalMonthlyRequired`.
- Assets map `outGoldValue`, `outMutualFundValue`, `outStockValue`.
- Health maps `analysisHealthScore`, `analysisEmergencyHealth`.
- Recent Transactions preview: last five from the ledger.
- Insights preview: maximum five.
- Implementation order in DOC-015: Analysis before Dashboard; Dashboard before Insights.

#### DOC-016 — Naming Conventions

- Reusable BE outputs use `out{Name}`. Examples include `outMonthlyIncome`, `outTotalCash`, `outNetWorth`, `outAssetValue`, `outGoalCompletion`.
- Reusable AE outputs use `analysis{Name}`. Official RC1: eight health **bands**. `analysisHealthScore`, `analysisCashRunway`, `analysisGoalForecast`, `analysisPurchaseStatus` deferred.
- Score/severity may use suffixes (`analysisSavingsHealthScore`, `analysisSavingsHealthSeverity`).
- Text also says named ranges “always reference Helpers outputs.” Live engine names already violate that sentence (`outLiabilityPaymentTotal`, `outAssetPurchaseTotal`, eight `analysis*` bands).

#### ES-001 — Engineering Standards

- Dashboard components never contain source data.
- Dashboard consumes Business Engine outputs, Analysis Engine outputs, lookup tables, and Settings.
- Presentation stays separate from storage.
- No VBA, macros, Office Scripts, Power Query, Power Pivot, external APIs, desktop-only plugins.
- Card layouts, consistent spacing, application feel.
- Avoid volatile functions and duplicated calculations.

#### RC1 Implementation Log

- T001–T008 frozen and committed.
- T009.1 / T009.1.1 architecture frozen; log still marks T009 “Not started.”
- T010 listed as not started.
- Forecasting / Decision Simulator / QA Regression after T010.
- PROD-001: do not rewrite Helpers `E2:K2`; do not save production through this machine’s Excel Desktop COM session.
- T005 explicitly did not rewrite Dashboard.

#### Other frozen docs that collide with this T010 brief

- **DOC-007** Dashboard sections include Upcoming Commitments, Estimated Completion Month, Remaining EMI Months, Gold/Property/Retirement, Monthly Forecast, unified Health Score, Insights top three.
- **DOC-013** Dashboard preview: maximum five insights; navigate to Insights.
- **DOC-017** Design tokens (no hex values). Compact KPI numbers. Cards, badges, progress rings.
- **DESIGN-EXCEL-01** eight zones including Health Hero, Predictions, Recommendations; KPI order disagrees with DOC-012 and with this brief.
- **DESIGN-EXCEL-04** spending donut, runway, forecast, debt payoff charts.
- **DESIGN-EXCEL-06** Hero KPI order: Net Worth, Monthly Surplus, Total Debt, Savings Rate, Emergency Runway, Financial Health Score; compact currency (`₹42.6L`); every KPI has a delta.

### Conflicts (do not silently resolve)

#### C-1 — Section order

**Conflict:** This T010 brief freezes A Snapshot → B Health → C Goals → D Asset Allocation → E Liability → F Cash Flow → G Monthly Overview → H Quick Insights. DOC-012 desktop, DOC-012 mobile, DOC-007, and DESIGN-EXCEL-01 each freeze a different order. None matches this brief.

**Not resolved.** Implementation cannot place sections until the user names the RC1 order that wins.

#### C-2 — Snapshot card catalog

**Conflict:** This brief requires eight cards (Net Worth, Total Assets, Total Liabilities, Available Cash, Monthly Income, Monthly Expenses, Monthly Savings, Savings Rate). DOC-008 / DOC-012 / DOC-007 freeze six (Total Cash, Net Worth, Income, Expense, Savings, Rate). DESIGN-EXCEL-01 and DESIGN-EXCEL-06 freeze different six-card sets that include Emergency Runway and Financial Health Score.

**Not resolved.**

#### C-3 — Savings Rate display owner

**Conflict:** Live `B30` / `B64` is the numeric rate (Business Engine). DOC-008 owns that formula. DOC-012 Snapshot and DOC-015 Dashboard map send “Savings Rate” to `analysisSavingsHealth`, which is a **band string** (`Excellent` / `Unavailable`), not a percentage. T009 C-7 deferred this decision to T010.

**Not resolved.** Freeze candidate (not approved): Snapshot value = `B30` formatted as percent; Health card Savings band = `analysisSavingsHealth`.

#### C-4 — Available Cash vs Total Cash vs `B4`

**Conflict:** This brief labels a Snapshot card “Available Cash.” Live `B4` label is **Total Active Account Balance** (Active + Include in Dashboard = Yes), including Investment Account and Credit Card type balances if they are dashboard-enabled. DOC-010 Available Cash text is cash-class accounts (bank, wallets, savings, current). T009.1 originally used `B6+B7`. T009.1.1 / DOC-008 Liquidity uses `B4` and forbids rebuilding from `B6+B7`. DOC-012 Snapshot says “Total Cash.” `B6` is Cash type only. `B49` Liquid Net Worth is hardcoded `0` and deferred.

**Not resolved.** T010 must not pick a numerator silently.

#### C-5 — Missing `out*` names

**Conflict:** DOC-015 / DOC-016 require `outMonthlyIncome`, `outMonthlyExpense`, `outMonthlySavings`, `outTotalCash`, `outNetWorth`, `outAssetValue`, `outOutstandingDebt`, `outGoalCompletion`, and others. Live names are only `outLiabilityPaymentTotal` (`B46`) and `outAssetPurchaseTotal` (`B39`). This brief says Dashboard must consume named ranges wherever available. DOC-016 also says named ranges always reference Helpers.

**Not resolved.** Adding `out*` names touches `xl/workbook.xml` and is a Business Engine API change even if sheet11 formulas stay byte-identical.

#### C-6 — Missing score / severity names

**Conflict:** DOC-016 allows `analysis{Name}HealthScore` / `HealthSeverity`. T009 created band names only (`B158:B165`). Health cards need score and severity. Direct `C158:D165` addresses work but violate “named ranges wherever available.”

**Not resolved.**

#### C-7 — Recent Transactions preview

**Conflict:** DOC-012 / DOC-015 / DOC-007 require a latest-five completed-transaction preview sourced from Transactions. This T010 brief and Hard Rules 2–5 forbid scanning `tblTransactions`. There is no Business Engine “recent transactions” output.

**Not resolved.** Freeze candidate (not approved): omit Recent Transactions from RC1 Dashboard.

#### C-8 — Insights preview vs empty Insights sheet

**Conflict:** DOC-008 max **three** insights (Critical / Warning / Opportunity). DOC-012 / DOC-013 / DOC-015 max **five** (Red → Green). This brief: placeholders only; Insights owns sentences; Dashboard displays only. Live Insights worksheet is `A1` = `Insights`, 0 formulas. DOC-015 says build Dashboard before Insights.

**Not resolved.** Freeze candidate (not approved): reserved blank insight slots; no sentences until a later Insights checkpoint.

#### C-9 — Gold / Stock / Mutual Fund

**Conflict:** DOC-012 / DOC-015 / DOC-007 Assets card require Gold, Mutual Fund, Stock (and DOC-007 Property / Retirement). T009.1 C-9 and this brief: consume `B70:B75` only; no type breakdown. Leftover Analysis `A62:A71` type rows are not official.

**Not resolved.** Freeze candidate (not approved): allocation uses the six category totals only.

#### C-10 — Unified Health Score, Emergency Health, Health Hero, Health Radar

**Conflict:** DOC-012 / DOC-007 / DOC-015 / DESIGN-EXCEL-01 / DESIGN-EXCEL-06 require a 0–100 composite score and Emergency Health / Runway hero. T009.1, DOC-008 T009.2, DOC-011, and this brief: eight dimension cards; composite deferred; Emergency Fund Health deferred. This brief’s chart list says Health Radar “if deferred, state deferred.”

**Not resolved.** Freeze candidate (not approved): eight cards; no composite; Health Radar deferred.

#### C-11 — Forecast, commitments, remaining cash, deltas

**Conflict:** DOC-007 / DOC-008 Rule 7 / DOC-012 Cash Flow / DOC-015 / DESIGN-EXCEL-01 require Forecast, Upcoming Commitments, Fixed Commitments, Variable Spending, Remaining Cash, Net Worth monthly change, goal estimated completion. None of those exist as T005–T009 official outputs. Recurring Commitment Engine is not implemented. Previous-month Net Worth / Income do not exist (`B23` is previous-month **expense** only). RC1 log places Forecasting after T010.

**Not resolved.** Freeze candidate (not approved): omit all of them from T010.

#### C-12 — Per-goal and per-liability widgets vs “never scan entity tables”

**Conflict:** DOC-012 Goals Card and Liabilities Card are per-entity (name, %, saved, remaining, target, date, priority; outstanding, EMI, due day, status). Official Goal Engine outputs are aggregates `B53:B58` only (T006: no Goal matrix). Official Liability outputs are aggregates `B41:B46`. This brief forbids scanning `tblGoals` / `tblAssets` and says use engine outputs only.

**Not resolved.** Freeze candidate (not approved): aggregate widgets only.

#### C-13 — Expense Breakdown chart source

**Conflict:** This brief and DESIGN-EXCEL-04 expect an Expense Breakdown chart. No official Business Engine category-expense series exists. Analysis Section 2 / 7 `SUMIFS` on `tblTransactions` omit Completed/Reconciled and T005.2 Destination Type = Asset. Dashboard must not scan `tblTransactions` and must not use those leftover cells.

**Not resolved.** Freeze candidate (not approved): defer Expense Breakdown until a Business Engine category-expense checkpoint.

#### C-14 — Monthly Cash Flow chart source

**Conflict:** A 12-month cash-flow chart has no official BE series. Analysis `A30:E41` is calendar-year, ignores status and T005.2, and is leftover (T009 C-4 / C-14 / C-25). Official T005 outputs for a bar are current-month `B16`, `B22`, `B29` only (plus `B23` expense).

**Not resolved.** Freeze candidate (not approved): current-month three-point bar **or** defer the chart.

#### C-15 — Filters

**Conflict:** DOC-012 / DOC-007 / DOC-008 freeze reporting-period, account, goal, and category filters that change presentation only. Business Engine calculates the As-Of month only. There are no official previous-FY / per-account / per-category Dashboard-ready outputs. This brief does not mention filters.

**Not resolved.** Freeze candidate (not approved): no RC1 filters. Entire Dashboard stays protected.

#### C-16 — Analysis Section 9 “KPI Output Table (Dashboard source)”

**Conflict:** Live Analysis `A134` is labeled as the Dashboard source and pass-throughs many BE cells plus leftover metrics (`B147` overdue first-8, `B151` estimated interest, `B154` emergency placeholder). T009 freeze: new consumers use Section 10 + BE cells only. This brief: Analysis for interpretation only.

**Not resolved.** Freeze candidate (not approved): T010 ignores Section 9 entirely.

#### C-17 — Stale T009 status in RC1 log / DOC-011

**Conflict:** User context and git `ce5a34e` say T009 is implemented. `RC1_IMPLEMENTATION_LOG.md` and DOC-011 Version History say T009 has not started. T009.2 documentation freeze is in DOC-008 / 010 / 011 / 016.

**Not resolved as a product rule.** It is documentation debt. T010 architecture treats Section 10 as **live official Analysis output**.

#### C-18 — DOC-008 Dashboard Rule 7 Forecast Card vs RC1 deferral

**Conflict:** The Dashboard Rules chapter still contains a Forecast Card. The Health / Version History chapters defer Forecast / Runway / Purchase Simulation.

**Not resolved.** T010 must not implement a Forecast card unless the user explicitly overrides the RC1 deferral.

#### C-19 — “Progress calculations” on Dashboard

**Conflict:** DOC-012 protection table lists “Progress calculations” as a protected Dashboard item. This brief: no progress calculations; Goal Engine outputs only. DOC-017 progress rings consume Business Engine percentages.

**Not resolved.** Freeze candidate (not approved): progress bars are formats over `B58` (and only `B58`); no division on Dashboard.

#### C-20 — Dark-first design vs live workbook theme

**Conflict:** DESIGN-01 is Dark First (Electric Blue, Premium Purple). Live workbook is Office theme, Calibri 11, light fills (`F3F4F6`), T004 dxf pastels. Dashboard has no custom styles. DOC-017 tokens have **no hex values**.

**Not resolved.** Inventing a new dark hex palette is a design-system change.

#### C-21 — Currency format and Settings

**Conflict:** DOC-017 / DESIGN-EXCEL-06 allow compact KPIs (`₹42.6L`). Live number format is `#,##0.00` (numFmt 166). Settings `tblSettings` is an empty 200-row table; no currency value is stored. Header “Currency Badge” has no source.

**Not resolved.**

#### C-22 — Trend / delta indicators

**Conflict:** DESIGN-EXCEL-01 / 06 require a delta on every KPI. Official previous-period outputs: `B23` previous-month expenses only. No previous-month income, savings, net worth, or assets.

**Not resolved.** Freeze candidate (not approved): no deltas in T010.

#### C-23 — Icons and images

**Conflict:** DOC-012 / DOC-017 / DESIGN-EXCEL-06 require icons on cards. The package has **no** `xl/media`, drawings, or charts. Adding images/shapes has Excel Web / mobile compatibility risk (DOC-018 / ES-001).

**Not resolved.** Freeze candidate (not approved): text labels only in RC1; no pictures.

#### C-24 — Card radius, shadows, gauges

**Conflict:** DOC-017 radius/shadow tokens are CSS-like. Excel cells cannot do true radius. Gauges are not a native Excel feature without doughnut charts or images.

**Not resolved.** Freeze candidate (not approved): cell fill + border + spacing to simulate cards; no shape-based gauges.

#### C-25 — Health Radar chart

**Conflict:** This brief lists Health Radar as expected-if-not-deferred. No radar exists. Composite score is deferred. Eight scores exist at `C158:C165`.

**Not resolved.** Freeze candidate (not approved): **deferred**.

#### C-26 — Quick Actions / navigation footer

**Conflict:** DOC-012 freezes Quick Actions and a navigation footer. This brief’s Section H is Quick Insights placeholders only.

**Not resolved.**

#### C-27 — DOC-015 maps to nonexistent names

**Conflict:** DOC-015 Dashboard blueprint references `outFixedCommitments`, `outVariableSpending`, `outNetWorthChange`, `outGoldValue`, `outMutualFundValue`, `outStockValue`, `outGoalMonthlyRequired`, `analysisGoalForecast`, `analysisHealthScore`, `analysisEmergencyHealth`, `analysisEmergencyCoverage`. None exist as live names or official RC1 cells.

**Not resolved.** T010 must not create those outputs to satisfy DOC-015.

#### C-28 — Dashboard cell addresses are unspecified

**Conflict:** Live Dashboard is `A1` = `"Dashboard"` only. No document freezes RC1 row/column addresses for the eight sections. Inventing `B4:E20` here would be an architecture decision.

**Not resolved.** Implementation cannot write cells until a layout grid is approved.

#### C-29 — Monthly Overview widgets unspecified

**Conflict:** This brief requires Section G “KPI widgets” and does not list them. Snapshot, Cash Flow, and Health already consume the official monthly KPIs. Duplicating `B16`/`B22`/`B29` without a list is guessing.

**Not resolved.**

#### C-30 — May T010 add defined names?

**Conflict:** Consuming named ranges “wherever available” plus C-5 / C-6 implies adding names. T009 freeze said do not add `out*` during T009. Adding names edits `workbook.xml` (and is the only non-Dashboard XML T010 might need).

**Not resolved.**

#### C-31 — Hidden chart-staging cells

**Conflict:** Excel charts need a contiguous range. Official values live on hidden Business Engine / Analysis Engine. Charting hidden sheets is fragile on Excel Web / mobile. A Dashboard hidden staging range that only contains `='Business Engine'!$B$70` is presentation assembly (DOC-015) but is also “hidden helper cells.”

**Not resolved.**

#### C-32 — `B74` on the allocation chart vs Asset Health

**Conflict:** This brief: consume `B70:B75` only (includes Cash Equivalent). Asset Health concentration **excludes** `B74`. Showing `B74` on the pie and excluding it from Asset Health is consistent with T009.1.1 **if** approved as two different jobs (mix vs diversification).

**Not resolved.**

#### C-33 — DOC-018 / DOC-016 Helpers-only names vs engine names

**Conflict:** Compatibility text says use named ranges from Helpers. Official RC1 engine names already point at Business Engine and Analysis Engine.

**Not resolved.** T010 must not move engine outputs onto Helpers (PROD-001).

#### C-34 — One Excel sheet vs mobile / desktop layouts

**Conflict:** DOC-012 freezes different mobile and desktop orders. Excel Version 1 has one Dashboard sheet. Two layouts are not implementable without a second sheet (forbidden) or hiding rows (fragile).

**Not resolved.** Freeze candidate (not approved): one vertical RC1 stack for all platforms.

#### C-35 — PROD-001 COM save

**Conflict:** Any Excel Desktop COM save on this machine can strip Helpers `E2:K2`. T010 implementation, if approved, must be XML-level or licensed-Desktop, must not open/save via the broken COM session, and must not touch Helpers.

**Not resolved as a product rule.** It is an implementation constraint.

#### C-36 — Header context sources

**Conflict:** DOC-012 header needs Current Month, Financial Year, Currency Badge. `B1` is the As-Of Date and is serial `13` in the empty book. Settings values are empty. Financial year is not a BE output. AE leftover monthly trend is calendar year, not FY.

**Not resolved.**

#### C-37 — Semantic green/red collision

**Conflict:** Savings positive/negative CF, health severity CF, and goal-completion CF all want Green / Red. DOC-012 says colors are semantic, not decorative. The same green would mean “saved money,” “Excellent health,” and “goal complete.”

**Not resolved.** Mapping tables must be approved before CF is written.

### Missing specifications (blocking)

- Approved RC1 section order (C-1) and cell grid (C-28).
- Approved Snapshot catalog and Available Cash numerator (C-2, C-4).
- Savings Rate card binding (C-3).
- Whether T010 may add `out*` / `analysis*Score` / `analysis*Severity` names (C-5, C-6, C-30).
- Monthly Overview widget list (C-29).
- Chart set: allocate / defer Expense Breakdown, Monthly series vs 3-point bar, Health Radar (C-13, C-14, C-25, C-32).
- Per-entity vs aggregate Goal / Liability widgets (C-12).
- Insights placeholder count and whether Insights `A1` stays untouched (C-8).
- Excel visual system: dark vs light, hex tokens, icons, radius approximation (C-20, C-21, C-23, C-24).
- Header contents (C-36).
- Filter presence (C-15).

---

## 3. Workbook Impact Analysis

Inspected package only. No bytes written. Excel was not opened.

### Current Dashboard worksheet structure

| Property | Live value |
| --- | --- |
| Sheet | `Dashboard` (`xl/worksheets/sheet13.xml`, sheetId 13, visible) |
| XML length | 1394 bytes |
| Used range | `A1` |
| Formulas | **0** |
| Charts | **0** (no `xl/charts`, no drawings, no sheet rels) |
| Tables | **0** |
| Progress bars | **0** |
| Gauges | **0** |
| Conditional formatting | **0** |
| Named ranges owned by Dashboard | **0** |
| Merged cells | **0** |
| Hidden helper cells / hidden rows / hidden columns | **0** |
| Frozen panes | **none** |
| Data validations | **0** |
| Drawing | **none** |
| Tab color | **none** |
| Column widths | Column A width 28 |
| Default row height | 14.4 |
| Protection | Sheet protected; objects and scenarios locked. `formatCells/Columns/Rows` allowed. Insert/delete/sort/autofilter/pivot denied. **No unlocked user region.** |
| Page setup | Portrait |
| Cell `A1` | Shared string `"Dashboard"`, style 3 (bold Calibri 11) |

Insights (`sheet14.xml`) is the same empty scaffold (`A1` = `"Insights"`, 0 formulas, same protection). Out of T010 scope.

### Complete live Dashboard layout map

```
A1  "Dashboard"   (label only)
```

There are no cards, tables, charts, progress bars, gauges, helper columns, or frozen header.

### Cells that would change during T010 implementation

Only after conflict resolution and PASS approval.

| Area | Would change |
| --- | --- |
| `xl/worksheets/sheet13.xml` | All new labels, value formulas (`=` engine refs only), number formats, fills, borders, merges, row heights, column widths, freeze panes, CF, protection unlocks if filters are approved |
| `xl/sharedStrings.xml` | New card titles and empty-state strings |
| `xl/styles.xml` | New cellXfs / fills / fonts / dxfs if the visual freeze is approved |
| `xl/calcChain.xml` | New Dashboard formula entries |
| `xl/workbook.xml` | **Only if** C-30 approves new defined names. Existing name refs must not change |
| `[Content_Types].xml`, `xl/workbook.xml.rels`, `xl/charts/*`, `xl/drawings/*`, `xl/worksheets/_rels/sheet13.xml.rels` | **Only if** charts are approved |

`A1` will be overwritten or surrounded. Exact addresses are **not frozen** (C-28).

### Workbook parts that must remain byte-identical

**Worksheets**

- Settings, Categories, Income Sources, Accounts, Assets, Liabilities, Recurring Commitments, Transactions, Goals
- Helpers (`sheet10.xml`) — PROD-001
- **Business Engine** (`sheet11.xml`) — entire T005–T008 surface
- **Analysis Engine** (`sheet12.xml`) — Sections 1–10 including `A156:D165`
- **Insights** (`sheet14.xml`)

**Formula regions (byte-identical)**

- Account Engine matrix `D1:L200` and `I2:I200` (TD-002 `#N/A`)
- Cash / income / expense / savings `B4:B31`
- Asset Engine `B34:B39`, `B70:B75`, `tblAssets` appreciation columns
- Liability Engine `B41:B46`
- Net Worth `B48:B50`
- Goal Summary `B53:B58` and `tblGoals` Current Saved / Remaining
- Monthly Financial Health inputs `B61:B68`
- Analysis leftover `A1:AA154` and Section 10 `A156:D165`
- T002 validation named-range **targets**

**Existing defined names (refs must stay)**

All 64 live names, including `rng*` / `val*`, `outLiabilityPaymentTotal`, `outAssetPurchaseTotal`, and the eight `analysis*Health` band names.

**Files (byte-identical)**

- `workbook/testing/*`
- `workbook/versions/*`
- Helpers `E2:K2` FILTER/SORT/UNIQUE

T010 is Dashboard-only. It is not a T005–T009 repair pass.

---

## 4. Dashboard Architecture Freeze

Status of this section: **binding rules** are listed as Freeze. **Bindings that depend on an open C-ID** are Freeze Candidates and are not approved.

Shared RC1 rules (Freeze):

- Presentation only. One engine output per displayed metric.
- No `SUMIFS`, `COUNTIFS`, `SUMPRODUCT`, `FILTER`, `INDEX/MATCH` over entity tables on Dashboard.
- No `OFFSET`, `INDIRECT`, `TODAY`, `NOW`, `RAND`.
- `LET` on Dashboard is allowed only as a display alias of one already-calculated cell (not to compute a new financial metric). Prefer a direct `=` reference.
- Number format may change appearance. Multiplying `B30` by 100 is a calculation and is forbidden; use a percent format on the ratio.
- Empty / Unavailable: show `0` for BE amounts that are already 0; show `Unavailable` / blank for Analysis band / score / severity. Do not convert Unavailable into Weak.
- Sold assets, closed accounts, paused/archived goals, pending/cancelled transactions are already excluded by the engine outputs. Dashboard does not re-filter them.

### Section A — Financial Snapshot

**Freeze candidate catalog (this T010 brief — conflicts C-2, C-3, C-4):**

| Display title | Business Engine source | Live name | Format | Icon / color token | Positive / negative |
| --- | --- | --- | --- | --- | --- |
| Net Worth | `B48` (`B4+B35−B42`) | none (`outNetWorth` missing) | Currency `#,##0.00` | Blue informational | Negative `B48` → Risk Red; zero → Neutral Gray; positive → Blue (not Success Green — Green is reserved for health/savings) **C-37** |
| Total Assets | `B35` Total Current Value (Active) | none (`outAssetValue` missing) | Currency | Blue informational | Always ≥0 by validation; no negative format |
| Total Liabilities | `B42` Total Outstanding Balance (Active) | none | Currency | Neutral / Action Orange if `B45>0` **candidate** | Display as magnitude; do not negate the number |
| Available Cash | **Blocked on C-4.** Candidates: `B4` or `B6` or `B6+B7` (rebuild forbidden by T009.1.1 if Liquidity identity is reused) | none | Currency | Blue informational | `B4` can include credit-type balances; do not silently treat as cash |
| Monthly Income | `B16` | none (`outMonthlyIncome` missing) | Currency | Blue informational | Zero income is a valid empty/transfer month |
| Monthly Expenses | `B22` (T005.2) | none | Currency | Neutral Gray | Not “negative income.” Asset-purchase month does not inflate this cell |
| Monthly Savings | `B29` (`B16−B22`) | none | Currency | Success Green if `B29>0`; Risk Red if `B29<0`; Neutral if `0` | Negative savings allowed (DOC-008) |
| Savings Rate | **Blocked on C-3.** Candidate value `B30` (ratio) | none; do **not** bind to `analysisSavingsHealth` | Percent `0.0%` on the ratio | Same sign colors as Monthly Savings | `B16=0` → `B30` is already `0` via `IFERROR`; Health treats that as Unavailable. Snapshot must not call 0% “Weak” |

DOC-012 six-card catalog remains frozen in DOC-012 until the user says this eight-card set supersedes it for RC1.

### Section B — Financial Health

**Freeze:** eight RC1 cards. Analysis Engine only. No calculations. No composite score. No Emergency Fund card.

| Display title | Band | Score | Severity | Live band name |
| --- | --- | --- | --- | --- |
| Savings Health | `B158` | `C158` | `D158` | `analysisSavingsHealth` |
| Expense Health | `B159` | `C159` | `D159` | `analysisExpenseHealth` |
| Debt Health | `B160` | `C160` | `D160` | `analysisDebtHealth` |
| Asset Health | `B161` | `C161` | `D161` | `analysisAssetHealth` |
| Goal Health | `B162` | `C162` | `D162` | `analysisGoalHealth` |
| Liquidity Health | `B163` | `C163` | `D163` | `analysisLiquidityHealth` |
| Net Worth Health | `B164` | `C164` | `D164` | `analysisNetWorthHealth` |
| Cash Flow Health | `B165` | `C165` | `D165` | `analysisCashFlowHealth` |

Display: Band + Score + Severity color. Score blank and severity blank when band is Unavailable.

Color trigger = severity **text** from Analysis (`Red` / `Orange` / `Yellow` / `Green`), not a Dashboard recalculation of `B30` / `B66` / etc.

Do not read Analysis `B154`, `B78`, `B107`, `D98:D105`, or Section 9.

### Section C — Goal Progress

**Freeze:** Goal Engine outputs only. No progress math. No forecast month. No required monthly contribution.

| Widget | Source | Notes |
| --- | --- | --- |
| Total Target | `B53` | Currency |
| Total Saved | `B54` | Currency |
| Remaining | `B55` | Currency; Active remaining only |
| Active Goals | `B56` | Integer |
| Completed Goals | `B57` | Integer |
| Completion | `B58` | Percent format on the ratio; data bar / CF may paint `B58` |

Per-goal name / priority / target date / ring: **blocked on C-12**.  
`analysisGoalForecast` and AE `D98:D105`: **forbidden**.  
Empty book (`B56+B57=0`): show zeros; Goal Health is Unavailable (Section B), not Weak.

### Section D — Asset Allocation

**Freeze:** portfolio visualization consumes `B70:B75` only. No Gold / Stock / MF / ETF / SIP type split. No `tblAssets` scan.

| Label | Source |
| --- | --- |
| Investment | `B70` |
| Physical Asset | `B71` |
| Property | `B72` |
| Retirement Asset | `B73` |
| Cash Equivalent | `B74` |
| Other Asset | `B75` |
| Total Asset Value (caption) | `B35` |
| Signed Appreciation (optional caption) | `B36` — display only; not an Asset Health input |
| Active Asset Count (caption) | `B38` |

`B74` on this chart vs exclusion from Asset Health is C-32.  
Sold assets are already out of `B70:B75`.  
Zero assets: empty-state, no pie of blanks.

### Section E — Liability Summary

**Freeze:** T007 outputs only.

| Widget | Source |
| --- | --- |
| Outstanding Debt | `B42` |
| Monthly EMI | `B43` |
| Active Liabilities | `B45` |
| Original Amount (optional) | `B41` |
| Lifetime Payments (optional) | `B46` / `outLiabilityPaymentTotal` |
| EMI Ratio (optional numeric) | `B66` — display; Debt Health band stays Section B |
| Debt Ratio (optional numeric) | `B68` — display; Net Worth Health stays Section B |

Per-liability due-day cards: **blocked on C-12**.  
Upcoming-EMI highlight without a BE “next due” output: **forbidden**.  
Empty book: zeros; Debt Health Unavailable vs Excellent is Analysis’s job, not Dashboard’s.

### Section F — Cash Flow Summary

**Freeze:** current-month T005 outputs only.

| Widget | Source |
| --- | --- |
| Income | `B16` |
| Expenses | `B22` |
| Surplus / Savings | `B29` |
| Savings Rate | `B30` (if C-3 binds the numeric rate here) |
| Previous Month Expenses (optional) | `B23` — display only; do not compute MoM % on Dashboard |

Fixed Commitments, Variable Spending, Remaining Cash: **omitted until C-11**.  
Transfers do not appear (already excluded by T005).  
Asset-purchase month: expenses stay on `B22` (T005.2); do not add `B39` into this card.

### Section G — Monthly Overview

**Blocked on C-29.**

Do not invent a second Snapshot. If approved later, widgets must be aliases of existing BE cells (`B16`, `B22`, `B29`, `B30`, `B48`, `B61:B68`) with no new math.

### Section H — Quick Insights

**Freeze candidate (C-8):** placeholders only.

- Insights worksheet owns sentences. T010 must not write Insights cells.
- Dashboard may reserve labeled blank slots (“Insight 1/2/3”) with no formula, or `=""` constants.
- Do not concatenate Analysis bands into English (“Your savings rate is …”).
- Do not read DOC-011 example sentences onto the Dashboard.

---

## 5. Visual Design Freeze

No implementation. Tokens below are the RC1 **constraint set**. Hex values that do not already exist in the workbook are **not invented**.

### Spacing

| Token (DOC-017 / DESIGN-01) | RC1 Excel meaning |
| --- | --- |
| 8-point grid | Row heights and column widths snap to multiples of 8 where practical |
| XS | 1 row / narrow gap between label and value |
| SM | Between stacked metrics inside a card |
| MD | Inside-card section gap |
| LG | Between cards |
| XL | Between sections A–H |
| Dashboard Gap | One blank row between major sections |

No crowded grid. Vertical rhythm over dense tiles (C-34: one stack for all platforms).

### Typography

| Token | RC1 Excel |
| --- | --- |
| Font | Live workbook is Calibri. Changing the theme font is a design decision (C-20) |
| Display / KPI Number | Bold, largest text in the card |
| Heading | Section titles (Financial Snapshot, Financial Health, …) |
| Subheading | Card titles |
| Caption | Source-neutral labels (“This month”, “Active”) |
| Body | Not used for narrative in RC1 (Insights owns sentences) |

No decorative fonts. Numbers outrank labels.

### Number / currency / percentage formatting

| Kind | Live format already in `styles.xml` | RC1 Dashboard rule |
| --- | --- | --- |
| Currency | `#,##0.00` (numFmt 166) | Use this unless C-21 approves compact notation or a Settings currency symbol |
| Date | `dd/mm/yyyy` (165), `dd-mmm-yyyy` (164) | As-Of display only, if header is approved (C-36) |
| Percent | `numFmtId 10` exists (Excel 0%) | Bind to **ratios** `B30`, `B58`, `B66`, `B67`, `B68` — do not ×100 |
| Integers | General | Counts `B5`, `B38`, `B45`, `B56`, `B57` |
| Health score | General | Integer 0 / 25 / 50 / 75 / 100 or blank |
| Compact L/Cr | none | Not approved (C-21) |

Settings does not currently supply a currency code. Do not hardcode `₹` in formulas.

### Colors

Semantic roles (DOC-012 / DOC-017) — **roles are frozen**; hex is taken only from colors **already in the file**:

| Role | Usage | Existing workbook color |
| --- | --- | --- |
| Success Green | Positive savings; Strong/Excellent/Healthy severity | dxf `FFE5F6EA` |
| Warning Yellow | Moderate severity | dxf `FFFFF3D6` / `FFFFF6DE` |
| Action Orange | Weak severity | nearest existing is yellow/orange pastel — **no dedicated orange dxf** (C-37 / C-20) |
| Risk Red | Negative savings; Critical severity | dxf `FFFDECEC` |
| Information Blue | Neutral KPI values (Net Worth, Income, Assets) | dxf `FFE6F1FA` / theme accent1 `4F81BD` |
| Neutral Gray | Labels, zero, secondary | font `FF6B7280`; fill `FFF3F4F6` |
| Surface White | Page | theme lt1 `FFFFFF` |
| Dark cells | Not present | theme dk1 `000000` / dk2 `1F497D` — **do not apply a dark theme without C-20** |

Do not use leftover T004 purple (`FFF3EAF8`) for financial meaning.

### Card radius / borders / grid

| Token | RC1 Excel approximation |
| --- | --- |
| Medium radius (cards) | **Not implementable as CSS radius** (C-24). Use a 1-pt Neutral Gray border + Surface fill + LG gap |
| Large radius (widgets) | Same as cards |
| Full radius (rings) | Not in RC1 unless a doughnut chart is approved |
| Shadows | Soft elevation **not implementable**; rely on fill contrast |
| Grid | 12-column token is conceptual. Excel uses adjacent columns with consistent widths. Exact map = C-28 |

### Chart colors (if any chart is approved)

Use theme accents already in `theme1.xml`, in category order:

| Series | Theme | Hex |
| --- | --- | --- |
| Investment `B70` | accent1 | `4F81BD` |
| Physical `B71` | accent2 | `C0504D` |
| Property `B72` | accent3 | `9BBB59` |
| Retirement `B73` | accent4 | `8064A2` |
| Cash Equivalent `B74` | accent5 | `4BACC6` |
| Other `B75` | accent6 | `F79646` |

Do not introduce Electric Blue / Premium Purple hexes that are not in the workbook.

### Dark cells / light cells

| Surface | RC1 |
| --- | --- |
| Worksheet background | Light (live) until C-20 |
| Card surface | `FFF3F4F6` or white + border |
| KPI value cells | Light, bold |
| Hidden staging (if C-31 approved) | Same sheet, columns far right, hidden, locked |
| Engine sheets | Stay hidden; users never land there |

Premium / minimal: large numbers, few labels, no gridline-as-UI, no table style on Dashboard.

---

## 6. Conditional Formatting Freeze

Dashboard never recomputes values. Every rule’s trigger is an **already-calculated** engine cell (or a Dashboard display cell that is a direct `=` alias of that engine cell).

No CF exists on Dashboard today. The following are the RC1 rule **set**. Addresses wait on C-28.

| ID | Intent | Trigger source | Operator | Format | Must not |
| --- | --- | --- | --- | --- | --- |
| CF-S1 | Savings positive | `B29` (or its Dashboard alias) | `>0` | Success Green fill `FFE5F6EA` | Recalc `B16−B22` |
| CF-S2 | Savings negative | `B29` | `<0` | Risk Red fill `FFFDECEC` | Clamp to zero |
| CF-S3 | Savings zero | `B29` | `=0` | Neutral / no fill | Call zero “healthy” |
| CF-R1 | Savings rate positive | `B30` | `>0` | Success Green text or fill | Bind to `analysisSavingsHealth` |
| CF-R2 | Savings rate negative | `B30` | `<0` | Risk Red | Treat `B16=0` → `B30=0` as Weak |
| CF-H1 | Health Critical | Severity cell `D158:D165` (or alias) | `="Red"` | Risk Red | Recalculate bands |
| CF-H2 | Health Weak | Severity | `="Orange"` | Warning / Action (C-37 — orange dxf missing) |  |
| CF-H3 | Health Moderate | Severity | `="Yellow"` | Warning Yellow `FFFFF3D6` |  |
| CF-H4 | Health Strong/Excellent | Severity | `="Green"` | Success Green |  |
| CF-H5 | Health Unavailable | Band `B158:B165` | `="Unavailable"` | Neutral Gray; hide score/severity | Map to Weak |
| CF-G1 | Goal completion data bar | `B58` | Excel data bar 0–1 | Informational Blue | `B54/B53` on Dashboard |
| CF-G2 | No goals | `B56+B57` is Analysis’s Unavailable path; Dashboard may gray the widget when `B56=0` and `B57=0` | direct `B56`,`B57` | Neutral | Scan `tblGoals` |
| CF-L1 | Liability warning | Candidate: `B42>0` or `B66≥0.35` | BE numeric | Action / Risk | Use AE `B78`; recompute EMI |
| CF-L2 | No liabilities | `B45=0` and `B42=0` | Neutral | Do not paint Excellent — that is Debt Health |
| CF-C1 | Cash flow warning | `B29<0` | Risk Red | Same trigger as CF-S2; do not add a second formula |
| CF-C2 | Zero income + expenses | Display only; Health already Critical/Unavailable | Neutral | New ratio |
| CF-A1 | Zero assets | `B38=0` | Neutral empty-state | Build concentration on Dashboard |
| CF-N1 | Negative net worth | `B48<0` | Risk Red | Change `B48` |

CF formulas, if they must sit on Dashboard aliases, may only be `=$B29alias<0` style references. They must not call `SUMIFS`.

Icon sets / traffic lights that **score** a number on Dashboard are forbidden; they would duplicate Analysis.

---

## 7. Chart Architecture Freeze

No charts exist. None are implemented here.

| Chart | RC1 status | Type | Source cells | Ownership | Labels | Colors | Sorting | Empty-state |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Asset Allocation | **Freeze candidate** (sources exist) | Doughnut or Pie (DESIGN-04 donut) | `B70:B75` (or C-31 staging aliases) | Business Engine values; Dashboard chart object | Frozen labels Investment / Physical Asset / Property / Retirement Asset / Cash Equivalent / Other Asset | Theme accents in Section 5 order | Category order `B70`→`B75`, never value-sort | If `B35=0`, do not render a pie; show “No active assets” |
| Expense Breakdown | **Deferred** (C-13) | — | No official BE series | — | — | — | — | — |
| Goal Progress | **Freeze candidate** | Bar or data bar, not a per-goal ring | `B58` only (aggregate) | Goal Engine | “Goal completion” | Informational Blue | n/a | If `B56+B57=0`, hide bar |
| Monthly Cash Flow | **Blocked on C-14** | Candidate: clustered bar of 3 points | `B16`, `B22`, `B29` | T005 | Income / Expenses / Surplus | Blue / Neutral / Green-or-Red | Fixed order, not sorted | All zeros → empty-state, not a flat axis of #N/A |
| Health Radar | **Deferred** (C-10, C-25) | — | `C158:C165` exist but composite/radar not in RC1 | — | — | — | — | — |
| Forecast / Runway / Debt payoff | **Deferred** | — | No official outputs | — | — | — | — | — |

Chart objects, if approved, live on Dashboard only. Series formulas reference engine cells or Dashboard aliases. They must not reference `tblTransactions`, leftover AE `C30:C41`, or type rows `A62:A71`.

---

## 8. Named Range Consumption Map

Live defined names Dashboard may use today:

| Widget | Engine cell | Live name | Notes |
| --- | --- | --- | --- |
| Lifetime liability payments | `B46` | `outLiabilityPaymentTotal` | Optional Section E |
| Lifetime asset purchases | `B39` | `outAssetPurchaseTotal` | **Not** a Snapshot Total Assets; not a cash-flow expense |
| Savings Health band | `B158` | `analysisSavingsHealth` | Section B only |
| Expense Health band | `B159` | `analysisExpenseHealth` | Section B |
| Debt Health band | `B160` | `analysisDebtHealth` | Section B |
| Asset Health band | `B161` | `analysisAssetHealth` | Section B |
| Goal Health band | `B162` | `analysisGoalHealth` | Section B |
| Liquidity Health band | `B163` | `analysisLiquidityHealth` | Section B |
| Net Worth Health band | `B164` | `analysisNetWorthHealth` | Section B |
| Cash Flow Health band | `B165` | `analysisCashFlowHealth` | Section B |

Everything else is a **direct Business Engine / Analysis Engine address** until C-5 / C-6 / C-30 are decided.

### Full widget → engine map (no entity tables)

| Widget | Business Engine | Analysis Engine | Goal | Asset | Liability |
| --- | --- | --- | --- | --- | --- |
| Net Worth | `B48` | — | — | — | — |
| Total Assets | `B35` | — | — | `B35` / `B70:B75` | — |
| Total Liabilities | `B42` | — | — | — | `B42` |
| Available Cash | **C-4** | — | — | not `B74` unless C-4 says so | — |
| Monthly Income | `B16` | — | — | — | — |
| Monthly Expenses | `B22` | — | — | T005.2 already dropped asset purchases | — |
| Monthly Savings | `B29` | — | Goal spend stays inside `B22` (C-20 T009) | — | — |
| Savings Rate (numeric) | `B30` | not `B158` | — | — | — |
| Eight health cards | inputs already inside T009 | `B158:D165` | `B58` via T009 only | `B70:B75` via T009 only | `B66` via T009 only |
| Goal widgets | `B53:B58` | Goal Health only | aggregates only | — | — |
| Asset allocation | `B70:B75` | Asset Health only | — | category totals only | — |
| Liability widgets | `B41:B46`, `B66`, `B68` | Debt Health only | — | — | aggregates only |
| Cash flow summary | `B16`, `B22`, `B29`, `B23` | Cash Flow Health only | — | — | — |
| Monthly Overview | **C-29** | — | — | — | — |
| Quick Insights | — | no sentences | — | — | — |

`rng*` / `val*` names are Helpers validation lists. Dashboard does not consume them unless C-15 approves filters.

**Forbidden references on Dashboard:** `tblTransactions[*]`, `tblAssets[*]`, `tblGoals[*]`, `tblLiabilities[*]`, `tblAccounts[*]`, Analysis `A17:C41`, `A62:A71`, `A98:E105`, `B121`, `B154`, `B78`.

---

## 9. Regression Test Plan

Dashboard-only scenarios. Pass means: T005–T009 cells, formulas, names, and leftover AE `A1:AA154` are unchanged, and Dashboard display matches the frozen bindings.

### Engine isolation (must remain byte-identical)

| ID | Verify | Method |
| --- | --- | --- |
| R-T005 | Account matrix `D:L`, `B4:B31`, T005.2 `B22:B25` / `B29:B31` / `B61:B66` | Hash / formula text of `sheet11.xml` those ranges |
| R-T006 | `tblGoals` Current Saved / Remaining; `B53:B58` | sheet9 + `B53:B58` |
| R-T007 | `B41:B46` | `B41:B46` |
| R-T008 | `B34:B39`, `B70:B75`, appreciation columns | those ranges |
| R-T009 | Section 10 `B158:D165` and leftover `A1:AA154` | `sheet12.xml` |
| R-HLP | Helpers `E2:K2` | PROD-001 |
| R-INS | Insights `A1` only | `sheet14.xml` |

### Display scenarios

| ID | Setup | Expected Dashboard | Engines |
| --- | --- | --- | --- |
| R-E1 | Empty workbook (current fixture, `B1=13`, all zeros) | Amounts 0; eight health **Unavailable** / blank score / blank severity; no chart pie; insight slots blank | Unchanged; AE leftover `#NUM!` on `AA3` remains (not a T010 defect) |
| R-E2 | Zero income, zero expenses | Snapshot income/expense/savings 0; `B30` displays 0%; Savings/Expense/Cash Flow Health Unavailable | `B16=B22=B29=0` |
| R-E3 | Zero income, expenses > 0 | Savings negative; Expense Health Critical; Cash Flow Critical | `B29=−B22` |
| R-E4 | Zero assets (`B38=0`) | Total Assets 0; allocation empty-state; Asset Health Unavailable | `B70:B75=0` |
| R-E5 | No goals (`B56+B57=0`) | Goal widgets 0; Goal Health Unavailable | `B53:B58` unchanged rule |
| R-E6 | No liabilities (`B45=0`,`B42=0`) on an **initialized** book | Liability widgets 0; Debt Health **Excellent** (Analysis), not painted by Dashboard as a calculation | T009.1.1 C-2B |
| R-E7 | Brand-new empty profile | Debt Health **Unavailable** | Do not show Excellent |
| R-E8 | High values (1e7+) | `#,##0.00` readable; no overflow formula | No clamp on Dashboard |
| R-E9 | Negative savings (`B16 < B22`) | Savings card Red; `B30` negative percent; Savings Health Critical; Cash Flow Critical | `B29` negative allowed |
| R-E10 | Sold assets only | `B35` / `B70:B75` ignore Sold; allocation empty if no Active | T008 |
| R-E11 | Asset purchase month | `B22` excludes Destination Type Asset; `B39` rises; Snapshot expenses do not include the purchase; do not add `B39` to expenses | T005.2 / T008 |
| R-E12 | Goal-heavy month | Contributions sit in `B22`; Savings Health can be Weak/Critical while Goal Health improves (`B54`/`B58`) | T009 C-20; Dashboard shows both facts |
| R-E13 | Transfer-only month | Income 0, expenses 0, savings 0; accounts move; Net Worth unchanged if only transfers | T005 |
| R-E14 | Credit-card spend vs payment | Spend in `B22`; payment in `B46` not added to expenses | T009 C-19 |
| R-E15 | Include in Dashboard = No account | Balance out of `B4` | Do not add it back on Dashboard |
| R-E16 | Health Unavailable vs 0% | Snapshot may show `B30=0`; Health card must show Unavailable, not Weak | C-3 edge |

If any T005–T009 formula text changes, T010 has failed regardless of card appearance.

---

## 10. PASS Checklist

Implementation cannot begin until every box is explicitly approved.

### Gate — workbook scope

- [ ] T010 may edit **Dashboard (`sheet13.xml`) only**, plus the optional package parts listed in Section 3 if charts/names/styles are approved.
- [ ] Business Engine: **no edits**.
- [ ] Analysis Engine: **no edits** (Section 10 already shipped in `ce5a34e`).
- [ ] Helpers: **no edits**.
- [ ] Insights: **no edits**.
- [ ] Entity sheets / tables / IDs: **no edits**.
- [ ] QA and version workbooks: **no edits**.
- [ ] PROD-001 honored (no COM save of production on this machine).

### Gate — cells

- [ ] Cells **allowed:** Dashboard used range after C-28 assigns addresses; formulas are `=` references to official BE/AE cells or approved names.
- [ ] Cells **forbidden:** every cell on every other worksheet; any Dashboard cell that contains ledger math, band math, or insight sentences.
- [ ] Hidden staging cells: approved or forbidden under C-31.
- [ ] Merged cells / freeze panes: approved with the layout grid (C-28).

### Gate — conflicts that block coding

- [ ] C-1 section order chosen.
- [ ] C-2 Snapshot catalog chosen.
- [ ] C-3 Savings Rate binding chosen.
- [ ] C-4 Available Cash numerator chosen.
- [ ] C-5 / C-6 / C-30 naming strategy chosen.
- [ ] C-8 insight placeholders (count + empty vs `=""`) chosen.
- [ ] C-12 aggregate-only vs per-entity chosen (per-entity requires a new engine output, not a T010 scan).
- [ ] C-13 / C-14 / C-25 / C-32 chart set chosen.
- [ ] C-15 filters yes/no.
- [ ] C-20 / C-21 / C-23 / C-24 visual system chosen.
- [ ] C-28 cell grid approved.
- [ ] C-29 Monthly Overview list approved or section dropped.
- [ ] C-36 header yes/no and sources.

### Gate — charts

- [ ] Asset Allocation approved or dropped.
- [ ] Expense Breakdown deferred (recommended) or a **new BE output** is specified first.
- [ ] Goal Progress aggregate-only approved or dropped.
- [ ] Monthly Cash Flow 3-point vs deferred.
- [ ] Health Radar deferred.

### Gate — conditional formatting

- [ ] CF-S / CF-R / CF-H / CF-G / CF-L / CF-C / CF-A / CF-N approved, including C-37 color collision.
- [ ] No CF that recalculates health or savings.

### Gate — named ranges

- [ ] Existing 64 names untouched.
- [ ] Any new `out*` / `analysis*Score` / `analysis*Severity` / `dash*` names listed and approved, or explicitly forbidden.

### Gate — protection / hidden / Dashboard-only

- [ ] Dashboard remains sheet-protected.
- [ ] Unlocked cells: none unless C-15 approves filters.
- [ ] Hidden engine sheets stay hidden.
- [ ] No VBA, Office Scripts, Power Query, form controls that calculate.
- [ ] Desktop / Web / Android / iPhone / iPad: direct references + `#,##0.00` / percent formats only; no `FILTER` on Dashboard.

### Gate — philosophy

- [ ] Dashboard never owns financial calculations.
- [ ] Dashboard never scans `tblTransactions` / `tblAssets` / `tblGoals`.
- [ ] Dashboard consumes Business Engine and Analysis Engine Section 10 only.
- [ ] Insights owns narrative; Dashboard shows placeholders only in RC1.

**Stop after architecture.** No workbook generation. No DOC-012 rewrite. No commit.

---

## Impact Summary (if implementation is later approved)

| Area | Impact |
| --- | --- |
| Files | `workbook/FinanceOS_v1.0.xlsx` (Dashboard parts only) |
| Worksheets | Dashboard |
| Tables | None |
| Named ranges | None unless C-30 |
| Formulas | Dashboard display refs only |
| Documentation | This file is the T010 SOT. DOC-012 / DOC-015 / RC1 log remain stale until a separate docs checkpoint |

Approval question (implementation, not this file):

> I understand the T010 architecture freeze, including the open C-1…C-37 conflicts. Shall I begin implementing Dashboard visualization in the workbook?

Silence is not approval. Conflict resolution is not approval.

---

**End of T010 Dashboard Architecture Review — Architecture Freeze Only**
