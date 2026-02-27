---
name: fetch-source
description: >
  Fetch source code for npm packages, Python packages, Rust crates, or GitHub
  repos to understand their implementation. Use when you need to explore a
  library's internals.
---

# Fetch Source Code

Use `opensrc` to download and explore package source code.

## Commands

```bash
bunx --bun opensrc <package>           # bun package (e.g., bunx --bun opensrc zod)
bunx --bun opensrc pypi:<package>      # Python package (e.g., bunx --bun opensrc pypi:requests)
bunx --bun opensrc crates:<package>    # Rust crate (e.g., bunx --bun opensrc crates:serde)
bunx --bun opensrc <owner>/<repo>      # GitHub repo (e.g., bunx --bun opensrc vercel/ai)
```

## Rules

- Always run in `/tmp` to avoid cluttering working directory
- Use when you need to understand library internals, not just API surface
