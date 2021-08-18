clear-host

$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'

Set-ItemProperty $key AutoCheckSelect 0
Set-ItemProperty $key DontPrettyPath 0
Set-ItemProperty $key Filter 0
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideDrivesWithNoMedia 0
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key HideIcons 0
Set-ItemProperty $key HideMergeConflicts 0
Set-ItemProperty $key IconsOnly 0
Set-ItemProperty $key LaunchTo 1
Set-ItemProperty $key ListviewAlphaSelect 1
Set-ItemProperty $key MapNetDrvBtn 0
Set-ItemProperty $key ReindexedProfile 1
Set-ItemProperty $key SeparateProcess 0
Set-ItemProperty $key ServerAdminUI 0
Set-ItemProperty $key SharingWizardOn 0
Set-ItemProperty $key ShowCompColor 1
Set-ItemProperty $key ShowInfoTip 1
Set-ItemProperty $key ShowStatusBar 1
Set-ItemProperty $key ShowSuperHidden 1
Set-ItemProperty $key ShowTypeOverlay 1
Set-ItemProperty $key Start_SearchFiles 2
Set-ItemProperty $key StartMenuInit 13
Set-ItemProperty $key StoreAppsOnTaskbar 1
Set-ItemProperty $key TaskbarAnimations 1
Set-ItemProperty $key WebView 1

stop-process -Name explorer