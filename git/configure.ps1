
# install & update git
Add-Package 'git' -params '/GitOnlyOnPath /NoShellIntegration'

# verify git
$version = $(git --version)
Write-Message $version

# install & update git-extras
$GitExtrasPath = 'C:\Program Files\git-extras'
if (-not (Test-Path -Path $GitExtrasPath)) {
    Write-Message 'Installing Git Extras ...'
    git clone --depth 1 'https://github.com/tj/git-extras.git' $GitExtrasPath | Write-External -executable 'Git'
    & "$GitExtrasPath\install.cmd"
    # after first installation it seems somewhat buggy, so we run the built-in update which seems to fix that
    Push-Location $GitExtrasPath
    git extras update | Write-External -executable 'GitExtras'
    Pop-Location
} else {
    Write-Message 'Updateing Git Extras ...'
    git extras update | Write-External -executable 'GitExtras'
}

# verify git-extras
$version = $(git extras --version)
Write-Message "git-extras version $version"
