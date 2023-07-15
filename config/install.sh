#!/bin/bash

# Prompt for environment name
read -p "Enter the environment name: " env_name

SCRIPTPATH="$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"  #get directory path
export ROOT_DIR=$(builtin cd $SCRIPTPATH/..; pwd) #Create environment variable for root direction

# Install required Python libraries and tools in the specified conda environment
conda create -n "$env_name" python pandas scipy seaborn plotly jupyter -y
conda activate "$env_name"
pip install ipython

echo "Installation completed successfully."
