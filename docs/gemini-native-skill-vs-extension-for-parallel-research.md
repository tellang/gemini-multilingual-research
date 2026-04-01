# Gemini-native skill vs extension for parallel research

_Researched on April 2, 2026._

## What this document is answering

This document answers the Gemini-native version of the question:

> For a workflow that Gemini itself should use directly, is a **Gemini skill** or a **Gemini extension** the right packaging for multilingual parallel research?

The earlier Claude-side interpretation was the wrong scope. This note focuses on **Gemini-native artifacts** only.

## Short answer

### If you mean a Gemini-native **skill**

- **Good for**: reusable research instructions, checklist-style workflow, domain glossary, source-quality rules, and output schema guidance.
- **Not ideal for**: reliable multi-worker orchestration, deterministic search fan-out, tool wiring, or hard guarantees about parallel execution.

### If you mean a Gemini-native **extension**

- **Better fit** for serious parallel research packaging.
- Use an extension when you need:
  - packaged tools or MCP integration
  - reusable commands
  - predictable invocation
  - richer automation surfaces than a Markdown skill alone

### Final verdict

For **multilingual parallel research**, a **Gemini extension is the better primary vehicle**.
A **Gemini skill can still be valuable inside that extension or alongside it**, but by itself it is too soft/LLM-mediated to be the main implementation surface for robust parallel research.

## Official Gemini CLI findings

## 1. Gemini skills are real, but they are instruction-first

Official Gemini CLI docs and CLI reference show that Gemini has native skill support:

- `gemini skills list`
- `gemini skills install <source>`
- `gemini skills link <path>`

The skills docs position skills as a way to extend Gemini CLI with:

- specialized expertise
- procedural workflows
- task-specific resources

That means Gemini skills are strong when the value is in:

- prompting structure
- research policy
- checklist discipline
- output formatting
- domain guidance

But that also means skills are fundamentally **instructional**, not a hard orchestration runtime.

## 2. Gemini extensions are the stronger packaging surface for automation

Official docs and CLI reference show Gemini extensions support:

- extension install / link / validate / update flows
- reusable packaged behavior
- deeper integration with Gemini CLI

An extension is the better fit when the workflow needs more than “read this SKILL.md and follow it.”

For parallel research, that matters because the real problem is not just knowing _how_ to research. The hard part is:

- coordinating repeated tool calls
- packaging helper commands
- managing MCP connectivity
- standardizing outputs
- making invocation predictable across environments

That is extension territory much more than skill territory.

## 3. Gemini subagents help specialization, but they do not replace extension-level packaging

Gemini CLI also has native subagents. Official docs say subagents provide:

- focused context
- specialized tools
- isolated context windows

This is useful for breaking work into:

- source collector
- comparer
- writer
- glossary builder

However, subagents still sit inside the Gemini runtime. They help specialization, but they do not by themselves solve:

- deterministic pipeline entrypoints
- project packaging
- reusable installation
- environment/tool bootstrapping

So for this use case, subagents are a **complement**, not the main packaging answer.

## 4. Trusted folders and policy constraints matter

Gemini CLI trusted-folder docs say an untrusted workspace can disable or restrict project-level behaviors, including:

- project settings
- MCP connectivity
- auto-approval behavior
- related local project features

That matters a lot for a research workflow that expects nontrivial tool access.

A plain Gemini skill is more vulnerable to these runtime/context assumptions, because much of its value depends on Gemini choosing to use it and having the expected tool environment available.

An extension still depends on trust and policy, but it gives you a more explicit installation/integration surface.

## 5. Headless mode is great for execution, but that favors extensions over skills for productionized pipelines

Official docs and the README show Gemini CLI supports headless automation:

- `gemini --prompt ...`
- `gemini --output-format json`
- `gemini --output-format stream-json`

This is excellent for automation.

But once you are automating, the question becomes:

> Do I want a loose Markdown instruction pack, or a more explicit packaged integration surface?

For parallel multilingual research, the answer is usually the latter.

## Local validation on this machine

The following was verified locally during research:

- `gemini --version` returned `0.36.0`
- `gemini --help` confirmed:
  - `--prompt`
  - `--output-format text|json|stream-json`
  - `gemini skills <command>`
  - `gemini extensions <command>`
- `Get-Command gemini` showed the current PowerShell environment wraps `gemini` in a function
- In this environment, `--prompt` is safer than `-p`
- `gemini --prompt 'Respond with OK only' --output-format json` succeeded and returned structured JSON

## Suitability by artifact type

## Option A — Gemini skill only

### Strengths

- easy to author
- good for reusable research instructions
- good for source-evaluation heuristics
- good for required output schema / checklist rules
- low implementation overhead

### Weaknesses

- activation is still more agent-mediated than command-like
- weak as the main vehicle for deterministic parallel orchestration
- does not by itself package custom tools or execution helpers
- less suitable when you need reproducible multi-step fan-out behavior

### Verdict

**Useful as a support layer, not sufficient as the main parallel-research implementation surface.**

## Option B — Gemini extension

### Strengths

- better packaging and install story
- more explicit runtime integration
- suitable for bundling commands / helpers / MCP-oriented behavior
- easier to make predictable across projects
- better base for “Gemini directly uses this” workflows

### Weaknesses

- more implementation overhead than a skill
- still subject to trust/policy/runtime constraints
- still needs good prompt design and possibly subagent decomposition

### Verdict

**Best primary choice for Gemini-native multilingual parallel research.**

## Recommended architecture for a Gemini-native version

If the goal is “Gemini itself should directly own this capability,” the best shape is:

1. **Gemini extension**
   - installable package
   - explicit entrypoints/commands
   - MCP/tool integration surface

2. **Gemini skill inside or alongside the extension**
   - research checklist
   - multilingual quality bar
   - output schema
   - citation and source-quality rules

3. **Optional Gemini subagents**
   - collector
   - comparer
   - writer
   - glossary builder

In other words:

- **Extension = productized capability**
- **Skill = reusable instruction layer**
- **Subagents = decomposition strategy**

## Concrete recommendation for this repo idea

If you want to build a Gemini-native version of `multilingual-research`, do **not** stop at a Gemini skill only.

Build:

- a **Gemini extension** as the primary artifact
- optionally ship a **Gemini skill** for the research protocol
- optionally define **Gemini subagents** for role separation

That combination is the one most likely to be appropriate for true multilingual, multi-source, quasi-parallel research.

## Bottom line

If the question is:

> “For Gemini itself, should this be a Gemini skill or a Gemini extension?”

then the answer is:

- **Skill only**: not enough for robust parallel research
- **Extension**: yes, this is the more appropriate Gemini-native surface
- **Best overall**: extension + optional skill + optional subagents

## Sources

- Gemini CLI GitHub README: <https://github.com/google-gemini/gemini-cli>
- Gemini CLI cheatsheet: <https://geminicli.com/docs/cli/cli-reference/>
- Gemini CLI agent skills: <https://geminicli.com/docs/cli/skills/>
- Gemini CLI subagents: <https://geminicli.com/docs/core/subagents/>
- Gemini CLI trusted folders: <https://geminicli.com/docs/cli/trusted-folders/>
- Gemini CLI configuration reference: <https://geminicli.com/docs/reference/configuration/>
- Gemini CLI quota and pricing: <https://geminicli.com/docs/resources/quota-and-pricing/>