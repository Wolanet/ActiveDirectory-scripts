<h1>PowerShell scripts for AD enviroment</h1>
Blog post for a more detailed walk-through >

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
<br />

<h2>Screenshots</h2>

<p align="center">
Select the disk:  <br/>
<img src="https://-------------" height="80%" width="80%" alt="PShell script"/>
<br />
<br />
Enter the number of passes: <br/>
<img src="https://------------" height="80%" width="80%" alt="PShell script"/>
</p>
<br />
<br />
