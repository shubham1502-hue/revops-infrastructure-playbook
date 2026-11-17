# WordPress Webhook Lead Ingestion

This is a reference pattern for Make.com and Zoho CRM lead intake. It illustrates validation and routing using an example payload.

1. Receive an event with a stable submission ID and source timestamp.
2. Validate and map the fields, then check the submission ID before creating a lead.
3. Create or find the lead in CRM. Record the source submission timestamp separately from the CRM record creation timestamp.
4. Assign an owner and route incomplete or ambiguous records to a review queue.
5. Start the response clock using the timestamp defined by the team's SLA policy. Capture first human contact as a separate event.

```json
{
  "submission_id": "example-001",
  "email": "lead@example.com",
  "source": "Website",
  "submitted_at": "2026-05-01T10:15:00Z"
}
```

| Field | Use |
| --- | --- |
| `submission_id` | Idempotency lookup and event trace |
| `email` | Contact mapping input |
| `source` | Lead source reporting |
| `submitted_at` | Customer submission clock |

Keep CRM record creation time for intake lag and use the contact activity timestamp for response lag. Review duplicate, invalid, and timeout cases with synthetic events before adapting the pattern.
