$bytes = [System.IO.File]::ReadAllBytes('defaults.json')
Write-Host ('Size: ' + $bytes.Length)
Write-Host ('First 20 bytes hex: ' + [BitConverter]::ToString($bytes[0..19]))

# Check around position 7647
if ($bytes.Length -gt 7647) {
    $start = [Math]::Max(0, 7647 - 50)
    $end = [Math]::Min($bytes.Length - 1, 7647 + 50)
    Write-Host ('Bytes around 7647:')
    Write-Host [System.Text.Encoding]::UTF8.GetString($bytes[$start..$end])
}
