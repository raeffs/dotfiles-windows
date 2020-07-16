
$TaskName = 'ConfigureEnvironment'

function Register-ScheduledTaskAndReboot
{
    $entry = "$(Split-Path -parent $PSScriptRoot)\configure.ps1"
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "-NoExit -File `"$entry`""
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $TaskName
    shutdown /r /t 0
    throw 'Reboot required'
}

function Unregister-AnyScheduledTask
{
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false -ErrorAction SilentlyContinue
}