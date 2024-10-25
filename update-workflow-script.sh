#!/bin/bash

# Define the URL and the target file
URL="https://raw.githubusercontent.com/alisson-anjos/FluxDocker/refs/heads/main/download-workflows.sh"
FILE="download-workflows.sh"

# Download the script, overwriting if it already exists
curl -O $URL

# Make the downloaded script executable
chmod +x $FILE

# Run the downloaded script
./$FILE