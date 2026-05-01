# Zoho Books + Zoho CRM Integration Design

## Integration Architecture

The Books–CRM integration was designed to eliminate the manual step between a deal closing in CRM and an invoice being raised in Books. Previously, this step was done manually — often delayed by 24–72 hours and sometimes missed entirely.

## Trigger Logic

When a deal moves to **Closed Won** in Zoho CRM, a Deluge function fires immediately:

1. Pulls the following deal fields:
   - `Account_Name` (maps to Books customer)
   - `Final_Close_Amount` (maps to invoice total)
   - `Payment_Terms` (maps to Books payment terms)
   - `Deal_Name` (maps to invoice reference number)
2. Checks if the account already exists in Books. If not, creates the customer record.
3. Creates a draft invoice with the above values.
4. Writes the new Books invoice ID back to the `Books_Invoice_ID` field in the CRM deal.

## Reconciliation Logic

A nightly SQL query (`06-revenue-reconciliation.sql`) cross-checks:
- All CRM deals with `Stage = Closed Won` in the last 30 days
- All Zoho Books invoices created in the same period
- Flags any closed deals missing a Books invoice record

This gives Finance daily visibility into any gap between what Sales closed and what Finance has invoiced.

## Benefits

| Before | After |
|---|---|
| Manual finance notification | Auto-triggered on Close Won |
| Invoice delay: 24–72 hours | Invoice delay: < 1 minute |
| No deal-to-invoice link | `Books_Invoice_ID` written to CRM deal |
| Manual reconciliation monthly | Automated nightly reconciliation query |
