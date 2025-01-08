# Cryptex Installation Script
$ErrorActionPreference = "Stop"

Write-Host "🧙‍♂️ Summoning Cryptex..."

# Check for required commands
function Test-Command($cmd) {
    if (!(Get-Command $cmd -ErrorAction SilentlyContinue)) {
        Write-Host "❌ Error: '$cmd' not found. Please install it first."
        Exit 1
    }
}

Check-Command "git"
Check-Command "node"
Check-Command "npm"

# Set npm prefix and update PATH
$npmPrefix = Join-Path $env:USERPROFILE ".npm-packages"
npm config set prefix $npmPrefix
$env:PATH = "$(Join-Path $npmPrefix 'bin');$env:PATH"

# Clone and install
$tempDir = Join-Path $env:TEMP "cryptex-install"
Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
git clone https://github.com/hlsitechio/cryptexcli1.git $tempDir

Set-Location (Join-Path $tempDir "cryptex-cli")
npm install
npm link

Write-Host "`n✨ Installation complete! Try 'cryptex interact' to begin your magical journey."