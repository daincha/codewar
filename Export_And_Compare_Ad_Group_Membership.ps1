Import-Module ActiveDirectory
 
get-adgroupmember "AdGroupA" -recursive | Select SamAccountName, Name | Export-csv -path C:\Users\Administrator\AdGroupA.csv -NoTypeInformation
 
get-adgroupmember "AdGroupB" -recursive | Select SamAccountName, Name| Export-csv -path C:\Users\Administrator\AdGroupB.csv -NoTypeInformation
 
$groupa = Get-ADGroupMember "AdGroupA"
 
$groupb = Get-ADGroupMember "AdGroupB"
 
$groupa.SamAccountName | where {$groupb.SamAccountName -contains $psitem} | Out-File -filepath C:\Users\Administrator\InBothGroup.csv
 
$groupa.SamAccountName | where {$groupb.SamAccountName -notcontains $psitem} | Out-File -filepath C:\Users\Administrator\InGroupAONLY.csv
 
$groupb.SamAccountName | where {$groupa.SamAccountName -notcontains $psitem} | Out-File -filepath C:\Users\Administrator\InGroupBONLY.csv
