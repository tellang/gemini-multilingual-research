param(
  [string]$Version = "0.1.0",
  [string]$OutDir = "release"
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$extensionRoot = Resolve-Path (Join-Path $scriptDir "..")
$repoRoot = Resolve-Path (Join-Path $extensionRoot "..")
$stageRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("gemini-multilingual-research-" + [guid]::NewGuid().ToString("N"))
$outRoot = Join-Path $repoRoot $OutDir
$zipName = "gemini-multilingual-research-$Version.zip"
$zipPath = Join-Path $outRoot $zipName

New-Item -ItemType Directory -Force -Path $stageRoot | Out-Null
New-Item -ItemType Directory -Force -Path $outRoot | Out-Null

$include = @(
  "gemini-extension.json",
  "GEMINI.md",
  "README.md",
  "LICENSE",
  "package.json",
  "commands",
  "skills",
  "agents"
)

foreach ($item in $include) {
  $source = Join-Path $extensionRoot $item
  if (-not (Test-Path $source)) {
    throw "Missing required extension asset: $item"
  }
  Copy-Item -Recurse -Force $source $stageRoot
}

if (Test-Path $zipPath) {
  Remove-Item -Force $zipPath
}

Compress-Archive -Path (Join-Path $stageRoot '*') -DestinationPath $zipPath -Force
Write-Host "Created extension archive: $zipPath"
