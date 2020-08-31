#!/usr/bin/env bash

#Renaming $1 to something more readable	
archiveName=$1

#Getting rid of the suffix on the tar archive and renaming to baseName
baseName=$(basename -s .tgz "$archiveName")

#Renaming directory to a more descriptive name
tempDirectory=$(mktemp -d)

#Extracting the contents of the archive into the tempDirectory
tar -xzf "$archiveName" -C "$tempDirectory"

#Preserving directory to use later
HERE=$(pwd)
 
cd "$tempDirectory" || exit 

#Removing all of the files thate contain "DELETE ME!" 
grep -Rl "DELETE ME!" . | xargs rm

#Creating a new compressed tar archive that contains the files left over in the temporary Directory
tar -zcf cleaned_"$archiveName" "$baseName"
mv cleaned_"$archiveName" "$HERE"

