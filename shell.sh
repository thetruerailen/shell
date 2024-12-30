#!/bin/bash

# Print prompt and get command in a loop
while true; do
    # Show prompt with current directory
    echo -n "$(pwd) > "
    
    # Read the command
    read command
    
    # Split command into array
    read -ra cmd_array <<< "$command"
    
    # Handle empty input
    if [ ${#cmd_array[@]} -eq 0 ]; then
        continue
    fi
    
    # Handle built-in commands
    case "${cmd_array[0]}" in
        "exit")
            echo "Goodbye!"
            exit 0
            ;;
        "cd")
            if [ ${#cmd_array[@]} -eq 1 ]; then
                cd "$HOME"
            else
                cd "${cmd_array[1]}"
            fi
            ;;
        *)
            # Execute the command
            $command
            ;;
    esac
done
