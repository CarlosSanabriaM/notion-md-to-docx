#/bin/bash

# Move to the Downloads folder
cd ~/Downloads

# Get latest modified zip file name (should be the zip exported by Notion that contains the md file)
latestModifiedZipFile=$(ls -t *.zip | head -n1)
echo "File to unzip: $latestModifiedZipFile"

# Unzip the file contents inside a directory and remove the zip file
outputDir="notion-export-content"
echo "Unzip file contents inside $outputDir"
unzip -o "$latestModifiedZipFile" -d "$outputDir"
echo "Remove zip file $latestModifiedZipFile"
rm -f "$latestModifiedZipFile"

# Move to the new directory and transform the md file to docx
cd "$outputDir"
mdFile=$(ls *.md | head -n1)
echo "Markdown file to transform to Word: $mdFile"
pandoc -s "$mdFile" -o word.docx

# Open the new word file
open word.docx
