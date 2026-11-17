# Zoho Books and CRM Integration Design

This is an illustrative finance handoff for a CRM implementation. Finance owns invoice review, tax, payment terms, and issuance.

1. A deal transitions to Closed Won. The workflow validates the source deal ID, customer reference, line items, and approved terms.
2. Use the source deal ID as the invoice draft lookup key. If the draft exists, return its reference instead of creating another one.
3. Create a draft for finance review and write its reference back to CRM after a successful response.
4. If the API response is uncertain, look up the source deal ID before any retry. Route missing mappings and rejected drafts to a named exception owner.
5. Review unmatched records using the [sample reconciliation query](../sql-queries/06-revenue-reconciliation.sql). Check duplicate records and status differences separately.

Measure draft creation and invoice issuance as distinct events. Compare on a defined population of eligible closed deals, with missing mappings and manual exceptions explicitly tracked.
