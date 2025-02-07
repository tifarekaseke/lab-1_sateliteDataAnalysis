#!/bin/bash

# This script combines temp_script.sh and country_sort_script.sh to extract the top 10 countries with the highest temperature 
#and sort humidity data for South Africa.

# Define file paths
summary_results_path="../analyzed_data/summary_results.csv"
satelite_location="../raw_data/satelite_temperature_data.csv"

# Extract the header
header=$(head -n 1 "$satelite_location")

awk -F, 'NR==1 || $1 == "South Africa"' "$satelite_location" | sort -t, -k4 -nr > "$south_africa_data"

sed -i "1s/.*/$header/" "$south_africa_data"

echo "________________________________________________________________________________________________" >> $file_location

# Extract South Africa data and sort based on highest humidity

output_file="../analyzed_data/summary_results.csv"
satellite_data="../raw_data/satelite_temperature_data.csv"

# Extract the header from the satellite data
header=$(head -n 1 "$satellite_location"); then 

# Extract the top 10 highest temperature rows (excluding the header), then add the header back
{
    echo "$header"  # Print the header first
    tail -n +2 "$satellite_data" | sort -t, -k3 -nr | head -n 10  # Sort by column 3 (Temperature) and take the top 10
} > "$output_file"

# Display the result
cat "$output_file"
