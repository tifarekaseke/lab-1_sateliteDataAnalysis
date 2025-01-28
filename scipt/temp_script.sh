#!bin/bash
satelite_location="../raw_data/satelite_temperature_data.csv"
highest_temp_loc="../analyzed_data/highest_temp.csv"
cut -d, -f3 $satelite_location | sort -nr | head -n 10 > $highest_temp_loc
