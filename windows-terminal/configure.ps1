
# install & update
#Add-Package 'microsoft-windows-terminal' -displayName 'Windows Terminal'

# verify
$packageInfo = Get-AppxPackage -Name Microsoft.WindowsTerminal
$packageInfo.Version | AddVersion -name 'Windows Terminal'

# link settings
$settings = "$($env:LOCALAPPDATA)\packages\$($packageInfo.PackageFamilyName)\LocalState\settings.json"
Copy-Item "$PSScriptRoot\settings.json" "$settings" -Force
