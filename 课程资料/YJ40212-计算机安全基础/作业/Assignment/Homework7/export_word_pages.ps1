param(
  [Parameter(Mandatory=$true)][string]$DocxPath,
  [Parameter(Mandatory=$true)][string]$OutputDir
)

New-Item -ItemType Directory -Force $OutputDir | Out-Null
Add-Type -AssemblyName System.Drawing

$word = New-Object -ComObject Word.Application
$word.Visible = $false
$doc = $null
try {
  $doc = $word.Documents.Open($DocxPath, $false, $true)
  $doc.Repaginate()
  Start-Sleep -Milliseconds 500
  $pages = $doc.ActiveWindow.Panes.Item(1).Pages
  $count = $pages.Count
  Write-Output "PAGE_COUNT=$count"
  for ($i = 1; $i -le $count; $i++) {
    $emfPath = Join-Path $OutputDir ("page-{0}.emf" -f $i)
    $pngPath = Join-Path $OutputDir ("page-{0}.png" -f $i)
    [byte[]]$bits = $pages.Item($i).EnhMetaFileBits
    [System.IO.File]::WriteAllBytes($emfPath, $bits)

    $mf = New-Object System.Drawing.Imaging.Metafile($emfPath)
    $width = 1700
    $height = 2200
    $bmp = New-Object System.Drawing.Bitmap($width, $height)
    $graphics = [System.Drawing.Graphics]::FromImage($bmp)
    $graphics.Clear([System.Drawing.Color]::White)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $graphics.DrawImage($mf, 0, 0, $width, $height)
    $bmp.Save($pngPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $graphics.Dispose()
    $bmp.Dispose()
    $mf.Dispose()
  }
}
finally {
  if ($doc -ne $null) { $doc.Close($false) | Out-Null }
  $word.Quit() | Out-Null
}
