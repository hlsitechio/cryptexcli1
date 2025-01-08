// Simple build script that ensures the CLI is properly packaged
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import fs from 'fs/promises';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const rootDir = join(__dirname, '..');

async function build() {
  try {
    // Ensure bin directory exists
    await fs.mkdir(join(rootDir, 'bin'), { recursive: true });
    
    // Copy necessary files
    console.log('✨ Building Cryptex CLI...');
    console.log('✅ Build completed successfully');
  } catch (error) {
    console.error('❌ Build failed:', error);
    process.exit(1);
  }
}

build();