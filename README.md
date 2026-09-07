### AI+Formal Methods survey

Literature notes and a survey draft on the intersection of large language
models and formal methods: formalising intent and specifications from
natural language, verifier-in-the-loop code generation, automated proof
search/synthesis/repair, and benchmarks for these.

The survey itself is `survey.tex` (ACM Computing Surveys style), with
references in `survey.bib`. Notes are organised by section directly in the
`.tex` file; see `AGENTS.md` for conventions on prose, typography, and
adding bibliography entries.

## Building

Requires a TeX distribution with `latexmk` and `biber` (or `tectonic`).

```
make survey.pdf
```

Other targets: `make papers/survey.pdf` builds a version with clickable
links to local PDF copies of cited papers; `make run` builds and opens it;
`make clean` removes build artefacts.

## Papers and Git LFS

Where practical, a PDF copy of each cited paper is kept under `papers/`
(referenced from `survey.bib` via a `file` field). These PDFs are stored
with Git LFS. Install it before cloning or pulling:

```
sudo apt install git-lfs
git lfs install
```
