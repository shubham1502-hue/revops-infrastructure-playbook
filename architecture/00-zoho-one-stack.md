# Zoho Stack Reference Architecture

The CRM case study centers on migration, lead and deal management, workflow configuration, handoffs, and leadership reporting. This reference shows how a company could extend that design across finance and support.

| App | Purpose | Records it owns |
| --- | --- | --- |
| Zoho CRM | Lead, contact, and deal management | Pipeline, deal fields, stages, and ownership |
| Zoho Books | Draft invoices and payments | Invoices, transactions, and payment state |
| Zoho Analytics | Aggregation for leadership reporting | Reporting models and dashboard definitions |
| Zoho Desk | Post-sale support | Tickets, service requests, and SLA state |

A Closed Won CRM event can initiate a finance draft or a service handoff. Share a source deal ID across systems. Finance owns the invoice state, support owns ticket state, and reporting reads those systems rather than editing their records.

Evaluate native integration, access controls, field mapping, and maintenance effort before adding another system. Start with the [finance integration design](05-zoho-books-crm-integration.md) and [handoff design](07-team-handoff-automation.md).
