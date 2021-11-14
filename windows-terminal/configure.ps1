
# install & update
#Add-Package 'microsoft-windows-terminal' -displayName 'Windows Terminal'

# verify
$packageInfo = Get-AppxPackage -Name Microsoft.WindowsTerminal
$packageInfo.Version | AddVersion -name 'Windows Terminal'

# link settings
$settings = "$($env:LOCALAPPDATA)\packages\$($packageInfo.PackageFamilyName)\LocalState\settings.json"
New-Item -ItemType SymbolicLink -Path $settings -Target "$PSScriptRoot\settings.json" -Force
