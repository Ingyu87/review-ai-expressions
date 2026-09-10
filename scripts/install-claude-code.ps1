[CmdletBinding()]
param(
    [string]$TargetRoot = (Join-Path $env:USERPROFILE '.claude')
)

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillTarget = Join-Path $TargetRoot 'skills\review-ai-expressions'
$commandTarget = Join-Path $TargetRoot 'commands'
$aliasStem = 'ai' + [char]0xD45C + [char]0xD604
$aliasFile = $aliasStem + '.md'

New-Item -ItemType Directory -Force -Path $skillTarget | Out-Null
New-Item -ItemType Directory -Force -Path $commandTarget | Out-Null

Copy-Item -LiteralPath (Join-Path $repoRoot 'SKILL.md') -Destination (Join-Path $skillTarget 'SKILL.md') -Force
Copy-Item -LiteralPath (Join-Path (Join-Path $repoRoot 'claude\commands') $aliasFile) -Destination (Join-Path $commandTarget $aliasFile) -Force

Write-Output 'Claude Code installation complete.'
Write-Output ('Skill: ' + (Join-Path $skillTarget 'SKILL.md'))
Write-Output ('Command: ' + (Join-Path $commandTarget $aliasFile))
Write-Output ('Invoke it with /' + $aliasStem + '.')
