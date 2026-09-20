# FinanceOS QA Report — BUG-003 + QA-001

**Workbook:** `workbook/testing/FinanceOS_QA_Validation_v1.xlsx`  
**Engine under test (links):** `workbook/testing/FinanceOS_v1.0-QA-BUG003I.xlsx`  
**Production:** not modified  
**Git:** no commit / no push  
**Generated:** 19 September 2026  
**QA workbook version:** QA-001.1 (freeze candidate)

---

## 1. What this QA workbook is

A companion regression workbook. It does not copy the FinanceOS engine.

| Sheet | Role |
| --- | --- |
| QA Dashboard | PASS/FAIL rollup, scenario selector, compatibility checklist, timestamp |
| Test Scenarios | SCN-BASE through SCN-P (A–J plus BUG-003 K–P) |
| Before Snapshot | Paste-values capture (no VBA) |
| After Snapshot | Live mirror of Actual Results |
| Expected Results | Before + scenario delta (dates use MAX / UNCHANGED / SET) |
| Actual Results | Live links into `[FinanceOS_v1.0-QA-BUG003I.xlsx]Business Engine` |
| Comparison Engine | Expected vs Actual, Difference, PASS / FAIL / WAIT |

**95 metrics** covering Accounts (per-account D–L plus totals), Income, Expense, Savings, Assets, Liabilities, Net Worth, Goals, Financial Health, As-Of Date.

Without VBA, Before cannot auto-write itself. Workflow is on the Dashboard: paste Actual column E as values into Before column D, run the scenario on the engine, then Comparison turns WAIT into PASS or FAIL.

---

## 2. How to execute

1. Keep both xlsx files in `workbook/testing/`.
2. Open **engine first**, then the QA workbook.
3. Enable external links if Excel prompts.
4. Confirm Actual Results show numbers (not `#REF!`).
5. Copy Actual Results column E → Paste Values on Before Snapshot column D.
6. Set **Active Scenario** on the Dashboard.
7. Enter that scenario on the engine (do not click Excel Web **Update Workbook**).
8. Return to QA. Mark **Executed? = Yes** on Test Scenarios.

Overall status:

- **WAIT** — Before not captured or engine links not live  
- **PASS** — all captured metrics within 0.005  
- **FAIL** — any metric outside tolerance (row is red on Comparison Engine)

---

## 3. Validations catalog

### 3.1 Accounts Summary

| Metric ID | Engine cell | Independent expected |
| --- | --- | --- |
| ACC_*_NAME / OPEN / IN / OUT / BAL / LAST / TYPE / DASH / STAT | D2:L6 | Per-account deltas from scenario params |
| ACC_TOTAL_BAL | B4 | Active + Dashboard Yes only |
| ACC_ACTIVE_N | B5 | Count Active + Dashboard Yes |
| ACC_CASH / SAVINGS / INVEST / CREDIT | B6:B9 | Type totals, same filters |

### 3.2 Income Summary

B12–B19: Salary, Business, Freelance, Investment, Monthly Total, Other, Annual, Active Source Count.

### 3.3 Expense Summary

B22–B25: Current month, previous month, YTD, expense count.

### 3.4 Savings Summary

B28–B31: Monthly income, savings, rate, average monthly savings.

### 3.5 Asset Summary

B34–B38: Purchase, current, appreciation amount/%, active count.

### 3.6 Liability Summary

B41–B45: Original, outstanding, EMI, weighted interest, active count.

### 3.7 Net Worth

B48–B50: Net worth, liquid (engine currently 0), invested.

### 3.8 Goal Summary

B53–B58: Target, saved, remaining, active, completed, completion %.

### 3.9 Monthly Financial Health

B61–B68: Income, expenses, savings, rate, net worth, EMI ratio, asset allocation, debt ratio.

### 3.10 Scenarios A–J

