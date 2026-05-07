-- ─────────────────────────────────────────────────────────────
-- Revenue Reconciliation: CRM Deals vs Zoho Books Invoices
-- Nightly check for closed deals missing an invoice
-- Used in: Finance team daily review
-- ─────────────────────────────────────────────────────────────
SELECT
    d.deal_id,
    d.deal_name,
    d.account_name,
    d.final_close_amount AS crm_closed_amount,
    d.close_date,
    d.books_invoice_id,
    i.invoice_total AS books_invoice_amount,
    i.invoice_status,
    CASE
        WHEN d.books_invoice_id IS NULL OR d.books_invoice_id = ''
            THEN 'MISSING - No invoice created'
        WHEN ABS(d.final_close_amount - COALESCE(i.invoice_total, 0)) > 100
            THEN 'MISMATCH - Amount discrepancy'
        ELSE 'OK'
    END AS reconciliation_status
FROM crm_deals d
LEFT JOIN books_invoices i
    ON d.books_invoice_id = i.invoice_id
WHERE d.stage = 'Closed Won'
  AND d.close_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
ORDER BY reconciliation_status, d.close_date DESC;
