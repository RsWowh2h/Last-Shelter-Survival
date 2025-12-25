cd "$(Split-Path -Parent $MyInvocation.MyCommand.Path)"

if (-not (git status --porcelain)) {
    Write-Host "No changes to commit"
    Write-Host ""
    Write-Host "Press Enter to close..."
    Read-Host
    exit
}

git add .

$time = Get-Date -Format "yyyy-MM-dd HH:mm"
git commit -m "Auto update $time"

git push

Write-Host ""
Write-Host "Press Enter to close..."
Read-Host
