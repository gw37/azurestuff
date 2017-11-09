$folder = "c:\temp"
$log = "c:\temp\AzureLog_gw.txt"
$date = get-date

if (!(Test-Path $log)) {
    New-Item -Path $folder -ItemType Directory
    New-Item -Path $log -ItemType File
    Add-Content -Value "NEW LOG: Azure PowerShell Endpoint - $date" -Path $log
    }
else {
    Add-Content -Value "EXISTING LOG: Azure PowerShell Endpoint - $date" -Path $log
}