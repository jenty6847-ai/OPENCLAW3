$ErrorActionPreference = "Stop"
$WorkspacePath = "C:\Users\Y\.openclaw\workspace"
Set-Location $WorkspacePath

# Check for changes
$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Output "$(Get-Date) - No changes to backup."
    exit 0
}

Write-Output "$(Get-Date) - Found changes, starting backup..."
git add -A
git commit -m "auto-backup: Sync memory and workspace state - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
git push origin main

if ($?) {
    Write-Output "$(Get-Date) - Backup pushed successfully."
} else {
    Write-Error "$(Get-Date) - Failed to push backup."
}
