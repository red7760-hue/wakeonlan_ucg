#!/bin/bash

# Check if etherwake is installed
if ! command -v etherwake &> /dev/null
then
    echo "etherwake is not installed. Attempting to install..."
    # Update package lists and install etherwake without interactive prompts
    apt-get update && apt-get install -y etherwake
    if [ $? -eq 0 ]; then
        echo "etherwake installed successfully."
    else
        echo "Failed to install etherwake."
    fi
else
    echo "etherwake is already installed."
fi
