$path = 'defaults.json'
$bytes = [System.IO.File]::ReadAllBytes($path)
$content = [System.Text.Encoding]::UTF8.GetString($bytes)

Write-Host ('File length: ' + $content.Length)

# Check around position 7647
$pos = 7647
$start = [Math]::Max(0, $pos - 20)
$length = [Math]::Min(60, $content.Length - $start)
$snippet = $content.Substring($start, $length)
Write-Host ('Around position ' + $pos + ' (chars ' + $start + '-' + ($start + $length) + '):')
Write-Host $snippet

# Show hex values
Write-Host ''
Write-Host 'Hex values around position 7647:'
for ($i = $start; $i -lt $start + $length; $i++) {
    $char = $content[$i]
    $hex = [int]$char
    Write-Host ('  [' + $i + '] "' + $char + '" = 0x' + $hex.ToString('X4'))
}
