# AGENTS.md

## Overview

This repository is a personal academic website built on top of the `al-folio` Jekyll theme and deployed with GitHub Pages via GitHub Actions.

Most work in this repo is content editing, not application logic. The highest-value changes usually touch:

- `_config.yml` for site-wide settings, identity, navigation, and integrations
- `_pages/` for top-level pages
- `_bibliography/papers.bib` for publications
- `_data/talks.yml` for talks
- `_data/*.yml` for structured site data
- `assets/` for images, PDFs, JS, and styles
- `_plugins/` for custom Ruby/Liquid behavior

## Repo Map

- `_pages/about.md`: homepage content
- `_pages/publications.md`: renders publications from Jekyll Scholar and `_bibliography/papers.bib`
- `_pages/talks.md`: renders invited talks and conference talks from `_data/talks.yml`
- `_pages/cv.md`: CV page config; current downloadable PDF is `cv_4.pdf`
- `_bibliography/papers.bib`: main publication source of truth
- `_data/coauthors.yml`: coauthor links for publication rendering
- `_data/venues.yml`: venue abbreviations/badges
- `_data/cv.yml`: YAML CV fallback data
- `assets/pdf/cv_4.pdf`: published CV asset
- `_cv/`: LaTeX CV source and generated artifacts
- `_plugins/`: custom Jekyll plugins used by the site
- `.github/workflows/`: deploy, broken-link, formatting, and accessibility workflows

## How The Site Works

- The site uses Jekyll with Ruby gems from `Gemfile`.
- Publications are generated with `jekyll-scholar`.
- Talks are plain YAML data rendered by Liquid in `_pages/talks.md`.
- The current repo still contains a lot of upstream `al-folio` sample/demo content. Be careful not to “clean up” template files unless the task clearly calls for it.
- GitHub Actions deploys the site from `main`/`master` using `.github/workflows/deploy.yml`.

## Common Tasks

### Update publications

Edit `_bibliography/papers.bib`.

Notes:
- This file includes YAML front matter separators at the top; preserve them.
- Keep BibTeX syntax valid.
- Supported custom fields include `abbr`, `abstract`, `arxiv`, `bibtex_show`, `code`, `html`, `pdf`, `poster`, `slides`, `supp`, `video`, and `website`.

### Update talks

Edit `_data/talks.yml`.

Expected structure:
- each item has `conference`, `invited`, `year`, `title`, and `speakers`
- optional fields include `seminar` and `number`
- `speakers` is a list of objects shaped like `- speaker: S. W. Chung`

### Update the homepage/about page

Edit `_pages/about.md` and related assets in `assets/img/`.

### Update CV

There are two CV-related paths in this repo:

- `_pages/cv.md` and `_data/cv.yml` control the website CV page
- `_cv/cv_4.tex` is the LaTeX CV source

The downloadable/public CV currently lives at `assets/pdf/cv_4.pdf`, while `_pages/cv.md` also references `cv_4.pdf`.

Be careful here:
- `_cv/` contains generated LaTeX artifacts such as `.aux`, `.fdb_latexmk`, `.fls`, `.log`, `.out`, and `_cv/cv_4.pdf`
- these generated files are not good candidates for manual editing
- do not delete them unless the task explicitly asks for cleanup

## Local Commands

Use the least invasive command that verifies the change.

Typical commands:

```bash
bundle install
pip install jupyter
bundle exec jekyll serve --lsi
```

For a production-style build:

```bash
JEKYLL_ENV=production bundle exec jekyll build --lsi
```

Formatting:

```bash
npx prettier . --check
npx prettier . --write
```

Notes:
- `package.json` is only for Prettier and the Liquid plugin
- CI also runs purgecss in deploy-related workflows, but that is usually not necessary for normal content edits

## Editing Guidance

- Prefer small, targeted edits. This is primarily a content repo.
- Preserve front matter exactly when editing Markdown pages.
- Preserve YAML indentation and list formatting in `_data/*.yml`.
- Preserve BibTeX validity in `_bibliography/papers.bib`; a single syntax error can break the publications page.
- Avoid broad theme/layout refactors unless the task explicitly asks for design or structural changes.
- Treat `_plugins/*.rb` as real code paths; changes there can affect the whole build.
- Do not assume README/CUSTOMIZE/INSTALL describe only this site; much of that documentation is inherited from upstream `al-folio`.

## Verification Checklist

After edits, choose the smallest relevant verification:

- Content-only Markdown/YAML/BibTeX edits: run `bundle exec jekyll build --lsi` if dependencies are available
- Formatting-sensitive changes: run `npx prettier . --check`
- Layout/plugin changes: prefer a full local Jekyll build
- Link-heavy edits: note that CI has broken-link workflows, but local validation may still be useful

## Known Gotchas

- `_config.yml` changes usually require a rebuild to observe correctly.
- The site has custom plugins in `_plugins/`; plugin-related failures may surface only during Jekyll build.
- The repo has untracked generated CV artifacts in `_cv/`; leave them alone unless the task is specifically about the CV build pipeline.
- This repo mixes user content with upstream theme sample content. Confirm intent before removing anything that looks like a demo page or sample post.
