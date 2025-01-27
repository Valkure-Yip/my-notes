#!/bin/bash

# Function to clear the previous line
clear_line() {
    echo -ne "\033[K"
}

# Load configuration from repo.ini
source ./init_file_parser.sh
process_ini_file repos.ini

# Get all repository variables
repo_vars=$(set | grep ^repos_ | grep -v 'repos_keys\|repos_values')

# Calculate the maximum repository name length
max_length=0
for repo_var in $repo_vars; do
    repo_name=${repo_var#repos_}
    repo_name=${repo_name%%=*}
    if [ ${#repo_name} -gt $max_length ]; then
        max_length=${#repo_name}
    fi
done

# Add padding for the status column
max_length=$((max_length + 4))

echo -e "\nCloning Repositories:"
echo -e "-------------------"

# Function to clone a single repository
clone_repo() {
    local repo_name=$1
    local repo_var="repos_${repo_name}"
    eval "repo_url=\${$repo_var}"
    
    if [ -z "$repo_url" ]; then
        echo -e "\t❌ $repo_name: Repository not found in config"
        return 1
    fi
    
    # Create padding
    padding=""
    current_length=${#repo_name}
    pad_length=$((max_length - current_length))
    for ((i=0; i<pad_length; i++)); do
        padding+=" "
    done
    
    # Check if the directory already exists
    if [ -d "$repo_name" ]; then
        echo -e "\t📁 $repo_name$padding Already exists, skipping..."
    else
        clear_line
        echo -ne "\t🔄 $repo_name$padding Cloning...\r"
        if git clone "$repo_url" "$repo_name" > /dev/null 2>&1; then
            clear_line
            echo -e "\t✅ $repo_name$padding Successfully cloned"
        else
            clear_line
            echo -e "\t❌ $repo_name$padding Failed to clone"
        fi
    fi
}

# Check if a specific repository was requested
if [ $# -eq 1 ]; then
    clone_repo "$1"
else
    # Clone all repositories
    for repo_var in $repo_vars; do
        repo_name=${repo_var#repos_}
        repo_name=${repo_name%%=*}
        clone_repo "$repo_name"
    done
fi

echo -e "\nCloning Complete!\n"
