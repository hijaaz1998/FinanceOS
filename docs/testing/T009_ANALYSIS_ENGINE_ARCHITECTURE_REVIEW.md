# T009 — Analysis Engine Integration (Planning Only / Architecture Review)

**Document:** T009_ANALYSIS_ENGINE_ARCHITECTURE_REVIEW  
**Workbook:** `workbook/FinanceOS_v1.0.xlsx`  
**Inspected (read-only ZIP/XML):** size `120421` bytes; SHA-256 `DE4B6AC58F05372065642F85FF462515DECF9D92FB4765C7CE63C927200B7B1F`  
**Excel opened or saved:** No  
**Commits created:** No  
**Status:** Planning complete. Implementation is blocked until every PASS Checklist item is satisfied.

Catalog correction (user list vs frozen IDs):

| User label | Frozen document |
| --- | --- |
| DOC-010 Business Engine | `docs/10_Business_Engine.md` |
| DOC-015 Formula Architecture | `docs/15_Formula_Standards.md` |
| DOC-016 Named Range Standards | `docs/16_Naming_Conventions.md` (contains Named Range Standards) |
| DOC-017 Dashboard Specification | `docs/17_UI_UX_Design_System.md` is UI/UX. Dashboard architecture is **DOC-012**. |
| DOC-018 Excel Compatibility Rules | `docs/18_Excel_Compatibility.md` |
| ES-001 | `docs/04_Engineering_Standards.md` |
| Cash Engine (T005) | T005 is **Business Engine Integration** (Cash Flow Engine + Account Engine). Not a separate worksheet. |

`docs/testing/RC1_IMPLEMENTATION_LOG.md` is stale: it still lists T007/T008 as not started. Production is frozen through T008 (`5d1ab3e`, `ae8ba3e`). That lag is documentation debt. It does not authorize a T005–T008 redesign.

---

## 1. Understanding

### What the Analysis Engine owns

The Analysis Engine is the **interpretation layer**. It is not a financial entity and it does not store Accounts, Goals, Assets, Liabilities, or Transactions.

It owns:

- Deterministic **health bands**, **dimension scores**, and **severity codes** derived from Business Engine outputs.
- Reusable **insight inputs** (category + severity + supporting metric pointers) for Dashboard (T010) and Insights (later).
- Existing pre-RC1 Analysis Engine sections that already sit on the hidden `Analysis Engine` worksheet. Those sections are **not** a T009 invention; they are a foundation scaffold (see C-4).

It does **not** own:

- Income, expense, savings, balances, goal saved amounts, outstanding debt, EMI totals, asset values, net worth, or any other financial total.
- Dashboard cards, colors, or copy.
- Insights narrative text.
- Forecasting, purchase simulation, or scenario comparison (RC1 roadmap: after T010).

### What it consumes

T009 may consume **frozen T005–T008 Business Engine outputs only**, plus the As-Of Date.

| Engine (RC1) | Frozen outputs Analysis may read |
| --- | --- |
| Cash / Account (T005) | `B16` Total Monthly Income; `B22` Current Month Expenses (T005.2); `B23` Previous Month Expenses (T005.2); `B24` YTD Expenses (T005.2); `B28`/`B61` Income aliases; `B29`/`B63` Current Month Savings; `B30`/`B64` Savings Rate; `B4` Total Active Account Balance; `B5` Active Account Count; `B6`–`B9` account-type totals; Account matrix `D2:L200` (already referenced by AE A126/A130/A131) |
| Goal (T006) | `tblGoals[Current Saved Amount]` / `[Remaining Amount]` (entity fields); Goal Summary `B53:B58` (unchanged in T006) |
| Liability (T007) | `B41:B45` Active-only liability totals; `B46` lifetime `outLiabilityPaymentTotal`; `B66` EMI Ratio; `B68` Debt Ratio |
| Asset (T008) | `B34:B38` Active asset totals; `B39` lifetime `outAssetPurchaseTotal`; `B70:B75` Active category totals; `tblAssets` appreciation columns (entity fields, locked) |
| Net Worth (existing BE) | `B48` Net Worth (`B4+B35-B42`); `B49` Liquid Net Worth **placeholder `0`**; `B50` Invested Net Worth (`=$B$35`); `B65` Net Worth alias; `B67` Asset Allocation (`B35/B48`) |

Transaction status rule already frozen on those cash totals: **Completed or Reconciled only**. Pending and Cancelled are ignored. Transfers and Adjustments stay out of income and expense. T005.2 removes Destination Type = Asset from spending metrics (`B22:B25`, `B29:B31`, `B61:B66`).

### What it outputs (T009 product)

Proposed T009 outputs are **interpretation only**:

| Output | Kind | Owner prefix (DOC-016) |
| --- | --- | --- |
| Savings Health | Band + optional 0–100 + severity | `analysisSavingsHealth` |
| Expense Health | Band + optional 0–100 + severity | `analysisExpenseHealth` (name not in DOC-016 examples) |
| Debt Health | Band + optional 0–100 + severity | `analysisDebtHealth` |
| Asset Health | Band + optional 0–100 + severity | not in DOC-016 examples |
| Goal Health | Band + optional 0–100 + severity | `analysisGoalHealth` |
| Liquidity Health | Band + optional 0–100 + severity | not in DOC-016 examples |
| Net Worth Health | Band + optional 0–100 + severity | not in DOC-016 examples |
| Cash Flow Health | Band + optional 0–100 + severity | `analysisCashFlowHealth` |

Overall `analysisHealthScore` is **not** a T009 freeze until C-9 is resolved.

T009 does **not** output: estimated completion month, cash runway months as a prediction, purchase Safe/Caution/Not Recommended, scenario deltas, or Dashboard card formulas.

### Relationship with Business Engine

One-way:

`User data → Helpers (validation only) → Business Engine (mathematics) → Analysis Engine (interpretation) → Dashboard / Insights`

Business Engine is the only owner of reusable financial numbers. Analysis may **map** those numbers to bands/scores. Analysis may **not** rewrite T005–T008 formulas, add Health Input Engine cells on Business Engine, or change `B49` / `B53:B58` / `B41:B46` / `B34:B39` / `B70:B75` / Account matrix `D:L`.

DOC-010 already places a **Health Input Engine** on Business Engine (savings rate, emergency coverage, debt burden, cash-flow stability, goal progress, asset allocation). In the live workbook, some of those **numeric** inputs already exist in Section 9 (`B61:B68`). Emergency coverage, essential expenses, fixed/variable split, and cash-flow stability history do **not** exist as Business Engine outputs.

### Relationship with Dashboard

Dashboard is empty of formulas today (0 formulas). T010 will consume Analysis outputs. T009 must not write Dashboard cells, named ranges used by Dashboard presentation, or card layout. DOC-012’s “Savings Rate source = Analysis Engine” is a **display-routing** conflict (C-7), not a T009 license to move `B30`.

### Relationship with Goals, Assets, Liabilities, Accounts, Transactions

| Entity | Analysis may | Analysis must not |
| --- | --- | --- |
| Transactions | Read only if a documented leftover formula already does (C-4, C-6). New T009 health formulas must not aggregate `tblTransactions`. | Change schema, status, validation, UX, IDs |
| Accounts | Read BE account outputs. | Edit balances or Account Engine `D1:L200` formulas |
| Goals | Read `B53:B58` and locked `tblGoals` calculated columns. | Change Current Saved / Remaining formulas; add forecast |
| Liabilities | Read `B41:B46`, `B66`, `B68`. | Recalculate outstanding, EMI, or `B46` |
| Assets | Read `B34:B39`, `B70:B75`. | Recalculate appreciation or purchase total |
| Helpers / validation lists | None. | Any write (PROD-001) |

### Ownership boundaries (freeze statement)

| Metric class | Owner |
| --- | --- |
| Totals, ratios already on Business Engine (`B16`, `B22`, `B29`, `B30`, `B42`, `B43`, `B48`, `B58`, `B66`, `B68`, …) | Business Engine |
| Health **bands / scores / severity** | Analysis Engine |
| Narrative sentences | Insights (not T009) |
| KPI cards / formatting | Dashboard (T010) |
| Validation lists / FILTER spills | Helpers |

One source of truth per metric. If a number exists on Business Engine, Analysis references that cell. It does not re-sum the ledger to recreate it.

---

## 2. Documentation Summary

### Existing frozen rules that T009 must preserve

