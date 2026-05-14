# CRM Field Dictionary Template

Use this before rebuilding CRM fields, importing legacy data, or creating automations. The goal is to make every field owned, defined, reportable, and safe to automate.

## Field dictionary

| Field name | CRM object | Type | Owner | Source | Required status | Reporting use | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Lead Source | Lead / Contact | Dropdown | RevOps | Webform, import, manual entry | Required on create | Source cohort and conversion reporting | Keep values controlled: Website, Referral, Event, Cold Outreach, Partner. |
| ICP Match | Lead / Contact | Checkbox | Sales Manager | Sales qualification | Required before demo booking | ICP conversion and pipeline quality | Avoid free-text ICP notes when a true/false field is enough. |
| Lead Quality Score | Lead / Contact | Integer | Sales Manager | Manual scoring or enrichment | Required before qualification | Lead prioritization and rep coaching | Define score bands before reporting on them. |
| Proposal Amount | Deal | Currency | Sales Rep | Rep-entered proposal | Required at Proposal Sent | Pipeline value and discount analysis | Editable until Proposal Sent. |
| Locked Proposal Amount | Deal | Currency | RevOps Automation | Workflow or function | System-required at Proposal Sent | Discount and margin audit | Read-only after automation writes it. |
| Final Close Amount | Deal | Currency | Sales Manager | Closed Won review | Required at Closed Won | Revenue reconciliation | Should match invoice or finance source after reconciliation. |
| Payment Terms | Deal | Dropdown | Finance | Proposal and contract | Required at Closed Won | Cash timing and collections planning | Example values: Immediate, Net 15, Net 30, Milestone-based. |
| Delivery Requirements | Deal / Ticket | Multi-line text | Sales Rep | Handoff notes | Required before handoff | Delivery readiness and handoff quality | Copy only delivery-safe context into downstream records. |
| Handoff Status | Deal / Ticket | Dropdown | Delivery Owner | Handoff workflow | Required after Closed Won | Handoff completion reporting | Example values: Not started, In progress, Completed, Blocked. |
| Handoff Completed By | Deal / Ticket | User lookup | Delivery Owner | Manual completion or workflow | Required when completed | Accountability and SLA review | Use a user field, not free text. |
| Stage Change Log | Deal | Multi-line text | RevOps Automation | Workflow or function | System-written | Audit trail and stage aging review | Lock manual edits if your CRM supports it. |
| Finance Invoice ID | Deal | Text | Finance | Accounting system | Required after invoice creation | Revenue reconciliation | Store external ID instead of duplicating invoice data. |

## Governance checklist

- Every field has exactly one owner.
- Dropdown values are documented before import.
- Required fields map to a stage, workflow, or reporting need.
- System-written fields are locked from manual edits where possible.
- Reporting fields have a clear dashboard, SQL query, or operating review use.
- Sensitive fields are excluded from downstream handoff records unless the receiving team needs them.

## How to adapt

1. Copy this file into your internal CRM implementation folder.
2. Replace the example rows with your current field list.
3. Mark duplicated, unused, or unclear fields before changing automations.
4. Review required fields by lifecycle stage and deal stage.
5. Use the final dictionary as the contract for imports, workflows, dashboards, and handoffs.
