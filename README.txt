Win10 Powershell script to batch add trusted root and non-root Certificate Authorities.

1. Create CAs folder on C:\
	Add Root CAs to C:\CAs\Root
	Add non-Root CAs to C:\CAs\Other
	

2. Open Powershell AS ADMIN

3. Enable running of PowerShell scripts:

	Set-ExecutionPolicy RemoteSigned

	y to confirm

4. Run the script:
	cd C:\CAs

	.\install_certs.ps1

	Enter local admin password when asked


4a. If error received: "this file is not digitally signed. The script will not execute on the system":
	Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

	y to confirm

	Redo Step 4.


