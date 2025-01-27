#!/bin/bash

# Function to clear the previous line
clear_line() {
    echo -ne "\033[K"
}

echo -e "\nUpdating Repositories:"
echo -e "-------------------"

# Calculate the maximum repository name length
max_length=0
for dir in */; do
    if [ -d "$dir/.git" ]; then
        dir=${dir%/}
        if [ ${#dir} -gt $max_length ]; then
            max_length=${#dir}
        fi
    fi
done

# Add padding for the status column
max_length=$((max_length + 4))

for dir in */; do
    if [ -d "$dir/.git" ]; then
        dir=${dir%/}
        
        # Create padding
        padding=""
        current_length=${#dir}
        pad_length=$((max_length - current_length))
        for ((i=0; i<pad_length; i++)); do
            padding+=" "
        done
        
        cd "$dir"
        clear_line
        echo -ne "\t🔄 $dir$padding Pulling changes...\r"
        if git pull > /dev/null 2>&1; then
            clear_line
            echo -e "\t✅ $dir$padding Pull successful"
        else
            clear_line
            echo -e "\t❌ $dir$padding Pull failed"
        fi
        
        clear_line
        echo -ne "\t📝 $dir$padding Adding changes...\r"
        git add .
        
        clear_line
        echo -ne "\t💾 $dir$padding Committing...\r"
        if git commit -m "Automatic update" > /dev/null 2>&1; then
            clear_line
            echo -e "\t✅ $dir$padding Committed"
        else
            clear_line
            echo -e "\t➖ $dir$padding No changes"
        fi
        
        clear_line
        echo -ne "\t⬆️  $dir$padding Pushing...\r"
        if git push > /dev/null 2>&1; then
            clear_line
            echo -e "\t✅ $dir$padding Push successful"
        else
            clear_line
            echo -e "\t❌ $dir$padding Push failed"
        fi
        cd ..
        echo -e "\n"
    fi
done

echo -e "\nUpdate Complete!\n"