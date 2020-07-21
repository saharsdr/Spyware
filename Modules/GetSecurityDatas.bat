$ipV4 = Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address 
$ip=$ipV4.IPAddressToString
$address ='datas\'+$ip+'SecurityInfo.txt'

$antivirous = Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct 
"------antivirous: " | out-file $address 
$antivirous| select displayName, productState | Add-Content  $address 

$fireWall = Get-NetFirewallProfile
"------firewall: " | Add-Content  $address 
$fireWall | Add-Content  $address 

$PasswordLastSet = Get-localUser| select name,PasswordLastSet
"------Password Last Set: " | Add-Content  $address 
$PasswordLastSet | Add-Content  $address 

$userToFind = $args[0] 
$administratorsAccount = Get-WmiObject Win32_Group -filter "LocalAccount=True AND SID='S-1-5-32-544'" 
$administratorQuery = "GroupComponent = `"Win32_Group.Domain='" + $administratorsAccount.Domain + "',NAME='" + $administratorsAccount.Name + "'`"" 
$admins = Get-WmiObject Win32_GroupUser -filter $administratorQuery | select PartComponent |where {$_ -match $userToFind}
"------Administrator users: " | Add-Content  $address 
$admins | Add-Content  $address 

$uacStatus = Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA | select EnableLUA
"------UAC Status: " | Add-Content  $address 
$uacStatus | Add-Content  $address 

$updateStatus = get-wmiobject -class win32_quickfixengineering | select *
"------Update Status: " | Add-Content  $address 
$updateStatus | Add-Content  $address 

$doNotHasSSH = (Get-Command New-PSSession).ParameterSets|select -Unique true|where .name -NotLike ssh
"------Do Not Has SSH: " | Add-Content  $address 
$doNotHasSSH | Add-Content  $address 

$hasSSH = (Get-Command New-PSSession).ParameterSets|select -Unique true|where .name -Like ssh
"------Has SSH: " | Add-Content  $address 
$hasSSH | Add-Content  $address 

