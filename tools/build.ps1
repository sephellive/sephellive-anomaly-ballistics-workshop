param(
    [Parameter(Mandatory = $false)]
    [string]$Version = "v0.0.1"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$distRoot = Join-Path $repoRoot "dist"
$packageRoot = Join-Path $distRoot "package"
$archiveName = ("{0}-{1}.zip" -f (Split-Path $repoRoot -Leaf), $Version)
$archivePath = Join-Path $distRoot $archiveName

if (Test-Path -LiteralPath $packageRoot) {
    Remove-Item -LiteralPath $packageRoot -Recurse -Force
}
if (Test-Path -LiteralPath $archivePath) {
    Remove-Item -LiteralPath $archivePath -Force
}

New-Item -ItemType Directory -Path (Join-Path $packageRoot "gamedata") -Force | Out-Null
Copy-Item -Path (Join-Path $repoRoot "gamedata\*") -Destination (Join-Path $packageRoot "gamedata") -Recurse -Force
Get-ChildItem -LiteralPath (Join-Path $packageRoot "gamedata") -Recurse -File -Filter ".gitkeep" -ErrorAction SilentlyContinue | Remove-Item -Force

if (-not (Get-Command Compress-Archive -ErrorAction SilentlyContinue)) {
    throw "Compress-Archive is not available in this PowerShell session."
}

Compress-Archive -Path (Join-Path $packageRoot "gamedata") -DestinationPath $archivePath -Force

Write-Host $archivePath
