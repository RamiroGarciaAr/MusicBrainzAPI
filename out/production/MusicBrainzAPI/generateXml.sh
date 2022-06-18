#!/bin/bash

artist_id=${1#*=}

curl "https://musicbrainz.org/ws/2/artist/${artist_id}?inc=works" > "artist_info.xml"
echo "artist_info.xml generated."

curl "https://musicbrainz.org/ws/2/recording?query=arid:${artist_id}&limit=1000" > "recordings_info.xml"
echo "recordings_info.xml generated."

java net.sf.saxon.Query extract_data.xq > "artist_data.xml"
echo "artist_data.xml generated."

java net.sf.saxon.Transform -s:./intermediate.xml -xsl:./convert_csv.xsl -o:output.csv
echo "output.csv generated, check your directory."
echo "If 'output.csv' is empty, check the error output in 'intermediate.xml'."