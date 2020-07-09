
function Write-Message
{
    param(
        $message
    )

    Write-Host " CONFIGURE " -BackgroundColor DarkGreen -NoNewline
    Write-Host " $message"
}