1. **Layering (AD / DOC-003, DOC-006, DOC-010, DOC-011):** Business Engine calculates; Analysis interprets; Dashboard presents; Insights explain.
2. **One calculation owner (DOC-010, DOC-015, ES-001):** no duplicate financial mathematics.
3. **Downward dependencies only.** No circular references. Analysis never writes into entity sheets.
4. **Transaction status (T005 / DOC-009):** Completed + Reconciled only. Pending is forecast-only. Cancelled ignored.
5. **Transfers / Adjustments (T005):** out of income, expense, savings.
6. **T005.2 Cash Conversion (T008 freeze):** Destination Type = Asset excluded from spending metrics `B22:B25`, `B29:B31`, `B61:B66`.
7. **Goal identity (T006):** Goal ID canonical; one exclusive adapter; no dual Name+ID `SUMIFS`; no Goal matrix; `B53:B58` unchanged; no T006 forecasting.
8. **Liability (T007):** Outstanding Balance user-maintained; Active-only totals; `B46` lifetime payment total; Destination Type = Liability; Expense or Transfer; Completed or Reconciled.
9. **Asset (T008):** Status Active/Sold only; Current/Purchase Value user-maintained; appreciation locked on `tblAssets`; `B39` lifetime purchase total; Active-only portfolio totals; ID-first adapter if per-asset attribution is ever added.
10. **Net Worth structure:** `B48 = B4 + B35 − B42`. Do not change.
11. **Formula bans (DOC-015 / DOC-018 / RC1):** structured table references; no whole-column refs; no `OFFSET`; no `INDIRECT`; no VBA; no Office Scripts; no Power Query; no volatile financial calculations (`NOW`, `RAND`, `TODAY` inside repeated financial math).
12. **Compatibility (DOC-018):** Desktop Windows/Mac, Web, Android, iPhone/iPad. `LET`, `IF`, `IFERROR`, `SUMIFS`, `COUNTIFS` approved. `FILTER` approved but reserved for Helpers spills, not Analysis health.
13. **PROD-001:** do not rewrite Helpers `E2:K2`; do not save production through this machine’s Excel Desktop COM session.
14. **RC1 roadmap:** Forecasting / Decision Simulator after T010. T006 and this T009 brief both say **no forecasting**.
15. **DOC-008 Savings Rate:** `Monthly Savings / Monthly Income × 100`; transfers excluded; negative savings allowed.
16. **DOC-008 Emergency bands:** &lt;1 Critical, 1–3 Weak, 3–6 Moderate, 6–12 Healthy, &gt;12 Excellent; target = 6 × essential expenses.
17. **DOC-008 Savings Health bands:** &gt;30% Excellent, 20–30 Strong, 10–20 Moderate, 0–10 Weak, negative Critical.
18. **DOC-008 Health Score weights (six components):** Savings 25%, Emergency 20%, Debt 20%, Cash Flow 15%, Goal 10%, Asset 10%.
19. **DOC-008 Asset Health:** diversification only; Version 1 does not score investment performance.
20. **DOC-011:** Analysis never reads Dashboard or Insights.
21. **DOC-016:** reusable Analysis outputs use `analysis{Name}`.
22. **Worksheet (DOC-007 / live file):** Analysis Engine is hidden, fully protected, no user-editable cells.

### Conflicts (do not silently resolve)

#### C-1 — T009 RC1 scope vs full DOC-011 / DOC-007 Analysis Engine

**Conflict:** DOC-007 / DOC-011 / DOC-015 / DOC-003 freeze Goal Forecast, Cash Runway, Purchase Affordability, Scenario, Future Prediction, and spending/income intelligence as Version 1 Analysis modules. RC1 log and this T009 brief defer forecasting and Decision Simulator until after T010, and this brief says **no forecasting**.

**Freeze candidate:** T009 implements **historical health interpretation only**. Defer Cash Runway prediction, Goal Forecast, Purchase Affordability, Scenario, and Future Prediction. Do not treat that deferral as a DOC-011 rewrite; record it as RC1 scope.

#### C-2 — Health dimension catalog mismatch

**Conflict:** This T009 brief requires Savings, Expense, Debt, Asset, Goal, Liquidity, Net Worth, Cash Flow. DOC-008 / DOC-011 require Savings, **Emergency Fund**, Debt, Cash Flow, Goal, Asset. Expense, Liquidity, and Net Worth Health are not named DOC-008 score components. Emergency Fund Health is named and weighted 20%, and is absent from the T009 list.

**Freeze candidate:** Do not drop Emergency Fund Health. Map **Liquidity Health** as the RC1 alias for Emergency / cash-reserve interpretation **only after C-15 is resolved**. Treat Expense Health and Net Worth Health as **proposed RC1 additions** that require approved thresholds (C-10) before implementation. Do not invent a new eight-weight scheme (C-9).

#### C-3 — Who may compute ratios

**Conflict:** DOC-010: Business Engine owns Savings Rate Input, Debt Burden Input, Emergency Coverage Input. DOC-015 Analysis Health module recalculates savings rate from `outMonthlyIncome` / `outMonthlySavings`. Live workbook already has `B30`, `B66`, `B68`, `B67`, `B58` on Business Engine.

**Freeze candidate:** Analysis **never recreates** `B30`, `B66`, `B68`, `B58`, `B29`, `B22`, `B16`. New T009 formulas only classify those existing cells. A ratio of two existing BE outputs (for example `B22/B16` for Expense Health) is allowed **only** as an Analysis interpretation input, and only if C-29 is approved. New `SUMIFS` / ledger math is forbidden.

#### C-4 — Live Analysis Engine is a parallel calculator

**Conflict:** Analysis Engine already has **251 formulas** (dimension `A1:AA154`). **65** reference `tblTransactions`. **Zero** of those mention Completed, Reconciled, Pending, or Destination Type. Previous-month / YTD / monthly-trend / category blocks therefore disagree with T005 and T005.2. DOC-010 / DOC-007 forbid Analysis from owning financial mathematics and from reading raw worksheets unless documented.

**Freeze candidate (recommended):** T009 **does not rewrite** Sections 1–8 transaction aggregations. T009 **adds** Section 10 health interpretation that reads Business Engine only. Residual ledger formulas remain a known defect (C-13, C-14), not silently “fixed” inside a health checkpoint.

**Alternate freeze:** T009 replaces every `tblTransactions` aggregation with Business Engine references or deletes them. That is a larger rewrite, still must not touch T005–T008 cells, and still cannot create previous-month income on Business Engine without violating “do not modify Business Engine.”

#### C-5 — Health Input Engine vs T009 “do not modify Business Engine”

**Conflict:** Official Emergency Coverage, essential expenses, fixed commitments, and cash-flow stability are DOC-010 **Business Engine** health inputs. They are not implemented. T009 is forbidden from adding them on Business Engine. Analysis cannot invent the missing mathematics without violating DOC-010.

**Freeze candidate:** Liquidity / Emergency Health is **blocked** in T009 until a later Business Engine health-input checkpoint **or** the user explicitly authorizes a narrow, documented BE add (that would be a new checkpoint, not silent T009 work).

#### C-6 — Allowed Analysis inputs

**Conflict:** DOC-007 Cursor notes: “Analysis references Business Engine only.” DOC-011 Input Sources: Business Engine, Settings, Goals, Categories. Live AE also reads `tblTransactions`, `tblAssets`, `tblLiabilities`, `tblGoals`, `lkpAssetType`, `lkpLiabilityType`, and the Account Engine matrix.

**Freeze candidate:** New T009 formulas reference **Business Engine cells and existing `out*` names only**. Settings / Goals / Categories metadata are not required for the eight health bands if BE inputs are used. Do not add new entity-table aggregations.

#### C-7 — Savings Rate display owner

**Conflict:** DOC-008 / live `B30`: Business Engine owns numeric Savings Rate. DOC-006 example and DOC-012 Snapshot: “Savings Rate / Analysis Engine.” DOC-015 Dashboard map: Savings Rate → `analysisSavingsHealth` (a health indicator, not the percentage).

**Freeze candidate:** Numeric rate stays `B30`/`B64`. Analysis owns `analysisSavingsHealth` (band/score). T010 decides which cell the Snapshot card reads. T009 does not move `B30`.

#### C-8 — Forecast-like formulas already on Analysis Engine

**Conflict:** AE `D98:D105` compute “Monthly Contribution Needed” from remaining amount ÷ remaining months. DOC-010 calls that a forecast input. T006 and this brief forbid forecasting.

**Freeze candidate:** Do not add more forecast formulas. Do not use `D98:D105` as Goal Health inputs. Leave those cells byte-identical unless a later checkpoint deletes them.

#### C-9 — Composite Health Score weights vs eight dimensions

**Conflict:** DOC-008 freezes a 6-component 100% weight table. T009 lists 8 dimensions. No weights exist for Expense, Liquidity, or Net Worth. DOC-007 says Module 1 outputs a 0–100 score.

**Freeze candidate:** T009 ships **per-dimension** band + score only. **Do not implement `analysisHealthScore`** until the user freezes either (a) DOC-008 six-component weights with Emergency included, or (b) a new eight-component table in documentation first.

#### C-10 — Missing numeric thresholds

**Conflict:** Only Savings Rate (DOC-008) and Emergency months (DOC-008) have numeric bands. Debt, Cash Flow, Goal, and Asset Health are qualitative (“higher burden lowers score”). Expense, Liquidity, and Net Worth Health have **no** documented bands. Helpers Constants Section (DOC-007) that should store thresholds is **empty**.

**Freeze candidate:** Section 4 bands below are **proposals**. Implementation cannot begin on a dimension until its band table is explicitly approved. Do not hide thresholds inside undocumented cells.

#### C-11 — Named-range ownership

**Conflict:** DOC-016: named ranges “always reference Helpers outputs.” Live engine names `outLiabilityPaymentTotal` and `outAssetPurchaseTotal` already point at Business Engine. No `analysis*` names exist. DOC-016 also requires `analysis{Name}` for Analysis outputs.

**Freeze candidate:** T009 may add `analysis*` defined names that point at **Analysis Engine cells**, matching the existing `out*` exception. Do not place Analysis outputs on Helpers (PROD-001).

#### C-12 — Formula family for new work

**Conflict:** DOC-015 prefers `LET`, `XLOOKUP`, `FILTER` in that order. Live engines use `SUMIFS` + `IFERROR` + some `SUMPRODUCT` (frozen on BE `B12:B15`, `B43`). RC1 T006 rejected `LET`/`XLOOKUP`/`SUMPRODUCT` on every goal row.

**Freeze candidate:** New T009 health formulas use `LET` + `IF` / `IFS` + `IFERROR` over scalar BE refs. Forbidden in T009: `FILTER`, `OFFSET`, `INDIRECT`, `TODAY`, `NOW`, `RAND`, `INDIRECT`, whole-column refs, new `SUMPRODUCT`, new `SUMIFS` on `tblTransactions`.

