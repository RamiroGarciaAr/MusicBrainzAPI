let $artist := doc("artist_info.xml")//artist
return
<artist_data xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  xsi:noNamespaceSchemaLocation="artist_data.xsd"> 
    <artist>
            <name>{$artist/name/text()}
            </name>

            <disambiguation>{$artist/disambiguation/text()}
            </disambiguation>
            
            <type>{$artist/@type/text()}
            </type>
            
            <area>
            
            <name>{$artist/area/name/text()}
            </name>
            
            <origin>{$artist/begin-area/name/text()}
            </origin>
            </area>
            
            <life-span>{$artist/life-span/node()}
            </life-span>
        <recordings>
            {
               let $recording := doc("recordings_info.xml")//recordings-list/recording
               return
                <recording>
                    <title>
                        {$recording/title/text()}
                    </title>

                    <lenght>
                        {$recording/lenght/text()}
                    </lenght>
                    <first-release-date>
                        {$recording/first-release-date/text()}
                    </first-release-date>
                            <release>
                                <title>
                                    {$recording/release-list/title/text()}
                                </title>
                                <date>
                                    {$recording/release-list/date/text()}
                                </date>

                                 <country>
                                    {$recording/release-list/release/text()} 
                                </country>
                                <type>
                                    {$recording/release-list/release-group/primary-type/text()}
                                </type>
                             <subtype>
                                    {$recording/release-list/release/release-group/secondary-type/text()}
                                </subtype>
                                
                                <track-number>
                                    {$recording/release-list/medium-list/medium/track-list/track/number/text()}
                                </track-number>  
                            </release>
                </recording>
            }
        </recordings>
    </artist>
</artist_data>