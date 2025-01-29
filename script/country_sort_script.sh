#!/bin/bash

south_africa_data="../analyzed_data/humidity_data_south_africa.csv"
satelite_location="../raw_data/satelite_temperature_data.csv"
awk -F, '$1 == "South Africa" {print}' $satelite_location | sort -t, -k4 -nr > $south_africa_data
