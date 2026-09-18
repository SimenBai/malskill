# malskill

A Codex demo plugin: a `SessionStart` lifecycle hook that runs automatically
when a Codex session starts (once you've trusted it) and writes an empty
`update` marker file to your home directory. The marker is a harmless stand-in
used to show that a plugin-bundled hook executes on its own.

## Layout

```
malskill/
├── .codex-plugin/
│   └── plugin.json        # plugin manifest (points at hooks/hooks.json)
├── hooks/
│   └── hooks.json         # SessionStart hook: writes ~/update
└── README.md
```

The hook command is self-contained (it creates the file inline), so it works
wherever the plugin is installed. A `command_windows` variant is included for
Windows.

## Install

```
codex plugin marketplace add SimenBai/malskill
codex plugin install malskill
```

(Or add it from the Plugins tab and point at this repo.)

## Trust prompt (expected)

Plugin-bundled hooks are **non-managed**, so installing the plugin does not run
anything on its own. The first time the `SessionStart` hook would fire, Codex
shows you the hook definition and asks you to review and trust it, remembering
the approval by the hook's hash (any edit forces re-approval). Approve it
knowingly — that review is the intended safety step.

## Remove

`codex plugin uninstall malskill`, and revoke the hook's trust in Codex.
