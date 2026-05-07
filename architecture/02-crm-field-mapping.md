# CRM Field Architecture and Mapping

## Custom Field Categories

Standard Zoho CRM fields were extended with custom fields organized into four groups:

### A. Lead / Contact Intelligence Fields
| Field Name | Type | Purpose |
|---|---|---|
| Lead Source | Dropdown | Website / Referral / Event / Cold Outreach / Partner |
| Region | Dropdown | North / South / East / West / International |
| ICP Match | Checkbox | Does this lead meet the Ideal Customer Profile? |
| Lead Quality Score | Integer | Manual or rule-based scoring (1-10) |
| First Response Time | DateTime | When was the lead first contacted after creation? |

### B. Deal Commercial Fields
| Field Name | Type | Purpose |
|---|---|---|
| Proposal Amount | Currency | Editable. The rep's proposed deal value. |
| Locked Proposal Amount | Currency | **Read-only. Auto-set by Deluge when Proposal Sent.** |
| Final Close Amount | Currency | Actual agreed deal value at Closed Won. |
| Discount Applied (%) | Decimal | Variance between Locked Proposal and Final Close. |
| Payment Terms | Dropdown | Immediate / Net 15 / Net 30 / Milestone-based |

### C. Handoff and Delivery Fields
| Field Name | Type | Purpose |
|---|---|---|
| Delivery Requirements | Multiline | What the delivery team needs to execute. |
| Inventory Requirement | Multiline | Products or materials needed. |
| Procurement Notes | Multiline | Supplier-specific notes for procurement team. |
| Handoff Status | Dropdown | Not started / In progress / Completed |
| Handoff Completed By | Lookup | User who completed the handoff. |

### D. Audit and Compliance Fields
| Field Name | Type | Purpose |
|---|---|---|
| Stage Change Log | Multiline | Auto-appended by Deluge on each stage transition. |
| Proposal Sent Date | DateTime | Auto-set when stage = Proposal Sent. |
| Time in Stage (days) | Integer | Computed field - days since last stage change. |
| Books Invoice ID | Text | Written back by Books trigger automation. |

## Field Visibility Rules
- **Locked Proposal Amount** is read-only for all users including admins via field permissions.
- **Stage Change Log** is system-written only - no direct user edit access.
- **Inventory/Procurement fields** are hidden from Sales reps in the Sales pipeline view but visible in the downstream Procurement pipeline.
