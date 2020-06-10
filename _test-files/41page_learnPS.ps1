$var = 'hello'

function MyFunction {

    Write-Host "In function var contains now '$var'"
    Write-Host "Changing var to goobdye"
    $var = "goodbye!"
    Write-Host "In function var contains now '$var'"
}

MyFunction

Write-Host "In script var is still $var"

Function New-Drives {
    Param()
    New-PSDrive -Name AppData -PSProvider FileSystem -Root $env:Appdata 
    New-PSDrive -Name Temp -PSProvider FileSystem -Root $env:TEMP
    $mydocs=Join-Path -Path $env:userprofile -ChildPath Documents
    New-PSDrive -Name Docs -PSProvider FileSystem -Root $mydocs
    }
    New-Drives
    # dir temp: | measure-object –property length -sum