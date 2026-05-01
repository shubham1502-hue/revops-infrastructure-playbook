# WordPress Webhook Lead Ingestion

## Overview
Customer enquiries submitted through the WordPress website were routed into Zoho CRM using webhook-based automation. This removed manual lead logging and ensured fresh website leads entered the system immediately.

## Flow
1. Customer submits web form on WordPress site.
2. Webhook fires with customer details.
3. Make.com receives and validates payload.
4. New lead is created in Zoho CRM.
5. Lead is assigned to analyst or relevant queue.
6. New lead SLA timer begins.

## Example Payload
```json
{
  "lead_name": "Amit Kumar",
  "region": "Jharkhand",
  "email": "amit@example.com",
  "phone": "+91XXXXXXXXXX",
  "source": "Website",
  "submitted_at": "2026-05-01T10:15:00Z"
}
```

## Why This Mattered
- Reduced delay between enquiry and CRM entry.
- Standardized lead data capture.
- Made website-originated leads traceable by source and region.
- Improved lead response discipline by starting SLA tracking immediately.
