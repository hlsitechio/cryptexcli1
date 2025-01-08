# 🧙‍♂️ Cryptex CLI

A powerful AI programming companion that helps you write, debug, and understand code.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Node Version](https://img.shields.io/badge/node-18%2B-blue)](https://nodejs.org/downloads/)

## Prerequisites

Before installing Cryptex, make sure you have:
- [Node.js](https://nodejs.org/) (version 18 or higher)
- [Git](https://git-scm.com/downloads)
- npm (comes with Node.js)

## Installation

### Easy Install (Recommended)
Open PowerShell and run:
```powershell
iwr https://raw.githubusercontent.com/hlsitechio/cryptexcli1/main/install.ps1 -UseBasicParsing | iex
```

If you get a security error, run:
```powershell
powershell -ExecutionPolicy Bypass -Command "iwr https://raw.githubusercontent.com/hlsitechio/cryptexcli1/main/install.ps1 -UseBasicParsing | iex"
```

### Manual Installation
```powershell
# Clone the repository
git clone https://github.com/hlsitechio/cryptexcli1.git
cd cryptexcli1/cryptex-cli

# Install dependencies and link globally
npm install
npm link
```

## Usage

Start using Cryptex with:
```bash
cryptex interact
```

## Configuration

1. Get your API key from [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create a `.env` file with:
```env
CRYPTEX_GOOGLE_AI_KEY=your_api_key_here
```

## License

MIT License - see [LICENSE](LICENSE) file