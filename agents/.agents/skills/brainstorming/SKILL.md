---
name: brainstorming
description: >
  Use for shaping features, diagnosing problems, surfacing missing requirements,
  and turning rough ideas into implementation-ready plans before building.
  Best for plan mode and other read-first workflows.
---

# Brainstorming

Turn rough ideas, bugs, and partial requests into clear implementation-ready plans.

This skill is for **thinking before building**. Use it when the request is incomplete, when trade-offs matter, when edge cases may be easy to miss, or when the user wants a safer plan before implementation.

## Goals

- Clarify the real problem.
- Surface missing constraints and hidden edge cases.
- Recommend a sensible approach with trade-offs.
- Produce a plan the build agent can execute.
- Add a manual test flow when the change is large, risky, or user-facing.

## Best Fit

Use this skill when:

- Designing a new feature or component.
- Changing behavior in an existing flow.
- Investigating a bug or confusing product issue.
- Reviewing a rough implementation idea for gaps.
- Converting a vague request into an execution plan.

Do **not** use this skill for:

- Direct implementation.
- Writing or editing code.
- Running scripts or making commits.
- Purely mechanical requests that are already fully specified.

## Working Style

- Be collaborative, but efficient.
- Ask only the minimum number of questions needed.
- Prefer grouped questions over one-by-one questioning.
- Organize questions into small logical sets.
- Tag each question as **Recommended** or **Optional**.
- Use multiple choice when it reduces effort for the user.
- If there is enough context, stop asking questions and move to recommendations.
- Make reasonable assumptions when the risk is low, and state them clearly.
- Do not block on tiny unknowns.

## First Step

Before proposing anything:

1. Restate the request in one or two sentences.
2. Classify the task as one of these:
   - **Feature**
   - **Bug / issue**
   - **Refactor / cleanup**
   - **UX / behavior change**
   - **Unknown / mixed**
3. Identify what is still missing.
4. Decide whether you need clarification or can proceed with assumptions.

## Discovery Rules

Focus on the smallest set of missing details that would change the solution.

Typical areas to check:

- Goal and success criteria.
- User experience expectations.
- Data shape, validation, and empty/loading/error states.
- Existing constraints from the current codebase.
- Edge cases and regressions.
- Performance, accessibility, and SEO when relevant.
- Analytics, permissions, and localization when relevant.
- Testing expectations.

For front-end work, pay special attention to:

- Loading, empty, error, and success states.
- Mobile and responsive behavior.
- Accessibility and keyboard interaction.
- Server/client boundaries in Next.js.
- Type safety and form validation.
- Styling impact and component reuse.

## Question Strategy

Ask questions in **grouped batches**, not as a long chain of single-message follow-ups.

Rules:

- Keep each batch small and focused.
- Split questions by topic when helpful, for example: product intent, UX behavior, technical constraints, and validation/testing.
- Mark each item as **Recommended** when it blocks the next design decision.
- Mark each item as **Optional** when it improves completeness but does not block planning.
- If only one answer is truly blocking progress, ask only that subset first.
- If multiple decisions can be made in parallel, group them into one discovery message.

Example grouping structure:

- **Recommended**: questions needed to unblock architecture or behavior decisions.
- **Optional**: edge cases, future-proofing, polish, analytics, or non-critical preferences.

## Two Operating Modes

### 1. Feature Mode

Use when the user wants to build or change functionality.

Process:

1. Clarify missing requirements.
2. Present grouped discovery questions when needed.
3. Propose 2-3 approaches with trade-offs.
4. Recommend one approach and explain why.
5. List edge cases, risks, and affected areas.
6. Produce a detailed implementation plan.
7. Add a manual test flow if the change is non-trivial.

### 2. Problem Mode

Use when the user reports a bug, weird behavior, or uncertainty.

Process:

1. Restate the observed problem.
2. List the most likely causes.
3. Identify what evidence is missing.
4. Ask only the highest-value grouped questions needed to diagnose the issue.
5. Suggest a short investigation plan.
6. If enough is known, produce a fix plan.
7. Add regression checks and a manual test flow.

Do not force feature-planning language onto a bug report. Diagnose first, then plan.

## Approach Exploration

When multiple approaches are plausible:

- Propose 2-3 options.
- Keep each option short.
- Compare them on complexity, risk, maintainability, and UX impact.
- Lead with the recommended option.
- Avoid fake neutrality; make a call.

## Output Contract

When you have enough information, produce the result in this structure:

## Summary

- What we are solving.
- Recommended direction.

## Assumptions

- Explicit assumptions being made.

## Missing Details

- Only include if they materially affect the solution.
- If useful, group them as **Recommended** and **Optional**.

## Risks and Edge Cases

- Important scenarios to watch.

## Plan

1. Step-by-step implementation plan.
2. Mention likely files or areas affected when reasonably inferable.
3. Call out validation, error handling, and regression concerns.

## Verification

- Scripts to run after implementation, for example `typecheck`, `lint`, `fix`, tests.
- Specific things to watch during review.
- Mention any area the implementer may struggle with or should treat carefully.

## Test Flow

Include only when the change is large, user-facing, stateful, or easy to break.
Provide a concise manual flow with realistic scenarios.

## Constraints

- Never write code unless the user explicitly asks for code.
- Never auto-commit.
- Never auto-run implementation steps.
- Never pretend uncertainty does not exist; state assumptions clearly.
- Do not ask repetitive or low-value questions.
- Do not overwhelm the user with giant design documents unless requested.
- Do not require documentation files by default.
- Keep answers structured and practical.

## Handoff

If the user wants to continue, end with an implementation-ready plan that another agent or mode can execute.
The result should be good enough for a follow-up like: "Proceed with the plan. Run typecheck and lint/fix after implementation, and tell me if anything was tricky or risky."
