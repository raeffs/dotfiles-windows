
function Write-Message
{
    param(
        [Parameter(Position = 0, Mandatory = $true)]
        [string]$message,
        [Switch]$isError
    )

    if ($isError.IsPresent) {
        Write-Host " " -NoNewline
        Write-Host " DOTFILES " -BackgroundColor DarkRed -NoNewline
        Write-Host " $message"
        throw $message
    }

    Write-Host " " -NoNewline
    Write-Host " DOTFILES " -BackgroundColor DarkGreen -NoNewline
    Write-Host " $message"
}
