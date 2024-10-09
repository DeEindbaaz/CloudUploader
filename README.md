# CloudUploader

# CloudUploader CLI

CloudUploader is a Bash-based CLI tool that allows you to upload files to Azure Blob Storage seamlessly and securely.

## Features

- Upload files to Azure Blob Storage.
- Securely manage credentials using Azure Key Vault.
- Provides clear feedback on upload status.
- Optional features: Progress bar, shareable links, file synchronization, and encryption.

## Prerequisites

- **Git** installed.
- **Azure CLI** installed and configured.
- Access to **Azure Blob Storage** and **Azure Key Vault**.
- Basic knowledge of Bash scripting.

## Setup

1. **Clone the Repository:**
    ```bash
    git clone https://github.com/DeEindbaaz/CloudUploader.git
    cd CloudUploader
    ```

2. **Make the Script Executable:**
    ```bash
    chmod +x clouduploader
    ```

3. **Configure Azure Key Vault:**
    - Store your storage account name and key in Azure Key Vault.
    - Update the `KEYVAULT_NAME` variable in the script.

## Usage

```bash
./clouduploader /path/to/file [target_directory]


## Installation

1. **Download the Script:**
    ```bash
    git clone https://github.com/DeEindbaaz/CloudUploader.git
    ```

2. **Move to a Directory in `$PATH`:**
    ```bash
    sudo mv CloudUploader/clouduploader /usr/local/bin/
    ```

3. **Make Executable:**
    ```bash
    sudo chmod +x /usr/local/bin/clouduploader
    ```

4. **Verify Installation:**
    ```bash
    clouduploader --help
    ```

