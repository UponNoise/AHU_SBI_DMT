param(
  [Parameter(Mandatory=$true)][string]$OutputPath
)

Add-Type -AssemblyName System.Drawing
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Win32Capture {
  [DllImport("user32.dll")]
  public static extern bool SetForegroundWindow(IntPtr hWnd);
  [DllImport("user32.dll")]
  public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
  [DllImport("user32.dll")]
  public static extern bool GetWindowRect(IntPtr hWnd, out RECT rect);
  [DllImport("user32.dll")]
  public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);
}
public struct RECT {
  public int Left;
  public int Top;
  public int Right;
  public int Bottom;
}
"@

$proc = Get-Process VirtualBoxVM | Where-Object { $_.MainWindowTitle -like "Ubuntu*" -and $_.MainWindowHandle -ne 0 } | Select-Object -First 1
if (-not $proc) {
  throw "VirtualBox Ubuntu VM window was not found."
}

$hwnd = $proc.MainWindowHandle
[Win32Capture]::ShowWindow($hwnd, 9) | Out-Null
[Win32Capture]::SetWindowPos($hwnd, [IntPtr]::new(-1), 20, 20, 1180, 860, 0x0040) | Out-Null
[Win32Capture]::SetForegroundWindow($hwnd) | Out-Null
Start-Sleep -Milliseconds 900

$rect = New-Object RECT
[Win32Capture]::GetWindowRect($hwnd, [ref]$rect) | Out-Null
$width = $rect.Right - $rect.Left
$height = $rect.Bottom - $rect.Top
if ($width -le 0 -or $height -le 0) {
  throw "Invalid VirtualBox window size: ${width}x${height}"
}

$bmp = New-Object System.Drawing.Bitmap($width, $height)
$graphics = [System.Drawing.Graphics]::FromImage($bmp)
$graphics.CopyFromScreen($rect.Left, $rect.Top, 0, 0, $bmp.Size)
$graphics.Dispose()

New-Item -ItemType Directory -Force (Split-Path $OutputPath -Parent) | Out-Null
$bmp.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
[Win32Capture]::SetWindowPos($hwnd, [IntPtr]::new(-2), 20, 20, 1180, 860, 0x0040) | Out-Null
Write-Output $OutputPath
