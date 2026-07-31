$bytes = [System.IO.File]::ReadAllBytes('defaults.json')
$text = [System.Text.Encoding]::UTF8.GetString($bytes)

# Find "unit" around line 169
$index = $text.IndexOf('"unit": "次"')
Write-Host ('Found "unit": "次" at index: ' + $index)

if ($index -ge 0) {
    $start = [Math]::Max(0, $index - 10)
    $length = [Math]::Min(50, $text.Length - $start)
    $snippet = $text.Substring($start, $length)
    Write-Host ('Snippet: ' + $snippet)
    
    # Show bytes for "次"
    $charBytes = [System.Text.Encoding]::UTF8.GetBytes('次')
    Write-Host ('Bytes for 次: ' + [BitConverter]::ToString($charBytes))
}
