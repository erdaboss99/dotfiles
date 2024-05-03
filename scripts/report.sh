#!/bin/bash

downloads_folder="/mnt/c/Users/rerdelyi/Downloads"
specific_folder="$HOME/Work/autotest-playwright/playwright-report"
rm -rf "$specific_folder"/*
# Find the most recent zip file in the Downloads folder
recent_zip=$(ls -t "$downloads_folder"/*.zip 2>/dev/null | head -n 1)

# Check if a zip file was found
if [ -n "$recent_zip" ]; then
	echo "Moving $recent_zip to $specific_folder"
	mv "$recent_zip" "$specific_folder"

	# Extract the zip file
	unzip -q "$specific_folder/$(basename "$recent_zip")" -d "$specific_folder"
	echo "Zip file extracted."
else
	echo "No zip files found in $downloads_folder"
fi
