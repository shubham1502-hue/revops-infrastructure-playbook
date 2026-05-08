# RevOps Infrastructure Playbook

Copyable RevOps architecture for CRM stages, field mapping, automations, finance handoffs, SQL reporting, and CEO briefs.

<!-- FOUNDER_OS_STANDARD_README -->

## Why this matters

This is the closest repo to my real operating work at STEMpedia.

I built the underlying RevOps infrastructure from scratch: CRM architecture, pipeline stages, handoffs, automation logic, reporting, and CEO visibility.

## Business impact

Measured outcomes documented in `outcomes/results.md`:

| Outcome | Before | After | Change |
| --- | --- | --- | --- |
| Sales cycle time | About 31 days average | About 26 days average | 15% reduction |
| Lead-to-demo conversion | About 28% | About 33% | 5 percentage point improvement |
| Lead capture delay | 12 to 24 hours | Real-time, under 1 minute | Eliminated |
| Invoice creation delay | 24 to 72 hours | Under 1 minute | Eliminated |
| CEO report prep time | 2 to 3 hours per week | 30 minutes | 80% reduction |
| Manual coordination overhead | About 15 hours per week across teams | About 2 hours per week | 87% reduction |
| Finance-sales reconciliation errors | Frequent | Near zero | Eliminated |

## Founder's Office signal

This repo demonstrates:

- building operating infrastructure from zero
- CRM and pipeline architecture
- cross-functional handoff design
- CEO visibility and reporting cadence
- automation logic
- translating messy sales and operations workflows into repeatable systems

## 7-day Founder's Office sprint

- Day 1: Audit CRM stages, ownership, and reporting gaps
- Day 2: Map lead sources, handoffs, and pipeline stages
- Day 3: Define required fields, owner rules, and data hygiene checks
- Day 4: Build first CEO visibility report
- Day 5: Add automation and follow-up logic
- Day 6: Review leakage, handoff gaps, and reporting friction
- Day 7: Turn the system into a weekly RevOps operating review

## The founder problem

Founder-led teams often run revenue on disconnected spreadsheets, CRM fields nobody trusts, manual handoffs, and reporting assembled by force. The founder problem is building a first reliable revenue operating layer before hiring a full RevOps team.

## What this repo does

- documents CRM and pipeline architecture
- maps field and handoff design
- provides automation logic and SQL query examples
- includes CEO briefing and CRM hygiene templates

## What a founder gets in 10 minutes

- CRM hygiene audit
- sales ops metrics spec
- service delivery handoff brief
- weekly CEO briefing note
- architecture notes
- automation examples

## Before and after

Before:

- untrusted CRM fields
- manual lead and deal handoffs
- finance and sales data mismatch
- ad hoc CEO reporting

After:

- defined revenue data model
- clear CRM stages
- automation logic
- weekly CEO briefing rhythm

## Who this is for

- RevOps operators
- early-stage founders
- Founder's Office teams
- BizOps operators
- GTM operators

## Quick start

- Fork the repo.
- Open `architecture/00-zoho-one-stack.md` first.
- Copy `templates/crm-hygiene-audit.md`.
- Use `templates/weekly-ceo-briefing-note.md` for the first operating review.

## How to fork and use this for your company

1. Click Fork.
2. Rename the repo if needed.
3. Map your CRM stages against `architecture/01-pipeline-stage-design.md`.
4. Replace field names in `architecture/02-crm-field-mapping.md`.
5. Copy templates into your CRM, Google Docs, Notion, or internal ops tracker.
6. Keep customer and prospect data out of public forks.

### Non-technical path

- Replace one template: `templates/crm-hygiene-audit.md`.
- Edit one architecture note: `architecture/01-pipeline-stage-design.md`.
- Run no code.
- Read one artifact first: `templates/weekly-ceo-briefing-note.md`.

## Input format

- current CRM stages
- pipeline fields
- lead sources
- handoff rules
- finance systems
- reporting needs

The default sample data and examples are synthetic, anonymized, or template-only unless the repo explicitly documents a public source. Keep private customer, prospect, employee, investor, borrower, merchant, payment, or company data out of public forks.

## Output files

- `architecture/`: RevOps architecture notes
- `templates/crm-hygiene-audit.md`: CRM cleanup guide
- `templates/sales-ops-metrics-spec.md`: reporting spec
- `templates/service-delivery-handoff-brief.md`: handoff template
- `templates/weekly-ceo-briefing-note.md`: CEO operating brief

## Sample artifacts to inspect

Open these before customizing the architecture:

- `templates/weekly-ceo-briefing-note.md`: the first founder-facing output to copy.
- `templates/crm-hygiene-audit.md`: the fastest audit artifact for a messy CRM.
- `architecture/01-pipeline-stage-design.md`: the pipeline design reference.
- `outcomes/results.md`: example outcome framing for a RevOps build.

