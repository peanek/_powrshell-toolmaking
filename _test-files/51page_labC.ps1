$logFile = 'c:\_logs\ErrorLog_52page_labC.log'

function Get-RemoteServiceInfo {
    param (
        [string]$computerName = 'localhost'
    )

    $services = Get-Service | Select-Object Name,DisplayName,Status

    foreach ($service in $services) {
        if ($service.Status -eq "Running" -and $service.DisplayName -like "*SQL*") {
            Write-Host $service
        }
    }
}

Get-RemoteServiceInfo