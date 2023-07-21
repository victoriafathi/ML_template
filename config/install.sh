#!/bin/bash

# Prompt for environment name
read -p "Enter the environment name: " env_name

# Install required Python libraries and tools in the specified conda environment
conda create -n "$env_name" python pandas scipy seaborn plotly jupyter dotenv -y
conda activate "$env_name"
#pip install ipython

# VAR ENV 
SCRIPTPATH="$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" #get directory path
conda env config vars set ROOT_DIR=$(cd "$SCRIPTPATH"/.. && pwd)
conda deactivate "$env_name"

echo "Installation completed successfully."
