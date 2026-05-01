# Baseline Audit — The Old Process

## Overview

Before the RevOps infrastructure was built, STEMpedia operated with process fragments rather than an integrated system. Each functional area — Sales, Operations, Service Delivery, and Finance — maintained its own records, coordinated through informal channels, and produced reports manually.

This document captures what the old process looked like, what risks it created, and what was being lost.

---

## Process State Before Build

### Lead Capture

| Old Method | Problem |
|---|---|
| Sales reps manually entered website leads into spreadsheets at the end of their day | 12–24 hour delay between enquiry and first contact |
| No standard field structure | Region, source, and segment captured inconsistently |
| Event and referral leads were entered even later — sometimes never | Lost leads with no record they ever existed |
| No SLA or response-time standard | No accountability for first contact speed |

### Pipeline Tracking

| Old Method | Problem |
|---|---|
| Shared Google Sheet with a "Stage" column updated manually | No enforcement of stage criteria — reps moved deals forward arbitrarily |
| No standard stage definitions | "Qualified" meant different things to different reps |
| No deal history | No audit trail of when or why a deal moved stages |
| Multiple versions of the spreadsheet existed | CEO review was based on whichever version was shared most recently |

### Team Handoffs

| Old Method | Problem |
|---|---|
| Sales rep sent WhatsApp message to delivery team when deal closed | Inconsistent information — sometimes just client name + deal value |
| Delivery team often re-contacted client to collect basic information | Duplicate effort; poor client experience |
| No acknowledgement system | Delivery team could miss a handoff message with no consequence |
| No confidentiality control | Commercial terms, pricing, and negotiation history sometimes visible to teams that didn't need them |

### Finance Coordination

| Old Method | Problem |
|---|---|
| Sales rep notified finance team via WhatsApp or email when deal closed | Invoice raised 24–72 hours after close — sometimes days later |
| No link between sales records and finance records | Monthly reconciliation required manual cross-referencing |
| No common deal identifier | Impossible to match a CRM deal to a Books invoice reliably |

### CEO Reporting

| Old Method | Problem |
|---|---|
| Weekly report assembled manually from spreadsheet + WhatsApp updates | 2–3 hours of prep time per week |
| Report was a point-in-time snapshot — stale by the time it was reviewed | No real-time view of pipeline health |
| Pipeline confidence was low | CEO frequently asked for verification of numbers before trusting them |
| Conversion and cycle time metrics did not exist | No understanding of where the funnel was leaking |

---

## What Was Being Lost

1. **Leads** — website enquiries were lost due to slow follow-up and no SLA enforcement
2. **Visibility** — pipeline reports were unreliable; leadership couldn't trust the numbers
3. **Time** — ~15 hours per week across Sales, Ops, and Finance spent on manual coordination and reporting
4. **Accountability** — no record of who owned what or when handoffs happened
5. **Insight** — no cohort, source, or stage data existed; decisions were based on intuition

---

## The Point

The problem was not lack of effort. The team worked hard. The problem was lack of system design. Once the infrastructure was built, the same team produced significantly better outcomes with less manual overhead.
