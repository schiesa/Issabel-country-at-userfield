#!/bin/bash

#International dialcode is 00
LDI="00"

# Set comma as delimiter
read -a strarr <<< "$text"

while RIFS= read -r line || [[ -n "$line" ]]; do
    #echo "Text read from file: $line"
    IFS=","
    read -a strarr <<< "$line"
    #Print the splitted words
    #echo "Country Name : ${strarr[0]}"
    #echo "Prefix : ${strarr[1]}"
    [[ $1 == $LDI${strarr[1]}* ]] && echo ${strarr[0]}
done < "cc.csv"   

