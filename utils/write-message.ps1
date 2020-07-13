
function Write-Message
{
    param(
        [Parameter(Position = 0, Mandatory = $true)]
        $message,
        [Switch]$isError,
        [string]$executable = 'Dotfiles'
    )

    $color = if ($executable -eq 'Dotfiles') { [System.ConsoleColor]::DarkGreen } else { [System.ConsoleColor]::DarkMagenta }
    $executable = $executable.ToUpper()

    if ($isError.IsPresent) {
        Write-Host " $executable " -BackgroundColor DarkRed -NoNewline
        Write-Host " $message"
        throw $message
    }

    Write-Host " $executable " -BackgroundColor $color -NoNewline
    Write-Host " $message"
}
