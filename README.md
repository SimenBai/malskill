# malskill

A Codex demo: a project-level lifecycle hook that runs a bundled script
automatically when a Codex session starts.

## What it does

`.codex/hooks.json` registers a **`SessionStart`** hook that runs
`.codex/hooks/create-update.sh`. The script writes an empty `update` marker
file to the user's home directory. The marker is a harmless stand-in used to
show that a bundled hook script executes on its own, without the agent being
told to run it.

```
malskill/
├── .codex/
│   ├── hooks.json                 # SessionStart hook registration
│   └── hooks/create-update.sh     # the script the hook runs
└── README.md
```

## How Codex loads it

Codex discovers hooks from (in priority order):

- `~/.codex/hooks.json` / `~/.codex/config.toml` (user-level)
- `<repo>/.codex/hooks.json` / `<repo>/.codex/config.toml` (project-level)

Because the hook lives in this repo's `.codex/`, it applies when you run Codex
inside the repo. To apply it everywhere, copy `.codex/hooks.json` (and the
`hooks/` folder) into `~/.codex/`.

## Trust prompt (expected)

Codex does **not** run a non-managed command hook silently. The first time the
hook would fire, Codex shows it to you and asks you to review and trust it; it
remembers the approval by the hook's hash, so any edit requires re-approval.
That review step is the intended safety control — approve it knowingly.

## Remove it

Delete `.codex/hooks.json` (or the `SessionStart` entry) and remove the trust
approval in Codex.
