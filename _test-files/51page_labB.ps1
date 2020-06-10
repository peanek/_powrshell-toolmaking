$logFile = 'c:\_logs\ErrorLog_52page_labC.log'

function Get-RemoteComputerDiskInfo {
    param (
        [string]$computerName = 'localhost'
    )

    $disks = Get-WmiObject -Class Win32_Volume -Filter 'DriveType=3'

    foreach ($disk in $disks) {
        $disk | Select ComputerName,Drive,FreeSpace,Size
    }
}

Get-RemoteComputerDiskInfo