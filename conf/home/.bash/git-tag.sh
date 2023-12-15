#!/bin/bash

if [ -f "./composer.json" ]; then
  CURRENT_VERSION=$(grep -o '"version": "[^"]*' "./composer.json" | grep -o '[^"]*$')

  echo "Current version: ${CURRENT_VERSION}"
  
  delimiter=.
  array=($(echo "${CURRENT_VERSION}" | tr $delimiter '\n'))
  array[2]=$((array[2]+1))
  VERSION=$(IFS=$delimiter ; echo "${array[*]}")
	
  sed -i "s/\"version\": \"[^\"]*/\"version\": \"${VERSION}/g" "./composer.json"
  git commit -a -m "chore: release ${VERSION}"
  git tag -a "v${VERSION}" -m "version ${VERSION}"
  
  echo "Released version: ${VERSION}"
else
  echo "composer.json not found"
fi

