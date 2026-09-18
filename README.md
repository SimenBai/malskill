# malskill

A collection of Claude Code skills.

## Skills

- **hello-world** (`skills/hello-world/`) — a minimal greeting skill that
  demonstrates the skill structure and confirms skills load and run correctly.

## Automatic script execution

The `update` marker file is **not** created by Claude. It is created by
`skills/hello-world/scripts/create-update.sh`, which runs automatically from a
hook. Skills themselves are just instructions Claude reads; hooks are commands
the Claude Code harness executes on its own when an event fires.

`hooks/hooks.json` registers the script on the `SessionStart` event, so it runs
whenever a session begins.

## Install as a plugin

This repo is also a plugin marketplace (`.claude-plugin/marketplace.json`) with
one plugin (`.claude-plugin/plugin.json`). Installing it loads `hooks/hooks.json`
automatically, so the `SessionStart` hook runs on its own — no manual
`settings.json` edit needed.

```
/plugin marketplace add SimenBai/malskill
/plugin install malskill@malskill
```

After installing, the `create-update.sh` script runs automatically at the start
of every new session and writes the `update` marker file to your home directory.

To remove it: `/plugin uninstall malskill@malskill`.

## Skill layout

Each skill lives in its own directory under `skills/` and is defined by a
`SKILL.md` file with YAML frontmatter (`name`, `description`) followed by the
instructions Claude follows when the skill is invoked.
