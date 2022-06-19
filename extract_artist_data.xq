let $artist := doc("artist_info.xml")//artist
return
<artist_data xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  xsi:noNamespaceSchemaLocation="artist_data.xsd"> 
    <artist>
            <name>
                {$artist/name/text()}
            </name>

            <disambiguation>
                {$artist/disambiguation/text()}
            </disambiguation>
            
            <type>
                {data($artist/@type)}
            </type>
            
            <area>

                <name>
                    {$artist/area/name/text()}
                </name>

                <origin>
                    {$artist/begin-area/name/text()}
                </origin>
                
            </area>

            <life-span>
                {$artist/life-span/node()}
            </life-span>
            
        <recordings>
            {
            for $recording in doc("recordings_info.xml")//recording-list/recording
            return
                <recording>
                    <title>
                        {$recording/title/text()}
                    </title>
                    
                    if(exists($$recording/length))
                    then <lenght>
                        {$recording/length/text()}
                    </lenght>
                    <first-release-date>
                        {$recording/first-release-date/text()}
                    </first-release-date>
                            <release>
                                <title>
                                    {$recording/release-list/release/title/text()}
                                </title>
                                
                                <date>
                                    {$recording/release-list/release/date/text()}
                                </date>

                                 <country>
                                    {$recording/release-list/release/text()} 
                                </country>

                                <type>
                                    {$recording/release-list/release/release-group/primary-type/text()}
                                </type>
                                
                                <subtype>
                                    {empty($recording/release-list/release/release-group/secondary-type/text())}
                                </subtype>
                                
                                <track-number>
                                    {$recording/release-list/release/medium-list/medium/track-list/track/number/text()}
                                </track-number>  
                            </release>
                </recording>
            }
        </recordings>
    </artist>
</artist_data>

(:~ Length,date varias veces ~:)