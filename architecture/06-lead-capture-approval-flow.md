# Lead Capture and Approval Flow

## Lead Sources

| Source | Capture Method | Volume | Quality |
|---|---|---|---|
| Website webform | WordPress webhook → Make.com → CRM | High | Mixed |
| Events / exhibitions | Manual entry by rep | Medium | High |
| Referrals | Manual entry + referrer contact field | Low | Very High |
| Cold outreach | Manual entry by rep | Medium | Low |
| Partner-sourced | Shared spreadsheet import | Low | High |

## Approval Flow for Large Deals

Deals above a defined threshold (e.g., ₹5L+) required a two-step approval before the Proposal Sent stage:

1. **Rep submits** deal with Proposal Amount and supporting notes.
2. **Manager reviews** in Zoho CRM approval queue.
3. **If approved**: deal stage advances, Locked Proposal Amount is set.
4. **If rejected**: rep is notified with comments, deal stays at Demo Scheduled.

This prevented large proposals going out without commercial sign-off.

## ICP Qualification Criteria

A lead was considered qualified if it met at least 3 of 5 criteria:

1. Region is a target geography
2. Segment matches an active vertical
3. Decision-maker contact confirmed
4. Budget signal present (e.g., referenced a budget, not just exploratory)
5. Timeline within 90 days
