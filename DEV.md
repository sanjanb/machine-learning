# Developer Setup & Local Build

Quick steps to get the site and repo development tools working on Windows (PowerShell). Keep this near the repo root.

## Prerequisites

- Ruby (matching `Gemfile`) and Bundler
- Python 3.8+ and `pip`
- Node (optional for some pre-commit hooks)
- Git

## Install Ruby gems (Jekyll)

```powershell
gem install bundler
bundle install
```

Build the site locally:

```powershell
bundle exec jekyll build    # outputs to _site/
bundle exec jekyll serve --livereload --port 4000
```

## Notebook maintenance

Preview cleaning (no write):

```powershell
# preview mode in provided script
powershell -ExecutionPolicy Bypass -File .\scripts\clean-notebooks.ps1 -Preview
```

Strip outputs in-place:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\clean-notebooks.ps1
git add -A
git commit -m "Strip notebook outputs"
```

## Pre-commit & nbstripout (Python)

Install tools (user-site recommended):

```powershell
python -m pip install --user pre-commit nbstripout
python -m pre_commit install
python -m nbstripout --install
```

Run hooks across the repo:

```powershell
python -m pre_commit run --all-files
```

If hooks modify files, stage and commit the fixes:

```powershell
git add -A
git commit -m "Apply pre-commit fixes"
```

## Long-running watchers

There is a watcher to convert notebooks to markdown in `scripts\watch-ipynb-convert.ps1`. To run it:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\watch-ipynb-convert.ps1
```

## Helpful notes
- `_site/` is generated — do not commit it. The repo `.gitignore` excludes it already.
- Keep `Gemfile` and the GitHub Actions workflow Jekyll version in sync.
- For large binary assets or datasets, consider Git LFS or external storage.

If you want, I can also add a `Makefile` or a PowerShell `dev.ps1` script to wrap these commands.
