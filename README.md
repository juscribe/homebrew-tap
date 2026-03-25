# Juscribe Homebrew Tap

Homebrew formulae for [Juscribe](https://juscribe.ai) tools.

## Installation

```sh
brew tap juscribe/tap
brew install juscribe/tap/jus
```

This installs:

- **`jus`** — the Juscribe CLI for project management, API interaction, and agent control
- **`jus-agent`** — the agent that connects [Juscribe](https://juscribe.ai) to your local AI agents

## Usage

```sh
# First-time setup
jus init

# Authenticate
jus login

# Check connection
jus whoami

# Start the agent
jus agent start

# API interaction
jus api GET '/workspaces/1/agent_state?panels=current,backlog'
```

## Upgrading

```sh
brew upgrade jus
```

The agent checks for updates on startup and will notify you when a newer version is available.

## Requirements

- macOS (Apple Silicon or Intel) or Linux (`amd64` or `arm64`)
- A [Juscribe](https://juscribe.ai) account

## Links

- [Juscribe](https://juscribe.ai)
- [`jus-agent` binary releases](https://github.com/juscribe/jus-agent/releases)
