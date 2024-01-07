#!/bin/bash

d="${1:-.}"

sudo chown -R 1000:1000 "${d}"

for f in $(find "$d" -type f); do 
	sudo chmod 0640 "$f"
	echo "  - $f CHANGED"
done
for f in $(find "$d" -type d); do 
	sudo chmod 0750 "$f"
	echo "  - $f CHANGED"
done

#find "${d}" -type f -exec sudo chmod 0640 {} \;
#find "${d}" -type d -exec sudo chmod 0750 {} \;