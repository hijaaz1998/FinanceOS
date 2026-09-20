# FinanceOS — RC1 QA Validation Checkpoint

**Document:** QA-VALIDATION-RC1  
**Workbook:** `workbook/testing/FinanceOS_QA_Validation_v7.xlsx`  
**Version:** v7  
**Status:** **Frozen for RC1**  
**Date:** 20 September 2026  

This document freezes the RC1 QA validation checkpoint. It does not change product architecture, Business Engine formulas, or the production workbook.

---

## Official artifacts

| Role | Path | Notes |
| --- | --- | --- |
| Official QA validation workbook | `workbook/testing/FinanceOS_QA_Validation_v7.xlsx` | Frozen for RC1. Do not replace with v8/v9. |
| QA Baseline | `workbook/testing/FinanceOS_QA_Baseline.xlsx` | Do not edit. |
| QA-RC1 sample workbook | `workbook/testing/FinanceOS_v1.0-QA-RC1.xlsx` | Scenario workbook. Do not treat as production. |
| Production workbook | `workbook/FinanceOS_v1.0.xlsx` | Untouched. |
| RC1 frozen archive | `workbook/versions/FinanceOS_v1.0-RC1-FROZEN.xlsx` | Byte-identical production freeze. |
| Environment setup notes | `workbook/testing/QA_REPORT_RC1.md` | Original dataset / session notes. Official validation file is v7, not v1. |

Obsolete validation packages `FinanceOS_QA_Validation_v1.xlsx` and `FinanceOS_QA_Validation_v6.xlsx` live in `workbook/testing/archive/`.

---

## Frozen RC1 results (Excel Desktop)

| Metric | Result |
| --- | --- |
| Validation workbook version | **v7** |
| Status | **Frozen for RC1** |
| PASS Count | **95** |
| FAIL Count | **0** |
| WAIT Count | **0** |
| MAXIFS Gate | **OK** |
| Regression Status | **PASS** |

Difference Engine SCN-BASE on Excel Desktop:

- B2 = 768866 (Baseline Business Engine B4)
- C2 = 768866 (QA-RC1 Business Engine B4)
- All 95 metrics PASS

v7 opens without the green “Workbook repaired” banner.

---

## Platform behavior

| Platform | External workbook links | Notes |
| --- | --- | --- |
| Excel Desktop | Resolves correctly | Official RC1 regression surface. |
| Excel Web | Returns cached `0.00` | URL-based / OneDrive `https://d.docs.live.net/...` references do not evaluate. Tracked as **QA-001**. |

Excel Web is **not** the RC1 sign-off platform for the linked Difference Engine.

Workaround: run the three-file regression set in Excel Desktop. See `docs/testing/KNOWN_ISSUES.md`.

---

## How to run RC1 regression

1. Keep Baseline, QA-RC1, and Validation v7 in `workbook/testing/`.
2. Open all three in **Excel Desktop**.
3. Enable / trust workbook links if prompted.
4. Confirm Difference Engine: PASS = 95, FAIL = 0, WAIT = 0.
5. Do not author a new validation workbook for this issue.

Excel Web three-tab Trust is insufficient for v7 while QA-001 is open.

---

## Out of scope for this freeze

- Creating Validation v8 / v9.
- Changing Business Engine or Analysis Engine formulas.
- Modifying `FinanceOS_v1.0.xlsx`, `FinanceOS_v1.0-QA-RC1.xlsx`, or `FinanceOS_QA_Baseline.xlsx`.
- Git commit or history rewrite.

---

## Related documents

- `docs/testing/KNOWN_ISSUES.md` — QA-001 Excel Web links.
- `docs/22_Testing_QA_Checklists.md` — product QA framework (frozen).
- `workbook/testing/QA_REPORT_RC1.md` — original RC1 environment report.
