# Automation Logic - Workflows and Deluge Functions

> Reference design with example fields, stages, and rules. Calibrate settings and validate them against the receiving team's workflow.

## Overview

The reference design uses two types of automation:

1. **Standard Zoho Workflows** - for simple, rule-based actions (field updates, email alerts, task assignments)
2. **Deluge Functions** - for conditional logic, cross-app communication, and field transformations

## Standard Workflows

| Automation | Trigger | Action |
|---|---|---|
| Lead Assignment | New lead created from webhook | Assign to available rep in rotation |
| First Response Alert | Lead uncontacted after 4 hours | Notify manager via email |
| Demo Reminder | Deal stage = Demo Scheduled, date T-24hrs | Send email to rep and prospect |
| Stale Deal Alert | No stage change in 7 days | Notify rep + flag for manager review |
| Closed Won Email | Stage changes to Closed Won | Auto-send thank you email to client |
| Lost Reason Required | Stage changes to Closed Lost | Block transition unless Lost Reason field is filled |

## Deluge Functions

### Proposal Amount Lock
**Trigger:** Deal stage changes to `Proposal Sent`
**Logic:** Copy `Proposal_Amount` → `Locked_Proposal_Amount` (read-only field). Log timestamp and user.
**Why:** Preserves a read-only proposal snapshot for review. Enables later comparison to final close amount for discount tracking.

### Deal Clone for Procurement/Inventory
**Trigger:** Deal stage changes to `Closed Won`
**Logic:** Create a new deal record in the Inventory & Procurement pipeline containing only delivery-relevant fields. Exclude pricing, negotiation history, and rep notes.
**Why:** Downstream teams need what is required to execute - not the commercial sensitivity of the deal.

### Zoho Books Invoice Trigger
**Trigger:** Deal stage changes to `Closed Won`
**Logic:** Create an invoice in Zoho Books with client name, deal amount, payment terms, and link to deal ID.
**Why:** Gives finance a draft and a source deal reference for its review.

### Stage Change Logger
**Trigger:** Any stage change in Deals module
**Logic:** Append to `Stage_Change_Log` multiline field: timestamp, previous stage, new stage, user, deal value at time of change.
**Why:** Captures a stage-change history for review. Useful for performance review, pattern analysis, and dispute resolution.
