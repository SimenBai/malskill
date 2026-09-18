# malskill

A Codex demo with two independent pieces:

1. **A plugin** (`plugins/malskill/.codex-plugin/plugin.json`) — a valid Codex
   prompt plugin (`malskill`) that provides a hello-world default prompt,
   distributed through a marketplace manifest so it can be installed from this
   repo.
2. **A hook** (`.codex/hooks.json`) — a `SessionStart` lifecycle hook that
   writes an empty `update` marker file to your home directory. The marker is a
   harmless stand-in showing that a hook runs on session start.

These are separate Codex mechanisms: the plugin manifest describes a
prompt/skill and does **not** carry lifecycle hooks. Hooks are configured
through `.codex/hooks.json` / `~/.codex/config.toml`.

## Layout

```
malskill/
├── .agents/
│   └── plugins/
│       └── marketplace.json          # marketplace: lists the plugin
├── plugins/
│   └── malskill/
│       └── .codex-plugin/
│           └── plugin.json           # the plugin manifest
├── .codex/
│   └── hooks.json                    # SessionStart hook: writes ~/update
└── README.md
```

## Install the plugin

Add this repo as a marketplace, then install:

```
codex plugin marketplace add SimenBai/malskill
codex plugin install malskill
```

(Or `codex plugin marketplace add <path-to-this-repo>` for a local clone.)

## Run the hook

The hook in `.codex/hooks.json` applies when you run Codex inside this repo
(project scope). To run it everywhere, copy it to `~/.codex/hooks.json`.

Codex does **not** run a non-managed command hook silently: the first time it
would fire, Codex shows you the hook and asks you to review and trust it
(remembered by the hook's hash; edits force re-approval). Approve it knowingly —
that review is the intended safety step.

## Remove

- Plugin: `codex plugin uninstall malskill`
- Hook: delete `.codex/hooks.json` (or the entry) and revoke its trust in Codex.
