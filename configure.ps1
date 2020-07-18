
$runsElevated = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (!$runsElevated) { 
    Start-Process powershell.exe "-NoExit -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

. $PSScriptRoot\utils\reboot-utils.ps1
. $PSScriptRoot\utils\write-message.ps1
. $PSScriptRoot\utils\get-commandsave.ps1
. $PSScriptRoot\utils\add-package.ps1
. $PSScriptRoot\utils\version-utils.ps1

Unregister-AnyScheduledTask

. $PSScriptRoot\chocolatey\configure.ps1
. $PSScriptRoot\wsl\configure.ps1
. $PSScriptRoot\windows-explorer\configure.ps1
. $PSScriptRoot\fonts\configure.ps1
. $PSScriptRoot\7zip\configure.ps1
. $PSScriptRoot\git\configure.ps1
. $PSScriptRoot\docker\configure.ps1
. $PSScriptRoot\windows-terminal\configure.ps1
. $PSScriptRoot\powershell\configure.ps1
. $PSScriptRoot\vscode\configure.ps1

PrintVersions
