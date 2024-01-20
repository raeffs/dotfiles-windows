
# install & update git
Add-Package 'git' -params '/GitOnlyOnPath /NoShellIntegration'

# verify git
git --version | AddVersion -name 'Git' -replace 'git version'

# install & update git-extras
$GitExtrasPath = 'C:\Program Files\git-extras'
if (-not (Test-Path -Path $GitExtrasPath)) {
    Write-Message 'Installing Git Extras ...'
    git clone --depth 1 'https://github.com/tj/git-extras.git' $GitExtrasPath
    & "$GitExtrasPath\install.cmd"
    # after first installation it seems somewhat buggy, so we run the built-in update which seems to fix that
    Push-Location $GitExtrasPath
    git extras update
    Pop-Location
} else {
    Write-Message 'Updating Git Extras ...'
    git extras update
}

# verify git-extras
git extras --version | AddVersion -name 'Git Extras'

# link gitconfig
New-Item -ItemType SymbolicLink -Path "$($env:HOME)\.gitconfig" -Target "$PSScriptRoot\user.gitconfig" -Force
New-Item -ItemType SymbolicLink -Path "$($env:HOME)\aliases.gitconfig" -Target "$PSScriptRoot\aliases.gitconfig" -Force
