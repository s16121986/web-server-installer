#!/bin/bash

d="${1:-.}"

sudo chown -R www-data:www-data "${d}"
for f in $(find "$d" -type f); do 
	sudo chmod 0660 "$f"
	echo "  - $f CHANGED"
done
for f in $(find "$d" -type d); do 
	sudo chmod 0770 "$f"
	echo "  - $f CHANGED"
done

#find "${d}" -type f -exec sudo chmod 0660 {} \;
#find "${d}" -type d -exec sudo chmod 0770 {} \;