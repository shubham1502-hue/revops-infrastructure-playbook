-- ─────────────────────────────────────────────────────────────
-- Sales Cycle Time Analysis
-- Distribution of days-to-close for Closed Won deals
-- Used in: Forecasting accuracy, bottleneck diagnosis
-- ─────────────────────────────────────────────────────────────
SELECT
    DATE_FORMAT(close_date, '%Y-%m') AS close_month,
    COUNT(deal_id) AS won_deals,
    ROUND(AVG(DATEDIFF(close_date, lead_created_date)), 1) AS avg_cycle_days,
    MIN(DATEDIFF(close_date, lead_created_date)) AS min_cycle_days,
    MAX(DATEDIFF(close_date, lead_created_date)) AS max_cycle_days,
    ROUND(
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY DATEDIFF(close_date, lead_created_date)), 1
    ) AS median_cycle_days
FROM crm_deals
WHERE final_stage = 'Closed Won'
  AND close_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY close_month
ORDER BY close_month;
