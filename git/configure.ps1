
# install & update
Add-Package 'git' -params '/GitOnlyOnPath /NoShellIntegration'

# verify
$version = $(git --version)
Write-Message $version
