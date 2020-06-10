function Get-OSInfo {
    [cmdletbinding()]
    param (
        [string[]]$hostName,
        [string]$errorLog
    )
    BEGIN{}
    
    PROCESS{
        foreach ($hostOne in $hostName) {
            $computerSystem = Get-WmiObject -Class Win32_ComputerSystem `
                -ComputerName $hostOne
            
            switch ($computerSystem.AdminPasswordStatus) {
               1 {$adminStatus="DISABLED"}
               2 {$adminStatus="ENABLED"}
               3 {$adminStatus="NA"}
               4 {$adminStatus="UNKNOWN"}
               Default {$adminStatus="Cannot read status"}
            }
            
            $bios = Get-WmiObject -Class Win32_Bios -ComputerName $hostOne
            $opratingSystem = Get-WmiObject -Class Win32_OperatingSystem -ComputerName `
                $hostOne
        
            $props = @{'WorkGroup'=$computerSystem.WorkGroup;
                        'AdminPassword'=$adminStatus;
                        'Model'=$computerSystem.Model;
                        'Manufacturer'=$computerSystem.Manufacturer;
                        'BIOSSerial'=$bios.SerialNumber;
                        'OSVersion'=$opratingSystem.Version;
                        'ComputerName'=$hostOne
            }
    
            $obj = New-Object -TypeName psobject -Property $props
            Write-Output $obj | Format-Table -Property ComputerName,OSVersion,AdminPassword
        }

    }
    END{}

        
  }


Get-OSInfo localhost