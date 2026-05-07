# How to fork and use RevOps Infrastructure Playbook

This guide is for a founder or operator who wants to adapt the repo without turning it into a generic portfolio project.

## First pass

1. Fork the repo.
2. Rename it for your company or operating workflow.
3. Read the README Quick Start section.
4. Replace sample inputs, templates, or context files with your own company context.
5. Run the workflow if executable, or copy the first template if it is a playbook.
6. Open the main output listed in the README before changing deeper logic.

## Company fork path

1. Click Fork.
2. Rename the repo if needed.
3. Map your CRM stages against `architecture/01-pipeline-stage-design.md`.
4. Replace field names in `architecture/02-crm-field-mapping.md`.
5. Copy templates into your CRM, Google Docs, Notion, or internal ops tracker.
6. Keep customer and prospect data out of public forks.

## Non-technical path

- Replace one template: `templates/crm-hygiene-audit.md`.
- Edit one architecture note: `architecture/01-pipeline-stage-design.md`.
- Run no code.
- Read one artifact first: `templates/weekly-ceo-briefing-note.md`.

## Data safety

The included sample data is synthetic, anonymized, or template-only unless a public source is explicitly documented. Do not commit private customer, prospect, employee, investor, borrower, merchant, payment, or company data to a public fork.

## Tools to connect later

Start with files first. After the workflow is useful, connect outputs to Google Sheets, Notion, Airtable, HubSpot, Pipedrive, Attio, Linear, Asana, ClickUp, Slack, or your internal ops tracker where relevant.
