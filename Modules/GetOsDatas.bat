$ipV4 = Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address 
$ip=$ipV4.IPAddressToString
$address ='datas\'+$ip+'OsInfo.txt'

$osInfo = Get-ComputerInfo -property OsType, OsVersion, OsName, OsLocalDateTime
"------OS Type: " + $osInfo.OsType | out-file $address 
"------OS Version: " + $osInfo.OsVersion | Add-Content  $address 
"------OS Name: " + $osInfo.OsName | Add-Content $address 
"------OS LocalDateTime: " + $osInfo.OsLocalDateTime | Add-Content $address 
