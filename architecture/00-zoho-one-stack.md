# Zoho One Stack Architecture

## Overview

The RevOps system at STEMpedia was designed as an integrated Zoho One operating stack - not isolated CRM setup. Four apps worked together as a connected operating layer covering the full revenue lifecycle.

## Stack Components

| App | Primary Role | Data It Owns |
|---|---|---|
| Zoho CRM | Lead, contact, and deal management | Pipeline, deal history, field data, automations |
| Zoho Books | Finance, invoicing, payment status | Invoices, transactions, payment timelines |
| Zoho Analytics | Leadership reporting and dashboards | Aggregated cross-app metrics |
| Zoho Desk | Post-sale support and issue tracking | Tickets, service requests, SLA status |

## Integration Logic

```
Zoho CRM  ──► Zoho Books        Closed Won triggers invoice creation
Zoho CRM  ──► Zoho Analytics    CRM data feeds dashboards in real time
Zoho CRM  ──► Zoho Desk         Closed deal creates service onboarding ticket
Zoho Desk ──► Zoho CRM          Support issues can link back to originating deal
Zoho Books ──► Zoho Analytics   Finance data consolidated into leadership view
```

## Why Zoho One

The company already used Zoho Books for accounting. The decision to extend into Zoho CRM and then Zoho One was driven by three practical constraints:

1. **Native integration** - CRM and Books sync without third-party connectors. Closed deals map directly to invoices, contacts to customers, and deal amounts to invoice values.
2. **Deluge scripting across apps** - A single automation language works across CRM, Books, Desk, and Analytics. This dramatically reduces the complexity of cross-app workflows.
3. **Cost efficiency** - Zoho One bundles all apps under a per-user price that is significantly cheaper than combining Salesforce + QuickBooks + Zendesk + Looker.

## Design Principle: One Source of Truth

All lead and deal data lives in CRM. Other apps pull from it or write back to it - they never maintain their own separate copy of the same entity. This was the foundational decision that made reporting reliable. Previously, data existed in spreadsheets that diverged over time.
