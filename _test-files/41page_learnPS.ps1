$var = 'hello'

function MyFunction {

    Write-Host "In function var contains now '$var'"
    Write-Host "Changing var to goobdye"
    $var = "goodbye!"
    Write-Host "In function var contains now '$var'"
}

MyFunction

Write-Host "In script var is still $var"