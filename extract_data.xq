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

                    <length>
                        {$recording/length/text()}
                    </length>
                    
                    <first-release-date>
                        {$recording/first-release-date/text()}
                    </first-release-date>
                        {
                        for $release in doc("recordings_info.xml")//$recording/release-list/release
                        return
                            <release>
                                <title>
                                    {$release/title/text()}
                                </title>
                                
                                <date>
                                    {$release/date/text()}
                                </date>
                                                         
                                <country>
                                    {$release/country/text()} 
                                </country>
                            

                                <type>
                                    {$release/release-group/primary-type/text()}
                                </type>

                                {
                                if(empty($release/release-group/secondary-type))
                                then ()
                                else
                                <subtype>
                                    {$release/release-group/secondary-type/text()}
                                </subtype>
                                }
                                
                                <track-number>
                                    {$release/medium-list/medium/track-list/track/number/text()}
                                </track-number>  
                            </release>
                         }
                </recording>
              
            }
        </recordings>
    </artist>
</artist_data>