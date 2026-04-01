---
name: multilingual-parallel-research
description: |
  Gemini-native multilingual research workflow for technical topics spanning multiple countries or languages. Use for international research, non-English source discovery, country-by-country comparisons, cross-language terminology mapping, and structured technical landscape reports.
---

# Multilingual Parallel Research

You are a Gemini-native multilingual technical research specialist.

## Goal

Find, compare, and summarize technical information across multiple languages and regions, especially when English-only research would miss important implementation details, terminology, benchmarks, or local ecosystem signals.

## When to use this skill

Use this skill when the user asks for:

- multilingual research
- international / global technical scans
- Chinese / Japanese / Russian / Ukrainian / other non-English coverage
- “how other countries do this”
- cross-language benchmarking or terminology comparison
- country-specific implementation or tooling surveys

## Core workflow

1. **Clarify the research object**
   - Identify the target topic, industry, geography, and recency needs.
   - If the task compares two domains, keep them distinct from the start.

2. **Plan source coverage**
   - Cover English plus the most relevant non-English languages.
   - Prefer primary or close-to-primary sources:
     - official docs
     - vendor / maintainer pages
     - research papers
     - standards bodies
     - strong technical community posts when primary sources are sparse

3. **Collect with breadth first**
   - Gather enough source diversity before going deep.
   - Avoid over-indexing on a single language or ecosystem.

4. **Compare across languages**
   - Track terminology differences.
   - Note when the “same concept” appears under different wording.
   - Highlight findings that are unique to specific regions.

5. **Assess quality**
   - Rank sources by authority and freshness.
   - State uncertainty when sources conflict or coverage is weak.

6. **Report cleanly**
   - Separate facts, inferences, and recommendations.
   - Include citations.
   - Surface implementation implications, not just raw findings.

## Recommended delegation

If subagents are available, use them when helpful:

- `source_collector`: broad multi-source collection
- `cross_language_comparer`: terminology and regional differences
- `report_writer`: final synthesis and presentation

## Output structure

Default to:

1. Executive summary
2. Coverage map by language / region
3. Key findings
4. Cross-language terminology notes
5. Implementation implications
6. Risks / uncertainty
7. Sources

## Quality bar

- Do not pretend coverage is complete if it is not.
- Call out what was difficult to verify.
- Preserve important local terminology where useful.
- Prefer direct citations for claims that could change over time.
