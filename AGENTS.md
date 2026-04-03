# Instructions for AI assistants

This repository is shared across tools (for example Cursor, Claude Code, and Codex). Conventions below apply to survey prose, BibTeX, and LaTeX sources.

## Repository purpose

The project supports literature research at the intersection of large language
models and formal methods. A broad aim is to explore how AI-assisted code
generation and formal verification can be combined to produce trustworthy
software, which in turn requires specification languages or other specification
mechanisms.

Work is organised into survey-style documents that collect notes and commentary
on topics the maintainers care about.

When an arXiv-oriented MCP `arxiv-mcp-server` server is available in the
environment, use it to search and retrieve papers from
[arXiv](https://arxiv.org/).

## LaTeX workflow

- Build with `make` (see the project `Makefile` for targets). For the main document, `make survey.pdf` is typical.

## LaTeX typography

In `.tex` files:

- Use standard LaTeX ASCII quoting (two grave accents for an opening double quote, two straight apostrophes for a closing double quote), not Unicode smart quotes.
- Use the LaTeX em-dash written as two ASCII hyphens (`--`), not a Unicode em-dash.
- Use the ASCII apostrophe (U+0027) for contractions and possessives.

Prefer commas or parentheses for asides; avoid framing subjective asides with dashes.

## Prose: British English

- **Spelling**: colour, behaviour, formalise, centre, analyse, programme (curriculum or schedule), licence (noun), license (verb), defence, offence, organisation, favour, honour.
- **-ise, not -ize**: realise, recognise, summarise, characterise (except in proper names of American organisations).
- **Punctuation**: place commas and full stops outside closing quotation marks when they belong to the sentence, not the quotation (British outer-quote convention).
- **Avoid**: "whilst" (use "while"); Unicode apostrophe (use ASCII U+0027); em-dashes for subjective asides (prefer commas or parentheses). Do not use "vacuous" (and derivatives).

## Prose: academic style

- Prefer precise, neutral wording; avoid colloquialisms and hype (e.g. "very", "really", "simply", "obviously").
- Use first person sparingly and only when it clarifies agency (e.g. "we implement" in technical passages); otherwise prefer "the system" or the passive when the actor is clear.
- Keep sentences clear and direct; avoid long chains of clauses. Aim for one main idea per sentence where possible.
- Preserve technical terms from computer science, programming languages, and formal methods exactly. Do not replace them with loose synonyms (e.g. reduction, semantics, typing, refinement). When editing or polishing prose, if a wording change might alter a technical reading, ask the maintainer rather than guessing.

## Bibliography

When adding new references:

1. Prefer a canonical BibTeX entry. [DBLP](https://dblp.org/) is the primary source: search by title and use the exported entry.
2. For arXiv preprints, an arXiv BibTeX export is fine when DBLP has no entry; if DBLP later lists the paper, prefer DBLP.
3. For other venues, use publisher or repository exports when available (e.g. ACM, IEEE).
4. [ALRAD](https://al.radbox.org/) is an additional BibTeX lookup when needed.
5. When adding a new entry, obtain a PDF copy in `papers/` where practical; if you do, add a `file` field to that entry set to the PDF filename only (no path).
