#!/bin/bash

# The URL of the github repo
repo_url="https://raw.githubusercontent.com/alisson-anjos/SD3.5Docker/refs/heads/main/workflows"

# The local directory to store the files
local_dir="/workspace/ComfyUI/user/default/workflows"

# Create the local directory if it does not exist
mkdir -p $local_dir

# List of file names
file_list=("SD3.5_large_Q8_GGUF.json")

# Change to the local directory
cd $local_dir

# Loop over the list of files
for file in "${file_list[@]}"
do
    # If the file does not exist
    if [ ! -f $file ]; then
        # Download the file
        echo "Downloading $file..."
        curl -O $repo_url/$file
    else
        echo "$file already exists."
    fi
done