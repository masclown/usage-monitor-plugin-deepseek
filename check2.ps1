$bytes = [System.IO.File]::ReadAllBytes('defaults.json')
Write-Host ('Size: ' + $bytes.Length)
Write-Host ('Has BOM: ' + ($bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF))

# Try to parse JSON
$json = [System.Text.Encoding]::UTF8.GetString($bytes)
try {
    $obj = $json | ConvertFrom-Json
    Write-Host 'JSON parse: OK'
} catch {
    Write-Host ('JSON parse error: ' + $_.Exception.Message)
}
