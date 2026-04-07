Param(
    [string]$WorkspacePath = "D:\Projects\machine-learning",
    [switch]$Preview
)

# Prefer workspace venv python if present
$venvPython = Join-Path $WorkspacePath ".venv\Scripts\python.exe"
$pythonExe = if (Test-Path $venvPython) { $venvPython } else { "python" }

Write-Host "Cleaning outputs from .ipynb files under: $WorkspacePath"

Get-ChildItem -Path $WorkspacePath -Filter "*.ipynb" -Recurse | ForEach-Object {
    $nb = $_.FullName
    if ($Preview) {
        Write-Host "[Preview] Would clear outputs: $nb"
    } else {
        Write-Host "Clearing outputs: $nb"
        & $pythonExe -m jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace "$nb" 2>&1 | Write-Host
    }
}

Write-Host 'Done. To permanently remove output diffs from git, run: git add -A; git commit -m "Strip notebook outputs"'
