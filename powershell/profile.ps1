
Import-Module posh-git
Import-Module oh-my-posh
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