#### C-13 — Spending insights vs T005.2

**Conflict:** AE Section 2 category `SUMIFS` and monthly trend expense columns do not exclude Destination Type = Asset. Health that used those cells would disagree with `B22`.

**Freeze candidate:** Expense Health and spending insight inputs use **`B22` / `B23`**, not AE `C14` / `C30:C41`. Leave Section 2 byte-identical (C-4) or schedule a later AE hygiene checkpoint.

#### C-14 — Status filter missing on existing AE ledger formulas

**Conflict:** AE previous-month income `C6` and all 65 `tblTransactions` formulas include Pending and Cancelled.

**Freeze candidate:** Same as C-4. New health formulas do not inherit this defect because they do not read those cells.

#### C-15 — Emergency / Liquidity inputs do not exist

**Conflict:** DOC-008 Emergency Fund = dedicated **goal category**; coverage = Emergency Fund ÷ average monthly **essential** expenses. Live model: `tblCategories` has no Essential flag; Helpers have no essential map; Settings has no emergency target row; Recurring Commitment Engine is not in T005–T008; Goal Category “Emergency Fund” is not a calculated BE output; AE `B154` is labeled placeholder and uses `B127/B45` (all dashboard-enabled cash ÷ monthly expenses).

**Freeze candidate:** Liquidity Health and Emergency Fund Health are **out of T009 implementation** until the user freezes (1) numerator, (2) denominator, (3) owner (must be Business Engine per DOC-010). Do not promote `B154` or `B49` to official inputs.

#### C-16 — Estimated monthly interest on Analysis Engine

**Conflict:** AE `B78 = B75 * B77 / 12` is new liability mathematics. DOC-010 gives liability math to Business Engine.

**Freeze candidate:** Do not use `B78` for Debt Health. Leave `B78` byte-identical. Debt Health uses `B66` and/or `B68` only.

#### C-17 — As-Of Date default

**Conflict:** Business Engine `B1` stored value is serial `13` (formatted as a date). AE `AA3` previous-month start is `#NUM!` for that default (`DATE(1900,0,1)`). Empty-workbook previous-month analysis is already broken.

**Freeze candidate:** T009 health uses current-month BE scalars and does not depend on `AA3`. Do not “fix” `B1` in T009 (that is Business Engine / Settings). Document empty-workbook `#NUM!` on leftover AE cells as unchanged behavior.

#### C-18 — PROD-001 interaction

**Conflict:** Any Excel Desktop COM save on this machine can strip Helpers `E2:K2`.

**Freeze candidate:** T009 implementation, if approved, must be XML-level or licensed-Desktop only, must not open/save via the broken COM session, and must not touch Helpers.

#### C-19 — Credit-card double count

**Conflict:** DOC-008: card purchases are expenses; payments are transfers toward liabilities; never count twice. T007 `B46` includes Expense **or** Transfer to Destination Type Liability.

**Freeze candidate:** Analysis spending/debt health uses `B22` (expenses, T005.2) and `B43`/`B66` (EMI). It must not add card payments from `B46` onto `B22`.

#### C-20 — Goal contributions vs Savings Health

**Conflict:** DOC-010: goal contributions remain expenses in cash flow. DOC-008: goal contributions are earmarked savings behavior and do not change Net Worth.

**Freeze candidate:** Savings Health uses **cash-flow** `B30` (`B16 − B22`) / `B16`. Goal Health uses `B58`. Do not treat goal contribution totals as extra savings.

#### C-21 — Asset-purchase month vs Expense Health

**Conflict:** Raw expense sums include asset purchases; `B22` excludes them (T005.2).

**Freeze candidate:** Expense Health uses `B22`, never a raw Expense `SUMIFS`.

#### C-22 — T009 is integration of an existing sheet, not a greenfield sheet

**Conflict:** DOC-019 / Master Index still say workbook engineering is “not started.” The live Analysis Engine is a hidden 154-row workbook with a KPI output table (Section 9) that already pass-throughs many BE cells.

**Freeze candidate:** Treat T009 like T005: integrate the existing sheet. Add Section 10. Do not rename the worksheet. Do not add a second analysis sheet.

#### C-23 — DOC-011 Settings / Goals / Categories vs T009 “engines only”

**Conflict:** DOC-011 lists Settings, Goals, Categories as Analysis inputs. This brief lists only T005–T008 engine outputs.

**Freeze candidate:** T009 health does not need Settings/Categories if BE inputs are used. Goal metadata is already summarized on `B53:B58`.

#### C-24 — Fixed-commitment burden missing

**Conflict:** DOC-008 Cash Flow Health includes fixed-commitment burden. Recurring Commitment Engine is not implemented in T005–T008.

**Freeze candidate:** Cash Flow Health in T009 uses surplus sign (`B29`) and optional expense MoM (`B22` vs `B23`) only. Commitment burden deferred.

#### C-25 — Calendar year vs financial year

**Conflict:** AE monthly trend `A30:E41` is calendar year of As-Of. DOC-008 default financial year is April–March. `B18`/`B24` use calendar `DATE(YEAR(B1),1,1)`, not FY.

**Freeze candidate:** T009 health is **current As-Of month** only. Do not add FY or calendar-trend formulas. Do not “fix” `B18`/`B24` FY (that would redesign T005).

#### C-26 — `out*` / `calc*` / `healthInput*` names mostly absent

**Conflict:** DOC-010 / DOC-015 / DOC-016 require `outMonthlyIncome`, `healthInputSavingsRate`, etc. Live names are only `outLiabilityPaymentTotal` and `outAssetPurchaseTotal`. Analysis already uses `'Business Engine'!$B$n` addresses.

**Freeze candidate:** T009 continues cell-address references to frozen BE cells. Do not add `out*` names on Business Engine in T009 (that would edit `workbook.xml` plus imply BE ownership changes). Add only `analysis*` names on Analysis Engine (C-11).

#### C-27 — Narrative vs insight inputs

**Conflict:** DOC-011 examples are sentences (“Your savings rate is improving.”). DOC-011 also says Analysis does not assemble narrative; Insights does.

**Freeze candidate:** T009 outputs codes/bands/scores only (`Excellent`, `Green`, `80`). No concatenated English headlines.

#### C-28 — Band labels vs 0–100 scores

**Conflict:** DOC-008 uses Excellent/Strong/Moderate/Weak/Critical (and Emergency Healthy/Excellent). DOC-011 severity is Green/Yellow/Orange/Red. DOC-007 Module 1 outputs 0–100.

**Freeze candidate:** Each implemented dimension outputs **three** fields: DOC-008-style band, 0–100 dimension score, DOC-011 severity. Mapping tables must be approved (C-10) before coding.

#### C-29 — Expense Health is unspecified

**Conflict:** No DOC defines Expense Health inputs, bands, or excluded statuses beyond general expense rules.

**Freeze candidate:** Proposed in Section 4. Blocked until approved.

#### C-30 — Net Worth Health is unspecified

**Conflict:** DOC-008 Net Worth rules define `Cash + Assets − Liabilities` (and also “Total Assets − Total Liabilities” in one sentence). Live `B48 = B4 + B35 − B42`. No health bands.

**Freeze candidate:** Proposed in Section 4. Net Worth **number** stays `B48`. Health is interpretation. Blocked until bands approved.

#### C-31 — Liquidity vs Available Cash vs Emergency Cash vs Liquid Net Worth

**Conflict:** DOC-010 Available Cash = active cash-class accounts. Live `B6` is Account Type `Cash` only; `B7` is `Savings Bank`; `B74` is asset category Cash Equivalent; `B49` is hardcoded `0`; Emergency Cash is an **Asset Type** under Cash Equivalent (DOC-007), while DOC-008 Emergency Fund is a **goal category**.

**Freeze candidate:** Do not pick a numerator in T009. C-15 blocks Liquidity.

#### C-32 — Helpers threshold constants missing

**Conflict:** DOC-007 Helpers Constants Section should store health/emergency/savings thresholds. Helpers have none.

**Freeze candidate:** T009 may hardcode approved bands **inside Analysis `LET` formulas** (documented in Section 4) **or** wait for a Helpers constants checkpoint. Do not write Helpers to store them in T009 (PROD-001 / “do not edit Helpers”).

### Missing specifications

- Expense Health definition and bands.
- Net Worth Health definition and bands.
- Liquidity / Emergency numerator and essential-expense denominator in the live schema.
- Eight-dimension weight table (or confirmation that composite score is deferred).
- Band → 0–100 → severity mapping tables for Debt, Cash Flow, Goal, Asset.
- Whether existing AE Sections 1–8 are frozen scaffold or in-scope rewrite.
- Whether previous-month income must exist before any MoM income insight (BE has previous-month **expense** only).
- RC1 Implementation Log not updated for T007/T008.

### Ambiguities

- Is “Liquidity Health” Emergency Fund Health, Available Cash / expenses (`B154`), or `B49`?
- Is “Cash Engine” only `B16/B22/B29` or the whole Account Engine?
- May Analysis read `tblGoals` for overdue flags (`E98:E105`, first 8 goals only) for Goal Health?
- Empty As-Of `B1=13`: treat as empty-workbook fixture or a defect to ignore?

### Architectural inconsistencies (already in frozen docs; not T009 to “fix”)

- DOC-008 Net Worth formula text vs live `B48` (cash + assets − liabilities vs “assets − liabilities”).
- DOC-008 “Completed only” vs T005 Completed+Reconciled (T005 already froze Reconciled = Completed).
- DOC-012 Savings Rate sourced from Analysis vs `B30`.
- DOC-016 named ranges “Helpers only” vs live `out*` on Business Engine.
- Master Index / DOC-019 “workbook not started” vs production through T008.

