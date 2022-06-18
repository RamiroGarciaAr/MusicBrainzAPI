declare variable $artist_id external;
declare variable $id-empty := "No artist_id to look up.";
declare variable $id-invalid := "The artist_id parameter is invalid.";

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

declare function local:name_validation($tag) as xs:boolean
{
    $tag/@k = "name" and string-length($tag/@v/string()) >= 1
};


<osm_result xsi:noNamespaceSchemaLocation="intermediate.xsd">
    {
        for $var in
        <nodes>
        {
            for $n in doc("artist_info.xml")//node
            where some $v in $n/tag satisfies local:id_validation($v)
            return <artist lat="{$n/@lat}" lon="{$n/@lon}">
                        <name>{$n/tag/@v[../@k/string() = "name"]/string()}</name>
                        <disambiguation>
                        </disambiguation>
                        <type>
                            <city>{$n/tag/@v[../@k/string() = "addr:city"]/string()}</city>
                            <postcode>{$n/tag/@v[../@k/string() = "addr:postcode"]/string()}</postcode>
                            <street>{$n/tag/@v[../@k/string() = "addr:street"]/string()}</street>
                        </type>
                        <area>
                        <name></name>
                        <origin></origin> 
                        </area>
                        <website>{$n/tag/@v[../@k/string() = "website"]/string()}</website>
                        <email>{$n/tag/@v[../@k/string() = "email"]/string()}</email>
                    </artist>
        }
        </nodes>/node
        where some $category in $var//category/type satisfies (local:type_validation($category))
        return $var
}
</osm_result>
