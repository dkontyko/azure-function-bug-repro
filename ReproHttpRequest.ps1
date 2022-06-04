# Test PDF: https://armypubs.army.mil/pub/eforms/DR_a/ARN31947-DA_FORM_4187-002-EFILE-3.pdf
# (I shortened PDF name to A4187.pdf locally)
$fileContents = Get-Content "A4187.pdf" -AsByteStream
$port = 55872

# fails with application/pdf
# succeeds with application/octet-stream
$headers = @{
    "Content-Type" = "application/pdf"
    "Accept" = "application/xml"
}

$response = Invoke-WebRequest -Uri "http://localhost:$port/api/HttpExample" -Method Post -Headers $headers -Body $fileContents

Write-Output $response

Write-Output $response.Content
