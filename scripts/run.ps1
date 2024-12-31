Function Download-Artifacts {
    $CI_USER_TOKEN = $env:SIGNPATH_CI_USER_TOKEN
    $SIGNING_REQUEST_ID = $env:SIGNPATH_SIGNING_REQUESt_ID
    $ORGANIZATION_ID = $env:SIGNPATH_ORGANIZATION_ID
	$output_file= $env:ARTIFACTS_PATH
    Write-Host "Downloading artifacts to $output_file" -ForegroundColor Yellow

    $headers = @{
        "Authorization" = "Bearer $($CI_USER_TOKEN)"
    }

    $ProgressPreference = 'SilentlyContinue'   

    Invoke-RestMethod -Uri "https://app.signpath.io/API/v1/$ORGANIZATION_ID/SigningRequests/$SIGNING_REQUEST_ID/SignedArtifact" `
        -Headers $headers `
        -OutFile $output_file
    #test if the file exists
    if (-not (Test-Path $output_file)) {
        Write-Host "Failed to download artifacts" -ForegroundColor Red
        exit 1
    }    
    Write-Host "Dwnloading complete, path: $output_file"
}

