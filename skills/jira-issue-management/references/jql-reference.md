# JQL (Jira Query Language) Reference

## Basic Syntax

JQL queries follow the pattern: `field operator value`

## Common Fields

| Field | Description | Example |
|-------|-------------|---------|
| project | Project key | `project = CSA` |
| status | Issue status | `status = "In Progress"` |
| assignee | Assigned user | `assignee = currentUser()` |
| reporter | Issue creator | `reporter = currentUser()` |
| priority | Priority level | `priority = Highest` |
| type | Issue type | `type = Bug` |
| created | Creation date | `created >= -7d` |
| updated | Last updated | `updated >= -30d` |
| summary | Issue title | `summary ~ "login"` |
| text | Full text search | `text ~ "deployment"` |

## Operators

| Operator | Meaning | Example |
|----------|---------|---------|
| = | Equals | `status = Done` |
| != | Not equals | `status != Done` |
| ~ | Contains text | `summary ~ "bug"` |
| IN | In list | `status IN ("To Do", "In Progress")` |
| IS | Is value | `assignee IS EMPTY` |
| >= | Greater or equal | `created >= -7d` |

## Date Shortcuts

| Shortcut | Meaning |
|----------|---------|
| -1d | 1 day ago |
| -7d | 7 days ago |
| -30d | 30 days ago |
| startOfDay() | Start of today |
| startOfWeek() | Start of this week |
| startOfMonth() | Start of this month |

## Combining Conditions

- `AND` — both must be true
- `OR` — either can be true
- Use parentheses for grouping

## Ordering

Add `ORDER BY field ASC/DESC` at the end:
- `project = CSA ORDER BY created DESC`
- `project = CSA ORDER BY priority ASC, created DESC`