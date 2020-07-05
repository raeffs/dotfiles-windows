#requires -Version 2 -Modules posh-git

function Write-Theme {
    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )

    # write (user)
    $user = $sl.CurrentUser
    $prompt += Write-Prompt -Object "$user" -ForegroundColor $sl.Colors.UserColor

    # write at (devicename)
    $computer = $sl.CurrentHostname
    $prompt += Write-Prompt -Object " at" -ForegroundColor $sl.Colors.PromptForegroundColor
    $prompt += Write-Prompt -Object " $computer" -ForegroundColor $sl.Colors.DeviceColor
    
    # write in (folder)
    $prompt += Write-Prompt -Object " in" -ForegroundColor $sl.Colors.PromptForegroundColor
    $dir = Get-FullPath -dir $pwd
    $prompt += Write-Prompt -Object " $dir " -ForegroundColor $sl.Colors.FolderColor
    
    # write on (branchname) [(status)]
    $status = Get-VCSStatus
    if ($status) {
        $themeInfo = Get-VcsInfo -status ($status)
        $prompt += Write-Prompt -Object "on " -ForegroundColor $sl.Colors.PromptForegroundColor
        $prompt += Write-Prompt -Object "$($themeInfo.VcInfo) " -ForegroundColor $sl.Colors.BranchColor
    }

    # check for elevated prompt
    $promptIndicator = $sl.PromptSymbols.PromptIndicator
    If (Test-Administrator) {
        $promptIndicator = $sl.PromptSymbols.ElevatedPromptIndicator
    }

    # check the last command state and indicate if failed
    $foregroundColor = $sl.Colors.PromptColor
    If ($lastCommandFailed) {
        $foregroundColor = $sl.Colors.FailedPromptColor
    }

    $prompt += Set-Newline
    $prompt += Write-Prompt -Object $promptIndicator -ForegroundColor $foregroundColor
    $prompt += ' '
    $prompt
}

$sl = $global:ThemeSettings

$sl.PromptSymbols.PromptIndicator = '>'
$sl.PromptSymbols.ElevatedPromptIndicator = '$'

$sl.Colors.PromptColor = [ConsoleColor]::DarkBlue
$sl.Colors.FailedPromptColor = [ConsoleColor]::Red

$sl.Colors.UserColor = [ConsoleColor]::DarkCyan
$sl.Colors.DeviceColor = [ConsoleColor]::DarkYellow
$sl.Colors.FolderColor = [ConsoleColor]::DarkGreen
$sl.Colors.BranchColor = [ConsoleColor]::DarkMagenta

$sl.Colors.PromptForegroundColor = [ConsoleColor]::Foreground

