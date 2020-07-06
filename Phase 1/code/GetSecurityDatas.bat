$antivirous = Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct 
"------antivirous: " | out-file 'datas\SecurityInfo.txt'
$antivirous| select displayName, productState | Add-Content  'datas\SecurityInfo.txt'

$fireWall = Get-NetFirewallProfile
"------firewall: " | Add-Content  'datas\SecurityInfo.txt'
$fireWall | Add-Content  'datas\SecurityInfo.txt'

$PasswordLastSet = Get-localUser -Name R.A.Avenger  | select PasswordLastSet
"------Password Last Set: " | Add-Content  'datas\SecurityInfo.txt'
$PasswordLastSet | Add-Content  'datas\SecurityInfo.txt'

$userToFind = $args[0] 
$administratorsAccount = Get-WmiObject Win32_Group -filter "LocalAccount=True AND SID='S-1-5-32-544'" 
$administratorQuery = "GroupComponent = `"Win32_Group.Domain='" + $administratorsAccount.Domain + "',NAME='" + $administratorsAccount.Name + "'`"" 
$admins = Get-WmiObject Win32_GroupUser -filter $administratorQuery | select PartComponent |where {$_ -match $userToFind}
"------Administrator users: " | Add-Content  'datas\SecurityInfo.txt'
$admins | Add-Content  'datas\SecurityInfo.txt'

$uacStatus = Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA | select EnableLUA
"------UAC Status: " | Add-Content  'datas\SecurityInfo.txt'
$uacStatus | Add-Content  'datas\SecurityInfo.txt'

$updateStatus = get-wmiobject -class win32_quickfixengineering | select *
"------Update Status: " | Add-Content  'datas\SecurityInfo.txt'
$updateStatus | Add-Content  'datas\SecurityInfo.txt'

$doNotHasSSH = (Get-Command New-PSSession).ParameterSets|select -Unique true|where .name -NotLike ssh
"------Do Not Has SSH: " | Add-Content  'datas\SecurityInfo.txt'
$doNotHasSSH | Add-Content  'datas\SecurityInfo.txt'

$hasSSH = (Get-Command New-PSSession).ParameterSets|select -Unique true|where .name -Like ssh
"------Has SSH: " | Add-Content  'datas\SecurityInfo.txt'
$hasSSH | Add-Content  'datas\SecurityInfo.txt'

