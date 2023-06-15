clear

Function GetGlobalHistory {cat (Get-PSReadlineOption).HistorySavePath}

Function measure_time_of_last_command { $command = (Get-History -Count 1) ; '{0}' -f ($command.EndExecutionTime - $command.StartExecutionTime) }

Function prompt { 
 	$promptString = $Admin + "$env:CONDA_PROMPT_MODIFIER PS $(get-location)> " 
     Write-Host $promptString -NoNewline -ForegroundColor Cyan
     return " "
}

cd C:\


Set-Alias -Name history -Value GetGlobalHistory -Option AllScope
New-Alias -Name grep -Value Select-String -Option AllScope
New-alias -Name subl -Value "C:\Program Files\Sublime Text\sublime_text.exe" -Option AllScope
New-alias -Name last_time -Value measure_time_of_last_command -Option AllScope


if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Ctrl+u -Function BackwardDeleteLine
Set-PSReadlineKeyHandler -Key Ctrl+w -Function BackwardDeleteWord