---

## 3. Workbook Impact Analysis

Inspected package. No bytes written.

### Would Change (T009 implementation, after approval only)

| Area | What |
| --- | --- |
| Worksheet | **Analysis Engine only** (`xl/worksheets/sheet12.xml`) |
| Cells | **New Section 10** below the current used range (recommended start `A156`, after `A154` Emergency placeholder). New locked formula cells for each approved dimension (band, score, severity) plus labels. Optional pointer row listing the BE input cell used. |
| Existing AE `A1:AA154` | **No change** under recommended C-4 freeze. Alternate freeze would edit Sections 1–2, 6–7 ledger formulas only — not recommended in the same checkpoint as health. |
| Named ranges | New `analysis*` names in `xl/workbook.xml` pointing at Section 10 cells (C-11). |
| Formula regions | New Section 10 only. Shared-strings / calcChain would update if formulas/labels are added. |
| Protected cells | Entire Analysis Engine is already sheet-protected with no unlocked user region. New cells stay locked. Protection flags themselves should remain unchanged. |
| Visibility | Sheet stays `state="hidden"`. |

T009 must **not** change Business Engine cells, including `B1`, `B49` (literal `0`), `B53:B58`, `B41:B46`, `B34:B39`, `B70:B75`, `B61:B68`, Account matrix `D1:L200`, or T005.2 spending formulas.

### Would NOT Change (must remain byte-identical)

Every production part except Analysis Engine sheet XML, and except `workbook.xml` **only if** `analysis*` names are added.

**Worksheets (byte-identical):**

- Settings
- Categories
- Income Sources
- Accounts
- Assets
- Liabilities
- Recurring Commitments
- Transactions
- Goals
- Helpers (`sheet10.xml` — PROD-001)
- **Business Engine** (`sheet11.xml`) — entire T005–T008 surface
- Dashboard (`sheet13.xml`, 0 formulas)
- Insights (`sheet14.xml`, 0 formulas)

**Engines / formula regions (byte-identical):**

- Account Engine matrix `D1:L200` and `I2:I200` Last Transaction Date (`#N/A`, TD-002)
- Cash Flow / Income / Expense / Savings `B4:B31`
- Asset Engine `B34:B39`, `B70:B75`, `tblAssets` appreciation columns
- Liability Engine `B41:B46`
- Net Worth `B48:B50`
- Goal Summary `B53:B58` and `tblGoals` Current Saved / Remaining
- Monthly Financial Health **inputs** `B61:B68` (these stay BE-owned numbers)
- T002 validation named ranges (`rng*` / `val*`)
- `outLiabilityPaymentTotal`, `outAssetPurchaseTotal`

**Files (byte-identical):**

- `workbook/testing/*` (QA workbook)
- `workbook/versions/*` (including `FinanceOS_v1.0-RC1-FROZEN.xlsx`)
- Helpers FILTER/SORT/UNIQUE `E2:K2`

**No guessing:** the live Analysis Engine **already contains** Sections 1–9. Recommended T009 does not rewrite them. If the alternate C-4 rewrite is chosen, the Would Change list expands to those AE cells and this impact section must be re-approved.

---

## 4. Business Rules (Freeze Candidates)

These are **proposed** T009 rules. They are not frozen until the user approves them and the blocking C-IDs are closed or explicitly deferred.

Common rules for every dimension:

- **No forecasting.**
- **No Dashboard rules.**
- **Included transaction statuses** (when a BE input already applied them): Completed, Reconciled.
- **Excluded transaction statuses:** Pending, Cancelled.
- **Excluded from cash totals (already in BE):** Transfer, Adjustment; Destination Type = Asset on spending metrics (T005.2).
- **Formula ownership:** band/score/severity on Analysis Engine Section 10. Numeric inputs remain Business Engine.
- **Empty / divide-by-zero:** dimension score blank (not Excel error); band `Unavailable`; severity blank. Matches DOC-010 “division by zero → blank.”
- **Extreme values:** do not clamp BE inputs. Bands must define a top and bottom bucket that absorb values outside mid ranges.

### 4.1 Savings Health

| Field | Freeze candidate |
| --- | --- |
| Inputs | `B30` / `B64` Savings Rate (already `IFERROR(B29/B28,0)`). `B29` Savings. `B16`/`B28` Income (for zero-income detection). |
| Formula ownership | Analysis classifies `B30`. Must not recompute savings. |
| Included statuses | Those already inside `B16`/`B22`/`B29`/`B30`. |
| Excluded statuses | Pending, Cancelled; Transfers; Adjustments; asset purchases in the expense leg (T005.2). |
| Bands (DOC-008, already frozen text) | `B30 < 0` Critical; `0 ≤ B30 < 0.10` Weak; `0.10 ≤ B30 < 0.20` Moderate; `0.20 ≤ B30 < 0.30` Strong; `B30 ≥ 0.30` Excellent. Note: `B30` is a **ratio**, not ×100. |
| Zero income | `B16=0` → `B30` is already `0` via `IFERROR`. That collides with “0–10% Weak.” **Edge case (must freeze):** if `B16=0` then band `Unavailable` (do not call 0% Weak). |
| Goal-heavy month | Goal contributions stay inside `B22`, so Savings Health can go Weak/Critical while Goal Health is Strong. That is correct (C-20). |
| Proposed 0–100 | Map the five DOC-008 bands to 0 / 25 / 50 / 75 / 100 **or** a linear clip of `B30` at 0–40%. **Not frozen** (C-28). |
| Proposed severity | Critical→Red; Weak→Orange; Moderate→Yellow; Strong/Excellent→Green. **Not frozen** (C-28). |

### 4.2 Expense Health

| Field | Freeze candidate |
| --- | --- |
| Inputs | `B22` current expenses (T005.2); `B16` income; optional `B23` previous-month expenses (T005.2). |
| Formula ownership | Analysis. Must not `SUMIFS` expenses. |
| Included / excluded statuses | Same as `B22`/`B23`. |
| Proposed primary metric | Expense-to-income `B22/B16` when `B16>0`. |
| Proposed bands (NOT in docs — C-29) | `B16=0` and `B22=0` → Unavailable; `B16=0` and `B22>0` → Critical; ratio `<0.50` Excellent; `0.50–<0.70` Strong; `0.70–<0.85` Moderate; `0.85–<1.00` Weak; `≥1.00` Critical. |
| Optional MoM | `(B22-B23)/B23` is an insight input, not the health band, until approved. `B23=0` → MoM Unavailable. |
| Asset purchase month | Uses `B22`, so asset purchases do not inflate Expense Health (C-21). |
| Credit-card month | Card spend sits in `B22`; card **payments** do not (C-19). |
| Transfer-only month | `B22=0` → Excellent or Unavailable (must freeze). |
| Blocked? | **Yes, until C-29 bands are approved.** |

### 4.3 Debt Health

| Field | Freeze candidate |
| --- | --- |
| Inputs | `B66` EMI Ratio (`IFERROR(B43/B16,0)`); `B68` Debt Ratio (`IFERROR(B42/(B42+B35),0)`); `B45` Active Liability Count. |
| Formula ownership | Analysis classifies `B66` and/or `B68`. Must not recompute EMI or outstanding. Must not use AE `B78`. |
| Included statuses | Active liabilities only (already in `B42`/`B43`). |
| Excluded statuses | Closed / non-Active liabilities; Pending/Cancelled payments (they never changed `B42` because outstanding is user-maintained). |
| Zero income | `B16=0` → `B66=0` via `IFERROR`, which would look “healthy.” **Must freeze:** if `B45>0` and `B16=0` → Debt Health Critical or Unavailable, not Strong. |
| No liabilities | `B45=0` and `B42=0` → Excellent. |
| Proposed EMI bands (NOT in docs — C-10) | Common consumer bands: `&lt;15%` Excellent; `15–&lt;25` Strong; `25–&lt;35` Moderate; `35–&lt;50` Weak; `≥50` Critical. **Not frozen.** |
| Proposed debt-ratio bands | Unspecified. Do not implement a second classifier until the user picks EMI-only vs blended. |
| Liability-heavy month | High `B43` vs `B16` lowers Debt Health. `B46` lifetime payments do not improve the band (outstanding is user-maintained). |
| Credit-card month | Credit Card type outstanding is inside `B42` if Active. Card spend does not by itself change `B42`. |
| Blocked? | Partially. Inputs exist. **Bands blocked on C-10.** |

### 4.4 Asset Health

| Field | Freeze candidate |
| --- | --- |
| Inputs | `B35` Total Current Value (Active); `B70:B75` category totals; `B38` Active Asset Count; `B67` Asset Allocation vs Net Worth (do **not** use as performance). |
| Formula ownership | Analysis. Diversification only (DOC-008). Must not score `B36`/`B37` appreciation quality. |
| Included statuses | Active assets only. |
| Excluded statuses | Sold (T008). Closed/Archived are not asset statuses. |
| Proposed metric | Concentration = `MAX(B70:B75)/B35` when `B35>0`. |
| Proposed bands (NOT in docs — C-10) | No assets `B38=0` → Unavailable (or Weak — must freeze). Concentration `≤0.40` Excellent; `≤0.60` Strong; `≤0.80` Moderate; `≤0.95` Weak; `>0.95` Critical. |
| Empty workbook | `B35=0` → Unavailable. |
| Asset purchase month | `B39` lifetime purchases do not change Asset Health; `B35` only changes if the user records Current Value. |
| Blocked? | **Yes, until C-10 diversification bands are approved.** |

### 4.5 Goal Health

