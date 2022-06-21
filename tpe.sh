#!/bin/bash

artist_id=${1#*=}

isInFile=$(cat ./artist_list.xml | grep -c "$artist_id")

if [ "$#" != "1" ]; then
    echo "You must provide only one artist_id."
else
    echo "Processing data please wait..."
fi

if [ $isInFile -eq 0 ]; then
   #string not contained in file
else
   #string is in file at least once
fi

rm -f artist_info.xml recordings_info.xml artist_data.xml

curl -o artist_info.xml "https://musicbrainz.org/ws/2/artist/${artist_id}?inc=works" 
echo "artist_info.xml generated."

curl -o recordings_info.xml "https://musicbrainz.org/ws/2/recording?query=arid:${artist_id}&limit=1000" 
echo "recordings_info.xml generated."

java net.sf.saxon.Transform -s:artist_info.xml -xsl:remove_namespace.xsl -o:artist_info.xml
java net.sf.saxon.Transform -s:recordings_info.xml -xsl:remove_namespace.xsl -o:recordings_info.xml

java net.sf.saxon.Query ./extract_data.xq > "artist_data.xml"
echo "artist_data.xml generated."

java net.sf.saxon.Transform -s:artist_data.xml -xsl:generate_doc.xsl -o:artist_page.adoc
echo "artist_page.adoc generated, check your directory."
echo "If 'artist_page.adoc' is empty, check the error output in 'artist_data.xml'."
