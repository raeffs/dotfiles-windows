
$AppsToRemove = @(
    "*.AutodeskSketchBook*",
    "*.DisneyMagicKingdoms*",
    "*.Facebook*",
    "*.MarchofEmpires*",
    "*.SlingTV*",
    "*.Twitter*",
    "*.XING*",
    "*ACGMediaPlayer*",
    "*ActiproSoftwareLLC*",
    "*AdobeSystemsIncorporated.AdobePhotoshopExpress*",
    "*Amazon.com.Amazon*",
    "*AmazonVideo.PrimeVideo*",
    "*AppUp.ThunderboltControlCenter*",
    "*Asphalt8Airborne*",
    "*AutodeskSketchBook*",
    "*CaesarsSlotsFreeCasino*",
    "*Clipchamp.Clipchamp*",
    "*COOKINGFEVER*",
    "*CyberLinkMediaSuiteEssentials*",
    "*Disney*",
    "*DisneyMagicKingdoms*",
    "*Dolby*",
    "*DolbyLaboratories.DolbyAccess*",
    "*DrawboardPDF*",
    "*Duolingo-LearnLanguagesforFree*",
    "*EclipseManager*",
    "*Facebook*",
    "*FarmVille2CountryEscape*",
    "*fitbit*",
    "*Flipboard*",
    "*HiddenCity*",
    "*HULULLC.HULUPLUS*",
    "*iHeartRadio*",
    "*Instagram*",
    "*king.com.BubbleWitch3Saga*",
    "*king.com.CandyCrushFriends*",
    "*king.com.CandyCrushSaga*",
    "*king.com.CandyCrushSodaSaga*",
    "*LinkedInforWindows*",
    "*MarchofEmpires*",
    "*Microsoft.3DBuilder*",
    "*Microsoft.549981C3F5F10*",  #Cortana app
    "*Microsoft.BingFinance*",
    "*Microsoft.BingFoodAndDrink*",           
    "*Microsoft.BingHealthAndFitness*",        
    "*Microsoft.BingNews*",
    "*Microsoft.BingSports*",
    "*Microsoft.BingTranslator*",
    "*Microsoft.BingTravel*",
    "*Microsoft.BingWeather*",
    "*Microsoft.DesktopAppInstaller*",
    "*Microsoft.GamingApp*",                    # Modern Xbox Gaming App, required for installing some PC games
    "*Microsoft.GetHelp*",
    "*Microsoft.Getstarted*",  # Cannot be uninstalled in Windows 11
    "*Microsoft.Messaging*",
    "*Microsoft.Microsoft3DViewer*",
    "*Microsoft.MicrosoftOfficeHub*",
    "*Microsoft.MicrosoftPowerBIForWindows*",
    "*Microsoft.MicrosoftSolitaireCollection*",
    "*Microsoft.MicrosoftStickyNotes*",
    "*Microsoft.MixedReality.Portal*",
    "*Microsoft.MSPaint*",
    "*Microsoft.NetworkSpeedTest*",
    "*Microsoft.News*",
    "*Microsoft.Office.OneNote*",
    "*Microsoft.Office.Sway*",
    "*Microsoft.OneConnect*", # Mobile Plans
    "*Microsoft.People*",
    "*Microsoft.Print3D*",
    "*Microsoft.ScreenSketch*",
    "*Microsoft.SkypeApp*",
    "*Microsoft.StorePurchaseApp*",
    "*Microsoft.Todos*",
    "*Microsoft.Wallet*",
    "*Microsoft.Windows.Photos*",
    "*Microsoft.WindowsAlarms*",
    "*Microsoft.WindowsCamera*",
    "*Microsoft.WindowsCommunicationsApps*", # Calendar and Mail
    "*Microsoft.WindowsFeedbackHub*",
    "*Microsoft.WindowsMaps*",
    "*Microsoft.WindowsPhone*", # Windows Phone Companion
    "*Microsoft.WindowsSoundRecorder*", # Voice Recorder
    "*Microsoft.Xbox.TCUI*",
    "*Microsoft.XboxApp*",  # Old Xbox Console Companion App, no longer supported
    "*Microsoft.XboxGameOverlay*",
    "*Microsoft.XboxGamingOverlay*",
    "*Microsoft.XboxIdentityProvider*",
    "*Microsoft.XboxSpeechToTextOverlay*",
    "*Microsoft.YourPhone*",
    "*Microsoft.ZuneMusic*",
    "*Microsoft.ZuneVideo*",
    "*MicrosoftCorporationII.MicrosoftFamily*",  # Family Safety App
    "*MicrosoftTeams*",  # Only removes the personal version (MS Store), does not remove business/enterprise version of teams
    "*Netflix*",
    "*NYTCrossword*",
    "*OneCalendar*",
    "*PandoraMediaInc*",
    "*PhototasticCollage*",
    "*PicsArt-PhotoStudio*",
    "*Plex*",
    "*PolarrPhotoEditorAcademicEdition*",
    "*RivetNetworks.KillerControlCenter*",
    "*Royal Revolt*",
    "*Shazam*",
    "*Sidia.LiveWallpaper*",
    "*SlingTV*",
    "*Speed Test*",
    "*Spotify*",
    "*SpotifyAB.SpotifyMusic*",
    "*TikTok*",
    "*TuneInRadio*",
    "*Twitter*",
    "*Viber*",
    "*WavesAudio.MaxxAudioProforDell2020",
    "*WinZipUniversal*",
    "*Wunderlist*",
    "*XING*"
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




