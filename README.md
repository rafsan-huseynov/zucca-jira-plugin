# Copilot Cowork Jira Plugin

A Copilot Cowork plugin that connects to Jira Cloud with full CRUD access. Search, create, update, transition, comment on, and log time against Jira issues from natural language prompts inside Cowork.

The built in Jira connector in Microsoft 365 Copilot is read only. This plugin gives you full read and write access.

## What's Inside

| File | Purpose |
|------|---------|
| `skills/jira-issue-management/` | Search, create, update, transition, comment on issues |
| `skills/jira-sprint-reporting/` | Sprint progress summaries and team workload |
| `skills/jira-time-tracking/` | Log time and track hours |
| `manifest.json` | M365 app manifest (registers the plugin) |
| `start.sh` | Starts the MCP server from .env |
| `build.sh` | Packages the plugin into a zip |
| `.env.example` | Template for required environment variables |

## Architecture

    You type a prompt in Cowork
           ↓
    Cowork reads the SKILL.md (knows what to do)
           ↓
    Cowork calls the MCP connector
           ↓
    MCP server (mcp-atlassian) talks to Jira Cloud
           ↓
    Cowork shows you the result

## Prerequisites

- Microsoft 365 Copilot license
- Access to Copilot Cowork (available through the Frontier preview program)
- Admin access to Microsoft 365 Admin Center
- Jira Cloud site (free tier works)
- Jira API token (free)
- Python 3.10+
- ngrok account (free tier)
- ImageMagick (for creating placeholder icons)

## Quick Start

### 1. Clone and configure

    git clone https://github.com/rafsan-huseynov/copilot-cowork-jira-plugin.git
    cd copilot-cowork-jira-plugin
    cp .env.example .env

Edit `.env` with your values:

    JIRA_URL=https://your-site.atlassian.net
    JIRA_USERNAME=your-email@example.com
    JIRA_TOKEN=your-api-token
    NGROK_URL=https://your-ngrok-url.ngrok-free.app

### 2. Install dependencies

    brew install pipx ngrok imagemagick
    pipx install mcp-atlassian

### 3. Run

Open three terminal tabs:

**Tab 1 (MCP Server):**

    ./start.sh

**Tab 2 (ngrok):**

    ngrok http 8000

Copy the ngrok URL and update `NGROK_URL` in `.env`.

**Tab 3 (Build):**

    ./build.sh

### 4. Upload the plugin to Microsoft 365

1. Go to **https://admin.microsoft.com**
2. Navigate to **Agents** in the left sidebar
3. Click **All agents**
4. Find the **Export** button area and click the **three dots** (...)
5. Click **+ Add agent**
6. Upload your `zucca-jira-plugin.zip` file
7. Wait for the upload to complete

### 5. Connect the plugin in Copilot Cowork

1. Open **Copilot Cowork** at https://m365.cloud.microsoft
2. Click the **+** icon
3. Select **Manage plugins**
4. Select **Browse plugins**
5. Find the plugin in the list
6. Click **Connect**
7. Toggle the plugin **ON**
8. Start a new conversation and try: "Find all issues in project [your project name]"

## Example Prompts

**Issue Management:**
- "Find all issues in project CSA"
- "Create a new task in project CSA: Deploy AI agent to production with priority High"
- "Move CSA-4 to In Progress"
- "Add a comment to CSA-2 saying review is scheduled for Monday"

**Sprint Reporting:**
- "Show me the sprint progress for project CSA"
- "What's left in the current sprint? Sort by priority."

**Time Tracking:**
- "Log 2 hours on CSA-3 for agent configuration work"
- "How much time has been logged on CSA-3?"

**Data Visualization:**
- "Show me a pie chart of all issues grouped by status"
- "Analyze project CSA and give me a dashboard with status breakdown, priority distribution, and workload by assignee. Use charts."

## Production Deployment

For production, replace the local MCP server and ngrok with:
- **Atlassian Rovo MCP Server** (cloud hosted, OAuth 2.1) or
- **Azure Container Apps** (self hosted)

Update `manifest.json` to use `OAuthPluginVault` for authentication.

## Video Walkthrough

Full video: https://youtu.be/ZvFaib-oA0M?si=_Fa9gJF34-341Nll

## Author

**Rafsan Huseynov** | AI Solutions Architect | Microsoft MVP
- YouTube: [@rafsanhuseynov](https://youtube.com/@rafsanhuseynov)
- LinkedIn: [rafsanhuseynov](https://linkedin.com/in/rafsanhuseynov)

## License

MIT
