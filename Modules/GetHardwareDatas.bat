$address ='datas\ardwareInfo.txt'

$motherBoard = Get-WmiObject win32_baseboard
"------Motherboard name: " + $motherBoard.name | out-file $address
"------Motherboard manufacturer: " + $motherBoard.manufacturer  | Add-Content $address

$bios = Get-WmiObject win32_bios
"------Bios version: " + $bios.version  | Add-Content $address

$diskName = wmic diskdrive get name
"------Disk name: "+ $diskName  | Add-Content $address
$diskSize = wmic diskdrive get name
"------Disk size: "+ $diskSize  | Add-Content $address
$diskSerial = wmic diskdrive get name
"------Disk serial: "+ $diskSeial  | Add-Content $address

$netNameSpeed = wmic NIC where NetEnabled=true get Name,Speed 
"------Network info: " | Add-Content $address
$netNameSpeed  | Add-Content $address

$cdROM = Get-WmiObject Win32_CDROMDrive 
"------CD/DVD ROM name: "+ $cdRom.name  | Add-Content $address

$cpuName = Get-WmiObject -class Win32_processor
"------CPU name: "+ $cpuName.name  | Add-Content $address

$coreNumber = Get-CimInstance Win32_ComputerSystem
"------Core number: "+ $coreNumber.NumberOfLogicalProcessors  | Add-Content $address

$ram = Get-WmiObject win32_physicalmemory | select name , MemoryType, Capacity
"------RAM info: "  | Add-Content $address
$ram  | Add-Content $address



$gpu = Get-WmiObject Win32_VideoController | select name,adapterram 
"------Graphic: " | Add-Content $address
$gpu  | Add-Content $address
