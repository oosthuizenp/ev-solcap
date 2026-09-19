param()

$root = "C:\Anti-Gravity Skills\ev-solcap"

Get-ChildItem -Path $root -Recurse -File | Where-Object {
    $p = $_.FullName.Replace($root, "")
    $p -notmatch '^\\\.jekyll-cache' -and
    $p -notmatch '^\\_site' -and
    $p -notmatch '^\\node_modules' -and
    $p -notmatch '^\\vendor' -and
    $p -notmatch '^\\assets' -and
    $p -notlike '*.bundle.*' -and
    $p -notlike '*.LICENSE*' -and
    $p -notlike '*.png' -and
    $p -notlike '*.jpg' -and
    $p -notlike '*.jpeg' -and
    $p -notlike '*.gif' -and
    $p -notlike '*.svg' -and
    $p -notlike '*.ico' -and
    $p -notlike '*.woff' -and
    $p -notlike '*.woff2' -and
    $p -notlike '*.ttf' -and
    $p -notlike '*.eot' -and
    $p -notlike '*.cache'
} | ForEach-Object {
    $path = $_.FullName
    try {
        $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
        if ($content.Length -eq 0) { return }
        $orig = $content

        # Replace old phone numbers with new primary contact phone
        $content = $content -replace '+27 69 443 0046', '+27 69 443 0046'
        $content = $content -replace '27694430046', '27694430046'
        $content = $content -replace '\+27694430046', '+27694430046'

        if ($content -ne $orig) {
            [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
            Write-Host "Updated: $($path.Replace($root, '.'))"
        }
    } catch {
        # Skip files that can't be read as text
    }
}