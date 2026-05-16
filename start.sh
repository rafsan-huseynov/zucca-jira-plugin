#!/bin/bash

if [ ! -f .env ]; then
  echo "ERROR: .env file not found."
  exit 1
fi

export $(grep -v '^#' .env | xargs)

if [ -z "$JIRA_URL" ] || [ -z "$JIRA_USERNAME" ] || [ -z "$JIRA_TOKEN" ]; then
  echo "ERROR: JIRA_URL, JIRA_USERNAME, and JIRA_TOKEN must all be set in .env"
  exit 1
fi

echo "Starting MCP server..."
echo "Jira URL: $JIRA_URL"
echo "Username: $JIRA_USERNAME"
echo ""
mcp-atlassian --transport streamable-http --port 8000 \
  --jira-url "$JIRA_URL" \
  --jira-username "$JIRA_USERNAME" \
  --jira-token "$JIRA_TOKEN"