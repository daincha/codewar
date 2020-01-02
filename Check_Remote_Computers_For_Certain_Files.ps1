$Computer=""
$CheckFilepath=""
$filelist=""
$file=""
$result=""

$path = "C:\Users\Administrator\Computer.txt"

Import-Csv $path | ForEach-Object {

$Computer = $_.Computer

if (Test-Connection -Computername $Computer -BufferSize 16 -Count 1 -Quiet)
{

  $CheckFilepath = "\\$Computer\C$\Windows\*"

  $filelist = (Get-Item $CheckFilepath).Name

  foreach($file in $filelist)
   {
     If ($file -like "*KEYWORD*")
     {
        $result = $Computer + " " +$file
        $result >> "C:\Users\Administrator\result20190124.txt"
        $result=""
     }

   }
 }
 else 
   {
        $result = $Computer + " " + "Offline"
        $result >> "C:\Users\Administrator\result20190124.txt"
        $result=""
 
    }


}
