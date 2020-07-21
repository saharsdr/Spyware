 Start-Process 'powershell.exe' -RedirectStandardInput "Modules\GetOsDatas.bat"  -WindowStyle Hidden
 Start-Process 'powershell.exe' -RedirectStandardInput "Modules\GetUserDatas.bat"  -WindowStyle Hidden
 Start-Process 'powershell.exe' -RedirectStandardInput "Modules\GetSecurityDatas.bat"  -WindowStyle Hidden
 Start-Process 'powershell.exe' -RedirectStandardInput "Modules\GetHardwareDatas.bat"  -WindowStyle Hidden
