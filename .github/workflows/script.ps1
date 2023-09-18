#Install-Module -Name SignPath
Import-Module -Name SignPath

$download={
$ORGANIZATION_ID = $env:OrganizationId
$CI_USER_TOKEN = $env:SIGNPATH_CI_USER_TOKEN
$SIGNING_REQUEST_ID =$env:SIGNING_REQUEST_ID
$PATH_TO_OUTPUT_ARTIFACT = Join-Path -Path $env:GITHUB_WORKSPACE -ChildPath "artifacts" 
#$buildFolderPath = Join-Path -Path $env:GITHUB_WORKSPACE -ChildPath "YourBuildFolder"


Write-Host "ORGANIZATION_ID = $ORGANIZATION_ID"

Get-SignedArtifact `
    -OrganizationId $ORGANIZATION_ID `
    -CIUserToken $CI_USER_TOKEN `
    -SigningRequestId $SIGNING_REQUEST_ID `
    -OutputArtifactPath $PATH_TO_OUTPUT_ARTIFACT `
    -Force

write-host "success downloading artifact"
#dir .\artifacts
}

write-host "Welcome to github action. run ps in github action"
& $download
