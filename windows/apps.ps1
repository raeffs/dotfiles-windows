
$AppsToRemove = @(
    "Microsoft.3DBuilder",
    "Microsoft.WindowsAlarms",
    "*.AutodeskSketchBook",
    "Microsoft.BingFinance",
    "Microsoft.BingNews",
    "Microsoft.BingSports",
    "Microsoft.BingWeather",
    "king.com.BubbleWitch3Saga",
    "Microsoft.WindowsCommunicationsApps", # Calendar and Mail
    "king.com.CandyCrushSodaSaga",
    "king.com.CandyCrushFriends",
    "*.DisneyMagicKingdoms",
    "DolbyLaboratories.DolbyAccess",
    "*.Facebook",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.GetStarted",
    "Microsoft.WindowsMaps",
    "*.MarchofEmpires",
    "Microsoft.Messaging",
    "Microsoft.OneConnect", # Mobile Plans
    "Microsoft.Office.OneNote",
    "Microsoft.MSPaint",
    "Microsoft.People",
    "Microsoft.Windows.Photos",
    "Microsoft.Print3D",
    "Microsoft.SkypeApp",
    "*.SlingTV",
    "Microsoft.MicrosoftSolitaireCollection",
    "SpotifyAB.SpotifyMusic",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.Office.Sway",
    "*.Twitter",
    "Microsoft.WindowsSoundRecorder", # Voice Recorder
    "Microsoft.WindowsPhone", # Windows Phone Companion
    "Microsoft.XboxApp",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.DesktopAppInstaller",
    "Microsoft.GetHelp",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MixedReality.Portal",
    "Microsoft.ScreenSketch",
    "Microsoft.StorePurchaseApp",
    "Microsoft.Wallet",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.YourPhone",
    "*.XING"
)

$AppsToRemove | ForEach-Object {
    Get-AppxPackage $_ -AllUsers | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | Where DisplayName -like $_ | Remove-AppxProvisionedPackage -Online
}

# Uninstall Windows Media Player
Disable-WindowsOptionalFeature -Online -FeatureName "WindowsMediaPlayer" -NoRestart -WarningAction SilentlyContinue | Out-Null

# Prevent "Suggested Applications" from returning
if (!(Test-Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent")) {New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Type Folder | Out-Null}
Set-ItemProperty "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" "DisableWindowsConsumerFeatures" 1
