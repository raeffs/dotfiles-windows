
# install & update
Add-Package 'vscode' -displayName 'Visual Studio Code' -params '/NoDesktopIcon'

# verify
code --version | Select-Object -First 1 | AddVersion -name 'Visual Studio Code'

# link settings
New-Item -ItemType SymbolicLink -Path "$($env:APPDATA)\Code\User\settings.json" -Target "$PSScriptRoot\settings.json" -Force
New-Item -ItemType SymbolicLink -Path "$($env:APPDATA)\Code\User\keybindings.json" -Target "$PSScriptRoot\keybindings.json" -Force
