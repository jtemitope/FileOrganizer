# File Organizer Script
A simple and efficient Bash script to organize your files by type, size, or modification date.
This script automates the process of categorizing files into directories or listing them based on size or date, helping you keep your directories neat and organized.

## Features
* Categorizes files into folders based on their types (e.g., Images, Documents, Textfiles)
* List files sorted by:
    * Size (largest to smallest)
    * Modification date (newest or oldest first)
* Logs all actions for easy review
* Non-destructive option: Files can be listed without being moved.

## How It Works
### File Type Organization
Files are moved into predefined directories:
* **Images:** .jpg, .png. .gif, etc.
* **Documents:** .pdf, .docx, .ppt, etc.
* **Textfiles:** .txt, .md, etc
### Sorting by Size
List files in descending order
### Sorting by Modification Date
List files by:
* Newest modification date first.
* Oldest modification date first.

## Setup
**1. Clone the Repository**

git clone https://github.com/jtemitope/FileOrganizer.git

cd FileOrganizer

**2. Make the Script Executable**

chmod +x organize_files.sh

## Usage
Run the script:
./organize_files.sh

Choose an option from the interactive menu:
1. Organize by file type
2. List files by size
3. List files by newest modification date
4. List files by oldest modification date

## Requirements
* A Linux or macOS system with Bash installed.
* Basic understanding of the command line.

## Log File
All actions prerformed by the script are logged in organize_files.log, including skipped files and errors.

## Customization
Feel free to edit the script to:
* Add more file types.
* Change folder names.
* and many more.

## Contributing
Contributions are welcome! Fork the repository, make your changes, and submit a pull request. Suggestions and feedback are also appreciated.

## Author
Temitope Johnson
* X (formerly Twitter): @temibytes
* LinkedIn: https://linkedin.com/in/jtemitope
