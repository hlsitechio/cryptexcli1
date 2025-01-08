# Cryptex Installation Script
Write-Host "🧙‍♂️ Summoning Cryptex..."

# Check for Node.js and npm
try {
    $nodeVersion = node --version
    Write-Host "✓ Node.js found: $nodeVersion"
    $npmVersion = npm --version
    Write-Host "✓ npm found: $npmVersion"
} catch {
    Write-Host "❌ Node.js is required but not installed!"
    Write-Host "Please install Node.js from https://nodejs.org/"
    exit 1
}

# Create temp dir and clone repo
$tempDir = Join-Path $env:TEMP "cryptex-install"
Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $tempDir | Out-Null
git clone https://github.com/hlsitechio/cryptexcli1.git $tempDir

# Install and link
Set-Location (Join-Path $tempDir "cryptex-cli")
npm install
npm link

Write-Host "✨ Installation complete! Try 'cryptex interact' to begin your magical journey!"