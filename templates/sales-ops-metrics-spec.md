# Sales Operations Metrics Specification

## Revenue Metrics

| Metric | Definition | Formula | Frequency |
|---|---|---|---|
| Revenue Closed | Total deal value for Closed Won deals | SUM(final_close_amount) WHERE stage='Closed Won' | Weekly, Monthly |
| Pipeline Value | Total value of active deals | SUM(deal_amount) WHERE stage NOT IN (closed) | Weekly |
| Weighted Forecast | Pipeline value adjusted by stage probability | SUM(deal_amount * probability / 100) | Weekly |
| Avg Deal Value | Mean value of Closed Won deals | AVG(final_close_amount) WHERE stage='Closed Won' | Monthly |
| Avg Discount % | Mean discount from proposal to close | AVG((locked_proposal - close_amount) / locked_proposal * 100) | Monthly |

## Conversion Metrics

| Metric | Definition | Formula |
|---|---|---|
| Lead → Qualified Rate | % of leads that pass ICP filter | qualified / total_leads * 100 |
| Demo Conversion | % of qualified leads that complete a demo | demo_completed / qualified * 100 |
| Proposal Conversion | % of demos resulting in a proposal | proposal_sent / demo_completed * 100 |
| Win Rate | % of closed deals that are Won | closed_won / (closed_won + closed_lost) * 100 |
| Lead to Close Rate | % of all leads that reach Closed Won | closed_won / total_leads * 100 |

## Velocity Metrics

| Metric | Definition | Formula |
|---|---|---|
| Sales Cycle (days) | Days from lead creation to close date | AVG(DATEDIFF(close_date, lead_created_date)) WHERE stage='Closed Won' |
| Time to First Contact | Hours from lead creation to first logged activity | AVG(DATEDIFF(first_contact_timestamp, created_at)) |
| Stage Velocity | Days spent in each pipeline stage | AVG(DATEDIFF(exit_timestamp, entry_timestamp)) per stage |

## What "Good" Looks Like — Early-Stage EdTech B2B

| Metric | Watch | Target | Strong |
|---|---|---|---|
| Lead to Close Rate | < 5% | 8–12% | > 15% |
| Win Rate | < 25% | 30–40% | > 45% |
| Sales Cycle | > 45 days | 20–30 days | < 20 days |
| Avg Discount % | > 20% | < 10% | < 5% |
| Demo Conversion | < 50% | 60–70% | > 75% |
