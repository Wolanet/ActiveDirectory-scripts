
#This script can show the status and the scan day of Windows Defender, or it can enable/disable it's real-time protection

$option = Read-Host "
|=================|

 Choose an option:

1. Check Windows Defender status and view the scheduled scan day.
2. Disable real-time protection.
3. Enable real-time protection.

|=================| "

$windefender = Get-MpPreference
$sday = $windefender.ScanScheduleDay

switch($option) {

1 {
if($windefender.DisableRealtimeMonitoring) { Write-Host "Real-time protection of Windows Defender is disabled. The scheduled scan day is: $($sday)"  } 
else { Write-Host "Real-time protection of Windows Defender is enabled. The scheduled scan day is: $($sday)" }

break }

2 {
$windefender.DisableRealtimeMonitoring = $true
$windefender | Set-MpPreference
Write-Host "Real-time protection of Windows Defender has been disabled."

break }

3 {
$windefender.DisableRealtimeMonitoring = $false
$windefender | Set-MpPreference
Write-Host "Real-time protection of Windows Defender has been enabled."

break }

default {
Write-Host "Invalid option..."
break   }

}