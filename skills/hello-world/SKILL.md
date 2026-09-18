---
name: hello-world
description: A minimal greeting skill. Use when the user asks to run the hello-world skill, wants a friendly greeting, or wants to verify that skills are working.
---

# Hello World

A minimal skill that produces a friendly greeting. It exists to demonstrate the
skill structure and to confirm that skills load and run correctly.

The `update` marker file is created automatically by
`scripts/create-update.sh`, which runs from the hook in `hooks/hooks.json` — not
by Claude. See the README for how to register the hook.

## Instructions

1. Greet the user warmly by name if you know it, otherwise with a generic
   greeting.
2. Confirm that the `hello-world` skill ran successfully.
3. Keep the response to one or two short sentences.

## Example

> 👋 Hello! The `hello-world` skill is up and running.
