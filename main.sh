#!/bin/bash

# Replace 'REPO_URL1', 'REPO_URL2', ..., 'REPO_URL7' with the URLs of the repositories you want to clone
repo_urls=(
    "https://github.com/KIP-Protocol-Contracts/offchain-APIs.git"
    "https://github.com/KIP-Protocol-Contracts/kip-protocol-pools-contract.git"
    "https://github.com/KIP-Protocol-Contracts/kip-pools-contract.git"
    "https://github.com/KIP-Protocol-Contracts/kip-sft-3525-contract.git"
    "https://github.com/KIP-Protocol-Contracts/Kip-account-abstraction-contract-HH.git"
    "https://github.com/KIP-Protocol-Contracts/kip-graphql.git"
    "https://github.com/KIP-Protocol-Contracts/kip-account-abstraction-contract.git"
    "https://github.com/KIP-Protocol-Contracts/kip-ft-20-contract-KIP.git"
    "https://github.com/KIP-Protocol-Contracts/kip-crowd-funding-contract.git"
    "https://github.com/KIP-Protocol-Contracts/kip-all-contract.git"
    "https://github.com/KIP-Protocol-Contracts/kip-decentralized-storage.git"
)

while true; do
    # Get the current timestamp
    timestamp=$(date +"%Y%m%d%H%M%S")

    # Create a folder with the timestamp as the name under /home/test/
    folder_name="/home/test/clone_${timestamp}"
    mkdir "${folder_name}"

    # Clone each repository into a subfolder
    for repo_url in "${repo_urls[@]}"; do
        repo_name=$(basename "${repo_url}" .git)
        repo_folder="${folder_name}/${repo_name}"
        git clone --mirror "${repo_url}" "${repo_folder}"
    done

    # Wait for an hour before cloning again
    sleep 3600
done
