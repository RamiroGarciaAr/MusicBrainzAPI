declare variable $artist_id external;
declare variable $id-error := "The artist_id parameter is invalid.";

(:~ La información a mostrar, es
la siguiente:
● Nombre del artista.
● País.
● Tipo (Grupo, solista, etc).
● Lugar de origen.
● Duración.
● Lista de grabaciones ordernadas por fecha (con su información
correspondiente). ~:)


declare function local:id_validation($artist_id) as xs:boolean
{
    fn:contains($artist_id,doc(artist_list.xml)//artists_list/artist/@arid)
};


if(local:id_validation($artist_id))
then(
    <result>
        <error>{$id-error}</error>
    </result>
    )
else(
<osm_result xsi:noNamespaceSchemaLocation="intermediate.xsd">    
        <artist>
            for $n in doc("artist_info.xml")
            return{
            <name>{//artist/name/text()}</name>,
            <disambiguation>{//artist/disambiguation/text()} </disambiguation>,
            <type>{//artist/@type/text()}</type>,
            <area>
                <name/>
                <origin/>
            </area>,
            <life-span>{//artist/life-span}</life-span>
            }
            <recordings>
            for $var in doc("recordings_info.xml")
            return
                <title>{//recording-list/recording/title/text()}</title>
                <length>{//recording-list/recording/lenght/text()}</length>
                <first-release-date>{//recording-list/recording/first-release-date/text()}</first-release-date>
                <release>
                    for $n in //recording-list/recording/release-list
                        <title>{/title/text()}</title>
                        <date>{/date/text()}</date>
                        <country>{/country/text()}</country>
                        <type/>
                        <subtype/>
                        <track-number>{/meduim-list/medium/track-list/track/number/text()}</track-number>
                </release>
            </recordings>
        </artist>
        
</osm_result>
)

