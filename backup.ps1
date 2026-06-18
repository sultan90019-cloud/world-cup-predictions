$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backupDir = Join-Path $PSScriptRoot "backups"
$backupFile = Join-Path $backupDir "backup_$timestamp.sql"

if (-not (Test-Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
}

$pgBin = "C:\Program Files\PostgreSQL\16\bin"
& "$pgBin\pg_dump.exe" -U postgres -d worldcup --clean --if-exists -f $backupFile

if ($LASTEXITCODE -eq 0) {
    Write-Host "OK $backupFile"
    Get-ChildItem "$backupDir\backup_*.sql" | Sort-Object Name -Descending | Select-Object -Skip 30 | Remove-Item -Force -ErrorAction SilentlyContinue
} else {
    Write-Host "FAILED"
    exit 1
}
