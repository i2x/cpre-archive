# Installation Guide

## Prerequisites
Ensure you have the following installed on your system:
- Git
- Make

## Installation Steps

1. **Clone the repository:**
   ```sh
   git clone --recursive https://github.com/i2x/cpre-archive.git
   cd cpre-archive
   ```

2. **Run the installation command:**
   ```sh
   make
   ```

## Verification
After installation, verify that the submodules are properly initialized by running:
```sh
git submodule status
```
This should list all submodules without a `-` prefix.

## Troubleshooting
- If `make` is not available, install it via your package manager:
  - Ubuntu/Debian: `sudo apt install make`
  - macOS: `brew install make`
  - Windows: Install via Git for Windows or WSL.

## Uninstallation
To remove the repository and its submodules:
```sh
rm -rf cpre-archive
```