| ID | Test | Expected (summary) |
| --- | --- | --- |
| SCN-BASE | Baseline | Actual = Before |
| SCN-A | Completed salary +3000 HDFC | Money In/Balance/Monthly Salary/Income/Savings +3000; last date = txn date |
| SCN-B | Completed expense +2500 HDFC | Money Out +2500; balance −2500; month expenses +2500; savings −2500 |
| SCN-C | Pending expense | **No change** |
| SCN-D | Cancelled expense | **No change** |
| SCN-E | Transfer HDFC → SBI 1000 | Sender −1000; receiver +1000; **total active balance unchanged** |
| SCN-F | Transfer SBI → HDFC 1000 | Same integrity reversed |
| SCN-G | Future-dated completed income | Balance/last date update; monthly income unchanged if month ≠ As-Of |
| SCN-H | Older date below newer row | Last date **stays newer**; not last worksheet row |
| SCN-I | HDFC Include in Dashboard = No | Totals exclude HDFC; row still calculates |
| SCN-J | Completed txn on Closed Old SBI | Matrix updates; dashboard totals unchanged |

### 3.11 BUG-003 regression

| ID | Test | Expected |
| --- | --- | --- |
| SCN-K | 30-Nov-2026 **above** 01-Jan-2026 | Last date = **30-Nov-2026** |
| SCN-L | Pending newer than completed | Last date unchanged |
| SCN-M | Cancelled newer than completed | Last date unchanged |
| SCN-N | Reconciled newer than completed | Last date = reconciled date |
| SCN-O | Incoming transfer | Transfer date counts for receiver |
| SCN-P | Outgoing transfer | Transfer date counts for sender |

### 3.12 Compatibility (manual dropdowns)

Excel Desktop no repair; Excel Web no compatibility popup; protection; dropdowns; calculated-column autofill; formula count; named ranges.

---

## 4. PASS / FAIL table (this generation)

Live Expected vs Actual **cannot be executed in this session**: Business Engine cells have no cached `<v>`, and Excel Web / Desktop were not opened against the new companion.

| Gate | Result | Notes |
| --- | --- | --- |
| QA workbook created | **PASS** | `FinanceOS_QA_Validation_v1.xlsx` (7 sheets, 95 metrics, 17 scenarios) |
| Production untouched | **PASS** | |
| Git untouched | **PASS** | |
| Actuals are live engine refs | **PASS** | No hardcoded engine outputs |
| Auto Before snapshot without VBA | **N/A** | Paste-values by design |
| Live Comparison PASS/FAIL | **WAIT** | Open both files and capture Before |
| Failed cell references (live) | **None yet** | See Comparison Engine column G after a run |

### BUG-003 lineage (already executed manually)

| Artifact | Excel Web popup | Row-order last date | Promote? |
| --- | --- | --- | --- |
| Checkpoint `v1.0-checkpoint-engine-foundation` | PASS (no popup) | n/a (no MAXIFS engine) | Baseline |
| QA-BUG003C MAXIFS | FAIL (popup) | not used | No |
| QA-BUG003F static I2:I200 | PASS (no popup) | n/a (not live) | No — not a fix |
| QA-BUG003G AGGREGATE | FAIL (popup) | not accepted | No |
| QA-BUG003H LOOKUP | PASS (no popup) | **FAIL** (01-Jan-2026 vs 30-Sep-2026) | **No** |
| QA-BUG003I MAX(INDEX) | **WAIT** (Web + SCN-K/H) | designed order-independent | Pending your run |

---

## 5. Expected vs actual (live)

After you capture Before and run a scenario, read:

- Expected: `Expected Results!G`  
- Actual: `Actual Results!E` / `After Snapshot!D`  
- Difference: `Comparison Engine!F`  
- Result: `Comparison Engine!G`  

Filter G = FAIL for failed cell references (column D on that sheet is the engine cell via Actual Results).

Until then, Actual values are **external links** and will display 0 / `#REF!` / `#N/A` if the engine is closed.

---

## 6. Regression summary

