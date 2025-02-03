#!/bin/bash

# This script will sort the data of a specific country, South Africa, from the satelite data

# Define file file paths
south_africa_data="../analyzed_data/humidity_data_south_africa.csv"
satelite_location="../raw_data/satelite_temperature_data.csv"

# Extract South Africa data and sort by column 4 in descending order
awk -F, '$1 == "South Africa" {print}' $satelite_location | sort -t, -k4 -nr > $south_africa_data

