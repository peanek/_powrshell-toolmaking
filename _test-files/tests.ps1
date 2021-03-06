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

$go = $true
if ($go -eq $false) {
    Write-Host "It's true"
}
else {
    Write-Host "Not true"
}

if ("Power" -eq "*owe*") {
	Write-Host "It is True"
}
else {
	Write-Host "It is False"
}

$status = 1 

switch ($status) {
0 {$status_text="ok"}
1 {$status_text="error"}
default {$status_text="unknown"}
}
Write-Host $status_text

$services = (Get-Service).name
$result = ""
switch -wildcard ($services) {
"*SQL*" {
	$result+="Service SQL"
	break
	}
"*MSSQL*" {
	$result+="MS SQL"
	break
	}
}
Write-Host $result

$typeOne = "1"
$typeTwo = 2
Write-Host $typeOne.GetType()
Write-Host $typeTwo.GetType()
Write-Host "$typeOne"
Write-Host '$typeTwo'

$i = 0;
Do {
	Write-Host $i
	$i++;
} while ($i -lt 5)

#$services = (Get-Service).name
#ForEach ($service in $services) {
#	if ($service -like "*SQL*") {
#		Write-Host $service | Stop-Service -Verbose
#	}
#}

for ($i=5; $i -gt 0; $i--) {
	Write-Host $i
}

1..10 | ForEach-Object -Process {
	Write-Host $_
}

Write-Host "------------------`n"
Write-Host "`tNext"

$j = 0
do {
	Write-Host $j
	if	($j -eq 5) {
		break
	}
	$j++
} while ($j -lt 100)

Write-Host "------------------`n"
Write-Host "`tNext"