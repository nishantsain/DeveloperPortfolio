
#!/bin/bash

# Author: Nishant
# Purpose: Create compressed folder backup

if [ -z "$1" ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

SOURCE="$1"

if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder does not exist."
    exit 1
fi

BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"

mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

FILENAME="backup_${TIMESTAMP}.tar.gz"

ARCHIVE="$BACKUP_DIR/$FILENAME"

if tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"; then

    SIZE=$(du -h "$ARCHIVE" | cut -f1)

    echo "Backup created successfully!"
    echo "Filename: $FILENAME"
    echo "Size: $SIZE"

    echo "$TIMESTAMP - SUCCESS - $FILENAME - $SIZE" >> "$BACKUP_DIR/backup.log"

else
    echo "Error: Backup failed."

    echo "$TIMESTAMP - FAILED - $SOURCE" >> "$BACKUP_DIR/backup.log"

    exit 1
fi
