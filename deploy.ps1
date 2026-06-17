# deploy.ps1 — Deploy Lychee Docs to GitHub Pages
# Pushes index.html to gh-pages branch on github.com/MD-Mushfiqur123/lychee-docs

param(
    [string]$CommitMessage = "docs: update Lychee documentation site"
)

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

Write-Host "🍈 Deploying Lychee Docs to GitHub Pages..." -ForegroundColor Cyan

# 1. Verify we're in the right directory with index.html
if (-not (Test-Path "index.html")) {
    Write-Host "ERROR: index.html not found in current directory!" -ForegroundColor Red
    exit 1
}

# 2. Ensure gh CLI is available
$gh = Get-Command gh -ErrorAction SilentlyContinue
if (-not $gh) {
    Write-Host "ERROR: GitHub CLI (gh) not found. Install from https://cli.github.com/" -ForegroundColor Red
    exit 1
}

# 3. Check git repo status
$isRepo = Test-Path ".git"
if (-not $isRepo) {
    Write-Host "ERROR: Not a git repository. Run 'git init' first." -ForegroundColor Red
    exit 1
}

# 4. Check if remote exists, add if not
$remote = git remote get-url origin 2>$null
if (-not $remote) {
    Write-Host "No remote 'origin' found. Adding..." -ForegroundColor Yellow
    git remote add origin "https://github.com/MD-Mushfiqur123/lychee-docs.git"
}

# 5. Ensure we're on main/master branch
$currentBranch = git rev-parse --abbrev-ref HEAD

# 6. Commit any changes on current branch
$status = git status --porcelain
if ($status) {
    Write-Host "Changes detected. Committing..." -ForegroundColor Yellow
    git add index.html -f
    git commit -m $CommitMessage
    git push origin $currentBranch
    Write-Host "Pushed to $currentBranch" -ForegroundColor Green
} else {
    Write-Host "No changes to commit." -ForegroundColor Yellow
}

# 7. Deploy to gh-pages branch
Write-Host "Deploying to gh-pages branch..." -ForegroundColor Cyan

# Force-add just index.html to gh-pages
git checkout -B gh-pages
git add index.html -f
git commit -m $CommitMessage --allow-empty
git push origin gh-pages --force

# Switch back to original branch
git checkout $currentBranch

Write-Host ""
Write-Host "✅ Deployment complete!" -ForegroundColor Green
Write-Host "🌐 Live URL: https://MD-Mushfiqur123.github.io/lychee-docs" -ForegroundColor Cyan
Write-Host ""
Write-Host "Note: It may take 1-3 minutes for GitHub Pages to publish." -ForegroundColor Yellow
