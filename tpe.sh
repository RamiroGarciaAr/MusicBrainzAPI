#!/bin/bash

artist_id=${1#*=}


curl -o artist_info.xml "https://musicbrainz.org/ws/2/artist/${artist_id}?inc=works" 
echo "artist_info.xml generated."

curl -o recordings_info.xml "https://musicbrainz.org/ws/2/recording?query=arid:${artist_id}&limit=1000" 
echo "recordings_info.xml generated."

java net.sf.saxon.Query -o artist_data.xml extract_data.xq 
echo "artist_data.xml generated."

java net.sf.saxon.Transform -s:./artist_data.xml -xsl:./convert_csv.xsl -o:output.csv
echo "output.csv generated, check your directory."
echo "If 'output.csv' is empty, check the error output in 'artist_data.xml'."