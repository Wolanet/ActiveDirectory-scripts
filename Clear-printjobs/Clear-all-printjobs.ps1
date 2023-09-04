
# Removes all the print jobs from all the printer devices, useful if your printer/print spooler is stuck and you need to reset it or clear the Queue

	#get a list of all the printers in AD, also considering if you don't find any printers
	$printers = Get-Printer
	if ($printers.Count -eq 0) { throw "No printers available" }
	
	# Loop through each printer and remove all print jobs
	foreach ($printer in $printers) {
		$printerName = $printer.Name
        Write-Host "Cancelling print jobs for printer: $printerName"
		$printjobs = Get-PrintJob -PrinterObject $printer
		
		foreach ($printjob in $printjobs) {
			Remove-PrintJob -InputObject $printjob
		}
	Write-Host "All print jobs cancelled for printer: $printerName"
	}