#get data from os
$computerInfo = Get-ComputerInfo -property CsName, CsUserName
"------Computer Name: " + $computerInfo.CsName | out-file 'datas\UserInfo.txt'
"------UserName: " + $computerInfo.CsUserName | Add-Content 'datas\UserInfo.txt'
"------User Path: " + $env:USERPROFILE | Add-Content 'datas\UserInfo.txt'
$PartitionCount = Get-Partition
$PartitionCount = $PartitionCount.PartitionNumber[-1]
"------Disk Partition Count: " + $PartitionCount | Add-Content 'datas\UserInfo.txt'
$instaled64BitApps = get-childitem 'C:\Program Files\'| select name
$instaled32BitApps = get-childitem 'C:\Program Files (x86)\'| select name
"------Instaled Apps: " | Add-Content 'datas\UserInfo.txt'
$instaled32BitApps.name | Add-Content 'datas\UserInfo.txt'
$instaled64BitApps.name | Add-Content 'datas\UserInfo.txt'
$userFiles = Get-ChildItem -Recurse -Depth 5 $env:USERPROFILE
"------User Files: " | Add-Content 'datas\UserInfo.txt'
$userFiles.name | Add-Content 'datas\UserInfo.txt'


