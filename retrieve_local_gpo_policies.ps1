Install-Module PolicyFileEditor

$MachineDir = "$env:windir\system32\GroupPolicy\Machine\registry.pol"
$UserDir = "$env:windir\system32\GroupPolicy\User\registry.pol"

Get-PolicyFileEntry -Path $MachineDir -All | Export-Clixml -Path $env:USERPROFILE\Desktop\MachinePol.xml
Get-PolicyFileEntry -Path $UserDir -All | Export-Clixml -Path $env:USERPROFILE\Desktop\UserPol.xml
