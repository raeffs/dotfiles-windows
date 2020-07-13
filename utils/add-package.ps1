
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

    choco search $packageName --exact --local-only | Write-External -executable 'Choco'
    if ($LASTEXITCODE -eq 2) {
        Write-Message "Installing $displayName ..."
        choco install $packageName --yes --limit-output --no-progress --params=$params | Write-External -executable 'Choco'
    } elseif ($LASTEXITCODE -eq 0) {
        # upgrade would also install if not already installed... :?
        Write-Message "Updateing $displayName ..."
        choco upgrade $packageName --yes --limit-output --no-progress --params=$params | Write-External -executable 'Choco'
    } else {
        Write-Message "Failed to install or update $displayName!" -isError
    }

    Update-SessionEnvironment
}