## Example founder workflow

- Monday: audit CRM field trust.
- Tuesday: map lead and deal stages.
- Wednesday: define handoffs.
- Thursday: review reporting queries.
- Friday: send CEO briefing note.

## Customization guide

Customize these before using the repo for a real company:

- CRM stages
- field names
- automation rules
- finance handoffs
- SQL queries
- weekly CEO brief sections

## Standalone or integrated

Standalone:
Use this repo by itself if you only need CRM stages, field mapping, handoffs, reporting, automation architecture, and CEO visibility templates. Fork it, replace the sample input, run the workflow or copy the templates, and use the main output in your next founder review.

Integrated:
Use this repo with the Founder OS ecosystem if you want to connect it to adjacent operating workflows.

- Use as the RevOps backbone for GTM, sales, revenue diagnosis, and onboarding.
- Feed CRM and funnel structure into [founder-os-revenue-engine](https://github.com/shubham1502-hue/founder-os-revenue-engine).
- Use owner fields and handoff design with [founder-customer-onboarding-os](https://github.com/shubham1502-hue/founder-customer-onboarding-os).
- Use [startup-metrics-playbook](https://github.com/shubham1502-hue/startup-metrics-playbook) to keep metric definitions consistent.

## Lifecycle handoff

Before:

- [founder-os](https://github.com/shubham1502-hue/founder-os) for choosing the operating system shape.
- [startup-metrics-playbook](https://github.com/shubham1502-hue/startup-metrics-playbook) for metric definitions.

This repo produces:

- CRM stage design
- Field map
- Handoff architecture
- Automation design
- SQL examples
- CEO briefing templates

After:

- [ai-gtm-command-center](https://github.com/shubham1502-hue/ai-gtm-command-center) for GTM inputs that should land in CRM.
- [founder-os-revenue-engine](https://github.com/shubham1502-hue/founder-os-revenue-engine) for funnel diagnosis.
- [founder-customer-onboarding-os](https://github.com/shubham1502-hue/founder-customer-onboarding-os) for post-sale owner gaps and onboarding handoffs.

## Post-sale operating layer

RevOps Infrastructure Playbook designs the CRM, reporting, handoff, and automation backbone. [Founder Customer Onboarding OS](https://github.com/shubham1502-hue/founder-customer-onboarding-os) gives founders a working post-sale control tower for onboarding health, activation risk, owner gaps, and handoff issues.

## Where this fits in the Founder OS

This is the infrastructure layer for `founder-os-revenue-engine`, `founder-led-sales-call-os`, `ai-gtm-command-center`, and `startup-metrics-playbook`. Use it when the issue is system design rather than one-off analysis.

## Why this remains practical

This is not a RevOps essay. It is a copyable operating architecture for making revenue data usable.

## Roadmap

- HubSpot version
- Pipedrive version
- Attio version
- Make/Zapier automation examples
- dashboard field dictionary

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) if present. Practical improvements are welcome when they make the workflow easier to fork, run, or adapt.

## License

MIT License. See [LICENSE](LICENSE).

## Built by

Built by Shubham Singh, a founder-facing operator focused on RevOps, GTM systems, startup metrics, AI workflows, and operating systems for early-stage teams.

## Use this in your company

Fork it, replace the sample inputs with your company context, and run the workflow. Start with the main output listed in the Quick Start section. Keep private data out of public forks.

## If you are a Founder's Office candidate

Use this repo to understand how a founder-facing operator turns messy inputs into decisions, cadence, and execution artifacts. Fork it, adapt it to a real company example, and write a short case note explaining what changed.

---

## Detailed implementation notes

The founder-facing guide above is the fastest path. The original repo-specific notes are preserved below for deeper implementation context.

## Problem This Solves

Founder-led startups often run revenue on disconnected spreadsheets, CRM fields nobody trusts, manual handoffs, and weekly reporting assembled by force. The problem is the lack of a reliable revenue operating system.

## How It Helps

- Documents a full RevOps architecture: CRM stages, field mapping, automations, finance handoffs, webhooks, SQL reporting, and CEO briefing templates.
- Shows what a practical first operating layer can look like before a company hires a full RevOps team.
- Gives founders and operators copyable artifacts rather than abstract advice.

## When To Fork This

- Fork this if you are building or rebuilding CRM, pipeline, sales ops, finance handoff, or CEO reporting infrastructure at an early-stage company.
- Fork it when leads, deals, invoices, and delivery handoffs are fragmented across tools and people.
- Adapt the pipeline stages, field map, Deluge scripts, SQL queries, and briefing templates to your own stack.

> Built by Shubham Singh | Founder's Office / Revenue Operations | [LinkedIn](https://linkedin.com/in/shubham9616) | [shubham1502@gmail.com](mailto:shubham1502@gmail.com)

---

## Use This In Your Company

This repo is designed to be forked into an internal company workflow. Fork it, replace the sample inputs with your company context, and keep only the parts that match your operating cadence. No permission request or sales call is needed before using it; the repo is the handoff. Check the license if you plan to redistribute your version.

- Use it as a RevOps rebuild checklist for early-stage teams with messy CRM, handoffs, invoicing, or reporting.
- Keep the architecture: field map, pipeline stages, automations, finance handoff, SQL reporting, CEO briefing.
- Replace Zoho-specific examples with your CRM and finance stack only where needed.

## Minimum Edits To Make It Yours

Change these first:

| Edit | Where | Why |
|---|---|---|
| Map your pipeline stages. | `architecture/01-pipeline-stage-design.md` | Prevents CRM reporting from inheriting someone else's sales process. |
| Replace CRM fields. | `architecture/02-crm-field-mapping.md` | Makes automations, SQL, and dashboards line up with your system. |
| Update handoff and approval rules. | `architecture/07-team-handoff-automation.md` and `architecture/06-lead-capture-approval-flow.md` | Keeps cross-team ownership clear. |
| Rewrite operating templates. | `templates/weekly-ceo-briefing-note.md` and related templates | Turns the playbook into your weekly founder/CEO rhythm. |

You can leave the Zoho reference architecture, SQL query examples, and Deluge script structure alone on the first fork. Map fields and stages first; automation code comes after the process is clear.

## What This Is

This repo documents the complete revenue operations infrastructure I designed and built from scratch at STEMpedia - a founder-led EdTech startup. It covers the full operating stack: CRM architecture, pipeline logic, cross-team automation, finance integration, and leadership reporting.

The problem being solved: the company had process fragments but no operating system. Leads were tracked across spreadsheets, team handoffs happened via WhatsApp, and the CEO's weekly business review was assembled manually from multiple disconnected sources. Data existed but not in a form leadership could trust or act on quickly.

The solution: a Zoho One-based operating layer that unified Sales, Operations, Service Delivery, and Finance - with automated handoffs, field-level audit trails, webhook-based lead ingestion, and SQL-driven reporting.

---

## Operating System Preview

Start with these forkable artifacts:

- [Zoho One stack design](architecture/00-zoho-one-stack.md)
- [Pipeline stage design](architecture/01-pipeline-stage-design.md)
- [CRM field mapping](architecture/02-crm-field-mapping.md)
- [Weekly CEO briefing note](templates/weekly-ceo-briefing-note.md)
- [Revenue reconciliation SQL](sql-queries/06-revenue-reconciliation.sql)
- [Results and operating impact](outcomes/results.md)

---

## Business Impact

| Metric | Before | After |
|---|---|---|
| Sales cycle time | ~31 days avg | ~26 days avg - **15% reduction** |
| Lead → demo conversion | ~28% | ~33% - **+5pp improvement** |
| Manual reporting hours/week | ~15 hrs (across teams) | ~2 hrs |
| CEO update preparation | 2-3 hrs manually | 30-min Zoho Analytics pull |
| Finance-sales reconciliation | Manual cross-check | Automated Books trigger on Close Won |
| Lead capture delay | 12-24 hrs manual entry | Real-time via webhook |

---

## Stack

| Layer | Tool | Role |
|---|---|---|
| CRM & Pipeline | Zoho CRM | Lead, contact, deal management - source of truth |
| Finance | Zoho Books | Invoicing, payment tracking, revenue reconciliation |
| Reporting | Zoho Analytics | CEO and leadership dashboards |
| Support | Zoho Desk | Post-sale service and handoff tracking |
| Automation | Zoho Deluge | Workflow logic, field automation, cross-app triggers |
| Integration | Make.com | WordPress webhook ingestion, inter-app routing |
| Website Leads | WordPress + Webhooks | Webform → CRM in real time |
| Analytics | MySQL + Tableau | Cohort analysis, funnel reporting, revenue ops metrics |

---

## Repo Contents

```
revops-infrastructure-playbook/
├── README.md
├── .gitignore
│
├── architecture/
│  ├── 00-zoho-one-stack.md       - Full stack design + integration logic
│  ├── 01-pipeline-stage-design.md   - CRM pipeline stages + entry/exit criteria
│  ├── 02-crm-field-mapping.md     - Field architecture, custom fields, data types
│  ├── 03-automation-logic.md      - Workflow triggers + automation catalogue
│  ├── 04-data-flow.md         - End-to-end data flow across all apps
│  ├── 05-zoho-books-crm-integration.md - Finance integration design
│  ├── 06-lead-capture-approval-flow.md - Lead qualification + approval routing
│  ├── 07-team-handoff-automation.md  - Sales → Ops → Delivery handoff system
│  └── 08-wordpress-webhook-ingestion.md- Webform → CRM via webhook
│
├── deluge-scripts/
│  ├── 01-clone-deal-for-next-team.deluge   - Clone deal with filtered fields
│  ├── 02-proposal-amount-lock.deluge     - Lock proposal amount as non-editable
│  └── 03-books-trigger-on-close.deluge    - Trigger Books invoice on Close Won
│
├── sql-queries/
│  ├── 01-pipeline-health.sql      - Active pipeline by stage and rep
│  ├── 02-conversion-by-source.sql   - Lead-to-close by acquisition source
│  ├── 03-cycle-time-analysis.sql    - Days-to-close distribution
│  ├── 04-rep-performance.sql      - Rep-level output and conversion
│  ├── 05-weekly-ceo-dashboard.sql   - CEO weekly briefing metrics
│  ├── 06-revenue-reconciliation.sql  - Closed deals vs Books invoices
│  ├── 07-source-cohort-analysis.sql  - Monthly cohort funnel by source
│  └── 08-stage-dropoff-analysis.sql  - Funnel drop-off rates by stage
│
├── templates/
│  ├── weekly-ceo-briefing-note.md   - CEO weekly briefing template
│  ├── crm-hygiene-audit.md       - Monthly CRM hygiene checklist
│  ├── sales-ops-metrics-spec.md    - Metrics definitions and formulas
│  └── service-delivery-handoff-brief.md- Sales → delivery handoff template
│
└── outcomes/
  ├── baseline-audit.md        - Old process documentation
  └── results.md            - Measured and estimated outcomes
```

---

## Architecture Overview

```
             ┌────────────────────────────────────────────────────────────┐
             │          ZOHO ONE STACK             │
             │                              │
 WordPress Form ──────► │ Make.com ──► Zoho CRM ──────────────────► Zoho Analytics │
 (Webhook payload)    │  │      │   │            (Dashboards) │
             │  │   Pipeline   │                  │
             │  │   Stages    ▼                  │
             │  │      Deluge Scripts ──────────► Zoho Books    │
             │  │      (Automations)       (Invoicing)    │
             │  │         │                  │
             │  │         ▼                  │
             │  │      Zoho Desk                  │
             │  │      (Post-sale support)             │
             │                              │
             └────────────────────────────────────────────────────────────┘
                        │
                  MySQL + Tableau
                  (Cohort & Funnel Analysis)
```

---

## Key Design Decisions

### 1. Single source of truth in CRM
All lead, deal, and contact data lives in Zoho CRM. Other systems pull from or push to CRM - they don't duplicate it. This was the most important architectural decision because the previous state had multiple spreadsheets that quickly diverged.

### 2. Webhook-based real-time lead ingestion
Website leads from WordPress webforms are ingested via Make.com webhook. No manual entry, no delay. Lead SLA clock starts at form submission, not at the point someone notices and enters it manually.

### 3. Deal cloning for cross-team handoffs
When a deal progressed to a handoff point, a Deluge script created a downstream deal record in the next team's pipeline with only the fields that team needed. Sensitive commercial data, pricing negotiations, and internal rep notes were excluded. This preserved confidentiality while giving delivery and procurement teams the context they needed.

### 4. Proposal amount audit trail
One of the most important control mechanisms: when a rep filled the Proposal Amount field at the Proposal Sent stage, a Deluge function immediately copied it into a locked, non-editable field called `Locked_Proposal_Amount`. This created an immutable record of what was proposed - enabling later comparison against the final closed amount to track discounting behavior and rep discipline.

### 5. Books integration via close-won trigger
Zoho Books invoices were triggered automatically when a deal moved to Closed Won. This eliminated the gap between sales recording and finance records - previously a manual process that caused invoice delays and payment tracking issues.

---

## Who This Is For

This repo is intended for:
- **Founders and operators** evaluating what a RevOps build actually looks like in a founder-led startup
- **Hiring managers** reviewing Founder's Office or BizOps candidates who claim systems experience
- **Startup operators** looking for reference architecture for early-stage CRM + RevOps implementation

---

## Author Note

Built by Shubham Singh, focused on practical operating systems for early-stage founders and RevOps teams.

I built all of this in production at STEMpedia while reporting directly to the CEO. This repo is the documented version of that work.

[LinkedIn](https://linkedin.com/in/shubham9616) · [GitHub](https://github.com/shubham1502-hue)
