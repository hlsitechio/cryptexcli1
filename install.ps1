# Cryptex Installation Script
$ErrorActionPreference = "Stop"
Write-Host "🧙‍♂️ Summoning Cryptex..."

# Clone repository
$tempDir = Join-Path $env:TEMP "cryptex-install"
Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
git clone https://github.com/hlsitechio/cryptexcli1.git $tempDir

# Install package
Set-Location (Join-Path $tempDir "cryptex-cli")
npm install -g .

Write-Host "✨ Installation complete! Try 'cryptex interact' to begin your magical journey!"