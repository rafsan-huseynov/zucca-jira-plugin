---
name: jira-issue-management
description: |
  Manages Jira issues including searching, creating, updating, commenting, and transitioning.
  Use when user asks to "find my Jira tickets", "create a Jira issue", "update PROJ-123",
  "move ticket to Done", "search Jira for bugs", "what's assigned to me in Jira",
  "show my backlog", "add a comment to CSA-3", "log time on a ticket",
  "transition issue to In Progress", or "list Jira projects".
license: MIT
metadata:
  author: Rafsan Huseynov
  version: "1.0"
cowork.category: "Project Management"
cowork.icon: TaskListSquare
---

# Jira Issue Management

## What This Skill Does

Enables Cowork to search, create, update, comment on, and transition Jira issues
using the Atlassian MCP Server connector.

## Available Tools

Use these connector tools by name:

- `searchJiraIssuesUsingJql` — Search issues using JQL queries
- `getJiraIssue` — Get full details of an issue by key (e.g., CSA-3)
- `createJiraIssue` — Create a new issue in a project
- `editJiraIssue` — Update fields on an existing issue
- `transitionJiraIssue` — Move an issue through workflow states
- `addCommentToJiraIssue` — Add a comment to an issue
- `addWorklogToJiraIssue` — Log time spent on an issue
- `getTransitionsForJiraIssue` — List available workflow transitions
- `getVisibleJiraProjects` — List all Jira projects the user can access
- `getJiraProjectIssueTypesMetadata` — List issue types in a project
- `getJiraIssueTypeMetaWithFields` — Get required fields for creating an issue
- `lookupJiraAccountId` — Find a user's account ID by name or email

## Workflows

### Searching Issues

1. Ask the user for search criteria if not provided
2. Build a JQL query from the criteria
3. Use `searchJiraIssuesUsingJql` to find matching issues
4. Present results in a summary table

### Creating Issues

1. Use `getVisibleJiraProjects` to confirm the target project
2. Use `getJiraProjectIssueTypesMetadata` to get valid issue types
3. Use `getJiraIssueTypeMetaWithFields` to get required fields
4. Use `createJiraIssue` with all required fields populated
5. Confirm creation with the issue key

### Updating Issues

1. Use `getJiraIssue` to get current state
2. Use `editJiraIssue` to update the requested fields
3. For status changes, call `getTransitionsForJiraIssue` first
4. Then use `transitionJiraIssue` with the correct transition ID

### Adding Comments

1. Use `addCommentToJiraIssue` with the issue key and comment body
2. Confirm the comment was added

## JQL Quick Reference

- My open issues: `assignee = currentUser() AND status != Done`
- All issues in project: `project = CSA ORDER BY created DESC`
- By status: `project = CSA AND status = "In Progress"`
- Recently updated: `project = CSA AND updated >= -7d`
- Unassigned: `project = CSA AND assignee is EMPTY`
- Text search: `project = CSA AND text ~ "login"`

## Output Format

Present issue lists as a table:

| Key | Summary | Status | Assignee | Priority |
|-----|---------|--------|----------|----------|
| CSA-1 | Requirements Gathering | Done | Zucca Huseynov | Medium |
| CSA-3 | Create a custom copilot agent | In Progress | Zucca Huseynov | Highest |