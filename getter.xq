let $url :=  ('https://musicbrainz.org/ws/2/artist/')
let $final := ('?inc=works')
for $arid in doc('artists_list.xml')//artists_list/artist/@arid

return $arid