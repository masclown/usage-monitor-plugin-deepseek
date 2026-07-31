# Test different ways to read the JSON file
$path = 'defaults.json'

# Method 1: Get-Content -Raw
Write-Host '=== Method 1: Get-Content -Raw ==='
$content1 = Get-Content $path -Raw
$index1 = $content1.IndexOf('"unit"')
Write-Host ('Index of "unit": ' + $index1)
if ($index1 -ge 0) {
    Write-Host ('Snippet: ' + $content1.Substring($index1, 30))
}

# Method 2: Get-Content -Raw -Encoding UTF8
Write-Host ''
Write-Host '=== Method 2: Get-Content -Raw -Encoding UTF8 ==='
$content2 = Get-Content $path -Raw -Encoding UTF8
$index2 = $content2.IndexOf('"unit"')
Write-Host ('Index of "unit": ' + $index2)
if ($index2 -ge 0) {
    Write-Host ('Snippet: ' + $content2.Substring($index2, 30))
}

# Method 3: [System.IO.File]::ReadAllText with UTF8
Write-Host ''
Write-Host '=== Method 3: [System.IO.File]::ReadAllText ==='
$content3 = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
$index3 = $content3.IndexOf('"unit"')
Write-Host ('Index of "unit": ' + $index3)
if ($index3 -ge 0) {
    Write-Host ('Snippet: ' + $content3.Substring($index3, 30))
}

# Method 4: Read bytes and decode
Write-Host ''
Write-Host '=== Method 4: Read bytes and decode ==='
$bytes = [System.IO.File]::ReadAllBytes($path)
$content4 = [System.Text.Encoding]::UTF8.GetString($bytes)
$index4 = $content4.IndexOf('"unit"')
Write-Host ('Index of "unit": ' + $index4)
if ($index4 -ge 0) {
    Write-Host ('Snippet: ' + $content4.Substring($index4, 30))
}

# Try to parse JSON
Write-Host ''
Write-Host '=== JSON Parse Test ==='
try {
    $obj = $content4 | ConvertFrom-Json
    Write-Host 'JSON parse: OK'
} catch {
    Write-Host ('JSON parse error: ' + $_.Exception.Message)
}
