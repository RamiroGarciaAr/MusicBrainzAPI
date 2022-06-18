declare function local:order($arid as xs:ID) as xs:string
{
    for $arid in doc('artists_list.xml')//artists_list/artist
    order by artist/@arid
    return
};