| Field | Freeze candidate |
| --- | --- |
| Inputs | `B58` Goal Completion % (`B54/B53`); `B56` Active Goal Count; `B57` Completed Goal Count. |
| Formula ownership | Analysis classifies `B58`. Must not change `tblGoals` or `B53:B58`. Must not use `D98:D105` (C-8). |
| Included goal statuses | Active + Completed (already in `B53`/`B54`/`B58`). |
| Excluded goal statuses | Paused, Archived (already out of `B53:B54`). |
| Included contribution statuses | Completed + Reconciled expenses to Destination Type Goal (already inside Current Saved). |
| Excluded contribution types | Transfer, Adjustment, Pending, Cancelled (T006). |
| Zero targets | `B53=0` → `B58=0` via `IFERROR`. If `B56+B57=0` → Unavailable, not Weak. |
| Proposed bands (NOT in docs — C-10) | No goals → Unavailable; `B58 ≥ 0.80` Excellent; `≥0.50` Strong; `≥0.25` Moderate; `>0` Weak; `=0` with active goals Critical. |
| Goal-heavy month | Contributions raise `B54`/`B58` and simultaneously lower Savings Health (C-20). |
| Overdue flag | AE `B107` only covers the first 8 goal rows and is not a BE output. **Do not use** unless the user freezes “first-8 overdue” as official (not recommended). |
| Blocked? | **Yes, until C-10 bands are approved.** Inputs exist. |

### 4.6 Liquidity Health

| Field | Freeze candidate |
| --- | --- |
| Inputs | **None official.** Do not use `B154` placeholder, `B49` (`0`), or ad-hoc `B4/B22`. |
| Formula ownership | DOC-010: Emergency Coverage Input is **Business Engine**. Analysis would only classify a future `healthInputEmergencyCoverage`. |
| Included / excluded | Cannot specify until numerator/denominator are frozen (C-15, C-31). |
| DOC-008 bands (exist, unused) | Months: &lt;1 Critical; 1–3 Weak; 3–6 Moderate; 6–12 Healthy; &gt;12 Excellent. Target 6 months. |
| Edge cases | Essential expense list has no schema (no category flag, no commitment engine). |
| Blocked? | **Yes. C-5, C-15, C-31.** |

### 4.7 Net Worth Health

| Field | Freeze candidate |
| --- | --- |
| Inputs | `B48` Net Worth; optional `B68` Debt Ratio; `B4`, `B35`, `B42` as supporting pointers only. |
| Formula ownership | `B48` stays Business Engine. Analysis classifies `B48`. |
| Included entity statuses | Those already inside `B4` (Active + Include in Dashboard = Yes), `B35` (Active assets), `B42` (Active liabilities). |
| Excluded | Closed accounts, Sold assets, non-Active liabilities; goal cash is already inside accounts (no double count). |
| Transfers / asset purchases | Do not change `B48` immediately (DOC-008 / T005 / T008). Net Worth Health should stay Stable across a transfer-only or asset-purchase month if the user updates Current Value = cash spent. If they do not update Current Value, `B4` falls and `B48` falls — that is a data issue, not Analysis math. |
| Proposed bands (NOT in docs — C-30) | `B48 < 0` Critical; `B48 = 0` Weak; `B48 > 0` and `B68 ≥ 0.70` Weak; `B68 ≥ 0.40` Moderate; else Strong/Excellent. **Not frozen.** |
| Previous-month NW change | No previous-month Net Worth exists on BE. Do not invent it. |
| Blocked? | **Yes, until C-30 bands are approved.** Input `B48` exists. |

### 4.8 Cash Flow Health

| Field | Freeze candidate |
| --- | --- |
| Inputs | `B29`/`B63` Monthly Savings (surplus; DOC-010 surplus = income − expense). Optional `B22` vs `B23` for expense direction. |
| Formula ownership | Analysis classifies `B29`. Must not rebuild cash flow. |
| Included / excluded statuses | Same as `B16`/`B22`. |
| DOC-008 qualitative | Positive surplus improves score; negative surplus reduces immediately; consistency and fixed-commitment burden mentioned but **not implementable** (C-24, no history series on BE). |
| Proposed bands (partially documented) | `B29 < 0` Critical; `B29 = 0` Weak; `B29 > 0` Strong; if `B16=0` and `B22=0` Unavailable; if `B16=0` and `B22>0` Critical. Consistency (3+ months) **deferred**. |
| Transfer-only month | `B16=0`, `B22=0`, `B29=0` → Unavailable or Weak (must freeze; do not call it healthy surplus). |
| Zero income month | Negative if any T005.2 expense exists. |
| Blocked? | Partially. Sign-of-surplus rule can freeze from DOC-008. Multi-month stability cannot. |

---

## 5. Formula Inventory

No workbook XML. No implementation.

### 5.1 Proposed T009 formulas (Section 10 only)

All proposed formulas are **scalar**. They read one or two Business Engine cells. They do not iterate tables.

| ID | Metric | Cell owner (proposed) | Family | Why this family | Compatibility | Forbidden alternatives |
| --- | --- | --- | --- | --- | --- | --- |
| F-S1 | Savings Health band | Analysis Engine Section 10 (e.g. `B158`) | `LET` + nested `IF` | Names `rate` / `income` once; maps DOC-008 bands | DOC-018: `LET`/`IF` all five platforms | `IFS` acceptable alternate; `SWITCH` not in approved family list; `FILTER` unnecessary; `VLOOKUP` table on Helpers forbidden in T009; `SUMIFS` forbidden |
| F-S2 | Savings Health score | Adjacent cell | `LET` + `IF` | Same inputs as F-S1 | Same | Linear `MIN/MAX` clip only after C-28 |
| F-S3 | Savings Health severity | Adjacent cell | `IF` | Maps band → Green/Yellow/Orange/Red | Same | Conditional formatting as the source of truth (Dashboard-only, T010) |
| F-E1 | Expense-to-income (interpretation input) | Analysis Engine | `LET` + `IFERROR`/`IF` | Ratio of existing `B22`/`B16` | Same | New expense `SUMIFS`; `SUMPRODUCT`; AE `C14` |
| F-E2 | Expense Health band/score/severity | Analysis Engine | `LET` + `IF` | Classifies F-E1 | Same | Same as F-E1 |
| F-D1 | Debt Health band/score/severity | Analysis Engine | `LET` + `IF` | Classifies `B66` (and zero-income / no-liability guards) | Same | Recalc EMI; `B78`; `tblLiabilities` `SUMIFS` |
| F-A1 | Asset concentration | Analysis Engine | `LET` + `MAX` + `IF` | `MAX(B70:B75)/B35` is diversification, not performance | `MAX` of six scalars; no array spill required | `FILTER` of `tblAssets`; scoring `B36` |
| F-A2 | Asset Health band/score/severity | Analysis Engine | `LET` + `IF` | Classifies F-A1 | Same | Appreciation % as quality |
| F-G1 | Goal Health band/score/severity | Analysis Engine | `LET` + `IF` | Classifies `B58` with empty-goal guard | Same | `D98:D105`; `B107`; new `SUMIFS` on goals |
| F-C1 | Cash Flow Health band/score/severity | Analysis Engine | `LET` + `IF` | Classifies `B29` | Same | Recalc surplus; `TODAY`; commitment calendar |
| F-N1 | Net Worth Health band/score/severity | Analysis Engine | `LET` + `IF` | Classifies `B48` / optional `B68` | Same | Reconstruct NW; previous-month NW |
| F-L1 | Liquidity Health | — | — | **Not inventoried.** Blocked by C-15. | — | `B154`, `B49`, `B4/B22` as silent substitutes |
| F-H1 | Overall Health Score | — | — | **Not inventoried.** Blocked by C-9. | — | Ad-hoc average of eight scores |
| F-NR | `analysis*` names | `workbook.xml` | Defined names | DOC-016 prefix; Dashboard later binds to names not addresses | Names are cross-platform | Names on Helpers; `INDIRECT` |

**Compatibility notes:** no dynamic arrays in Section 10. No volatile functions. No circular refs (Section 10 reads BE only; BE does not read Analysis).

### 5.2 Existing Analysis Engine formulas (not T009 product; do not treat as approved health)

| Region | Family | Issue vs T005–T008 |
| --- | --- | --- |
| `C6:D11`, `C14`, `A30:C41`, `B17:D26` | `SUMIFS` / `SUMPRODUCT` on `tblTransactions` | No status filter; no T005.2 |
| `B6:B11`, `B14`, `B44:B48`, `B54:B58`, `B74:B81`, `B108:B109`, `B125:B129`, `B137:B151` | Direct `'Business Engine'!$B$n` | Already pass-through; keep |
| `B62:B71` | `SUMIFS` on `tblAssets` Active | Duplicates T008 category idea at **type** grain; not BE `B70:B75` |
| `B85:B94` | `SUMIFS` on `tblLiabilities` Active | Type mix not on BE; leftover |
| `B98:E105`, `B107` | `INDEX`/`IF` on `tblGoals` | First 8 rows only; `D` column is forecast-like |
| `B78` | Arithmetic | Liability math on Analysis (C-16) |
| `B154` | `IFERROR(B127/B45,0)` | Emergency placeholder (C-15) |
| `AA1:AA6` | `DATE` helpers | `AA3` `#NUM!` when `B1` month is 0-adjacent (C-17) |

T009 recommended freeze: **inventory only**. Do not rewrite these in T009.

---

## 6. Regression Test Plan

Official evaluation remains Excel Desktop (QA-001). Do not use Excel Web linked QA as the gate. Do not save production via the unlicensed COM session (PROD-001).

For every scenario:

