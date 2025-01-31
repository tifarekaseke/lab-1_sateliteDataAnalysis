#!/bin/bash

satelite_location="../raw_data/satelite_temperature_data.csv"
file_location="../analyzed_data/summary_result.csv"

cut -d, -f3 $satelite_location | sort -nr | head -n 10 > $file_location
awk -F, '$1 == "South Africa" {print}' $satelite_location | sort -t, -k4 -nr >> $file_location
