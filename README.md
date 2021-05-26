# Royal Bearing Photo Printer

The goal of this project is to power a station where orders 
can be scanned after the pictures are taken, and the pictures 
will be printed out and included with the order.

##Scanner: 
Any bar code scanner can be used. It must be 
configured to issue an ENTER character after the code. https://www.ssetechnologies.com/ls2208-add-enter-tab-key/

##Printer
The printer should be a local printer, exclusive to the machine 
running this station. The printer title shjould be: RBOrderPhotoPrinter

##Computer
The computer needs to be running Windows, and have ExpanDrive
and ImageMagick installed

##ExpanDrive
This needs to be configured to be logged in to the Gtransfer16@gmail.com account 
as the Y: drive.
https://www.expandrive.com/

## Execution Policy
Scripts need to be allowed on the system. Run this command: Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force;


##Usage
Open a Windows command window in the root directory (C:\PhotoPrinter)
and run the command "Powershell scan.ps1". You should see a prompt 
that says "Ready for scan", scan the code and it should create
the tiles image and print. 