function Get-SystemInfo {
    [CmdletBinding()]
    param (
        [string[]]$ComputerName,
        [string]$ErrorLog
    )
    BEGIN{
        Write-Output "Log name is $ErrorLog"

    }
    PROCESS{
        foreach ($Computer in $ComputerName) {
            $os = Get-WmiObject -Class Win32_OperatingSystem `
                -ComputerName $Computer
            $system = Get-WmiObject -Class Win32_ComputerSystem `
                -ComputerName $Computer
             $bios = Get-WmiObject -Class Win32_Bios `
                -ComputerName $Computer
        
        $props = @{'ComputerName'=$Computer;
                    'OsVersion'=$os.version;
                    'SpVersion'=$os.servicepackmajorversion;
                    'BIOSSerial'=$bios.SerialNumber;
                    'Manufacturer'=$system.Manufacturer;
                    'Model'=$system.Model}
        $obj = New-Object -TypeName psobject -Property $props 
        Write-Output $obj | Format-Table
        }
    }
    END{}

}

Get-SystemInfo -ComputerName localhost, localhost, localhost x.txt | Export-Clixml

