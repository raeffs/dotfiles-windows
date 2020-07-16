
# install & update
Add-Package 'microsoft-windows-terminal' -displayName 'Windows Terminal'

# verify
(Get-AppxPackage -Name Microsoft.WindowsTerminal).Version | AddVersion -name 'Windows Terminal'
