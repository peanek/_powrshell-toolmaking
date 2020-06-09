function Get-OSInfo {
    param(
	    [string]$computerName = 'localhost',
        [string]$loginName = 'ipf\administrator'
    )
    Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $computerName  
}
Get-OSInfo -computerName localhost

Function Get-DiskInfo {

    Param (
        [string]$computername='localhost',
        [int]$MinimumFreePercent=10
        )

$disks=Get-WmiObject -Class Win32_Logicaldisk -Filter "Drivetype=3"

    foreach ($disk in $disks) {
        $perFree=($disk.FreeSpace/$disk.Size)*100;
            
            if ($perFree -ge $MinimumFreePercent) {
                $OK=$True
            }
            else {
                $OK=$False
            };
        
        $disk | Select DeviceID,VolumeName,Size,FreeSpace,` 
            @{Name="OK";Expression={$OK}}
    }
}
Get-DiskInfo
