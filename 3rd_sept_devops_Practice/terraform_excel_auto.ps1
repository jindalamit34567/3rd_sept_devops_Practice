$csvPath = "$PSScriptRoot\rg.csv"
$tfvarsPath = "$PSScriptRoot\terraform.tfvars"

Write-Host "CSV Path: $csvPath" -ForegroundColor Cyan

if (-not (Test-Path $csvPath)) {
    Write-Host "ERROR: CSV file not found!" -ForegroundColor Red
    exit 1
}

# Display raw CSV content
Write-Host "`nCSV Content:" -ForegroundColor Yellow
Get-Content $csvPath

# Import CSV
$resources = @(Import-Csv -Path $csvPath)

Write-Host "`nRecords found: $($resources.Count)" -ForegroundColor Cyan

# Debug
foreach ($resource in $resources) {
    Write-Host "NAME     = [$($resource.name)]"
    Write-Host "LOCATION = [$($resource.location)]"
}

# Create HCL
$lines = @()

$lines += "rgs = {"

foreach ($resource in $resources) {

    $name = "$($resource.name)".Trim()
    $location = "$($resource.location)".Trim()

    if ($name -eq "") {
        Write-Host "Skipping row because name is empty." -ForegroundColor Red
        continue
    }

    Write-Host "Adding $name..." -ForegroundColor Green

    $lines += "  $name = {"
    $lines += "    name     = `"$name`""
    $lines += "    location = `"$location`""
    $lines += "  }"
}

$lines += "}"

# Write terraform.tfvars
$lines | Set-Content -Path $tfvarsPath -Encoding UTF8

Write-Host "`nterraform.tfvars updated:" -ForegroundColor Green
Get-Content $tfvarsPath