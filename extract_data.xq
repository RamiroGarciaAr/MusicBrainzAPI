declare variable $Id-invalid := "Id not found in the allowed list.";


declare function local:findID($artist_id as xs:anyAtomicType?)as xs:boolean
    {
      for $s in doc("artists_list.xml")/artists_list
      return
        if("$artist_id" = "$s/artist/@arid")
         then false()
        else true()
    };

(:~ declare function local:checkForErrors() as xs:boolean {
    exists(doc("./recordings_info.xml")//error) or exists(doc("./artist_info.xml")//error)
}; ~:)

let $artist := doc("artist_info.xml")//artist
return
if(local:findID("$artist/@Id"))
then(
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
)
else($Id-invalid)