- **Expected unchanged outputs** always include: Helpers `E2:K2`; Transactions table; `B4:B31`; `B34:B39`; `B41:B46`; `B48:B50`; `B53:B58`; `B61:B68`; `B70:B75`; Account matrix `D:L` (except `I` remains `#N/A`); Dashboard (0 formulas); Insights (0 formulas); QA and version workbooks.
- **Expected Analysis leftover Sections 1–9** stay byte-identical under recommended C-4 (they may still **calculate** wrong vs T005; that is a residual, not a T009 fail).
- **Expected Analysis Section 10** is listed only for dimensions that survive the PASS gate.

As-Of Date in setups below is a real month date on `B1` (not serial `13`) unless the scenario is Empty workbook.

### R-01 Positive savings month

- **Setup:** Income 100000 Completed; Expense 60000 Completed (no Asset destination); same month as `B1`.
- **Expected BE:** `B16=100000`; `B22=60000`; `B29=40000`; `B30=0.40`; `B66=0` if no EMI.
- **Expected Analysis:** Savings Health Excellent (DOC-008); Cash Flow Health not Critical; Expense Health depends on C-29 (0.60 ratio).
- **Expected unchanged:** all T005–T008 cells’ formulas; Dashboard.

### R-02 Negative savings month

- **Setup:** Income 50000; Expense 80000; both Completed.
- **Expected BE:** `B29=-30000`; `B30=-0.60`.
- **Expected Analysis:** Savings Health Critical; Cash Flow Health Critical.
- **Expected unchanged:** `B48` only moves if cash/assets/liabilities change; goal/asset/liability engines unchanged unless those entities were edited.

### R-03 Zero income month

- **Setup:** No income; Expense 10000 Completed.
- **Expected BE:** `B16=0`; `B22=10000`; `B29=-10000`; `B30=0` (today’s `IFERROR`); `B66=0` even if EMI exists.
- **Expected Analysis:** Savings Health **Unavailable** (C-3/4.1 freeze), not Weak. Cash Flow Critical. Debt Health must not treat `B66=0` as Excellent if `B45>0`.
- **Expected unchanged:** BE `IFERROR` behavior on `B30`/`B66` (Analysis must guard; do not “fix” BE).

### R-04 Goal-heavy month

- **Setup:** Income 100000; Expense 90000 of which 80000 Destination Type Goal Completed; T006 adapter matches Goal ID.
- **Expected BE:** `B22=90000`; `B29=10000`; `B30=0.10`; `tblGoals` Current Saved += 80000; `B54`/`B58` rise; `B48` unchanged (goal cash still in accounts).
- **Expected Analysis:** Savings Health Weak (10%); Goal Health improves; do not add 80000 as extra savings.
- **Expected unchanged:** T006 Current Saved formula; `B53:B58` formula text.

### R-05 Liability-heavy month

- **Setup:** Active liability EMI 40000; Income 80000; no other expenses; Outstanding 500000.
- **Expected BE:** `B43=40000` (monthly frequency); `B66=0.50`; `B42=500000`; `B16=80000`.
- **Expected Analysis:** Debt Health Critical under proposed 50% band (if approved). Cash Flow uses `B22` (EMI is **not** auto-expensed unless a transaction exists).
- **Expected unchanged:** `B41:B46` formulas; outstanding still user-typed.

### R-06 Asset purchase month

- **Setup:** Expense 200000 Destination Type Asset Completed; Income 200000; user also reduces cash via that expense (Account Engine). Current Value on `tblAssets` updated by user to 200000.
- **Expected BE:** `B22=0` (T005.2); `B29=200000`; `B30=1`; `B39` += 200000; `B35` += 200000 if Active; `B4` falls by 200000; `B48` unchanged if CV equals cash spent.
- **Expected Analysis:** Expense Health uses `B22=0` (not 200000). Savings Health Excellent on cash-flow identity. Asset Health uses `B35`/`B70:B75`, not `B39`.
- **Expected unchanged:** T005.2 formulas; `B39`; appreciation columns.

### R-07 Transfer-only month

- **Setup:** Transfer 50000 Completed between two Active dashboard accounts; no income/expense.
- **Expected BE:** `B16=0`; `B22=0`; `B29=0`; `B30=0`; `B4` unchanged in total; `B48` unchanged; `B46` unchanged.
- **Expected Analysis:** Savings/Expense/Cash Flow **Unavailable** (recommended), not Excellent/Weak-at-0%.
- **Expected unchanged:** Transfer exclusion on cash totals.

### R-08 Credit-card month

- **Setup:** Expense 15000 from Credit Card account Completed (not Destination Type Asset); later Transfer 15000 to Destination Type Liability Completed (card payment).
- **Expected BE:** `B22=15000` (purchase only); payment **not** in `B22`; `B46` includes the 15000 payment; `B4` credit-card line follows Account Engine (T005).
- **Expected Analysis:** Expense Health sees 15000 once. Debt Health unchanged unless `B42`/`B43` user values change. Do not add `B46` to expenses.
- **Expected unchanged:** T005 transfer rules; T007 `B46` two-`SUMIFS`.

### R-09 Mixed Completed / Reconciled month

- **Setup:** Income 40000 Completed + 10000 Reconciled; Expense 20000 Completed + 5000 Reconciled.
- **Expected BE:** `B16=50000`; `B22=25000`; `B29=25000`; `B30=0.50`.
- **Expected Analysis:** Same as one 50000 / 25000 month. Reconciled ≡ Completed.
- **Expected unchanged:** T005 status pairing.

### R-10 Pending / Cancelled month

- **Setup:** Income 999999 Pending; Expense 888888 Cancelled; plus a real Completed income 1000.
- **Expected BE:** `B16=1000`; `B22=0`; Pending/Cancelled ignored.
- **Expected Analysis:** Health uses 1000 / 0, not the pending/cancelled amounts. Leftover AE `C6`/`C14` may still include them (C-14 residual — not a T009 Section 10 fail).
- **Expected unchanged:** T005 ignore rules.

### R-11 Empty workbook

- **Setup:** Production as inspected (`B1=13`, all engine totals 0, no table rows).
- **Expected BE:** zeros; `B30=0`; `B49=0`; `B66=0`; `B67`/`B68` `IFERROR` 0; `I2:I200` `#N/A`.
- **Expected Analysis:** All implemented dimensions `Unavailable`. Do not emit Excellent because every ratio is 0. Leftover AE `AA3` may stay `#NUM!` (C-17).
- **Expected unchanged:** entire T005–T008 formula text; Helpers spills.

### R-12 High-volume workbook

- **Setup:** ≥1,000 transactions across months; ≥20 goals/assets/liabilities. Section 10 still only reads ~15 BE scalars.
- **Expected BE:** existing `SUMIFS` performance unchanged.
- **Expected Analysis:** Section 10 remains scalar (`LET`/`IF`); no new per-row Analysis formulas; no `FILTER` spills.
- **Expected unchanged:** no new whole-column refs; Account matrix still 199 rows.

### R-13 Extreme values

- **Setup:** Income 1e12; Expense 1; EMI ratio &gt; 2; Net Worth −1e12; Savings Rate 0.99; one asset 100% of `B35`.
- **Setup (div zero):** Purchase Value 0 on assets (appreciation % already `IFERROR` on BE/entity).
- **Expected BE:** no `#DIV/0!` on frozen `IFERROR` cells; negative savings and NW allowed.
- **Expected Analysis:** top/bottom bands absorb extremes; no overflow tricks; no `RANDBETWEEN`.
- **Expected unchanged:** BE `IFERROR` wrappers.

### Additional mandatory checks (not user-listed but required)

| ID | Purpose |
| --- | --- |
| R-14 | SHA-256 of Business Engine sheet XML, Helpers, Transactions, Dashboard, Insights, QA, versions unchanged. |
| R-15 | Helpers `E2:K2` FILTER/SORT/UNIQUE still present after T009 package write. |
| R-16 | No new BE named ranges; only optional `analysis*` names. |
| R-17 | Analysis sheet remains hidden + protected; no unlocked input cells. |
| R-18 | No circular reference (BE must not gain Analysis refs). |
| R-19 | Credit-card + asset-purchase + goal contribution in one month: T005.2, T006, T007, T008 simultaneously respected. |

---

## 7. Risks & Compatibility

| Risk | Platform / topic | Mitigation |
| --- | --- | --- |
| Excel Desktop COM save strips Helpers | Desktop / PROD-001 | XML patch or licensed Desktop only; never COM `Save` on this PC; R-15 |
| Excel Web linked QA is 0.00 | Web / QA-001 | Do not use Validation v7 Web links as T009 gate |
| Mobile CF partial | Mobile | T009 adds **no** Analysis conditional formatting; severity is a cell value |
| Dynamic arrays | All | Section 10 uses no spills; do not copy Helpers `FILTER` pattern onto Analysis |
| Performance | Desktop/Web/Mobile | Scalar `LET`/`IF` only; forbid new table scans; leftover 65 `SUMIFS` already exist (do not add more) |
| Circular references | All | Section 10 → BE only; BE stays unaware of Analysis |
| Volatile formulas | All | No `TODAY`/`NOW`/`RAND`/`OFFSET`/`INDIRECT` |
| Named ranges | All | `analysis*` → Analysis cells; do not retarget `rng*`/`val*`/`out*` |
| Existing engines | RC1 freeze | Byte-identical BE/Goals/Assets/Liabilities/Accounts/Transactions |
| Existing AE leftovers disagree with T005 | All | C-4: do not feed them into health; document residual |
| `LET` older Excel | Out of support | DOC-018 already requires `LET`; Version 1 does not support pre-dynamic Excel |
| `B1=13` `#NUM!` on `AA3` | All | Health independent of `AA3`; do not “fix” `B1` in T009 |
| Composite score politics | Product | Defer `analysisHealthScore` (C-9) |
| Promoting placeholders | Product | Never treat `B49` or `B154` as official |
| PROD-001 + `workbook.xml` name add | Desktop | Adding names without COM save is safe; opening in broken Excel to “check” is not |

