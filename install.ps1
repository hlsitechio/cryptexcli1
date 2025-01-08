# Cryptex Installation Script
$ErrorActionPreference = "Stop"
Write-Host "🧙‍♂️ Summoning Cryptex..."

# Set npm prefix to user directory to avoid permission issues
$npmPrefix = Join-Path $env:USERPROFILE ".npm-packages"
npm config set prefix $npmPrefix

# Add npm bin to PATH
$npmBin = Join-Path $npmPrefix "bin"
$env:PATH = "$npmBin;$env:PATH"

# Clone repository
$tempDir = Join-Path $env:TEMP "cryptex-install"
Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
git clone https://github.com/hlsitechio/cryptexcli1.git $tempDir

# Install package
Set-Location (Join-Path $tempDir "cryptex-cli")
npm install
npm link

Write-Host "✨ Installation complete! Try 'cryptex interact' to begin your magical journey!"