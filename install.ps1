# Cryptex Installation Script
Write-Host "🧙‍♂️ Summoning Cryptex..."

# Function to check command availability
function Test-Command {
    param($Command)
    try {
        if (Get-Command $Command -ErrorAction Stop) { return $true }
    } catch {
        return $false
    }
}

# Check for Node.js and npm
if (-not (Test-Command node) -or -not (Test-Command npm)) {
    Write-Host "❌ Node.js and npm are required but not installed!"
    Write-Host "Please install Node.js from https://nodejs.org/"
    exit 1
}

$nodeVersion = node --version
$npmVersion = npm --version
Write-Host "✓ Node.js found: $nodeVersion"
Write-Host "✓ npm found: $npmVersion"

# Create temp directory
$tempDir = Join-Path $env:TEMP "cryptex-install"
if (Test-Path $tempDir) {
    try {
        Remove-Item -Recurse -Force $tempDir -ErrorAction Stop
    } catch {
        Write-Host "⚠️ Could not remove existing temp directory. Using a new one..."
        $tempDir = Join-Path $env:TEMP "cryptex-install-$(Get-Random)"
    }
}

# Clone repository
Write-Host "📚 Cloning the repository..."
try {
    git clone https://github.com/hlsitechio/cryptexcli1.git $tempDir
    if (-not $?) { throw "Git clone failed" }
} catch {
    Write-Host "❌ Failed to clone repository: $_"
    exit 1
}

# Install dependencies and link package
Write-Host "🔮 Installing dependencies..."
try {
    Set-Location (Join-Path $tempDir "cryptex-cli")
    npm install --no-package-lock
    if (-not $?) { throw "npm install failed" }
    
    # Create global link
    $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")
    npm link
    if (-not $?) { throw "npm link failed" }
} catch {
    Write-Host "❌ Failed during npm operations: $_"
    exit 1
}

Write-Host "✨ Installation complete! Try 'cryptex interact' to begin your magical journey!"