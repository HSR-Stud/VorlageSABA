# BA_Vorlage
Vorlage für die Bachelor-Arbeit

## Anleitung Putzdienst

you can set this code as usercommand in texstudio but it will only clear the folder in which the file is located.
Or just run it with powershell.


 powershell "& ""C:/pfad/putzdienst.ps1"" "


for bibtex compile write a new command:
Options->Configure Texstudio->Build->UserCommands->add  
txs:///view-pdf | txs:///pdflatex | txs:///bibtex | txs:///pdflatex | txs:///pdflatex 
