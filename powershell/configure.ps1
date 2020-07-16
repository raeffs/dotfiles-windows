
# install & update powershell core
Add-Package 'powershell-core' -displayName 'Powershell Core'

# verify powershell core
pwsh -version | AddVersion -name 'PowerShell Core' -replacement 'powershell'

# configure powershell
Write-Message 'Configuring Powershell ...'
powershell -NoProfile -File $PSScriptRoot\_configure.ps1
# configure powershell core
Write-Message 'Configuring Powershell Core ...'
pwsh -NoProfile -File $PSScriptRoot\_configure.ps1
