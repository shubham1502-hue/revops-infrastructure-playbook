-- ─────────────────────────────────────────────────────────────
-- Pipeline Health Report
-- Shows active deal count and total value by stage
-- Used in: CEO weekly review, Sales manager standup
-- ─────────────────────────────────────────────────────────────
SELECT
    stage,
    COUNT(deal_id) AS deal_count,
    SUM(deal_amount) AS total_pipeline_value,
    ROUND(AVG(deal_amount), 0) AS avg_deal_value,
    SUM(deal_amount * stage_probability / 100) AS weighted_forecast_value
FROM crm_deals
WHERE stage NOT IN ('Closed Won', 'Closed Lost')
  AND is_deleted = 0
GROUP BY stage
ORDER BY FIELD(stage,
    'New Lead','Qualified','Demo Scheduled',
    'Proposal Sent','Negotiation');
