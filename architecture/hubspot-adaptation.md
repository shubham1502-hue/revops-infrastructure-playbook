# HubSpot Adaptation Notes

## Overview

The Zoho architecture in this repo can be adapted to HubSpot by keeping the operating logic the same and replacing the implementation layer. The key principle is unchanged: CRM remains the source of truth for leads, contacts, companies, deals, lifecycle status, handoff context, and leadership reporting.

## Zoho to HubSpot object mapping

| Zoho concept | HubSpot equivalent | Notes |
| --- | --- | --- |
| Zoho CRM Leads | Contacts with lifecycle stage and lead status | Use contact properties for qualification state and owner assignment. |
| Zoho CRM Accounts | Companies | Associate contacts and deals to companies before reporting on account-level pipeline. |
| Zoho CRM Deals | Deals | Use one primary sales pipeline unless downstream teams need separate operational pipelines. |
| Zoho Desk tickets | Tickets | Use tickets for post-sale support, onboarding, or service requests. |
| Zoho Books invoices | Quotes, payments, or external finance system records | Keep invoice IDs and payment status as CRM properties when finance lives outside HubSpot. |
| Zoho Analytics dashboards | HubSpot reports and dashboards, or BI exports | Keep SQL/BI exports when leadership reporting requires cross-system data. |
| Deluge functions | HubSpot workflows, calculated properties, custom code actions, or middleware | Keep complex cross-app logic outside CRM if it becomes brittle in workflows. |

## CRM fields

Create HubSpot custom properties that mirror the field groups in `architecture/02-crm-field-mapping.md`.

### Contact and company properties

| Property | HubSpot object | Type | Purpose |
| --- | --- | --- | --- |
| Lead source | Contact | Dropdown | Original acquisition source. |
| Region | Contact or Company | Dropdown | Routing and reporting dimension. |
| ICP match | Contact or Company | Checkbox | Qualification flag for the target customer profile. |
| Lead quality score | Contact | Number | Manual or rules-based score. |
| First response time | Contact | Date/time | Used to monitor speed-to-lead. |

### Deal properties

| Property | HubSpot object | Type | Purpose |
| --- | --- | --- | --- |
| Proposal amount | Deal | Currency | Rep-entered proposed value. |
| Locked proposal amount | Deal | Currency | Copied from proposal amount when proposal is sent. |
| Final close amount | Deal | Currency | Actual agreed value at Closed Won. |
| Discount applied percent | Deal | Number | Variance between locked proposal and final amount. |
| Payment terms | Deal | Dropdown | Immediate, Net 15, Net 30, or milestone-based. |

### Handoff and audit properties

| Property | HubSpot object | Type | Purpose |
| --- | --- | --- | --- |
| Delivery requirements | Deal or Ticket | Multi-line text | Context needed by delivery or onboarding. |
| Inventory requirement | Deal or Ticket | Multi-line text | Products, materials, or fulfillment needs. |
| Handoff status | Deal or Ticket | Dropdown | Not started, in progress, completed. |
| Handoff completed by | Deal or Ticket | HubSpot user | Owner who completed the handoff. |
| Stage change log | Deal | Multi-line text | Workflow-appended audit trail if required. |
| Finance invoice ID | Deal | Text | External invoice or payment record identifier. |

## Lifecycle stages and pipeline stages

Keep HubSpot lifecycle stages for the relationship state and deal stages for the revenue process.

| Operating state | HubSpot lifecycle stage | HubSpot deal stage |
| --- | --- | --- |
| New inbound or manually sourced account | Lead | New Lead |
| ICP fit confirmed | Marketing Qualified Lead or Sales Qualified Lead | Qualified |
| Meeting booked | Sales Qualified Lead | Demo Scheduled |
| Proposal shared | Opportunity | Proposal Sent |
| Commercial discussion active | Opportunity | Negotiation |
| Won customer | Customer | Closed Won |
| Disqualified or lost opportunity | Other or Evangelist, based on your convention | Closed Lost |

Use `lead status` for day-to-day qualification states such as New, Attempted, Connected, Qualified, Nurture, or Disqualified. Avoid using lifecycle stage as a high-churn task status field.

## Deal handoffs

