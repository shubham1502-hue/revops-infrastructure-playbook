-- ─────────────────────────────────────────────────────────────
-- Rep-Level Performance Report
-- Shows output, conversion, and velocity per sales rep
-- Used in: Weekly 1:1s, monthly performance review
-- ─────────────────────────────────────────────────────────────
SELECT
    rep_name,
    COUNT(DISTINCT deal_id)                                              AS total_deals_worked,
    COUNT(DISTINCT CASE WHEN stage = 'Closed Won' THEN deal_id END)     AS deals_won,
    COUNT(DISTINCT CASE WHEN stage = 'Closed Lost' THEN deal_id END)    AS deals_lost,
    ROUND(
        COUNT(DISTINCT CASE WHEN stage = 'Closed Won' THEN deal_id END) /
        NULLIF(COUNT(DISTINCT CASE WHEN stage IN ('Closed Won','Closed Lost') THEN deal_id END),0) * 100, 1
    ) AS win_rate_pct,
    SUM(CASE WHEN stage = 'Closed Won' THEN final_close_amount ELSE 0 END) AS total_revenue_closed,
    ROUND(AVG(CASE WHEN stage = 'Closed Won' THEN DATEDIFF(close_date, deal_created_date) END), 1) AS avg_cycle_days,
    ROUND(AVG(CASE WHEN stage = 'Closed Won'
              THEN (locked_proposal_amount - final_close_amount) / NULLIF(locked_proposal_amount,0) * 100
              END), 1) AS avg_discount_pct
FROM crm_deals
WHERE deal_created_date >= DATE_SUB(CURDATE(), INTERVAL 90 DAY)
GROUP BY rep_name
ORDER BY total_revenue_closed DESC;
