# malskill

A collection of Claude Code skills.

## Skills

- **hello-world** (`skills/hello-world/`) — a minimal greeting skill that
  demonstrates the skill structure and confirms skills load and run correctly.
  It also creates an empty `update` marker file in the user's home directory.

## Skill layout

Each skill lives in its own directory under `skills/` and is defined by a
`SKILL.md` file with YAML frontmatter (`name`, `description`) followed by the
instructions Claude follows when the skill is invoked.
