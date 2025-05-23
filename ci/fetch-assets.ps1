param (
    [Parameter(Mandatory=$true)][string]$RepoName,
    [Parameter(Mandatory=$true)][string]$DeviceDetection,
    [string]$DeviceDetectionUrl
)
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true

$RepoPath = [IO.Path]::Combine($pwd, $RepoName)

./steps/fetch-hash-assets.ps1 -RepoName $RepoName -LicenseKey $DeviceDetection -Url $DeviceDetectionUrl

Write-Output "Download Lite file"
curl -L -o "$RepoPath/device-detection-data/51Degrees-LiteV4.1.hash" "https://github.com/51Degrees/device-detection-data/raw/main/51Degrees-LiteV4.1.hash"

Write-Output "Download Evidence file"
curl -o "$RepoPath/device-detection-data/20000 Evidence Records.yml" "https://media.githubusercontent.com/media/51Degrees/device-detection-data/main/20000%20Evidence%20Records.yml"    

Write-Output "Download User Agents file"
curl -o "$RepoPath/device-detection-data/20000 User Agents.csv" "https://media.githubusercontent.com/media/51Degrees/device-detection-data/main/20000%20User%20Agents.csv"

Copy-Item $RepoPath/TAC-HashV41.hash  $RepoPath/device-detection-data/TAC-HashV41.hash
