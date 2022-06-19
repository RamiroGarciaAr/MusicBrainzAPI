(:~ La información a mostrar, es
la siguiente:
● Nombre del artista.
● País.
● Tipo (Grupo, solista, etc).
● Lugar de origen.
● Duración.
● Lista de grabaciones ordernadas por fecha (con su información
correspondiente). ~:)

    <artist_data xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  xsi:noNamespaceSchemaLocation="artist_data.xsd">    
        <artist>
            <name>{doc("artist_info.xml")//artist/name/text()}</name>/n,
            <disambiguation>{doc("artist_info.xml")//artist/disambiguation/text()} </disambiguation>,
            <type>{doc("artist_info.xml")//artist/@type/text()}</type>,
            <area>
                <name>{doc("artist_info.xml")//artist/area/name/text()}</name>
                <origin>{doc("artist_info.xml")//artist/begin-area/name/text()}</origin>
            </area>,
            <life-span>{doc("artist_info.xml")//artist/life-span}</life-span>
            <recordings>
                <title>{doc("recordings_info.xml")//recording-list/recording/title/text()}</title>
                <length>{doc("recordings_info.xml")//recording-list/recording/lenght/text()}</length>
                <first-release-date>{doc("recordings_info.xml")//recording-list/recording/first-release-date/text()}</first-release-date>
                <release>
                for $v in doc("recordings_info.xml")
                        <title>{doc("recordings_info.xml")//recording-list/release-list/title/text()}</title>/n
                        <date>{doc("recordings_info.xml")//recording-list/release-list/date/text()}</date>/n
                        <country>{doc("recordings_info.xml")//recording-list/release-list/country/text()}</country>
                        <type>{doc("recordings_info.xml")//recording-list/release-list/release-group/primary-type/text()}</type>
                        <subtype>{doc("recordings_info.xml")//recording-list/release-list/release-group/secondary-type/text()}</subtype>
                        <track-number>{doc("recordings_info.xml")//recording-list/release-list/meduim-list/medium/track-list/track/number/text()}</track-number>
                </release>
            </recordings>
        </artist>       
    </artist_data>

