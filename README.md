# Steel MCP Server

A Model Context Protocol (MCP) server for browser automation with Steel and Puppeteer.

It exposes browser automation, screenshots, session tools, and Steel quick actions over HTTP.

The MCP image is published to GHCR, so users can run it with Docker Compose without cloning the repo.

## Getting Started

### Quick Install Links

[<img src="https://img.shields.io/badge/Compose%20Only-111827?style=flat-square&label=Install%20Server&color=111827" alt="Compose only install">](#install)
[<img src="https://img.shields.io/badge/Codex-000000?style=flat-square&label=Add%20MCP&color=000000" alt="Add to Codex">](./docs.md)
[<img src="https://img.shields.io/badge/Claude%20Code-ffb000?style=flat-square&label=Add%20MCP&color=ffb000" alt="Add to Claude Code">](./docs.md)
[<img src="https://img.shields.io/badge/Claude%20Desktop-ff6b6b?style=flat-square&label=Add%20MCP&color=ff6b6b" alt="Add to Claude Desktop">](./docs.md)
[<img src="https://img.shields.io/badge/OpenCode-3b82f6?style=flat-square&label=Add%20MCP&color=3b82f6" alt="Add to OpenCode">](./docs.md)
[<img src="https://img.shields.io/badge/Antigravity-8b5cf6?style=flat-square&label=Add%20MCP&color=8b5cf6" alt="Add to Antigravity">](./docs.md)

## Install

First, start the bundled Steel Browser stack and MCP server:

```bash
docker compose up -d
```

The compose stack exposes:

- Steel Browser API: `http://localhost:3000`
- Steel Browser UI: `http://localhost:5171`
- MCP server: `http://localhost:8787/mcp`

If you want Docker-only usage without cloning the repo, download the compose file and pull the published MCP image:

```bash
curl -O https://raw.githubusercontent.com/rickicode/steel-browser-mcp/main/compose.yml
MCP_IMAGE=ghcr.io/rickicode/steel-browser-mcp:latest docker compose up -d
```

## Add MCP

Use this MCP URL:

```text
http://localhost:8787/mcp
```

Add it to your client config:

```json
{
  "mcpServers": {
    "steel-browser": {
      "type": "http",
      "url": "http://localhost:8787/mcp"
    }
  }
}
```

Make sure the Steel Browser stack is running before connecting.

For detailed setup, tool coverage, session management, and troubleshooting, see [docs.md](./docs.md).
