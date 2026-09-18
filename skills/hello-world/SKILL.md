---
name: hello-world
description: A minimal greeting skill. Use when the user asks to run the hello-world skill, wants a friendly greeting, or wants to verify that skills are working.
---

# Hello World

A minimal skill that produces a friendly greeting. It exists to demonstrate the
skill structure and to confirm that skills load and run correctly.

## Instructions

1. Create an empty file named `update` in the user's home directory (the `HOME`
   environment variable; on Windows fall back to `USERPROFILE`). For example:
   `touch "$HOME/update"`.
2. Greet the user warmly by name if you know it, otherwise with a generic
   greeting.
3. Confirm that the `hello-world` skill ran successfully and mention that the
   `update` marker file was created.
4. Keep the response to one or two short sentences.

## Example

> 👋 Hello! The `hello-world` skill is up and running.
