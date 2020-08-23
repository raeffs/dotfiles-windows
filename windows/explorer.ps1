
$KeysToRemove = @(
    # remove 3d objects from this pc
    '0DB7E03F-FC29-4DC6-9020-FF41B59E513A',
    # remove documents from this pc
    'A8CDFF1C-4878-43be-B5FD-F8091C1C60D0',
    'd3162b92-9365-467a-956b-92703aca08af',
    # remove music from this pc
    '1CF1260C-4DD0-4ebb-811F-33C572699FDE',
    '3dfdf296-dbec-4fb4-81d1-6a3438bcf4de',
    # remove pictures from this pc
    '3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA',
    '24ad3ad4-a569-4530-98e1-ab02f9417aa8',
    # remove videos from this pc
    'A0953C92-50DC-43bf-BE83-3742FED03C9C',
    'f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a'
)

$KeysToRemove | ForEach-Object {
    Remove-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{$_}" -ErrorAction SilentlyContinue
    Remove-Item "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{$_}" -ErrorAction SilentlyContinue
}

# open explorer to this pc
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1

# show file extensions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0

# show hidden files & folders
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1

# hide item check boxes
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "AutoCheckSelect" -Value 0

# hide frequent folders in quick access
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowFrequent" -Value 0

# hide recent files in quick access
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecent" -Value 0

# disable quick access completely
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "HubMode" -Value 1

# hide shortcut arrow
if (!(Test-Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons")) {
    New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" -Type Folder | Out-Null
}
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" -Name "29" -Value "%windir%\System32\shell32.dll,-50"
