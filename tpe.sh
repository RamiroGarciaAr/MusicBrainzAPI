#!/bin/bash

artist_id=${1#*=}

rm -f artist_info.xml recordings_info.xml artist_data.xml

if [ "$#" != "1" ]; then
    echo "You must provide only one artist_id."
    exit 1
else
    echo "Processing data please wait..."
fi


if grep -Fq "$artist_id" artists_list.xml
then
    echo "Id found processing still waiting..."
    curl -o artist_info.xml "https://musicbrainz.org/ws/2/artist/${artist_id}?inc=works" 
    echo "artist_info.xml generated."

    curl -o recordings_info.xml "https://musicbrainz.org/ws/2/recording?query=arid:${artist_id}&limit=1000" 
    echo "recordings_info.xml generated."

    java net.sf.saxon.Transform -s:artist_info.xml -xsl:remove_namespace.xsl -o:artist_info.xml
    java net.sf.saxon.Transform -s:recordings_info.xml -xsl:remove_namespace.xsl -o:recordings_info.xml

    java net.sf.saxon.Query ./extract_data.xq > "artist_data.xml"
    echo "artist_data.xml generated."

else
    echo "<error>El id indicado no existe en 'artists_list.xml'</error>" > "artist_data.xml"
fi

java net.sf.saxon.Transform -s:artist_data.xml -xsl:generate_doc.xsl -o:artist_page.adoc
echo "artist_page.adoc generated, check your directory."
echo "If 'artist_page.adoc' is empty, check the error output in 'artist_data.xml'."
