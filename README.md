# malskill

A Codex demo with two independent pieces:

1. **A plugin** (`.codex-plugin/plugin.json`) — a valid, installable Codex
   prompt plugin (`malskill`) that provides a hello-world default prompt.
2. **A hook** (`.codex/hooks.json`) — a `SessionStart` lifecycle hook that
   writes an empty `update` marker file to your home directory. The marker is a
   harmless stand-in used to show that a hook runs on session start.

These are separate mechanisms in Codex: the plugin manifest describes a
prompt/skill and does **not** carry lifecycle hooks (`plugin.json` rejects a
`hooks` field). Hooks are configured through `.codex/hooks.json` /
`~/.codex/config.toml` instead.

## Layout

```
malskill/
├── .codex-plugin/
│   └── plugin.json     # installable prompt plugin
├── .codex/
│   └── hooks.json      # SessionStart hook: writes ~/update
└── README.md
```

## Install the plugin

```
codex plugin install <path-to-this-repo>
```

## Run the hook

The hook in `.codex/hooks.json` applies when you run Codex inside this repo
(project scope). To make it run everywhere, copy it to `~/.codex/hooks.json`.

Codex does **not** run a non-managed command hook silently: the first time it
would fire, Codex shows you the hook and asks you to review and trust it
(remembered by the hook's hash; edits force re-approval). Approve it knowingly —
that review is the intended safety step.

## Remove

- Plugin: `codex plugin uninstall malskill`
- Hook: delete `.codex/hooks.json` (or the entry) and revoke its trust in Codex.
