
# install & update
Add-Package 'docker-desktop' -displayName 'Docker'

# verify
$version = $(docker --version)
Write-Message $version
$version = $(docker-compose --version)
Write-Message $version
