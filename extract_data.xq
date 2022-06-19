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

    <osm_result xsi:noNamespaceSchemaLocation="artist_data.xsd">    
        <artist>
            <name>{doc("artist_info.xml")//artist/name/text()}</name>,
            <disambiguation>{doc("artist_info.xml")//artist/disambiguation/text()} </disambiguation>,
            <type>{doc("artist_info.xml")//artist/@type}</type>,
            <area>
                <name>{//artist/area/name/text()}</name>
                <origin>{//artist/begin-area/name/text()}</origin>
            </area>,
            <life-span>{//artist/life-span}</life-span>
            <recordings>
            for $var in doc("recordings_info.xml")
                <title>{//recording-list/recording/title/text()}</title>
                <length>{//recording-list/recording/lenght/text()}</length>
                <first-release-date>{//recording-list/recording/first-release-date/text()}</first-release-date>
                <release>
                        <title>{//recording-list/release-list/title/text()}</title>
                        <date>{//recording-list/release-list/date/text()}</date>
                        <country>{//recording-list/release-list/country/text()}</country>
                        <type>{//recording-list/release-list/release-group/primary-type/text()}</type>
                        <subtype>{//recording-list/release-list/release-group/secondary-type/text()}</subtype>
                        <track-number>{/meduim-list/medium/track-list/track/number/text()}</track-number>
                </release>
            </recordings>
        </artist>       
    </osm_result>

