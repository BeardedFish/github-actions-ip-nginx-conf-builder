#!/usr/bin/env pwsh
#
# File Name:       GenerateGitHubActionsNginxConf.ps1
# Author:          Darian Benam <darian@darianbenam.com>
# Date Created:    Sunday, January 21, 2024
# Date Updated:    Sunday, January 28, 2024

$ApiEndpoint = 'https://api.github.com/meta'
$ApiResponse = Invoke-WebRequest -Method Get -Uri $ApiEndpoint

if (-not $ApiResponse.StatusCode -eq 200)
{
	Write-Error -Message "Failed to fetch data from GitHub's API! Status code was: $($ApiResponse.StatusCode)" -Category InvalidResult
	exit 1
}

$GitHubActionsIpAddresses = ($ApiResponse.Content | ConvertFrom-Json).Actions

foreach ($IpAddress in $GitHubActionsIpAddresses)
{
	Write-Output "allow $IpAddress;"
}
