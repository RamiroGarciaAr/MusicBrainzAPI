# Readme Trabajo Especial XML

## Archivos requeridos:

### Para ejecutar el programa correctamente, se debe contar con los siguientes archivos en el directorio donde se está trabajando:

* tpe.sh
* extract_data.xq
* artist_data.xsd
* artist_list.xml
* generate_doc.xsl
* remove_namespace.xsl

## Requisitos para poder correr tpe.sh

Además se debe tener instalado:

* Java
* Xerces
* Saxon

## Ejecución del tpe.sh

tpe.sh se ejecuta pasando como parametro el id del artista desdeado, de la siguiente manera:

* ./tpe.sh artist_id=id deseado 

o en su defecto

* ./tpe.sh id deseado 


Al ingresar dicho comando se notificará el proceso de lectura y al finalizar será generado un archivo .adoc con la información de salida en el mismo directorio. 
En caso de tener un error este se mostrara tanto en “artist_data.xml” como en "artist_page.adoc" detallando el tipo de error ocurrido.