#!/bin/bash
WORKDIR="/root/docker-compose-wordpress-LITESPEED/app"

# Remove the existing backup/public_html directory
rm -rf "$WORKDIR/backup/public_html"

# Check if the removal was successful
if [ $? -eq 0 ]; then
    echo "Previous backup removed successfully."

    # Copy the contents of public_html to backup/public_html
    cp -r "$WORKDIR/public_html" "$WORKDIR/backup/public_html"

    # Check if the copy was successful
    if [ $? -eq 0 ]; then
        echo "Backup completed successfully."
    else
        echo "Error: Failed to copy public_html. Check permissions or other issues."
    fi
else
    echo "Error: Failed to remove the previous backup. Check permissions or other issues."
fi