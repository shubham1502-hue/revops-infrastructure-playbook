# Monthly CRM Hygiene Audit Checklist

**Month:** [Month, Year]
**Auditor:** [Name]
**Date:** [Date]

---

## Lead Quality Checks

- [ ] All leads created this month have a `Lead Source` assigned
- [ ] All leads have an assigned rep
- [ ] No leads older than 7 days remain in `New Lead` without a first contact log
- [ ] Duplicate leads identified and merged or flagged
- [ ] Disqualified leads have a `Lost Reason` filled

---

## Deal Quality Checks

- [ ] All active deals have a `Closing Date` set within 90 days
- [ ] All deals at `Proposal Sent` have a non-zero `Proposal Amount`
- [ ] All deals at `Proposal Sent` have `Locked_Proposal_Amount` populated (audit Deluge trigger)
- [ ] No deal has been in the same stage for > 14 days without a logged activity
- [ ] All `Closed Won` deals have a `Books_Invoice_ID` written back

---

## Data Completeness Checks

- [ ] All accounts have a `Region` assigned
- [ ] All contacts have a verified `Email` and `Phone`
- [ ] Stage Change Log is populated for all deals that moved stages this month
- [ ] `Handoff_Status` is `Completed` for all `Closed Won` deals

---

## Reporting Integrity

- [ ] Weekly CEO dashboard figures match SQL query 05 output
- [ ] Revenue reconciliation query (SQL 06) shows zero `MISSING` records
- [ ] Cohort analysis query (SQL 07) shows no null `lead_source` entries

---

## Validation Sign-Off

Use this section to confirm that cleanup work is complete before the audit is
shared with leadership. Mark each row `Pass`, `Fail`, or `Needs follow-up`.

| Area | Pass/Fail | Evidence or follow-up owner |
| --- | --- | --- |
| Duplicate records: all duplicate leads, contacts, and accounts are merged, flagged, or assigned to an owner for review | [Status] | [Link/query/owner] |
| Stale deals: every deal stuck in one stage for more than 14 days has a logged next step or close-out action | [Status] | [Link/query/owner] |
| Missing owners: every active lead, account, contact, and deal has an accountable owner | [Status] | [Link/query/owner] |
| Missing close dates: every open opportunity has a realistic `Closing Date` | [Status] | [Link/query/owner] |
| Incomplete handoff fields: every `Closed Won` deal has completed delivery handoff fields, including `Handoff_Status`, handoff owner, and required service notes | [Status] | [Link/query/owner] |

---

**Notes:** [Any issues found and corrective actions taken]
