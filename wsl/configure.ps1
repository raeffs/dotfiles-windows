
Write-Message "Installing Windows Subsystem for Linux 2 ..."

choco search 'wsl2' --exact --local-only
if ($LASTEXITCODE -eq 2) {
    choco install 'wsl2' --yes --limit-output
    Register-ScheduledTaskAndReboot
}

choco install 'wsl2' --yes --limit-output --force
