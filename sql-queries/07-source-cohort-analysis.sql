-- ─────────────────────────────────────────────────────────────
-- Source Cohort Analysis
-- Tracks lead quality and conversion behavior over time,
-- segmented by acquisition source and cohort month.
-- Used in: Monthly RevOps review, source investment decisions
-- ─────────────────────────────────────────────────────────────

-- SECTION 1: Monthly cohort funnel (all sources combined)
SELECT
    DATE_FORMAT(created_at, '%Y-%m') AS cohort_month,
    COUNT(DISTINCT lead_id)                                               AS leads_created,
    COUNT(DISTINCT CASE WHEN qualified = 1 THEN lead_id END)              AS qualified,
    COUNT(DISTINCT CASE WHEN demo_completed = 1 THEN lead_id END)         AS demo_completed,
    COUNT(DISTINCT CASE WHEN proposal_sent = 1 THEN lead_id END)          AS proposal_sent,
    COUNT(DISTINCT CASE WHEN final_stage = 'Closed Won' THEN lead_id END) AS closed_won,
    ROUND(COUNT(DISTINCT CASE WHEN qualified = 1 THEN lead_id END) /
          NULLIF(COUNT(DISTINCT lead_id),0) * 100, 1)                     AS qual_rate,
    ROUND(COUNT(DISTINCT CASE WHEN demo_completed = 1 THEN lead_id END) /
          NULLIF(COUNT(DISTINCT CASE WHEN qualified = 1 THEN lead_id END),0) * 100, 1) AS qual_to_demo_pct,
    ROUND(COUNT(DISTINCT CASE WHEN final_stage = 'Closed Won' THEN lead_id END) /
          NULLIF(COUNT(DISTINCT lead_id),0) * 100, 1)                     AS lead_to_close_pct,
    ROUND(AVG(CASE WHEN final_stage = 'Closed Won'
              THEN DATEDIFF(close_date, created_at) END), 1)              AS avg_cycle_days,
    ROUND(AVG(CASE WHEN final_stage = 'Closed Won' THEN deal_amount END), 0) AS avg_deal_value
FROM lead_funnel_history
GROUP BY cohort_month
ORDER BY cohort_month;

-- SECTION 2: Source breakdown within each cohort
SELECT
    DATE_FORMAT(created_at, '%Y-%m') AS cohort_month,
    lead_source,
    COUNT(DISTINCT lead_id) AS leads,
    ROUND(COUNT(DISTINCT CASE WHEN final_stage = 'Closed Won' THEN lead_id END) /
          NULLIF(COUNT(DISTINCT lead_id),0) * 100, 1) AS close_rate_pct,
    ROUND(AVG(CASE WHEN final_stage = 'Closed Won' THEN deal_amount END), 0) AS avg_deal_value
FROM lead_funnel_history
GROUP BY cohort_month, lead_source
ORDER BY cohort_month, close_rate_pct DESC;
