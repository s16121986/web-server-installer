#!/bin/bash

d="${1:-./storage/logs/}"

for f in $(find "$d" -name *.log); do 
	> $f
	echo "  - Trincating $f"
done

#find "${d}" -type f -name *.log -exec sudo sh -c ">{}" \;
#for file in "${d}/*.log"; do > "$file"; done
#truncate -s 0 "${d}/*.log"