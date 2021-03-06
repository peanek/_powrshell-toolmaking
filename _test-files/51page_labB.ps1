# $logFile = 'c:\_logs\ErrorLog_52page_labC.log'

# function Get-RemoteComputerDiskInfo {
#     param (
#         [string]$computerName = 'localhost'
#     )

#     $disks = Get-WmiObject -Class Win32_Volume -Filter 'DriveType=3'

#     foreach ($disk in $disks) {
#         $disk | Select ComputerName,Drive,FreeSpace,Size
#     }
# }

# Get-RemoteComputerDiskInfo

function Get-DiskInfo {
    [CmdletBinding()]
    param(
        [string[]]$ComputerName="localhost",
        [string]$ErrorLog
    )

    BEGIN {
        Write-Host "Error log is $ErrorLog"
    }
    PROCESS {
        foreach ($Computer in $ComputerName) {
            $drive = Get-WmiObject -Class Win32_DiskDrive `
                -ComputerName $Computer

            $properties = @{'FreeSpace'=$drive.Size; 
                            'Model'=$drive.Model}
            
            $object = New-Object -TypeName PSObject -Property $properties
            Write-Host $object
        }
    }
    END{}

}
Get-DiskInfo -ErrorLog x.txt -ComputerName localhost