1. Compatibility popup is **not** `workbook.xml` `extLst` (003C still popped; checkpoint with `extLst` did not).  
2. Trigger is **Business Engine column I live MAXIFS** (003F removed I formulas → popup gone).  
3. AGGREGATE replacement still pops (003G).  
4. LOOKUP(2,1/criteria) is Web-safe but **row-order wrong** (003H QA gate failed).  
5. **003I** is the remaining live-formula candidate: `MAX(INDEX(criteria*dates,0))`.  
6. Promote **nothing** to production until SCN-K (30-Nov-2026 above 01-Jan-2026) **and** Excel Web (no popup) both PASS on 003I using this companion.

---

## 7. Assumptions (explicit)

- Engine filename in Actual formulas is **QA-BUG003I**. Change links if you test 003C/H/G.  
- `NOW()` is used only for QA Execution Timestamp (not in FinanceOS production).  
- Pending/Cancelled expected as **zero delta**.  
- SCN-I expected totals subtract HDFC’s **Before** current balance.  
- Some type-total deltas (e.g. Savings Bank total) are simplified; Comparison still checks the live B6:B9 cells.  
- Liquid Net Worth is still engine `B49 = 0`.

---

## 8. QA-001.1 Enhancements

Paste-values Before Snapshot is **removed**. Regression is automatic when two engine copies are open.

### Dual-engine model (no VBA, no cell paste)

| File | Role |
| --- | --- |
| `FinanceOS_QA_Baseline.xlsx` | Frozen copy of the fixture. Never edit. Supplies **Before**. |
| `FinanceOS_v1.0-QA-BUG003I.xlsx` | Live candidate. Edit only here. Supplies **After**. |

Create the baseline once: copy 003I → `workbook/testing/FinanceOS_QA_Baseline.xlsx`. Open **baseline + live + QA**. SCN-BASE must be all PASS before any other scenario.

### New / replacement sheets

| Sheet | Upgrade |
| --- | --- |
| Difference Engine | Metric, Before, After, Difference, Expected Difference, PASS/FAIL + red/green CF |
| Cell Regression | Address, FORMULATEXT, Before, After, Changed?, Expected to Change?, PASS/FAIL |
| Test Scenarios | Guided checklist: preconditions, test data, steps, expected outputs, rollback |
| Coverage Matrix | Section, formula range, cell count, scenario IDs; STRESSED / BASELINE ONLY / UNCOVERED |
| Compatibility Gate | Desktop / Web / Mobile checklist; Overall PASS only if every item PASS |
| Formula Inventory | FORMULATEXT of 101 engine cells; family counts; **MAXIFS PRESENT** red gate |
| QA Dashboard | Version, BUG IDs, timestamp, PASS/FAIL/WAIT, **READY FOR PROMOTION** vs **DO NOT PROMOTE** |

Removed as primary workflow: Before Snapshot paste, After Snapshot, Expected Results, Comparison Engine.

### Automatic rules

- Difference ≠ Expected Difference → **FAIL**.
- Cell changed when it should not (e.g. B23 Previous Month Expenses on SCN-B) → **FAIL**.
- Cell did not change when it should (e.g. H2 on SCN-A) → **FAIL**.
- Any inventoried formula containing `MAXIFS` → Dashboard **DO NOT PROMOTE**.
- WAIT > 0 (baseline or live closed) → **DO NOT PROMOTE**.
- Compatibility Overall ≠ PASS → **DO NOT PROMOTE**.

### Coverage

Assets, Liabilities, and Goals are **BASELINE ONLY** (must not move in SCN-A–P). Every other Business Engine section is stressed by at least one change scenario. No UNCOVERED rows.

### Freeze criteria

Do not treat QA-001.1 as an Engineering Standard until:

1. You have created `FinanceOS_QA_Baseline.xlsx`.
2. SCN-BASE is all PASS.
3. SCN-K (30-Nov-2026 above 01-Jan-2026) PASS on 003I.
4. Compatibility Gate Excel Web “no popup” is PASS.
5. Formula Inventory MAXIFS gate is OK.
6. Dashboard shows **READY FOR PROMOTION**.

