#!/bin/bash

# This script extracts and sorts satellite data for South Africa, retaining the header.

# Define file paths
south_africa_data="../analyzed_data/humidity_data_south_africa.csv"
satelite_location="../raw_data/satelite_temperature_data.csv"

# Extract the header
header=$(head -n 1 "$satelite_location")

# Ensure that the header is displayed correctly
echo "$header" > "$south_africa_data"

# Extract South Africa data and sort by column 4 in descending order
awk -F, 'NR==1 ||$1 == "South Africa"' "$satelite_location" | sort -t, -k4 -nr >> "$south_africa_data"

# Remove the last line
sed -i '$ d' "$south_africa_data"

# Task completion message
echo "South Africa data sorted by highest to lowest humidity extracted and saved to '$south_africa_data'."
