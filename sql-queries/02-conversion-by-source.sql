-- ─────────────────────────────────────────────────────────────
-- Conversion Rate by Lead Source
-- Shows full funnel from lead to close by acquisition channel
-- Used in: Marketing ROI review, source prioritization
-- ─────────────────────────────────────────────────────────────
SELECT
    lead_source,
    COUNT(DISTINCT lead_id)                                              AS total_leads,
    COUNT(DISTINCT CASE WHEN qualified = 1 THEN lead_id END)             AS qualified,
    COUNT(DISTINCT CASE WHEN demo_completed = 1 THEN lead_id END)        AS demo_completed,
    COUNT(DISTINCT CASE WHEN proposal_sent = 1 THEN lead_id END)         AS proposal_sent,
    COUNT(DISTINCT CASE WHEN final_stage = 'Closed Won' THEN lead_id END) AS closed_won,
    ROUND(
        COUNT(DISTINCT CASE WHEN final_stage = 'Closed Won' THEN lead_id END) /
        NULLIF(COUNT(DISTINCT lead_id), 0) * 100, 1
    ) AS lead_to_close_pct,
    ROUND(AVG(CASE WHEN final_stage = 'Closed Won' THEN deal_amount END), 0) AS avg_won_deal_value
FROM lead_funnel_history
GROUP BY lead_source
ORDER BY lead_to_close_pct DESC;
