# Log File Monitor

This script monitors a log file for new entries and extracts error messages to a separate log file.

## Usage

1. Ensure you have Bash installed on your system.
2. Set the `LOG_FILE` variable in the script to the path of the log file you want to monitor.
3. Set the `ERROR_LOG` variable to the path where you want to store error messages.
4. Run the script using `bash script.sh`.
5. The script will continuously monitor the log file for new entries and display them. Errors will be logged to the error log file.

## Considerations

- Ensure the script has permission to read the log file and write to the error log file.
- If the log file is rotated, consider using a log rotation tool to manage log files.
- For efficiency, consider using tools like `inotifywait` or `tail -f` to monitor the log file instead of reading the entire file each time.

## Example

```bash
LOG_FILE="/path/to/your/log/file.log"
ERROR_LOG="/path/to/your/error/log.txt"
bash monitor_script.sh

