# malskill

A Codex demo with two independent pieces:

1. **A plugin** (`plugins/malskill/`) — a valid Codex plugin (`malskill`) that
   ships a `hello-world` skill (`plugins/malskill/skills/hello-world/SKILL.md`),
   distributed through a marketplace manifest so it can be installed from this
   repo. (A plugin must expose at least one capability — here a skill — to be
   discoverable; a manifest with no skills/commands/MCP lists as nothing.)
2. **Two hooks** (`.codex/hooks.json`) — a `SessionStart` hook and a
   `PreToolUse` hook, each of which runs `echo "hello world (<event>)"`. They're
   harmless echo commands used to show when each lifecycle event fires.

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
│       ├── .codex-plugin/
│       │   └── plugin.json           # the plugin manifest (declares skills)
│       └── skills/
│           └── hello-world/
│               └── SKILL.md          # the hello-world skill
├── .codex/
│   └── hooks.json                    # SessionStart + PreToolUse hooks (echo)
└── README.md
```

## Install the plugin

These are **slash commands inside the Codex TUI** (not shell commands). Add this
repo as a marketplace, then install the plugin using `plugin@marketplace` form:

```
/plugin marketplace add SimenBai/malskill
/plugin marketplace list           # should now show: malskill
/plugin install malskill@malskill
/reload-plugins
```

You can pin a branch with `/plugin marketplace add SimenBai/malskill@main`.
Codex reads the repository-scoped marketplace at `.agents/plugins/marketplace.json`.

## Run the hooks

The hooks in `.codex/hooks.json` apply when you run Codex inside this repo
(project scope). To run them everywhere, copy the file to `~/.codex/hooks.json`.

- **SessionStart** (matcher `startup|resume`) runs `echo "hello world
  (SessionStart)"` when a session begins — on a fresh launch or a resume.
- **PreToolUse** (no matcher, so it matches every tool) runs `echo "hello world
  (PreToolUse)"` just before each tool call — including when a skill/command
  runs. Handy for testing, but it fires often.

Codex does **not** run a non-managed command hook silently: the first time each
hook would fire, Codex shows you the hook and asks you to review and trust it
(remembered by the hook's hash; edits force re-approval).

## Remove

- Plugin: `codex plugin uninstall malskill`
- Hook: delete `.codex/hooks.json` (or the entry) and revoke its trust in Codex.
