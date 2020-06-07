Param (
	[string]$computerString = 'localhost'
)
Get-CimInstance -ClassName Win32_OperatingSystem `
    -ComputerName $computerString