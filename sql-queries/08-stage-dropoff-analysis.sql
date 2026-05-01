-- ─────────────────────────────────────────────────────────────
-- Stage Drop-off Analysis
-- Identifies where funnel leakage occurs by stage and source.
-- Used in: Sales process improvement, coaching prioritization
-- ─────────────────────────────────────────────────────────────

-- SECTION 1: Overall funnel conversion rates
SELECT
    'Lead → Qualified'      AS transition,
    ROUND(SUM(qualified)    / NULLIF(COUNT(*),0) * 100, 1) AS conversion_pct,
    COUNT(*) - SUM(qualified) AS dropped
FROM lead_funnel_history
UNION ALL
SELECT
    'Qualified → Demo',
    ROUND(SUM(demo_completed) / NULLIF(SUM(qualified),0) * 100, 1),
    SUM(qualified) - SUM(demo_completed)
FROM lead_funnel_history
UNION ALL
SELECT
    'Demo → Proposal',
    ROUND(SUM(proposal_sent) / NULLIF(SUM(demo_completed),0) * 100, 1),
    SUM(demo_completed) - SUM(proposal_sent)
FROM lead_funnel_history
UNION ALL
SELECT
    'Proposal → Closed Won',
    ROUND(SUM(CASE WHEN final_stage='Closed Won' THEN 1 ELSE 0 END) / NULLIF(SUM(proposal_sent),0) * 100, 1),
    SUM(proposal_sent) - SUM(CASE WHEN final_stage='Closed Won' THEN 1 ELSE 0 END)
FROM lead_funnel_history;

-- SECTION 2: Drop-off rates by lead source
SELECT
    lead_source,
    COUNT(*)                                                              AS total_leads,
    ROUND(SUM(qualified)           / NULLIF(COUNT(*),0) * 100, 1)        AS lead_to_qual_pct,
    ROUND(SUM(demo_completed)      / NULLIF(SUM(qualified),0) * 100, 1)  AS qual_to_demo_pct,
    ROUND(SUM(proposal_sent)       / NULLIF(SUM(demo_completed),0) * 100,1) AS demo_to_prop_pct,
    ROUND(SUM(CASE WHEN final_stage='Closed Won' THEN 1 ELSE 0 END) /
          NULLIF(SUM(proposal_sent),0) * 100, 1)                         AS prop_to_close_pct,
    ROUND(SUM(CASE WHEN final_stage='Closed Won' THEN 1 ELSE 0 END) /
          NULLIF(COUNT(*),0) * 100, 1)                                   AS end_to_end_pct
FROM lead_funnel_history
GROUP BY lead_source
ORDER BY end_to_end_pct DESC;

-- SECTION 3: Post-proposal stall analysis
-- Deals that reached Proposal Sent but didn't close within 14 days
SELECT
    deal_id,
    deal_name,
    lead_source,
    rep_name,
    proposal_sent_date,
    DATEDIFF(CURDATE(), proposal_sent_date) AS days_since_proposal,
    final_stage,
    CASE
        WHEN DATEDIFF(CURDATE(), proposal_sent_date) > 21 AND final_stage = 'Proposal Sent'
            THEN 'HIGH RISK — Stalled > 21 days'
        WHEN DATEDIFF(CURDATE(), proposal_sent_date) BETWEEN 14 AND 21 AND final_stage = 'Proposal Sent'
            THEN 'WATCH — Stalled 14–21 days'
        ELSE 'Normal'
    END AS stall_status
FROM crm_deals
WHERE proposal_sent = 1
  AND final_stage NOT IN ('Closed Won', 'Closed Lost')
ORDER BY days_since_proposal DESC;
