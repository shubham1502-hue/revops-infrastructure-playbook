# Cross-Team Handoff Automation

> Reference design with example fields, stages, and rules. Calibrate settings and validate them against the receiving team's workflow.

## Handoff contract

Require the delivery inputs, name the receiving owner, and capture acknowledgement. Copy the fields the receiving team needs and keep commercial records in their source workflow. The example acknowledgement window is configurable.

## Handoff Flow

```
Sales Deal [Closed Won]
        │
        ▼
Deluge: Clone Deal
        │
        ├─ Include: Client name, region, delivery requirements,
        │           inventory requirement, procurement notes,
        │           expected delivery timeline, primary contact
        │
        └─ Exclude: Proposal amount, negotiation history,
                    rep notes, pricing terms, discount detail
        │
        ▼
New Deal in Procurement/Inventory Pipeline
        │
        ├─ Assigned to relevant delivery team member
        ├─ Handoff Status = "Pending Acknowledgement"
        └─ SLA clock starts: 24-hour acknowledgement window
```

## Handoff Quality Controls

- **Mandatory fields before clone**: Delivery Requirements and Inventory Requirement must be filled by the Sales rep before the handoff can trigger.
- **Acknowledgement required**: Procurement deal stays in "Pending" until team member marks it as acknowledged.
- **Escalation**: If unacknowledged after 24 hours, manager is notified.
