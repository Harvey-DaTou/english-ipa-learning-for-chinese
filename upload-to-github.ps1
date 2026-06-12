param(
  [string]$Message = "Update website"
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$GitDir = Join-Path $Root "_gitrepo\.git"
$Remote = "https://github.com/Harvey-DaTou/english-ipa-learning-for-chinese.git"

function Run-Git {
  param([string[]]$Args)
  & git --git-dir="$GitDir" --work-tree="$Root" @Args
  if ($LASTEXITCODE -ne 0) {
    throw "Git command failed: git $($Args -join ' ')"
  }
}

if (!(Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Host "Git was not found. Please install Git for Windows: https://git-scm.com/download/win" -ForegroundColor Red
  exit 1
}

Run-Git @("branch", "-M", "main")

$remotes = & git --git-dir="$GitDir" --work-tree="$Root" remote
if ($remotes -contains "origin") {
  Run-Git @("remote", "set-url", "origin", $Remote)
} else {
  Run-Git @("remote", "add", "origin", $Remote)
}

Run-Git @("add", "index.html", "README.md", "audio", ".gitignore", "upload-to-github.ps1")

$status = & git --git-dir="$GitDir" --work-tree="$Root" status --porcelain
if ($status) {
  Run-Git @("commit", "-m", $Message)
} else {
  Write-Host "No file changes. Trying to upload directly." -ForegroundColor Cyan
}

Write-Host "Uploading to GitHub..." -ForegroundColor Cyan
Run-Git @("push", "-u", "origin", "main")

Write-Host "Upload complete: https://github.com/Harvey-DaTou/english-ipa-learning-for-chinese" -ForegroundColor Green
