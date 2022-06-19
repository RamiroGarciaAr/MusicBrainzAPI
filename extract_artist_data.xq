let $artist := doc("artist_info.xml")//artist
return
<artist_data xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  xsi:noNamespaceSchemaLocation="artist_data.xsd"> 
    <artist>
            <name>{data($artist/name)}
            </name>

            <disambiguation>{data($artist/disambiguation)}
            </disambiguation>
            
            <type>{data($artist/@type)}
            </type>
            
            <area>
            
            <name>{data($artist/area/name)}
            </name>
            
            <origin>{data($artist/begin-area/name)}
            </origin>
            </area>
            
            <life-span>{$artist/life-span/node()}
            </life-span>
        <recordings>
            {
               for $recording in doc("recordings_info.xml")/recordings-list/recording
               order by $recording/recording-list/recording/first-release-date
               return
               if(exists($recording))
                then <recording>
                    <title>
                        {data($recording/title)}
                    </title>

                    <lenght>
                        {data($recording/lenght)}
                    </lenght>
                    
                    if (exists($recording/first-release-date))
                    then <first-release-date>
                        {data($recording/first-release-date)}
                    </first-release-date>
                    else()
                        if (exists($recording/release-list))
                            then <release>
                                <title>
                                    {data($recording/release-list/title)}
                                </title>
                            
                                <date>
                                    {data($recording/release-list/date)}
                                </date>

                                if (exists($recording/release-list/release))
                                then <country>
                                    {data($recording/release-list/release)} 
                                </country>
                                else()
                            
                                <type>
                                    {data($recording/release-list/release-group/primary-type)}
                                </type>
                            
                                if (exists($recording/release-list/release/release-group/secondary-type))
                                then <subtype>
                                    {data($recording/release-list/release/release-group/secondary-type)}
                                </subtype>
                                else()
                            
                                if (exists($recording/release-list/medium-list/medium/track-list/track/number))
                                then <track-number>
                                    {data($recording/release-list/medium-list/medium/track-list/track/number)}
                                </track-number>  
                                else()
                            </release>
                        else()
                </recording>
                else()
            }
        </recordings>
    </artist>
</artist_data>