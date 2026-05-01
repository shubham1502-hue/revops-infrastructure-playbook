# CRM Pipeline Stage Design

## Pipeline Stages

The Zoho CRM sales pipeline was designed with 7 stages. Each stage has defined entry criteria, exit criteria, and primary owner.

| Stage | Entry Criteria | Exit Criteria | Owner |
|---|---|---|---|
| New Lead | Form submission / manual entry | Qualified or disqualified | Sales Rep |
| Qualified | Lead meets ICP criteria (region, segment, intent) | Demo scheduled | Sales Rep |
| Demo Scheduled | Demo call booked | Demo completed | Sales Rep |
| Proposal Sent | Demo completed, requirements understood | Proposal document shared | Sales Rep |
| Negotiation | Proposal received; pricing discussion started | Agreement on terms | Sales Rep + Manager |
| Closed Won | Terms agreed; signed or verbal confirmation | Invoice triggered | Sales + Finance |
| Closed Lost | Pursuit abandoned or rejected | Reason captured | Sales Rep |

## Stage Fields

Each stage activates a specific subset of fields. Only fields relevant to the current stage are visible to the rep — the rest are locked or hidden.

| Stage | Key Fields Active |
|---|---|
| New Lead | Lead source, region, phone, email, notes |
| Qualified | ICP match score, segment, use case, primary contact confirmed |
| Demo Scheduled | Demo date, stakeholders attending, rep assignment |
| Proposal Sent | Proposal amount, Locked Proposal Amount (auto-set), proposal document URL |
| Negotiation | Revised amount, discount applied, approval status |
| Closed Won | Final amount, close date, payment terms, handoff notes |
| Closed Lost | Lost reason (dropdown), lost to (competitor/no budget/no decision) |

## Stage Probability

Each stage maps to a pipeline probability used in Zoho Analytics for weighted forecasting.

| Stage | Probability |
|---|---|
| New Lead | 5% |
| Qualified | 15% |
| Demo Scheduled | 30% |
| Proposal Sent | 55% |
| Negotiation | 75% |
| Closed Won | 100% |
| Closed Lost | 0% |
