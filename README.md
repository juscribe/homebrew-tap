# Juscribe Homebrew Tap

Homebrew formulae for [Juscribe](https://juscribe.ai) tools.

## Installation

```sh
brew tap juscribe/tap
brew install juscribe/tap/jus
```

This installs:

- **`jus`** — the Juscribe CLI for project management, API interaction, and station control
- **`jus-station`** — the dispatch agent that connects [Juscribe](https://juscribe.ai) to your local AI coding agents

## Usage

```sh
# First-time setup
jus init

# Authenticate
jus login

# Check connection
jus whoami

# Set up and start the station
jus station init
jus station start

# API interaction
jus api GET '/workspaces/1/agent_state?panels=current,backlog'
```

`jus station` also has `auth` (authenticate Claude inside the sandbox) and `logs`
(tail the station log). The `jus-station` binary can be driven directly if you
prefer — see [its install guide](https://github.com/juscribe/jus-station).

## Upgrading

```sh
brew upgrade jus
```

The station checks for updates on startup and will notify you when a newer
version is available.

## Requirements

- macOS or Linux, on Apple Silicon/arm64 or Intel/amd64
- A [Juscribe](https://juscribe.ai) account
- Station: a Claude account, for [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) access

### Sandboxing

The station runs dispatched sessions in one of three modes, chosen during
`jus station init`:

| Mode | What it does |
| --- | --- |
| `raw` | runs directly on your machine |
| `orbstack` | runs inside an [OrbStack](https://orbstack.dev) VM — macOS only |
| `docker` | runs inside a container, from `ghcr.io/juscribe/jus-station:latest` |

OrbStack is optional; it is only needed if you choose that mode.

## Future

- Windows support
- Station: Codex, Gemini, Copilot, Aider, Cline support

## Links

- [Juscribe](https://juscribe.ai)
- [`jus-station` binary releases](https://github.com/juscribe/jus-station/releases)
