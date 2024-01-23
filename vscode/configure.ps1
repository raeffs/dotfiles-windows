
# install & update
if (Get-CommandSave 'code') {
    Write-Message "Visual Studio Code is already installed!"
} else {
    Add-Package 'vscode' -displayName 'Visual Studio Code' -params '/NoDesktopIcon'
}

# verify
code --version | Select-Object -First 1 | AddVersion -name 'Visual Studio Code'
