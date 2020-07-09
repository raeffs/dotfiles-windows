
# install
if (Get-CommandSave 'choco') {
    Write-Host "Chocolatey is already installed!"
} else {
    Write-Host "Installing Chocolatey ..."
    Invoke-WebRequest "https://chocolatey.org/install.ps1" -UseBasicParsing | Invoke-Expression
}

# configure
Write-Host "Configuring Chocolatey ..."
choco feature enable -n=useEnhancedExitCodes
