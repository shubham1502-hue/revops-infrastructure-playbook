# RevOps Infrastructure Playbook

A case study on moving a founder-led education technology business from fragmented revenue tracking to a shared CRM workflow.

## Business context and my contribution

At STEMpedia, I worked on the migration from Zoho Bigin to Zoho CRM, configured workflow automation for lead routing and handoffs, and prepared pipeline reporting for leadership. This case study documents the workflow decisions and process changes I worked on with sales, operations, and service teams.

Leads, deal stages, delivery details, and report inputs were spread across CRM records, spreadsheets, and manual updates. Teams needed a shared definition of who owned an enquiry, what a deal stage meant, and when delivery should take over.

| Workflow | Contribution | Operating change |
| --- | --- | --- |
| CRM and pipeline | Worked on migration, field mapping, stage design, and ownership rules. | Sales and leadership could review deals using a shared stage and owner model. |
| Lead intake and routing | Configured capture and assignment workflows in Zoho CRM and Make.com. | Enquiries entered a consistent intake workflow, with an owner and follow-up step. |
| Handoffs | Worked with sales, operations, and service on required fields and handoff workflows. | Receiving teams had a more explicit set of fields, responsibilities, and next actions. |
| Leadership reporting | Prepared pipeline reporting for leadership. | Leadership could review open work, movement, and exceptions using a shared pipeline view. |

## Architecture and trade-offs

CRM holds the lead, deal stage, and owner. The routing workflow validates incoming fields and assigns the next action. A handoff passes the fields the receiving team needs and records acknowledgement separately. Reporting uses common stage definitions and checks for records that need an owner or follow-up.

One shared pipeline makes stage and ownership definitions easier to review. Role-specific handoff fields protect commercial context and create work for the team maintaining the mapping. Automatic routing helps when inputs are valid. An exception queue gives ambiguous or duplicate records an owner.

| Start here | What to review |
| --- | --- |
| [CRM stage design](architecture/01-pipeline-stage-design.md) and [field mapping](architecture/02-crm-field-mapping.md) | Example stage gates and field ownership. |
| [Lead intake](architecture/08-wordpress-webhook-ingestion.md) and [handoffs](architecture/07-team-handoff-automation.md) | Input checks, assignment, and acknowledgement. |
| [Leadership briefing](templates/weekly-ceo-briefing-note.md) and [metrics spec](templates/sales-ops-metrics-spec.md) | Operational review, denominator definitions, and follow-up. |
| [Baseline and operating changes](outcomes/results.md) | Team-level process changes and a measurement plan. |
| [Zoho stack reference](architecture/00-zoho-one-stack.md) | Illustrative roles for CRM, reporting, finance, and support systems. |

## Reference artifacts

The SQL, Deluge, diagrams, webhook payloads, and templates are illustrative reference material. They use example schemas, rules, and values. Treat the Books, Desk, reconciliation, and HubSpot examples as design options. For a real deployment, validate the schema, permissions, exception handling, and retry behavior with representative test data.

Start with the [CRM hygiene audit](templates/crm-hygiene-audit.md), then compare the workflow to the [baseline questions](outcomes/baseline-audit.md). Keep live customer data, credentials, and internal mappings in an approved environment.

[LinkedIn](https://www.linkedin.com/in/shubham9616/)
