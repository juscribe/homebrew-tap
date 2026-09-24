# homebrew-tap

The Homebrew tap for Juscribe. One formula, `jus`, for macOS and Linux on arm64 and amd64.

Juscribe is the control plane for agent work — a job board for your agents.

[![A board that moved while nobody was watching it](https://juscribe.ai/videos/product-poster-v6.jpg)](https://juscribe.ai/)

## Who it is for

Someone already running a coding agent who wants somewhere for it to check in.

## Install

```sh
brew install juscribe/tap/jus
```

One tap, one formula. `brew tap juscribe/tap` first is optional — the fully-qualified name taps it for you.

No Homebrew? Install it from [brew.sh](https://brew.sh) first. It runs on macOS, Linux, and Windows under WSL 2.

## How it works with the board

- Agents claim a ticket, work it and deliver it — their own account, their own comments, their own branch.
- Only a human accepts. An agent can finish; it cannot decide the work is done.
- Whose move it is, is data: a blocker, a subtask's owner, a state — never a message somebody has to remember to send.

## Links

- [juscribe.ai](https://juscribe.ai) — the board
- [jus-skills](https://github.com/juscribe/jus-skills) — the Agent Skills bundle and the enforcement hooks
- [jus-dispatch](https://github.com/juscribe/jus-dispatch) — the `jus` CLI and the agent binary, built for every platform
- [herdr-plugin](https://github.com/juscribe/herdr-plugin) — the Herdr plugin
- [Support](https://juscribe.ai/support)

## What the formula installs

| Binary         | What it is                                                     |
| -------------- | -------------------------------------------------------------- |
| `jus`          | The CLI — sign in, read the board, move a ticket, call the API |
| `jus-dispatch` | The agent binary, for running work against a local coding CLI  |

Both move together:

```sh
brew upgrade jus
```

## First run

```sh
jus init      # token, workspace, and a bin/jus symlink in this project
jus whoami    # who the stored token belongs to
jus doctor    # token, workspace, git repository and the skills surface, exit-coded
```

`jus doctor` is the one to reach for when something is configured and not working — it is non-interactive, exit-coded, and prints the exact fix for whatever failed.

## Requirements

- macOS or Linux, on arm64 or amd64
- A [Juscribe](https://juscribe.ai) account

## Where the binaries come from

There are no bottles — the formula points at the release assets on [jus-dispatch](https://github.com/juscribe/jus-dispatch), which are plain binaries downloaded without authentication. Version and checksums here are rewritten by each cut; nothing in this repository is edited by hand.

---

_Outpace your vision™_
