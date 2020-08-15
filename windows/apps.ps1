
$AppsToRemove = @(
    "*.AutodeskSketchBook",
    "*.DisneyMagicKingdoms",
    "*.Facebook",
    "*.MarchofEmpires",
    "*.SlingTV",
    "*.Twitter",
    "*.XING",
    "AppUp.IntelGraphicsExperience",
    "AppUp.ThunderboltControlCenter",
    "DolbyLaboratories.DolbyAccess",
    "king.com.BubbleWitch3Saga",
    "king.com.CandyCrushFriends",
    "king.com.CandyCrushSodaSaga",
    "Microsoft.3DBuilder",
    "Microsoft.BingFinance",
    "Microsoft.BingNews",
    "Microsoft.BingSports",
    "Microsoft.BingWeather",
    "Microsoft.DesktopAppInstaller",
    "Microsoft.GetHelp",
    "Microsoft.GetStarted",
    "Microsoft.Messaging",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.MixedReality.Portal",
    "Microsoft.MSPaint",
    "Microsoft.Office.OneNote",
    "Microsoft.Office.Sway",
    "Microsoft.OneConnect", # Mobile Plans
    "Microsoft.People",
    "Microsoft.Print3D",
    "Microsoft.ScreenSketch",
    "Microsoft.SkypeApp",
    "Microsoft.StorePurchaseApp",
    "Microsoft.Wallet",
    "Microsoft.Windows.Photos",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsCommunicationsApps", # Calendar and Mail
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsPhone", # Windows Phone Companion
    "Microsoft.WindowsSoundRecorder", # Voice Recorder
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.YourPhone",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "NVIDIACorp.NVIDIAControlPanel",
    "RivetNetworks.KillerControlCenter",
    "SpotifyAB.SpotifyMusic",
    "WavesAudio.MaxxAudioProforDell2020"
)

$AppsToRemove | ForEach-Object {
    Get-AppxPackage $_ -AllUsers | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | Where DisplayName -like $_ | Remove-AppxProvisionedPackage -Online
}

# Uninstall Windows Media Player
Disable-WindowsOptionalFeature -Online -FeatureName "WindowsMediaPlayer" -NoRestart -WarningAction SilentlyContinue | Out-Null

# Prevent "Suggested Applications" from returning
if (!(Test-Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent")) {
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Type Folder | Out-Null
}
Set-ItemProperty "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" "DisableWindowsConsumerFeatures" 1
