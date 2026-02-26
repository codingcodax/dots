---
description: Generate a conventional commit message based on the changes in the current git diff.
agent: plan
model: google/gemini-flash-lite-latest
---

Here are my code changes:
!`git diff`

Optional context about the task or issue:

You are an expert programmer writing a **Conventional Commit** message based on the following code diff and optional task context.

---

## 1. Detect Scope from File Paths

Check each file path in the `git diff` and assign the scope using these rules (first match wins):

1. `/components/ui/*` → `ui`
2. `/components/*` (except `/components/ui`) → `components`
3. `/pages/*` → `pages`
4. `/hooks/*` → `hooks`
5. `/utils/*` → `utils`
6. `/lib/*` → `lib`
7. `/helpers/*` → `helpers`
8. `/layout.ts` → `layout`
9. `/loading.ts` → `loading`
10. `/api/*` or `/server/api/*` → `api`
11. `/server/trpc/*` or files named `*.trpc.ts` → `trpc`
12. `/db/*` or Drizzle schema tables → `db`
13. Files named `schema.ts` → `schema`
14. Files named `actions.ts` → `actions`
15. Tailwind config or `/styles/*` → `styles`
16. Theme files or dark mode logic → `theme`
17. `/icons/*` or SVG changes → `icons`
18. Animation files → `animations`
19. Zustand, Redux, or React context store → `store`
20. Zod schemas or validators → `validation`
21. Config files like `next.config.*`, eslint, prettier → `config`
22. `.env` changes → `env`
23. `.github/*` or CI workflow changes → `ci`
24. Analytics/tracking integration → `analytics`
25. Unit/integration test files (`*.test.*`) → `tests`
26. End-to-end test files → `e2e`
27. Static markdown/data/CMS content → `content`
28. Documentation files → `docs`
29. Performance optimizations → `perf`
30. SEO/meta updates → `seo`
31. `*.d.ts` files or files whose only modifications are TypeScript type changes → `types`
32. `package.json` script/name changes (non-dependencies) → scope `packaging`, type `chore`
33. `package.json` dependency changes → scope `deps`, type `chore`

If multiple scopes apply, select the most specific directory match.

---

## 2. Commit Type Rules

- If scope is `packaging`, `deps`, `config`, `ci`, or `env` → type: `chore`
- If scope is `tests` or `e2e` → type: `test`
- If scope is `docs` or `content` → type: `docs`
- If scope is `perf` or `seo` → type: `perf`
- Otherwise, determine the type based on changes: `feat` (new features), `fix` (bug fixes), `refactor` (code restructure), `style` (formatting, no code change)

---

## 3. Special Cases

- Detect if there are any BREAKING CHANGES in the diff. If so, add `!` after the type and add a `BREAKING CHANGE:` section in the body.
- If no meaningful changes are detected, generate a fallback message like "chore: update dependencies" or request user input.

---

## 4. Style and Formatting Rules

- Format:

```
{type}({scope}): {short-summary}

- {bullet1}

- {bullet2}
```

- Short summary: lowercase, imperative mood, max 50 characters ideally, max 72 characters allowed
- Scope: lowercase kebab-case only
- Bullets: use lowercase kebab-case for components, hooks, utils, and functions mentioned; describe WHAT and WHY, not HOW
- Do not add extra prose or greetings
- Wrap the body paragraphs to a max of 72 characters per line

---

## 5. Use Provided Context

Incorporate the optional task or issue summary if provided to add clarity to the commit message body regarding WHY the changes were made.

---

## 6. Output Instructions

Return only the commit message in a fenced code block. No explanations or additional text.

**IMPORTANT**: Your response must contain ONLY the commit message in a code fence. Do not include any reasoning, thinking process, or explanations. Start your response directly with the opening code fence (```).

Generate the commit message now based on the rules above.
