
Import-Module posh-git

Import-Module oh-my-posh
# we need to resolve the symbolic link in order to get the correct path for the themes folder
$profileDir = Split-Path -parent (Get-Item $PROFILE).Target
$ThemeSettings.MyThemesLocation = "$profileDir\themes"
Set-Theme custom-theme

Function Open-VsCode {
  Param(
    [string]$path="."
  )

  code $path
}

Function Open-Explorer {
  Param(
    [string]$path="."
  )

  explorer $path
}

Set-Alias -Name c -Value Open-VsCode
Set-Alias -Name e -Value Open-Explorer

Clear-Host
