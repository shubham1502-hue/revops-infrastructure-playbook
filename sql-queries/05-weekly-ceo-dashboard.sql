-- ─────────────────────────────────────────────────────────────
-- Weekly CEO Dashboard Query
-- Compares current week vs prior week across key metrics
-- Used in: Friday CEO business review
--
-- Founder questions this query helps answer:
-- 1. Is lead creation improving or slowing compared with last week?
-- 2. Are enough demos happening to support the current pipeline target?
-- 3. Did closed-won deal count and revenue improve week over week?
-- 4. How much active pipeline value is still open for the team to work?
-- 5. Are stale open deals building up outside Closed Won or Closed Lost?
-- 6. Do handoff and invoicing checks need follow-up for recent wins?
-- 7. Does revenue hygiene look consistent with the Friday CEO review?
-- ─────────────────────────────────────────────────────────────
SELECT
    'Current Week' AS period,
    COUNT(DISTINCT CASE WHEN created_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) THEN lead_id END) AS new_leads,
    COUNT(DISTINCT CASE WHEN demo_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) THEN deal_id END) AS demos_held,
    COUNT(DISTINCT CASE WHEN close_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND stage = 'Closed Won' THEN deal_id END) AS deals_closed,
    SUM(CASE WHEN close_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND stage = 'Closed Won' THEN final_close_amount ELSE 0 END) AS revenue_closed,
    COUNT(DISTINCT CASE WHEN stage NOT IN ('Closed Won','Closed Lost') THEN deal_id END) AS active_pipeline_deals,
    SUM(CASE WHEN stage NOT IN ('Closed Won','Closed Lost') THEN deal_amount ELSE 0 END) AS active_pipeline_value
FROM crm_deals

UNION ALL

SELECT
    'Prior Week' AS period,
    COUNT(DISTINCT CASE WHEN created_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 14 DAY) AND DATE_SUB(CURDATE(), INTERVAL 7 DAY) THEN lead_id END),
    COUNT(DISTINCT CASE WHEN demo_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 14 DAY) AND DATE_SUB(CURDATE(), INTERVAL 7 DAY) THEN deal_id END),
    COUNT(DISTINCT CASE WHEN close_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 14 DAY) AND DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND stage = 'Closed Won' THEN deal_id END),
    SUM(CASE WHEN close_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 14 DAY) AND DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND stage = 'Closed Won' THEN final_close_amount ELSE 0 END),
    NULL, NULL
FROM crm_deals;