---

## 8. PASS Checklist

Implementation **cannot begin** until every box is explicitly satisfied by the user (or marked Deferred with an ID).

### Gate A — Scope

- [ ] C-1 accepted: T009 = historical health interpretation only; forecast/runway/purchase/scenario deferred.
- [ ] C-4 accepted: Section 10 add-only **or** alternate rewrite re-approved with a new impact list.
- [ ] C-22 accepted: integrate existing hidden Analysis Engine; no new worksheet.

### Gate B — Dimensions

- [ ] C-2 accepted: Emergency Fund Health kept, aliased, or formally dropped **in documentation first**.
- [ ] C-9 accepted: composite `analysisHealthScore` deferred **or** weights documented and frozen.
- [ ] C-29 Expense Health bands approved or Expense Health deferred.
- [ ] C-30 Net Worth Health bands approved or Net Worth Health deferred.
- [ ] C-15 / C-31 / C-5 Liquidity / Emergency: official numerator + denominator + BE owner **or** dimension deferred.
- [ ] C-10 Debt / Asset / Goal / Cash Flow numeric bands approved or those dimensions limited to the DOC-008 surplus-sign rule only.
- [ ] C-28 band ↔ 0–100 ↔ severity maps approved.

### Gate C — Ownership

- [ ] C-3 / C-7: numeric Savings Rate remains `B30`; Analysis owns the band only.
- [ ] C-6: new formulas read Business Engine cells / `out*` only.
- [ ] C-8: no new forecast; `D98:D105` unused.
- [ ] C-16: `B78` unused.
- [ ] C-20 / C-21 / C-19: goal, asset-purchase, and credit-card identity accepted.
- [ ] C-24: Cash Flow Health without commitment burden accepted.
- [ ] C-26: no new `out*` names on Business Engine.
- [ ] C-27: no narrative text in T009.
- [ ] C-32: thresholds live in approved Section 4 / `LET` constants, not Helpers.

### Gate D — Workbook hygiene

- [ ] Confirm production SHA still `DE4B6AC58F05372065642F85FF462515DECF9D92FB4765C7CE63C927200B7B1F` (or record a new hash if T008 is superseded before T009).
- [ ] T005–T008 formulas remain byte-identical after T009.
- [ ] Helpers, Dashboard, Insights, QA, version workbooks untouched.
- [ ] PROD-001 workaround acknowledged (C-18).
- [ ] C-11 `analysis*` names approved or deferred (cells can exist without names).
- [ ] Protection remains: hidden Analysis Engine, all new cells locked, no user inputs.
- [ ] Section 10 cell map (exact addresses) approved.

### Gate E — Tests

- [ ] Regression R-01–R-19 accepted as the T009 suite.
- [ ] Empty-workbook `Unavailable` (not fake zeros) accepted.
- [ ] Zero-income guards accepted (`B30=0` and `B66=0` are BE artifacts, not health truth).

### Gate F — Documentation-first

- [ ] User has approved this architecture review.
- [ ] Any DOC-008 / DOC-011 / DOC-016 amendments required by C-2 / C-9 / C-29 / C-30 are written and frozen **before** formulas.
- [ ] Grill Before Build approval question answered with an explicit implement word.

**If any Gate B dimension is Deferred, T009 may still implement only the unblocked dimensions (Savings Health is the only dimension whose **bands** are already frozen in DOC-008). All other dimensions default to Deferred.**

---

## Stop

This is the T009 Architecture Review. No workbook formulas were written. No files in `workbook/` were saved. No git commit was created.

Implementation waits on the PASS Checklist.

---

**End of T009 Architecture Review (Planning Only)**

---

# T009.1 — Architecture Freeze (RC1)

**Status:** Frozen for implementation gating.  
**Workbook bytes changed:** No  
**Excel opened:** No  
**Commits:** No  

T009.1 conflict IDs below are the **RC1 freeze IDs**. They supersede same-numbered IDs from the T009 planning review.

Shared interpretation system (all eight dimensions):

| Band | Score | Severity |
| --- | --- | --- |
| Unavailable | blank | blank |
| Critical | 0 | Red |
| Weak | 25 | Orange |
| Moderate | 50 | Yellow |
| Strong or Healthy | 75 | Green |
| Excellent | 100 | Green |

Interval rule: lower bound inclusive, upper bound exclusive, except a dimension’s top band which is inclusive of its floor. `B30` and `B66` are ratios, not percentage points.

---

## Frozen Decisions (T009.1)

### C-2 — Eight Financial Health Dimensions

RC1 Analysis Engine interprets exactly these eight dimensions. No composite `analysisHealthScore` in T009.

Official Emergency Fund Coverage (Emergency Fund ÷ essential expenses) remains **out of RC1**. Liquidity Health is the RC1 cash-coverage interpretation (see that dimension). DOC-008 Emergency Fund Health is not a ninth RC1 dimension.

#### 1. Savings Health

| Field | Freeze |
| --- | --- |
| Definition | Quality of the current-month cash-flow savings rate. |
| BE inputs | `B30` Savings Rate; `B16` Total Monthly Income (zero-income guard only). |
| Time basis | Period (As-Of month). |
| Bands | `B16 = 0` → Unavailable. Else `B30 < 0` Critical; `[0, 0.10)` Weak; `[0.10, 0.20)` Moderate; `[0.20, 0.30)` Strong; `≥ 0.30` Excellent. |
| Unavailable | `B16 = 0`. |
| Notes | Uses T005.2 savings (`B29/B28`). Goal contributions stay inside expenses. |

#### 2. Expense Health

| Field | Freeze |
| --- | --- |
| Definition | Current-month spending pressure vs income after T005.2. |
| BE inputs | `B22` Current Month Expenses; `B16` income. |
| Time basis | Period (As-Of month). |
| Bands | `B16 = 0` and `B22 = 0` → Unavailable. `B16 = 0` and `B22 > 0` → Critical. Else ratio `B22/B16`: `< 0.50` Excellent; `[0.50, 0.70)` Strong; `[0.70, 0.85)` Moderate; `[0.85, 1.00)` Weak; `≥ 1.00` Critical. |
| Unavailable | No income and no T005.2 expense. |

#### 3. Debt Health

| Field | Freeze |
| --- | --- |
| Definition | Current EMI burden vs current-month income. |
| BE inputs | `B66` EMI Ratio; `B16` (guard); `B45` Active Liability Count; `B42` (zero-debt guard). |
| Time basis | Snapshot obligation (`B43`/`B42`) measured against period income (`B16`). |
| Bands | `B45 = 0` and `B42 = 0` → Excellent. `B45 > 0` and `B16 = 0` → Critical. Else `B66`: `< 0.15` Excellent; `[0.15, 0.25)` Strong; `[0.25, 0.35)` Moderate; `[0.35, 0.50)` Weak; `≥ 0.50` Critical. |
| Unavailable | Never, once the guards above apply. Empty book with no liabilities is Excellent (no debt), not Unavailable. |
| Notes | Do not use AE `B78`. Do not use `B68` here (`B68` belongs to Net Worth Health). No outstanding-debt trend in RC1. |

#### 4. Asset Health

| Field | Freeze |
| --- | --- |
| Definition | Active-portfolio diversification only. Not performance. |
| BE inputs | `B35` Total Current Value; `B70:B75` category totals; `B38` Active Asset Count. |
| Time basis | Snapshot. |
| Metric | Concentration = largest of `B70:B75` ÷ `B35`. |
| Bands | `B38 = 0` or `B35 = 0` → Unavailable. Else concentration `≤ 0.40` Excellent; `≤ 0.60` Strong; `≤ 0.80` Moderate; `≤ 0.95` Weak; `> 0.95` Critical. |
| Unavailable | No Active assets or zero Active current value. |
| Notes | Do not classify `B36` / `B37`. Sold assets are excluded by T008. |

#### 5. Goal Health

| Field | Freeze |
| --- | --- |
| Definition | Aggregate progress of Active + Completed goals. |
| BE inputs | `B58` Goal Completion %; `B56` Active Goal Count; `B57` Completed Goal Count. |
| Time basis | Snapshot (lifetime saved vs target). |
| Bands | `B56 + B57 = 0` → Unavailable. Else `B58 ≥ 0.80` Excellent; `≥ 0.50` Strong; `≥ 0.25` Moderate; `> 0` Weak; `= 0` Critical. |
| Unavailable | No Active and no Completed goals. |
| Notes | Do not use AE `D98:D105` or `B107`. |

#### 6. Liquidity Health

| Field | Freeze |
| --- | --- |
| Definition | RC1 months of **cash-class account** coverage vs current-month T005.2 expenses. This is **not** DOC-008 Emergency Fund Coverage. |
| BE inputs | `B6` Cash Accounts Total; `B7` Savings Accounts Total; `B22` Current Month Expenses. |
| Time basis | Snapshot cash (`B6+B7`) vs period expenses (`B22`). |
| Metric | Liquidity months = `(B6 + B7) / B22` when `B22 > 0`. |
| Bands | `B22 = 0` and `(B6+B7) = 0` → Unavailable. `B22 = 0` and `(B6+B7) > 0` → Excellent. Else months: `[0, 1)` Critical; `[1, 3)` Weak; `[3, 6)` Moderate; `[6, 12]` Healthy; `> 12` Excellent. |
| Unavailable | No cash-class balances and no T005.2 expense. |
| Notes | Excludes `B8` Investment, `B9` Credit, `B49`, `B74`, `B154`. Wallet / Current Bank have no official B-cell; they are out of RC1 Liquidity. |

