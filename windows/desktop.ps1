
# remove all shortcuts
Get-ChildItem "$env:USERPROFILE\Desktop" -Filter *.lnk | Remove-Item
Get-ChildItem "$env:PUBLIC\Desktop" -Filter *.lnk | Remove-Item
