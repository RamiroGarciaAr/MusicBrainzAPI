# Readme Trabajo Especial XML

## Archivos requeridos:

Para ejecutar el programa correctamente, se debe contar con los siguientes archivos en el directorio donde se está trabajando:

### tpe.sh
### extract_data.xq
Además se debe tener instalado Java, Xerces, y Saxon.

tp.sh se ejecuta pasando como parametro el id del artista desdeado, de la siguiente manera:

### ./tp.sh artist_id=id deseado

getter.sh se ejecuta de la siguiente manera:

### ./getter.sh

Al ingresar dicho comando se notificará el proceso de lectura y al finalizar será generado un archivo .csv con la información de salida en el mismo directorio. 
En caso de que el archivo se encuentre vacío, en  “intermediate.xml” se encontrarán los errores ocurridos durante la ejecución.