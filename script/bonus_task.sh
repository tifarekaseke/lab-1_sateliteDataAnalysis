#!/bin/bash

# This script combines temp_script.sh and country_sort_script.sh to extract the top 10 countries with the highest temperature
#and sort humidity data for South Africa.

# Define file paths
output_file="../analyzed_data/summary_result.csv"
satellite_data="../raw_data/satelite_temperature_data.csv"

# Extract the header from the satellite data
header=$(head -n 1 "$satellite_data")

# Sort by Temperature(column 3) and take the top 10
# Print the header first
echo "$header" > "$output_file"

# Extract the top 10 highest temperature rows while excluding the header
tail -n +2 "$satellite_data" | sort -t, -k3 -nr |uniq -u| head -n 10 >> "$output_file"

# Skip lines for better readability
echo "" >> "$output_file"
echo "" >> "$output_file"

# Ensure the header remains at the top
echo "$header" >> "$output_file"

# Extract South Africa data and sort by column 4, humidity in descending order
awk -F, 'NR==1 ||$1 == "South Africa"' "$satellite_data" | sort -t, -k4 -nr >> "$output_file"

# Remove the last line
sed -i '$ d' "$output_file"

# Task completion message
echo "Processing complete. Output saved to '$output_file'."
