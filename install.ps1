#!/usr/bin/env pwsh
# Keep this script simple and easily auditable!
$ErrorActionPreference = 'Stop'

if ($v) {
  $Version = "${v}"
}
if ($Args.Length -eq 1) {
  $Version = $Args.Get(0)
}

$TypstInstall = $env:TYPST_INSTALL
if (!$TypstInstall) {
  $TypstInstall = "${Home}\.typst"
}

$Target = 'x86_64-pc-windows-msvc'
$Folder = "typst-${Target}"
$File = "$Folder.zip"

$URL = if ($Version) {
  "https://github.com/typst/typst/releases/download/v${Version}/$File"
} else {
  "https://github.com/typst/typst/releases/latest/download/$File"
}

if (!(Test-Path "$TypstInstall")) {
  New-Item "$TypstInstall" -ItemType Directory | Out-Null
}

curl.exe -fsSL "$URL" -o "$TypstInstall\$File"
tar.exe -xf "$TypstInstall\$File" -C "$TypstInstall"
Remove-Item "$TypstInstall\$File"

$User = [System.EnvironmentVariableTarget]::User
$Path = [System.Environment]::GetEnvironmentVariable('Path', $User)
if (!(";${Path};".ToLower() -like "*;$TypstInstall\$Folder;*".ToLower())) {
  [System.Environment]::SetEnvironmentVariable('Path', "${Path};$TypstInstall\$Folder", $User)
  $Env:Path += ";$TypstInstall\$Folder"
}

Write-Output "Typst was installed successfully to $TypstInstall\$Folder\typst.exe"
Write-Output "Run 'typst --help' to get started"
Write-Output "Stuck? Open an Issue https://github.com/typst-community/install_typst/issues"
