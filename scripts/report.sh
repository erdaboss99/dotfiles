#!/bin/bash

rm -rf "$PW_REPORT_PASTE_FOLDER"/*
# Find the most recent zip file in the Downloads folder
recent_zip=$(ls -t "$PW_REPORT_DOWNLOAD_FOLDER"/*.zip 2>/dev/null | head -n 1)

# Check if a zip file was found
if [ -n "$recent_zip" ]; then
	echo "Moving $recent_zip to $PW_REPORT_PASTE_FOLDER"
	mv "$recent_zip" "$PW_REPORT_PASTE_FOLDER"

	# Extract the zip file
	unzip -q "$PW_REPORT_PASTE_FOLDER/$(basename "$recent_zip")" -d "$PW_REPORT_PASTE_FOLDER"
	echo "Zip file extracted."
else
	echo "No zip files found in $PW_REPORT_DOWNLOAD_FOLDER"
fi