#### 7. Net Worth Health

| Field | Freeze |
| --- | --- |
| Definition | Interpretation of the frozen Net Worth number and its leverage. Does **not** change `B48`. |
| BE inputs | `B48` Net Worth; `B68` Debt Ratio; `B4`, `B35`, `B42` (empty-position guard only). |
| Time basis | Snapshot. |
| Bands | `B4 = 0` and `B35 = 0` and `B42 = 0` → Unavailable. `B48 < 0` → Critical. `B48 = 0` → Weak. `B48 > 0` and `B68 ≥ 0.70` → Weak; `B68 ≥ 0.40` → Moderate; `B68 ≥ 0.20` → Strong; `B68 < 0.20` → Excellent. |
| Unavailable | No dashboard cash, no Active assets, no Active liabilities. |
| Notes | `B48` remains `B4 + B35 − B42`. |

#### 8. Cash Flow Health

| Field | Freeze |
| --- | --- |
| Definition | Sign of current-month surplus after T005.2. |
| BE inputs | `B29` Current Month Savings; `B16`; `B22`. |
| Time basis | Period (As-Of month). |
| Bands | `B16 = 0` and `B22 = 0` → Unavailable. `B29 < 0` → Critical. `B29 = 0` → Weak. `B29 > 0` → Strong. |
| Unavailable | Transfer-only or empty cash-flow month. |
| Notes | No multi-month stability. No commitment burden. Excellent is unused. |

---

### C-6 — Depreciation Total

**Freeze: Signed Appreciation Total only.**

- Official RC1 output: `B36` Total Appreciation Amount (sum of Active `tblAssets[Appreciation Amount]`).
- Negative `B36` means net depreciation. There is **no** separate Depreciation Total cell in RC1.
- DOC-010 “Depreciation Total” is deferred.
- Asset Health does not use `B36`.

### C-8 — Asset Status Vocabulary

**Freeze: Active and Sold only.**

Closed and Archived are **not** asset statuses in RC1. Permanently. Do not add them later inside T009.

### C-9 — Asset Category Outputs

**Freeze: Category totals only.**

Official RC1 outputs: `B70:B75` (Investment, Physical Asset, Property, Retirement Asset, Cash Equivalent, Other Asset).

Gold / Mutual Fund / Stock are Asset **Types**, not RC1 official engine outputs. Leftover Analysis Engine type rows are not T009 inputs. Do not add both.

### C-10 — Total Assets Meaning

| Official RC1 name | Cell | Meaning |
| --- | --- | --- |
| **Total Asset Value** | `B35` | Sum of Active Current Value. |
| **Active Asset Count** | `B38` | Count of Status = Active. |
| Total Purchase Value | `B34` | Active purchase-value sum. Not “Total Assets”. |
| Asset Purchase Total | `B39` | Lifetime Completed/Reconciled Expense + Destination Type Asset. Not “Total Assets”. |

### C-11 — Liquid Assets

**Freeze: Deferred.**

`B49` Liquid Net Worth stays the hardcoded `0` placeholder. T009 must not invent a liquid-asset formula, must not use `B49`, and must not treat Cash Equivalent (`B74`) as Liquid Assets.

Liquidity Health (C-2) uses `B6 + B7` only. That is not a Liquid Assets engine.

### C-15 — Asset Sale Model

**Freeze: Status-only. No sale engine.**

- User sets Status = Sold. Row remains on `tblAssets`.
- Sold is excluded from `B34:B38`, `B36`, `B37`, `B70:B75`.
- No auto cash-in, no disposal transaction, no Closed/Archived path.
- Current Value and Purchase Value stay user-maintained.
- `B39` is lifetime purchases and is not reversed on Sold.

### C-17 — Net Worth Health

**Freeze: Interpretation only.** See C-2 dimension 7.

Do not modify `B48`, `B49`, or `B50`.

### C-20 — Lifetime vs As-Of Date

| Dimension | Basis |
| --- | --- |
| Savings Health | Period (As-Of month) |
| Expense Health | Period (As-Of month) |
| Debt Health | Snapshot EMI / debt vs period income |
| Asset Health | Snapshot |
| Goal Health | Snapshot (lifetime saved / target) |
| Liquidity Health | Snapshot cash vs period expenses |
| Net Worth Health | Snapshot |
| Cash Flow Health | Period (As-Of month) |

`B39` and `B46` are lifetime engine totals. They are **not** Analysis Health inputs.

### C-21 — Negative Current Value

**Freeze: Validation rejects; engine does not clamp; Analysis does not repair.**

T008: Current Value must be `>= 0`. No `MAX(0,)` on `tblAssets` or `B35`. If invalid data bypasses validation, `B35` includes it. Analysis does not special-case negative Current Value.

### C-23 — Per-Asset Matrix

**Freeze: Deferred.** Not RC1. No Analysis per-asset matrix. Portfolio-level Section 10 only. T008 ID-first adapter remains the rule if a later checkpoint adds per-asset attribution.

### Also carried forward (not relisted by T009.1)

| Decision | Freeze |
| --- | --- |
| Forecast / runway / purchase / scenario | Out of T009 (original T009 C-1) |
| Existing AE `A1:AA154` | Byte-identical; add Section 10 only (original T009 C-4) |
| Composite health score | Deferred |
| New formulas | BE cells / existing `out*` only; `LET`+`IF`+`IFERROR`; no new ledger `SUMIFS` |
| Helpers / Dashboard / Insights / QA / versions / T005–T008 | Untouched |

---

**End of T009.1 Architecture Freeze**

---

# T009.1.1 — Architecture Amendments (RC1)

**Status:** Frozen. Supersedes the named T009.1 rows only.  
**Workbook bytes changed:** No  
**Excel opened:** No  
**Commits:** No  

Live Business Engine `B4` label is **Total Active Account Balance**. T009.1.1 consumes that cell as the RC1 cash numerator. T009 does not rename `B4`.

Empty financial profile (C-2B) is true only when all of these are zero: `B4`, `B16`, `B22`, `B35`, `B38`, `B42`, `B45`, `B56`, `B57`.

Non-cash-equivalent asset value (C-9A) = `B70 + B71 + B72 + B73 + B75` (= `B35 − B74`).

Cash Flow overlap at zero surplus (C-2C): Weak owns `B29 = 0`. Moderate is `(0, 0.10)` of Surplus Ratio, not `[0, 0.10)`.

---

## C-2A — Liquidity Health (replaces T009.1 dimension 6)

| Field | Freeze |
| --- | --- |
| Definition | RC1 months of coverage using Business Engine `B4` vs current-month T005.2 expenses. Not DOC-008 Emergency Fund Coverage. |
| BE inputs | `B4` Total Active Account Balance; `B22` Current Month Expenses. |
| Metric | Liquidity Months = `B4 / B22` when `B22 > 0`. |
| Bands | `B22 = 0` and `B4 = 0` → Unavailable. `B22 = 0` and `B4 > 0` → Excellent. Else months: `[0, 1)` Critical; `[1, 3)` Weak; `[3, 6)` Moderate; `[6, 12]` Healthy; `> 12` Excellent. |
| Unavailable | `B4 = 0` and `B22 = 0`. |
| Forbidden | Rebuild from `B6+B7`. Use `B8`, `B9`, `B49`, `B74`, `B154`, or any asset category total. |

## C-2B — Debt Health empty-profile guard (replaces T009.1 dimension 3 empty-book rule)

| Guard | Condition | Band |
| --- | --- | --- |
| Empty financial profile | `B4=B16=B22=B35=B38=B42=B45=B56=B57=0` | **Unavailable** |
| Initialized, zero liabilities | Not empty, and `B45=0` and `B42=0` | **Excellent** |
| Active liabilities, zero income | `B45 > 0` and `B16 = 0` | **Critical** |
| Active liabilities, has income | Else classify `B66` with T009.1 EMI bands | Unchanged |

A brand-new workbook is Unavailable for Debt Health. It is not Excellent.

## C-2C — Cash Flow Health bands (replaces T009.1 dimension 8)

| Field | Freeze |
| --- | --- |
| Inputs | `B29`, `B16`; `B22` only for the Unavailable guard. |
| Surplus Ratio | `B29 / B16` when `B16 > 0`. |
| Unavailable | `B16 = 0` and `B22 = 0`. |
| Critical | `B29 < 0`. |
| Weak | `B29 = 0` and not Unavailable. |
| Moderate | Surplus Ratio `(0, 0.10)`. |
| Strong | Surplus Ratio `[0.10, 0.25)`. |
| Excellent | Surplus Ratio `≥ 0.25`. |
| Notes | No commitment burden. No forecasting. `B16 = 0` and `B22 > 0` is Critical (negative surplus), not Unavailable. |

## C-9A — Asset diversification (amends T009.1 dimension 4)

| Field | Freeze |
| --- | --- |
| Compared categories | `B70` Investment; `B71` Physical Asset; `B72` Property; `B73` Retirement Asset; `B75` Other Asset. |
| Excluded | `B74` Cash Equivalent. Liquidity Health measures cash. |
| Concentration | Largest of `{B70,B71,B72,B73,B75}` ÷ `(B35 − B74)`. |
| Unavailable | `B38 = 0`, or `(B35 − B74) = 0` (no non-cash-equivalent Active value). |
| Bands | Unchanged: `≤ 0.40` Excellent; `≤ 0.60` Strong; `≤ 0.80` Moderate; `≤ 0.95` Weak; `> 0.95` Critical. |

Cash Equivalent-only portfolios are Unavailable for Asset Health.

---

**End of T009.1.1 Architecture Amendments**
