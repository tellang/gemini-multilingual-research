# gemini-multilingual-research

Gemini CLI extension for multilingual, multi-source technical research.

## What it provides

- Gemini-native extension packaging
- bundled multilingual research skill
- reusable research commands
- optional subagents for collection, comparison, and writing

## Install

### From a local path

```bash
gemini extensions install /path/to/gemini-multilingual-research
```

### From GitHub

```bash
gemini extensions install https://github.com/tellang/gemini-multilingual-research --ref gemini-multilingual-research-v0.1.1
```

If installing from a GitHub Release archive, use the tagged release shipped for this extension.

## Commands

- `/research:quick-scan <topic>`
- `/research:full-report <topic>`
- `/research:compare-domains <topic A vs topic B>`

## Local development

```bash
gemini extensions link .
gemini extensions validate .
```

## Packaging

From the extension project root on Windows PowerShell:

```powershell
.\scripts\package.ps1 -Version 0.1.1
```

The script produces a self-contained zip archive in `release/` with `gemini-extension.json` at the archive root.
