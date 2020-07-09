
function Add-Package
{
    param(
        [Parameter(Position = 0, Mandatory = $true)]
        [string]$packageName,
        [Parameter(Mandatory = $false)]
        [string]$displayName,
        [Parameter(Mandatory = $false)]
        [string]$params
    )

    if (-not $displayName) {
        $displayName = $packageName
    }

    choco search $packageName --exact --local-only
    if ($LASTEXITCODE -eq 2) {
        Write-Message "Installing $displayName ..."
        choco install $packageName --yes --limit-output --params=$params
    } elseif ($LASTEXITCODE -eq 0) {
        # upgrade would also install if not already installed... :?
        Write-Message "Updating $displayName ..."
        choco upgrade $packageName --yes --limit-output --params=$params
    } else {
        Write-Message "Failed to install or update $displayName!" -isError
    }

    Update-SessionEnvironment
}
