Function Download-Artifacts {
    Write-Host "Downloading artifacts..." -ForegroundColor Yellow
    $CI_USER_TOKEN = $env:SIGNPATH_CI_USER_TOKEN
    $SIGNING_REQUEST_ID = $env:SIGNPATH_SIGNING_REQUESt_ID
    $ORGANIZATION_ID = $env:SIGNPATH_ORGANIZATION_ID
	$output= $env:ARTIFACTS_PATH

    $headers = @{
        "Authorization" = "Bearer $($CI_USER_TOKEN)"
    }
    $ProgressPreference = 'SilentlyContinue'   

    Invoke-RestMethod -Uri "https://app.signpath.io/API/v1/$ORGANIZATION_ID/SigningRequests/$SIGNING_REQUEST_ID/SignedArtifact" `
        -Headers $headers `
        -OutFile $Output
    Write-Host "Dwnloading complete, path: $Output"
}

