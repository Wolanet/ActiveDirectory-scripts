#feel free to edit these variables as you prefer, e.g. change the password to something else
#Most of this script is highly customizable as per your needs
$USER_PASSWORD = "Admin1"
$USERS_NAMES_LIST = Get-Content .\listnames.txt
#run the cd command to go where the listnames.txt file is stored before running the script, OR write the full path of the location where the txt file is stored after Get-Content

#this stores the plain text password into an object
$password = ConvertTo-SecureString $USER_PASSWORD -AsPlainText -Force
#this creates the organizational unit called _USERS
New-ADOrganizationalUnit -Name _USERS

<#
This is the main script, it's gonna store the first name of the user from the listnames.txt in the variable "first",
by splitting the first element (first name) with the second element (the surname), since they're separated by a space character,
then the surname is store in the "last" variable.
#>
foreach ($n in $USERS_NAMES_LIST) {
    $first = $n.Split(" ")[0].ToLower()
    $last = $n.Split(" ")[1].ToLower()
	
	#this will create the username by glueing together the first letter of the first name and the surname, in lowercase
    $username = "$($first.Substring(0,1))$($last)".ToLower()
	
	#this outputs on the screen that we're generating the users, feel free to customize as you'd like
    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Green
    
	#this generates all the users by setting all the parameters automatically
    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=_USERS,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true
}
Write-Host "All done!"
