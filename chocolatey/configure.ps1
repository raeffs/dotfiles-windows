
# install & update
if (Get-CommandSave 'choco') {
    Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
    Add-Package 'chocolatey'
} else {
    Write-Message "Installing Chocolatey ..."
    Invoke-WebRequest "https://chocolatey.org/install.ps1" -UseBasicParsing | Invoke-Expression
    Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
}

# verify
choco --version | AddVersion -name 'Chocolatey'

# configure
Write-Message "Configuring Chocolatey ..."
choco feature enable -n=useEnhancedExitCodes
