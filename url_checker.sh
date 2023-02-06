#!/bin/bash

path=/path/to/file

while read -r line; do
    status=$(curl -s -o /dev/null -L -w "%{http_code}" "$line")
    if [ "$status" != "200" ]; then
        echo "Item non found: $line (Status: $status)"
    fi
done < $path
