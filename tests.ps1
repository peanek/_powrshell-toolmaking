Clear-Host
# Get-Process;
# Get-Service
#
#$numbers = 1,2,3,4,5
#"" + $numbers[-2]
#
#$processess = Get-Process
#$prompt = "First process is $($processess[0].Name)"
#Write-Host $prompt

$debug = "`$computer contains $computer"
"" + $debug
$hor = "Column`tColumn`tColumn`t"
"" + $hor


$processVars = Get-Process
"" + $processVars[0].name.ToUpper()
"" + $processVars.Length
$name = $processVars[0].name
"" + $name.ToUpper()

$name = (Get-Service)[0].name
Write-Host $name