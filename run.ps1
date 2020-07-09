 Start-Process 'powershell.exe' -RedirectStandardInput "\\192.168.150.1\share\Modules\GetOsDatas.bat"  -WindowStyle Hidden
 Start-Process 'powershell.exe' -RedirectStandardInput "\\192.168.150.1\share\Modules\GetUserDatas.bat"  -WindowStyle Hidden
 Start-Process 'powershell.exe' -RedirectStandardInput "\\192.168.150.1\share\Modules\GetSecurityDatas.bat"  -WindowStyle Hidden
 Start-Process 'powershell.exe' -RedirectStandardInput "\\192.168.150.1\share\Modules\GetHardwareDatas.bat"  -WindowStyle Hidden
