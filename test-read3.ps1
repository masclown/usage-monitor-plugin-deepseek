$path = 'defaults.json'
$bytes = [System.IO.File]::ReadAllBytes($path)
$content = [System.Text.Encoding]::UTF8.GetString($bytes)

# Find all "unit" occurrences
$index = 0
$count = 0
while (($index = $content.IndexOf('"unit"', $index)) -ge 0) {
    $count++
    $snippet = $content.Substring($index, [Math]::Min(40, $content.Length - $index))
    Write-Host ('[' + $count + '] Index ' + $index + ': ' + $snippet)
    $index += 6
}

# Try to parse JSON
Write-Host ''
Write-Host '=== JSON Parse Test ==='
try {
    $obj = $content | ConvertFrom-Json
    Write-Host 'JSON parse: OK'
    Write-Host ('providerId: ' + $obj.providerId)
    Write-Host ('displayName: ' + $obj.displayName)
} catch {
    Write-Host ('JSON parse error: ' + $_.Exception.Message)
}
