#!/bin/bash

# This script extracts the top 10 countries with the highest temperature from satellite data
# and ensures that the headers are displayed correctly.

# Define file paths
output_file="../analyzed_data/highest_temp.csv"
satellite_data="../raw_data/satelite_temperature_data.csv"

# Extract the header from the satellite data
header=$(head -n 1 "$satellite_data")

# Extract the top 10 highest temperature rows (excluding the header), then add the header back
{
    echo "$header"  # Print the header first
    tail -n +2 "$satellite_data" | sort -t, -k3 -nr | head -n 10  # Sort by column 3 (Temperature) and take the top 10
} > "$output_file"

# Display the result
cat "$output_file"
