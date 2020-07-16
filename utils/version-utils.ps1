
$InstalledVersions = @{}

function AddVersion
{
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$version,
        [Parameter(Mandatory = $true)]
        [string]$name,
        [string]$replacement
    )

    $InstalledVersions[$name] = ($version -replace $replacement).Trim()
}

function PrintVersions 
{
    $InstalledVersions
}
