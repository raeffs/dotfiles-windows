
# font helper
Add-Package 'chocolatey-font-helpers.extension'
Import-Module "$env:ChocolateyInstall\extensions\chocolatey-font-helpers\FontHelp.psm1"

# nerdfonts
$location = 'C:\Program Files\dotfiles\nerdfonts'
$fonts = @(
    'CascadiaCode',
    'FantasqueSansMono',
    'FiraCode',
    'VictorMono'
)
$version = (Invoke-RestMethod 'https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest').name
$fonts | ForEach-Object {
    $folder = "$location\$version\$_"
    $url = "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$_.zip"
    if (!(Test-Path $folder)) {
        Write-Message "Installing Nerdfont $_ ..."
        $tmp = New-TemporaryFile | Rename-Item -PassThru -NewName { $_ -replace 'tmp$', 'zip' }
        Invoke-WebRequest -OutFile $tmp $url
        $tmp | Expand-Archive -DestinationPath $folder -Force
        $tmp | Remove-Item
        Get-ChildItem $folder -Filter *.ttf | ForEach-Object { Install-ChocolateyFont $_.FullName }
    }
}
