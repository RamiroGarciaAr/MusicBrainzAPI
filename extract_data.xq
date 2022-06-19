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

if(fn:contains($artist_id,doc(artist_list.xml)//artists_list/artist/@arid))
then(
    <osm_result xsi:noNamespaceSchemaLocation="intermediate.xsd">    
        <artist>
            <name>{doc("artist_info.xml")//artist/name/text()}</name>,
            <disambiguation>{//artist/disambiguation/text()} </disambiguation>,
            <type>{doc("artist_info.xml")//artist/@type/text()}</type>,
            <area>
                <name>{//artist/area/name/text()}</name>
                <origin>{//artist/begin-area/name/text()}</origin>
            </area>,
            <life-span>{//artist/life-span}</life-span>
            <recordings>
                <title>{doc("recordings_info.xml")//recording-list/recording/title/text()}</title>
                <length>{doc("recordings_info.xml")//recording-list/recording/lenght/text()}</length>
                <first-release-date>{doc("recordings_info.xml")//recording-list/recording/first-release-date/text()}</first-release-date>
                <release>
                        <title>{doc("recordings_info.xml")//recording-list/release-list/title/text()}</title>
                        <date>{doc("recordings_info.xml")//recording-list/release-list/date/text()}</date>
                        <country>{doc("recordings_info.xml")//recording-list/release-list/country/text()}</country>
                        <type>{doc("recordings_info.xml")//recording-list/release-list/release-group/primary-type/text()}</type>
                        <subtype>{doc("recordings_info.xml")//recording-list/release-list/release-group/secondary-type/text()}</subtype>
                        <track-number>{doc("recordings_info.xml")//recording-list/release-list/meduim-list/medium/track-list/track/number/text()}</track-number>
                </release>
            </recordings>
        </artist>       
    </osm_result>)
else(
    <result>
        <error>{$id-error}</error>
    </result>
)

