Add-Package 'firefox' -displayName 'Mozilla Firefox' -skipUpdate -params '/NoDesktopShortcut /RemoveDistributionDir'

# https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig 
# https://ffprofile.com/
# https://brainfucksec.github.io/firefox-hardening-guide

$firefoxDirectory = 'C:\Program Files\Mozilla Firefox'

New-Item -Type Directory "$firefoxDirectory\defaults\pref" -Force
Copy-Item "$PSScriptRoot\autoconfig.js" "$firefoxDirectory\defaults\pref" -Force
New-Item -Type Directory "$firefoxDirectory\distribution" -Force
Copy-Item "$PSScriptRoot\policies.json" "$firefoxDirectory\distribution" -Force
Copy-Item "$PSScriptRoot\firefox.cfg" "$firefoxDirectory" -Force
