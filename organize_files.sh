#!/bin/bash

#Enabling nullglob to avoid issues with unmatched patterns.
shopt -s nullglob

#Setting log file for operations.
LOG_FILE="organize_files.log"
echo "File organization started at $(date)" > "$LOG_FILE"

#Organize files by size
organize_by_size() {
    echo "Listing files by size..." | tee -a "$LOG_FILE"
    ls -lhS | tee -a "$LOG_FILE"
}

#Organize files by date (newest first)
organize_by_date() {
    echo "Listing files by modification date..." | tee -a "$LOG_FILE"
    ls -lht | tee -a "$LOG_FILE"
}

#Organize files by date. (Oldest first)
organize_by_oldest_date() {
    echo "Listing files by oldest modification date..." | tee -a "$LOG_FILE"
    ls -lhtr | tee -a "$LOG_FILE"
}

#Displaying user menu.
echo "Choose an organization method:"
echo "1. By file type (move files to directories)"
echo "2. By file size (list files in descending order)"
echo "3. By modification date (newest first)"
echo "4. By modification date (oldest first)"
read -rp "Enter your choice (1/2/3/4): " choice

#Organizing files by type. (Moving files to folders)
organize_by_type() {
    echo "Organizing files by type..." | tee -a "$LOG_FILE"

    #Define directories for file organization.
    IMAGES_DIR="Images"
    DOCS_DIR="Documents"
    TEXTFILES_DIR="Textfiles"
    
    #Create directories if they don't exist.
    mkdir -p "$IMAGES_DIR" "$DOCS_DIR" "$TEXTFILES_DIR"
   
    for file in * .*; do
        [["$file" == "." || "$file" == ".."]] && continue
        if [[-f "$file" ]]; then
            ext="${file##*.}"
            case "$ext" in
                jpg|jpeg|png|gif)
                    mv "$file" "$IMAGES_DIR/" && echo "Moved $file to $IMAGES_DIR" | tee -a "$LOG_FILE"
                    ;;
                pdf|doc|docx|ppt|pptx|xls|xlsx)
                    mv "$file" "$DOCS_DIR/" && echo "Moved $file to $DOCS_DIR" | tee -a "$LOG_FILE"
                    ;;
                txt|md)
                    mv "$file" "$TEXTFILES_DIR/" && echo "Moved $file to $TEXTFILES_DIR" | tee -a "$LOG_FILE"
                    ;;
                *)
                    echo "Skipped: $file (unknown type)" | tee -a "$LOG_FILE"
                    ;;
            esac
        fi
    done
}

#Execute the chosen organization method.
case "$choice" in
    1)
        organize_by_type
        ;;
    2)
        organize_by_size
        ;;
    3)
        organize_by_date
        ;;
    4)
        organize_by_oldest_date
        ;;
    *)
        echo "Invalid choice. Exiting." | tee -a "$LOG_FILE"
        ;;
esac

echo "File organization completed at $(date)" | tee -a "$LOG_FILE"