The Zoho design clones or routes deals when work moves from sales to downstream teams. In HubSpot, choose the simplest handoff model that preserves ownership and context.

### Option A: Deal property handoff

Use this when the same deal record can stay visible to Sales, Ops, and Delivery.

1. Require Delivery Requirements, Payment Terms, and Handoff Status before Closed Won.
2. On Closed Won, set Handoff Status to In progress.
3. Assign an onboarding or delivery owner.
4. Create a task for the owner with the delivery requirements.
5. Notify Sales and Delivery in the same workflow.

### Option B: Ticket handoff

Use this when delivery needs its own operational workflow.

1. On Closed Won, create a ticket associated to the deal, company, and primary contact.
2. Copy only delivery-safe properties into the ticket.
3. Set ticket pipeline, ticket owner, priority, and due date.
4. Keep commercial-only fields on the deal.
5. Report on time from Closed Won to ticket completion.

### Option C: Separate downstream pipeline

Use this when procurement, fulfillment, or implementation has stage gates similar to a sales pipeline. Create a second deal pipeline or ticket pipeline with its own stages, but keep links back to the original deal and company.

## Automations

| Zoho automation | HubSpot implementation |
| --- | --- |
| Lead assignment workflow | Workflow that assigns contact owner by region, source, segment, or rotation. |
| First response alert | Workflow that creates a task or sends a notification when first response time is blank after the SLA window. |
| Proposal amount lock | Workflow copies Proposal amount to Locked proposal amount when deal stage becomes Proposal Sent. |
| Deal clone for procurement | Workflow creates a ticket or downstream deal and copies approved handoff properties. |
| Books invoice trigger | Workflow sends data to finance middleware or stores external invoice ID after finance creates the invoice. |
| Stage change logger | Workflow appends previous stage, new stage, timestamp, and owner to an audit property. |
| Lost reason required | Make Lost Reason visible and required in the Closed Lost stage settings. |

## Reporting

Build the same operating views from the Zoho version, but point them at HubSpot properties and associations.

| Report | HubSpot source | Key filters |
| --- | --- | --- |
| Pipeline health | Deals | Open deals by stage, amount, owner, and close date. |
| Conversion by source | Contacts and deals | Lead source, lifecycle stage, associated deal stage. |
| Cycle time | Deals | Create date, stage dates, close date, and time-in-stage properties. |
| Rep performance | Deals and activities | Owner, stage movement, meetings, tasks, and closed revenue. |
| Revenue reconciliation | Deals plus finance properties | Closed Won amount, invoice ID, payment status, and finance system status. |
| CEO dashboard | Deals, contacts, companies, tickets | Pipeline value, conversion, cycle time, stale deals, handoff completion, and invoice gaps. |

If HubSpot is not the only reporting source, export CRM data into a warehouse or BI tool and keep the SQL query structure in `sql-queries/` as the reporting contract.

## What changes

- Deluge functions become HubSpot workflows, custom code actions, or middleware.
- Zoho Books integration becomes HubSpot-native payments/quotes or an external accounting integration.
- Zoho Desk handoffs become HubSpot tickets or a connected customer support tool.
- Zoho Analytics dashboards become HubSpot dashboards or BI exports.
- Some field permissions and automation depth may depend on the HubSpot plan and connected apps.

## What stays the same

- CRM remains the source of truth.
- Field definitions should be documented before automations are built.
- Stages need entry criteria, exit criteria, and primary owners.
- Proposal amount locking protects discount and margin analysis.
- Closed Won should trigger a structured handoff, not a manual message.
- Leadership reporting should pull from trusted fields and repeatable definitions.

## First implementation checklist

1. Recreate the pipeline stages from `architecture/01-pipeline-stage-design.md`.
2. Create the custom properties listed in this note.
3. Map existing import fields to contacts, companies, deals, and tickets.
4. Configure required fields at Proposal Sent, Closed Won, and Closed Lost.
5. Build the Closed Won handoff workflow.
6. Build the proposal amount lock workflow.
7. Create reports for pipeline health, conversion, cycle time, handoff completion, and finance reconciliation.
8. Run a CRM hygiene audit before enabling manager dashboards.
