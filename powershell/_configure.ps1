
# install and update powershell modules
if (!(Get-PackageProvider NuGet -Force -ErrorAction SilentlyContinue)) {
    Install-PackageProvider NuGet -Force
}

if ((Get-PSRepository PSGallery -ErrorAction SilentlyContinue).InstallationPolicy -ne 'Trusted') {
    Set-PSRepository PSGallery -InstallationPolicy Trusted
}

Install-Module posh-git
Install-Module oh-my-posh

# link profile
$profileDir = Split-Path -parent $PROFILE
Copy-Item "$PSScriptRoot\profile.ps1" "$PROFILE" -Force
Copy-Item "$PSScriptRoot\aliases.ps1" "$profileDir" -Force
