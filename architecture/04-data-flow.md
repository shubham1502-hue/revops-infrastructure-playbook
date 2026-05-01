# End-to-End Data Flow

## Data Flow Diagram

```
EXTERNAL                INGESTION              CRM CORE              DOWNSTREAM
─────────               ─────────              ────────              ──────────

WordPress               Make.com           Zoho CRM Leads          Zoho Analytics
Webform         ──►    (Webhook          ──► New Lead Record  ──►  (Dashboards)
(Customer)              Receiver)              │
                                               │ Stage: Qualified
                                               ▼
                                          Deal Record
                                               │
                                    ┌──────────┼──────────┐
                                    │          │          │
                              Proposal      Clone     Stage Change
                             Amount Lock   Deal for    Logger
                             (Deluge)      Next Team   (Deluge)
                                           (Deluge)
                                    │          │
                                    ▼          ▼
                              Locked       Procurement
                              Proposal     Pipeline
                              Field        (Filtered
                             (Read-only)    Fields)
                                    │
                              Close Won
                                    │
                         ┌──────────┴──────────┐
                         │                     │
                    Zoho Books            Zoho Desk
                    Invoice              Service Ticket
                    Created              Created
                         │
                    Finance               Support
                    Records               Records
                         │                     │
                         └──────────┬──────────┘
                                    │
                              Zoho Analytics
                              (Full Revenue +
                               Support View)
                                    │
                              MySQL Export +
                              Tableau Dashboards
                              (Cohort, Funnel,
                               CEO Reports)
```

## Data Ownership Matrix

| Entity | Created In | Modified In | Read By |
|---|---|---|---|
| Lead | Zoho CRM (via webhook or manual) | CRM | CRM, Analytics |
| Deal | Zoho CRM | CRM (Deluge-controlled for locked fields) | CRM, Analytics |
| Invoice | Zoho Books (triggered by CRM) | Books | Books, Analytics |
| Service Ticket | Zoho Desk (created from CRM handoff) | Desk | Desk, CRM (linked) |
| Dashboard | Zoho Analytics | Read-only | CEO, managers |
