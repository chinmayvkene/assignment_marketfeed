#!/bin/bash

# Specify the log file to monitor
LOG_FILE="/mnt/error.log"
ERROR_LOG="/mnt/errordir/log.txt"

# Keep track of processed lines
processed_lines=0

# Continuously monitor the log file for new entries
while true; do
    # Get the number of lines in the log file
    total_lines=$(wc -l < "$LOG_FILE")

    # If there are new lines to process
    if [ "$total_lines" -gt "$processed_lines" ]; then
        # Output the new entries
        tail -n +"$((processed_lines + 1))" "$LOG_FILE" | while IFS= read -r line; do
            echo "$line"
            # Log the error to a separate file
            if [[ "$line" == *"Error"* ]]; then
                echo "$(date +"%Y-%m-%d %H:%M:%S") - $line" >> "$ERROR_LOG"
            fi
        done

        # Update the number of processed lines
        processed_lines="$total_lines"
    fi

    # Generate summary report
    echo "Summary Report:"
    echo "---------------------"
    echo "Top Errors:"
    echo "---------------------"
    sort "$ERROR_LOG" | uniq -c | sort -nr 
    echo "---------------------"
    
    # Sleep for a short interval before checking again
    sleep 10
done
