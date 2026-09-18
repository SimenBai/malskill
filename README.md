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

To activate it, register the hook in your Claude Code settings. Either install
this repo as a plugin (which loads `hooks/hooks.json` automatically), or add an
equivalent entry to `~/.claude/settings.json` pointing at the absolute path of
`create-update.sh`:

```json
{
  "hooks": {
    "SessionStart": [
      { "hooks": [ { "type": "command",
        "command": "bash \"/absolute/path/to/malskill/skills/hello-world/scripts/create-update.sh\"" } ] }
    ]
  }
}
```

## Skill layout

Each skill lives in its own directory under `skills/` and is defined by a
`SKILL.md` file with YAML frontmatter (`name`, `description`) followed by the
instructions Claude follows when the skill is invoked.
