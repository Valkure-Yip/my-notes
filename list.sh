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

# Check if --remote flag is present
check_remote=false
for arg in "$@"; do
    if [ "$arg" = "--remote" ]; then
        check_remote=true
        break
    fi
done

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

echo -e "\nRepository Status:"
echo -e "----------------"

# Check each repository
for repo_var in $repo_vars; do
    # Extract the repository name
    repo_name=${repo_var#repos_}
    repo_name=${repo_name%%=*}
    eval "repo_url=\${$repo_var}"
    
    # Create padding
    padding=""
    current_length=${#repo_name}
    pad_length=$((max_length - current_length))
    for ((i=0; i<pad_length; i++)); do
        padding+=" "
    done
    
    # Check if directory exists
    if [ -d "$repo_name" ]; then
        if [ "$check_remote" = true ]; then
            cd "$repo_name" > /dev/null 2>&1
            
            # Fetch updates from remote
            clear_line
            echo -ne "\t🔄 $repo_name$padding Fetching...\r"
            git fetch > /dev/null 2>&1
            
            # Get ahead/behind counts
            ahead=$(git rev-list HEAD --not @{u} --count 2>/dev/null)
            behind=$(git rev-list @{u} --not HEAD --count 2>/dev/null)
            
            if [ $? -eq 0 ]; then
                clear_line
                if [ "$ahead" -eq 0 ] && [ "$behind" -eq 0 ]; then
                    echo -e "\t✅ $repo_name$padding In sync"
                elif [ "$ahead" -gt 0 ] && [ "$behind" -eq 0 ]; then
                    echo -e "\t⬆️  $repo_name$padding Ahead by $ahead commit(s)"
                elif [ "$ahead" -eq 0 ] && [ "$behind" -gt 0 ]; then
                    echo -e "\t⬇️  $repo_name$padding Behind by $behind commit(s)"
                else
                    echo -e "\t⚠️  $repo_name$padding Diverged (+$ahead/-$behind)"
                fi
            else
                clear_line
                echo -e "\t❓ $repo_name$padding No tracking"
            fi
            
            cd - > /dev/null 2>&1
        else
            echo -e "\t✅ $repo_name$padding Exists"
        fi
    else
        echo -e "\t❌ $repo_name$padding Missing"
    fi
done

echo -e "\nStatus Check Complete!\n"
