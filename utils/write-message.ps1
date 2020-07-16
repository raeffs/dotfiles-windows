
function Write-Message
{
    param(
        [Parameter(Position = 0, Mandatory = $true)]
        $message,
        [Switch]$isError,
        [string]$executable = 'Dotfiles'
    )

    $color = if ($executable -eq 'Dotfiles') { [System.ConsoleColor]::DarkGreen } else { [System.ConsoleColor]::DarkCyan }
    $executable = $executable.ToUpper()

    if ($isError.IsPresent) {
        Write-Host
        Write-Host " " -NoNewline
        Write-Host " $executable " -BackgroundColor DarkRed -NoNewline
        Write-Host " $message"
        Write-Host
        throw $message
    }

    Write-Host
    Write-Host " " -NoNewline
    Write-Host " $executable " -BackgroundColor $color -NoNewline
    Write-Host " $message"
    Write-Host
}
