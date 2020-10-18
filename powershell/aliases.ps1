
# navigation aliases
Function .. { Set-Location .. }
Function ... { Set-Location ..\.. }
Function .... { Set-Location ..\..\.. }
Function home { Set-Location ~ }

# list all files
Function la { ls -Force @args }
# list directories
Function lsd { ls -Directory -Force @args }

# open explorer
Function Open-Explorer {
  Param(
    [string]$path='.'
  )

  explorer $path
}
Set-Alias -Name e -Value Open-Explorer

# open visual studio code
Function Open-VsCode {
  Param(
    [string]$path='.'
  )

  code $path
}
Set-Alias -Name c -Value Open-VsCode

Set-Alias -Name openssl -Value "C:\Program Files\Git\usr\bin\openssl.exe"
