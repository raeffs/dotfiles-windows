
# install wsl2 (package is still under moderation)
# this will fail if wsl is not yet installed, so a reboot is required, then it can be executed again
choco search 'wsl2' --exact --local-only | Write-External -executable 'Choco'
if ($LASTEXITCODE -eq 2) {
    Write-Message "Installing Windows Subsystem for Linux 2 ..."
    choco install 'wsl2' --version='1.0.0' --yes --limit-output --no-progress | Write-External -executable 'Choco'
    $exitcode = $LASTEXITCODE
    Write-Message "Exit code $exitcode"

    if ($exitcode -ne 0) {
        Register-ScheduledTaskAndReboot
    }

}
