
# we need to resolve the symbolic link in order to get the correct path for the profile
$profileDir = Split-Path -parent (Get-Item $PROFILE).Target

Import-Module posh-git

Import-Module oh-my-posh
#$ThemeSettings.MyThemesLocation = "$profileDir\themes"
#Set-Theme custom-theme

. $profileDir\aliases.ps1

Clear-Host
