#!/bin/bash
set -e
# Prompt for environment name
read -p "Enter the environment name: " env_name

# Validate input
if [[ -z "$env_name" ]]; then
    echo "Environment name cannot be empty. Exiting."
    exit 1
fi

# Install required Python libraries and tools in the specified conda environment
conda create -n "$env_name" python pandas scipy seaborn plotly jupyter python-dotenv -y
conda activate "$env_name"
pip install ipython

# PROJECT ROOT DIR VAR 
SCRIPTPATH="$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" #get directory path
conda env config vars set ROOT_DIR=$(cd "$SCRIPTPATH"/.. && pwd)

trap 'conda deactivate' EXIT

echo "Installation completed successfully."
