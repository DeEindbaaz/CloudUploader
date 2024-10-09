#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: clouduploader /path/to/file [options]"
    exit 1
}

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    usage
fi

# Parse arguments
FILE_PATH=$1
TARGET_DIR=${2:-""}  # Optional second argument

# Check if file exists
if [ ! -f "$FILE_PATH" ]; then
    echo "Error: File '$FILE_PATH' not found."
    exit 1
fi

# Optional: Check read permissions
if [ ! -r "$FILE_PATH" ]; then
    echo "Error: File '$FILE_PATH' is not readable."
    exit 1
fi

# Variables
KEYVAULT_NAME="clouduploader-ne-prd-kv"

# Retrieve Storage Account Name and Key
STORAGE_ACCOUNT_NAME=$(az keyvault secret show --vault-name $KEYVAULT_NAME --name "StorageAccountName" --query value -o tsv)
STORAGE_ACCOUNT_KEY=$(az keyvault secret show --vault-name $KEYVAULT_NAME --name "StorageAccountKey" --query value -o tsv)

# Extract filename
FILE_NAME=$(basename "$FILE_PATH")

# Define container name (you can customize or pass as an argument)
CONTAINER_NAME="uploads"

# Create container if it doesn't exist
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $STORAGE_ACCOUNT_KEY --public-access off

# Upload the file
az storage blob upload --container-name $CONTAINER_NAME --file "$FILE_PATH" --name "$FILE_NAME" --account-name $STORAGE_ACCOUNT_NAME --account-key $STORAGE_ACCOUNT_KEY

if [ $? -eq 0 ]; then
    echo "File '$FILE_NAME' uploaded successfully to container '$CONTAINER_NAME'."
else
    echo "Error: Failed to upload '$FILE_NAME'."
    exit 1
fi

echo "Uploading '$FILE_NAME' to Azure Blob Storage..."

# (Upload command here)

if [ $? -eq 0 ]; then
    echo "✅ Successfully uploaded '$FILE_NAME' to '$CONTAINER_NAME'."
else
    echo "❌ Failed to upload '$FILE_NAME'. Please check your connection and credentials."
fi