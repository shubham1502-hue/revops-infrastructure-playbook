# WordPress Webhook Lead Ingestion

## Overview

Customer enquiries submitted through the website (WordPress) were connected to Zoho CRM using a Make.com webhook. This removed the manual lead entry step entirely.

## Flow

```
Customer fills webform on WordPress site
        │
        ▼
Webhook fires (POST request to Make.com endpoint)
        │
        ▼
Make.com scenario receives payload
        │
        ├─ Validates required fields (name, email, phone)
        ├─ Maps payload fields to CRM lead fields
        ├─ Sets Lead Source = "Website"
        └─ Sets Status = "New"
        │
        ▼
New Lead created in Zoho CRM
        │
        ├─ Lead assigned to next rep in rotation
        ├─ Lead SLA timer starts (4-hour first-response window)
        └─ Manager notified if uncontacted after 4 hours
```

## Example Webhook Payload

```json
{
  "lead_name": "Amit Kumar",
  "email": "amit@example.com",
  "phone": "+91XXXXXXXXXX",
  "region": "Jharkhand",
  "message": "Interested in your STEAM kits for school programs",
  "source_page": "/products/school-kits",
  "submitted_at": "2024-03-15T10:42:00Z"
}
```

## CRM Field Mapping

| Webhook Field | CRM Lead Field | Notes |
|---|---|---|
| `lead_name` | Lead Name | Required |
| `email` | Email | Required; validated in Make.com |
| `phone` | Mobile | Required; validated for format |
| `region` | Region (custom) | Mapped to dropdown values |
| `message` | Description | Free text; preserved as-is |
| `source_page` | Lead Source Detail | Optional; for UTM analysis |
| `submitted_at` | Lead Created Time | Preserves original submission time |

## Why This Mattered

Before this setup, website leads were submitted and then noticed — maybe hours later, maybe the next morning. By the time a rep reached out, the lead had often already contacted a competitor or lost interest. Real-time ingestion with SLA enforcement changed the response discipline entirely.
