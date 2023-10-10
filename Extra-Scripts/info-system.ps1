
# this script shows the system information of your local computer
<#
Windows Management Interface (WMI) is a popular management interface that can access data about a computer, this is what is being used in this script.
However, I found out that WMI is being deprecated, and PowerShell today relies heavily on PSRemoting and the security features it includes.
Given that this is just a simple script that shows your local computer info, I left the WMI cmdlet, 
however for more complex/security-related scripts you should use the Get-CIMInstance cmdlet instead.
#>

#CPU info
$CPU = Get-WmiObject -class Win32_Processor
$CPU_Name = $CPU.Name
$CPU_Manufacturer = $CPU.Manufacturer

#BIOS info
$BIOS = Get-WmiObject -Class Win32_Bios
$BIOS_Name = $BIOS.Name
$BIOS_Manufacturer = $BIOS.Manufacturer

#OS info
$OS = Get-WmiObject -class Win32_OperatingSystem
$OS_Name = $OS.Caption
$OS_Version = $OS.Version

#Computer System info
$CS = Get-WmiObject -class Win32_ComputerSystem
$CS_Name = $CS.Name
$CS_Owner = $CS.PrimaryOwnerName

#RAM info
$RAM = Get-WmiObject -Query "SELECT TotalVisibleMemorySize FROM Win32_OperatingSystem" #if the Query parameter is specified, the cmdlet runs WMI query language (WQL) commands
$RAMtotal = Math.Round($RAM.TotalVisibleMemorySize/1MB, 2)

#Disk info
$Disk = Get-WmiObject -class Win32_LogicalDisk -Filter "DeviceID='C:'" #filter specifies a "Where clause"
$Disk_ID = $Disk.DeviceID
$Disk_Space = Math.Round($Disk.Size/1GB, 2)

$systeminfo = systeminfo
# shows the network configuration and addresses
$ipconfig = ipconfig

# creates an array containing all the info retrieved above;
$infoproperties = @{ 
'CPU_Name'= $CPU_Name;
'CPU_Manufacturer'= $CPU_Manufacturer;
'BIOS_Name' = $BIOS_Name;
'BIOS_Manufacturer' = $BIOS_Manufacturer;
'OS_Name'= $OS_Name;
'OS_Version'= $OS_Version;
'CS_Name'= $CS_Name;
'CS_Owner'= $CS_Owner;
'RAM_total'= $RAMtotal;
'Disk_ID'= $Disk_ID;
'Disk_Space'= $Disk_Space;
 #extra info added to the array
'systeminfo'= $systeminfo;
'ipconfig'= $ipconfig; }

# creates a new object, PSObject (name) and loads all the properties from $infoprop into it
$infosystem = New-Object -TypeName PSObject -Prop $infoproperties
# converts the above data to JSON 
$infosystem = $infosystem | ConvertTo-JSON

# shows all the system info
Write-Host "Here's the main system information about your local computer:
$($infosystem)" 

