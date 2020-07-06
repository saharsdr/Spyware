$osInfo = Get-ComputerInfo -property OsType, OsVersion, OsName, OsLocalDateTime
"------OS Type: " + $osInfo.OsType | out-file 'datas\osInfo.txt'
"------OS Version: " + $osInfo.OsVersion | Add-Content  'datas\osInfo.txt'
"------OS Name: " + $osInfo.OsName | Add-Content 'datas\osInfo.txt'
"------OS LocalDateTime: " + $osInfo.OsLocalDateTime | Add-Content 'datas\osInfo.txt'