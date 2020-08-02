
$KeysToRemove = @(
    '0DB7E03F-FC29-4DC6-9020-FF41B59E513A', # remove 3d objects from this pc
    'A8CDFF1C-4878-43be-B5FD-F8091C1C60D0', # remove documents from this pc
    'd3162b92-9365-467a-956b-92703aca08af', # remove documents from this pc
    '1CF1260C-4DD0-4ebb-811F-33C572699FDE', # remove music from this pc
    '3dfdf296-dbec-4fb4-81d1-6a3438bcf4de', # remove music from this pc
    '3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA', # remove pictures from this pc
    '24ad3ad4-a569-4530-98e1-ab02f9417aa8', # remove pictures from this pc
    'A0953C92-50DC-43bf-BE83-3742FED03C9C', # remove videos from this pc
    'f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a'  # remove videos from this pc
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
