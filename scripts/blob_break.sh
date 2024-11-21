#!/bin/bash

# Variables
container_name="terraform"
storage_account_name="dcpokpwesteuropep"
account_key=$(az storage account keys list --account-name $storage_account_name --query '[0].value' --output tsv)

# Ask the user for a list of blob names
echo "Please enter the blob names (separated by spaces or newlines):"
read -r -d '' blobs

# Loop through each blob name provided by the user
for blob_name in $blobs; do
  echo "Processing blob: $blob_name"

  # Get lease state for the blob if it has an active lease
  lease_state=$(az storage blob show \
    --name "$blob_name" \
    --container-name "$container_name" \
    --account-name "$storage_account_name" \
    --account-key "$account_key" \
    --query "properties.leaseState" --output tsv)

  if [ "$lease_state" == "leased" ]; then
    echo "Breaking lease for blob: $blob_name"
    az storage blob lease break \
      --blob-name "$blob_name" \
      --container-name "$container_name" \
      --account-name "$storage_account_name" \
      --account-key "$account_key"
  else
    echo "Blob $blob_name does not have an active lease or is already unlocked."
  fi
done
