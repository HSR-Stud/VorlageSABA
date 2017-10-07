  
#set this code as usercommand in texstudio:
#  powershell "& ""C:/pfad/putzdienst.ps1"" "



function Get-ScriptDirectory{
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}

$path = (Get-ScriptDirectory)

cd $path


remove-item  *.log |% {remove-item $_}

get-childitem *.toc |% {remove-item $_}

get-childitem *.gz |% {remove-item $_}

get-childitem *.aux |% {remove-item $_}

get-childitem *.nav |% {remove-item $_}

get-childitem *.out |% {remove-item $_}

get-childitem *.synctex |% {remove-item $_}

get-childitem *.synctex.gz |% {remove-item $_}

get-childitem *.tmp |% {remove-item $_}

get-childitem *.4ct |% {remove-item $_}

get-childitem *.4tc |% {remove-item $_}

get-childitem *.anl |% {remove-item $_}

get-childitem *.lg |% {remove-item $_}

get-childitem *.idv |% {remove-item $_}

get-childitem *.xref |% {remove-item $_}

get-childitem *.bbl |% {remove-item $_}

get-childitem *.blg |% {remove-item $_}

get-childitem *.equ |% {remove-item $_}

get-childitem *.idx |% {remove-item $_}

get-childitem *.lof |% {remove-item $_}

get-childitem *.lot |% {remove-item $_}

get-childitem *.ptc |% {remove-item $_}

get-childitem *.tdo |% {remove-item $_}

get-childitem *.xml |% {remove-item $_}

get-childitem BA-blx.bib |% {remove-item $_}

exit