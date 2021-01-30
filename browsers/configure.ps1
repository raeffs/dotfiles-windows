Add-Package 'googlechrome' -displayName 'Google Chrome' -skipUpdate
Add-Package 'firefox' -displayName 'Mozilla Firefox' -skipUpdate -params '/NoDesktopShortcut /RemoveDistributionDir'
Add-Package 'microsoft-edge' -displayName 'Microsoft Edge' -skipUpdate -installerArgs 'DONOTCREATEDESKTOPSHORTCUT=true'
Add-Package 'brave' -displayName 'Brave' -skipUpdate
