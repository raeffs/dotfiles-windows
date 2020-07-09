
function Get-CommandSave
{
    param(
        $command
    )

    $currentPreference = $ErrorActionPreference
    $ErrorActionPreference = "Stop"
    try
    {
        if (Get-Command $command) { return $true }
    }
    catch
    {
        return $false
    }
    finally
    {
        $ErrorActionPreference = $currentPreference
    }
}
