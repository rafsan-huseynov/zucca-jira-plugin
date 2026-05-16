---
name: jira-time-tracking
description: |
  Logs and tracks time spent on Jira issues.
  Use when user asks to "log time", "track my hours", "add time to CSA-3",
  "how much time was logged", "log 2 hours on CSA-5",
  "record time spent", "timesheet", "time entry",
  "I worked 3 hours on CSA-2", or "update my time log".
license: MIT
metadata:
  author: Rafsan Huseynov
  version: "1.0"
cowork.category: "Project Management"
cowork.icon: Clock
---

# Jira Time Tracking

## What This Skill Does

Logs time entries on Jira issues and retrieves time tracking information.

## Available Tools

- `addWorklogToJiraIssue` — Log time spent on an issue
- `getJiraIssue` — Get issue details including time tracking info
- `searchJiraIssuesUsingJql` — Search for issues to log time against

## Workflows

### Log Time on an Issue

1. Parse the user's request for: issue key, time spent, and optional description
2. If issue key is missing, ask the user which issue
3. Use `addWorklogToJiraIssue` with:
   - Issue key (e.g., CSA-3)
   - Time spent in Jira format (e.g., "2h", "30m", "1h 30m")
   - Optional comment describing the work done
4. Confirm the time was logged

### Check Time Logged on an Issue

1. Use `getJiraIssue` to retrieve the issue
2. Look at the time tracking fields: timeSpent, remainingEstimate, originalEstimate
3. Present a summary of time logged vs estimated

## Time Format

Jira accepts these time formats:
- "2h" — 2 hours
- "30m" — 30 minutes
- "1h 30m" — 1 hour 30 minutes
- "1d" — 1 day (usually 8 hours)
- "1w" — 1 week (usually 5 days)

## Output Format

When confirming time logged:

"Logged 2h on CSA-3 (Create a custom copilot agent). Comment: Worked on agent configuration."

When showing time summary:

| Field | Value |
|-------|-------|
| Original Estimate | 8h |
| Time Spent | 3h 30m |
| Remaining | 4h 30m |