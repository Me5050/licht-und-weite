# Legt dieses Paket als GitHub-Repository an und lädt alles hoch.
# Aufruf: .\repo_erstellen.ps1            (öffentlich)
#         .\repo_erstellen.ps1 -Privat    (privat)
# Voraussetzung: GitHub CLI (https://cli.github.com) und git.
param([switch]$Privat)
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
$Name = "licht-und-weite"
$Sicht = if ($Privat) { "--private" } else { "--public" }
gh auth status *> $null
if ($LASTEXITCODE -ne 0) { gh auth login }
gh auth setup-git
$mail = git config user.email
if (-not $mail) {
  $login = gh api user -q .login; $id = gh api user -q .id
  git config --global user.name $login
  git config --global user.email "$id+$login@users.noreply.github.com"
}
if (-not (Test-Path .git)) {
  git init -q -b main
  git add .
  git commit -qm "Licht & Weite - Vorlagenpaket"
}
gh repo create $Name $Sicht --source . --remote origin --push --description "Instagram-Vorlage Licht & Weite fuer das Projekt Jesus auch Muslim"
Write-Host ""
Write-Host ("Fertig: " + (gh repo view $Name --json url -q .url))
