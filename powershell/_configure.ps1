
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
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$PSScriptRoot\profile.ps1" -Force
