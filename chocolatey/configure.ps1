
# install & update
if (Get-CommandSave 'choco') {
    Add-Package 'chocolatey'
} else {
    Write-Message "Installing Chocolatey ..."
    Invoke-WebRequest "https://chocolatey.org/install.ps1" -UseBasicParsing | Invoke-Expression
}

# verify
choco --version | AddVersion -name 'Chocolatey'

# configure
Write-Message "Configuring Chocolatey ..."
choco feature enable -n=useEnhancedExitCodes

# import the module so we are able to use refreshenv durring first run
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
