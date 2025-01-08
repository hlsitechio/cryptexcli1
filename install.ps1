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

# Install package globally
Write-Host "🔮 Installing Cryptex..."
try {
    npm install -g cryptex-cli
} catch {
    Write-Host "❌ Failed to install Cryptex: $_"
    exit 1
}

Write-Host "✨ Installation complete! Try 'cryptex interact' to begin your magical journey!"