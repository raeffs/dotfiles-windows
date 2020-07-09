
function Add-Package
{
    param(
        $packageName,
        $displayName
    )

    if ($displayName -eq $null) {
        $displayName = $packageName
    }

    choco search $packageName --exact --local-only
    if ($LASTEXITCODE -eq 2) {
        Write-Message "Installing $displayName ..."
        choco install $packageName --yes --limit-output
    } elseif ($LASTEXITCODE -eq 0) {
        # upgrade would also install if not already installed... :?
        Write-Message "Updating $displayName ..."
        choco upgrade $packageName --yes --limit-output
    } else {
        Write-Error "Failed to install or update $displayName!"
        Exit
    }
}
