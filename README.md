<h1>🧱 PowerShell scripts for AD enviroment</h1>
Blog post for a more detailed walk-through >  (link to come)

<h2>📙 Description</h2>

Here you will find two very simple **PowerShell utility scripts**, to be used in Active Directory and Windows enviroment.
<br />
<br />
- The first script, ```Generate_Users.ps1```, will automatically add any number of users to the Active Directory database, in a folder called ```_USERS```, keep in mind that you can change the name of the folder. You will specify name and surname (follow the format of the example names already present in the listnames.txt file, that is "first Name" + space + "last name") of each user that you'd like to add by simplying writing them in the listnames.txt file.
<br />

 *note*, in the .ps1 file (PowerShell code) there are a lot of comments explaining what the code does/how to modify it etc., feel free to ignore them or delete them.

 *note2*, in the listnames.txt replace "Myname Mysurname" with your name and surname, if you want to add yourself as well to Active Directory, otherwise delete that first line.
<br />
<br />

- The second script, ```Clear-all-printjobs.ps1```, will clear the printing queue and cancel any print jobs that might be there. It could be useful to troubleshoot issues with your printer (if the issue is software related, and not hardware related), for example the print spooler is stuck, then clearing the print job queue could fix the issue. <br />
This script will also get and display the name of the printers (if any) and let you know if any print job has been cancelled.

<h2>📗 Tested environments</h2>

- <b>Windows 10/11, Windows Server 2022</b>

<h2>Screenshots</h2>

Enter the following command to being able to run the Generate_Users script (you can change it back after):  <br />

![Sample image](images/PShellscript1.png)
<br />

Use the cd command to go where the txt file is store: <br />

![Sample image](images/PShellscript2.png)
<br />

The Generate_Users script in function: <br />

![Sample image](images/PShellscript3.png)
<br />
Keep in mind that what's being displayed is the username, which is a combination of the first latter of the first name and the last name, if you check the profile associated with those usernames in Active Directory you will also find the full first name and last name of each user.
<br />

Execution of the second script: <br />

![Sample image](images/PShellscript4.png)
<br />
<br />

<!-- If you want to upload the image instead of using a relative path:  <img src="https://---------" height="80%" width="80%" alt="PShell script"/> 
!-->

