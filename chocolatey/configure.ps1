
# install
if (Get-CommandSave 'choco') {
    Write-Message "Chocolatey is already installed!"
} else {
    Write-Message "Installing Chocolatey ..."
    Invoke-WebRequest "https://chocolatey.org/install.ps1" -UseBasicParsing | Invoke-Expression
}

# configure
Write-Message "Configuring Chocolatey ..."
choco feature enable -n=useEnhancedExitCodes | Write-External -executable 'Choco'

# import the module so we are able to use refreshenv durring first run
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"