# RevOps Infrastructure Playbook

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

- CRM field names
- pipeline stages
- handoff rules
- SQL table names
- weekly CEO briefing template

The fastest path is: fork the repo, replace the inputs above, run the demo or open the template, then adjust only the parts that reflect your company's workflow.

## What This Is

This repo documents the complete revenue operations infrastructure I designed and built from scratch at STEMpedia — a founder-led EdTech startup. It covers the full operating stack: CRM architecture, pipeline logic, cross-team automation, finance integration, and leadership reporting.

The problem being solved: the company had process fragments but no operating system. Leads were tracked across spreadsheets, team handoffs happened via WhatsApp, and the CEO's weekly business review was assembled manually from multiple disconnected sources. Data existed but not in a form leadership could trust or act on quickly.

The solution: a Zoho One-based operating layer that unified Sales, Operations, Service Delivery, and Finance — with automated handoffs, field-level audit trails, webhook-based lead ingestion, and SQL-driven reporting.

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
| Sales cycle time | ~31 days avg | ~26 days avg — **15% reduction** |
| Lead → demo conversion | ~28% | ~33% — **+5pp improvement** |
| Manual reporting hours/week | ~15 hrs (across teams) | ~2 hrs | 
| CEO update preparation | 2–3 hrs manually | 30-min Zoho Analytics pull |
| Finance–sales reconciliation | Manual cross-check | Automated Books trigger on Close Won |
| Lead capture delay | 12–24 hrs manual entry | Real-time via webhook |

---

## Stack

| Layer | Tool | Role |
|---|---|---|
| CRM & Pipeline | Zoho CRM | Lead, contact, deal management — source of truth |
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
│   ├── 00-zoho-one-stack.md             — Full stack design + integration logic
│   ├── 01-pipeline-stage-design.md      — CRM pipeline stages + entry/exit criteria
│   ├── 02-crm-field-mapping.md          — Field architecture, custom fields, data types
│   ├── 03-automation-logic.md           — Workflow triggers + automation catalogue
│   ├── 04-data-flow.md                  — End-to-end data flow across all apps
│   ├── 05-zoho-books-crm-integration.md — Finance integration design
│   ├── 06-lead-capture-approval-flow.md — Lead qualification + approval routing
│   ├── 07-team-handoff-automation.md    — Sales → Ops → Delivery handoff system
│   └── 08-wordpress-webhook-ingestion.md— Webform → CRM via webhook
│
├── deluge-scripts/
│   ├── 01-clone-deal-for-next-team.deluge     — Clone deal with filtered fields
│   ├── 02-proposal-amount-lock.deluge         — Lock proposal amount as non-editable
│   └── 03-books-trigger-on-close.deluge       — Trigger Books invoice on Close Won
│
├── sql-queries/
│   ├── 01-pipeline-health.sql           — Active pipeline by stage and rep
│   ├── 02-conversion-by-source.sql      — Lead-to-close by acquisition source
│   ├── 03-cycle-time-analysis.sql       — Days-to-close distribution
│   ├── 04-rep-performance.sql           — Rep-level output and conversion
│   ├── 05-weekly-ceo-dashboard.sql      — CEO weekly briefing metrics
│   ├── 06-revenue-reconciliation.sql    — Closed deals vs Books invoices
│   ├── 07-source-cohort-analysis.sql    — Monthly cohort funnel by source
│   └── 08-stage-dropoff-analysis.sql    — Funnel drop-off rates by stage
│
├── templates/
│   ├── weekly-ceo-briefing-note.md      — CEO weekly briefing template
│   ├── crm-hygiene-audit.md             — Monthly CRM hygiene checklist
│   ├── sales-ops-metrics-spec.md        — Metrics definitions and formulas
│   └── service-delivery-handoff-brief.md— Sales → delivery handoff template
│
└── outcomes/
    ├── baseline-audit.md                — Old process documentation
    └── results.md                       — Measured and estimated outcomes
```

---

## Architecture Overview

```
                         ┌────────────────────────────────────────────────────────────┐
                         │                    ZOHO ONE STACK                          │
                         │                                                            │
  WordPress Form ──────► │  Make.com ──► Zoho CRM ──────────────────► Zoho Analytics │
  (Webhook payload)       │    │           │      │                        (Dashboards) │
                         │    │     Pipeline      │                                    │
                         │    │     Stages        ▼                                    │
                         │    │           Deluge Scripts ──────────► Zoho Books        │
                         │    │           (Automations)             (Invoicing)        │
                         │    │                  │                                    │
                         │    │                  ▼                                    │
                         │    │           Zoho Desk                                   │
                         │    │           (Post-sale support)                         │
                         │                                                            │
                         └────────────────────────────────────────────────────────────┘
                                               │
                                    MySQL + Tableau
                                    (Cohort & Funnel Analysis)
```

---

## Key Design Decisions

### 1. Single source of truth in CRM
All lead, deal, and contact data lives in Zoho CRM. Other systems pull from or push to CRM — they don't duplicate it. This was the most important architectural decision because the previous state had multiple spreadsheets that quickly diverged.

### 2. Webhook-based real-time lead ingestion
Website leads from WordPress webforms are ingested via Make.com webhook. No manual entry, no delay. Lead SLA clock starts at form submission, not at the point someone notices and enters it manually.

### 3. Deal cloning for cross-team handoffs
When a deal progressed to a handoff point, a Deluge script created a downstream deal record in the next team's pipeline with only the fields that team needed. Sensitive commercial data, pricing negotiations, and internal rep notes were excluded. This preserved confidentiality while giving delivery and procurement teams the context they needed.

### 4. Proposal amount audit trail
One of the most important control mechanisms: when a rep filled the Proposal Amount field at the Proposal Sent stage, a Deluge function immediately copied it into a locked, non-editable field called `Locked_Proposal_Amount`. This created an immutable record of what was proposed — enabling later comparison against the final closed amount to track discounting behavior and rep discipline.

### 5. Books integration via close-won trigger
Zoho Books invoices were triggered automatically when a deal moved to Closed Won. This eliminated the gap between sales recording and finance records — previously a manual process that caused invoice delays and payment tracking issues.

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
