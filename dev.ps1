# dev.ps1 - Developer helper script for common tasks
#
# Usage:
#   .\dev.ps1 -Serve        # start Jekyll serve (foreground)
#   .\dev.ps1 -PreCommit    # run pre-commit hooks across repo
#   .\dev.ps1 -Watch        # run notebook watcher (foreground)
#   .\dev.ps1 -All          # run pre-commit, start watcher (background), then serve

Param(
    [switch]$Serve,
    [switch]$PreCommit,
    [switch]$Watch,
    [switch]$All
)

function Write-Usage {
    Write-Output "Usage: .\\dev.ps1 [-Serve] [-PreCommit] [-Watch] [-All]"
    exit 1
}

if (-not ($Serve -or $PreCommit -or $Watch -or $All)) {
    Write-Usage
}

function Run-PreCommit {
    Write-Output "Running pre-commit hooks..."
    python -m pre_commit run --all-files
}

function Start-Watcher-Background {
    if (-not (Test-Path ".\scripts\watch-ipynb-convert.ps1")) {
        Write-Output "Watcher script not found: .\scripts\watch-ipynb-convert.ps1"
        return
    }
    Write-Output "Starting notebook watcher in background..."
    Start-Process -FilePath powershell -ArgumentList "-NoProfile","-ExecutionPolicy","Bypass","-File",".\scripts\watch-ipynb-convert.ps1" -WindowStyle Hidden
}

function Serve-Jekyll {
    Write-Output "Starting Jekyll serve (foreground)..."
    if (Test-Path "Gemfile") {
        bundle exec jekyll serve --livereload --port 4000
    } else {
        jekyll serve --livereload --port 4000
    }
}

try {
    if ($All) {
        if (Test-Path ".pre-commit-config.yaml") { Run-PreCommit }
        Start-Watcher-Background
        Serve-Jekyll
        exit
    }

    if ($PreCommit) { Run-PreCommit }
    if ($Watch) {
        Write-Output "Starting notebook watcher (foreground)..."
        powershell -ExecutionPolicy Bypass -File .\scripts\watch-ipynb-convert.ps1
    }
    if ($Serve) { Serve-Jekyll }

} catch {
    Write-Error "Command failed: $_"
    exit 1
}
