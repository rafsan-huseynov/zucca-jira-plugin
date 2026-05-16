---
name: jira-sprint-reporting
description: |
  Generates sprint reports and summaries from Jira data.
  Use when user asks to "show my sprint progress", "how is the sprint going",
  "sprint summary", "what's left in the sprint", "sprint velocity",
  "how many issues are done this sprint", "team workload this sprint",
  or "sprint status report".
license: MIT
metadata:
  author: Rafsan Huseynov
  version: "1.0"
cowork.category: "Project Management"
cowork.icon: DataBarVertical
---

# Jira Sprint Reporting

## What This Skill Does

Generates sprint status reports, progress summaries, and workload breakdowns
from Jira project data.

## Available Tools

- `searchJiraIssuesUsingJql` — Search issues using JQL queries
- `getJiraIssue` — Get full details of a specific issue
- `getVisibleJiraProjects` — List available projects

## Workflows

### Sprint Progress Summary

1. Use `searchJiraIssuesUsingJql` with JQL: `sprint in openSprints() AND project = "CSA"`
2. Group results by status (To Do, In Progress, Done)
3. Calculate completion percentage
4. Present as a summary with counts and percentage

### Team Workload

1. Use `searchJiraIssuesUsingJql` with JQL: `sprint in openSprints() AND project = "CSA" AND status != Done`
2. Group results by assignee
3. Show how many open issues each person has

### What's Left in the Sprint

1. Use `searchJiraIssuesUsingJql` with JQL: `sprint in openSprints() AND project = "CSA" AND status != Done ORDER BY priority DESC`
2. Present remaining issues sorted by priority

## Output Format

**Sprint Progress:**
- Total issues: 10
- Done: 4 (40%)
- In Progress: 3 (30%)
- To Do: 3 (30%)

**Remaining by Priority:**

| Key | Summary | Priority | Assignee |
|-----|---------|----------|----------|
| CSA-3 | Create a custom copilot agent | Highest | Zucca Huseynov |
| CSA-4 | Agent Design & Planning | Medium | Zucca Huseynov |