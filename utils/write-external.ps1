
function Write-External
{
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $input,
        [Parameter(Mandatory = $true)]
        [string]$executable
    )

    BEGIN {}
    PROCESS {
        $input | ForEach-Object { Write-Message $_ -executable $executable }
    }
    END {}
}
