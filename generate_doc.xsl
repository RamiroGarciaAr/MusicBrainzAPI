<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:template match="/">
</xsl:template>




<!-- 
<template>
=<xsl:value-of select=“title”/>
</template> 
-->
======Releases
<xsl:for-each select="release">
|===
|Title|Date|Country|Type|Track number
|<xsl:value-of select="title"/>|<xsl:value-of select="Date"/>|<xsl:value-of select="Country"/>|<xsl:value-of select="Type"/>|<xsl:value-of select="Track Number"/>
|===
</xsl:for-each>


</xsl:stylesheet>
<!-- Ejemplos de sintaxis:
- Heading nivel 1: = Heading 1
- Heading nivel 3: === Heading 3
- Heading nivel 4: ==== Heading 4
- Heading nivel 6: ====== Heading 6
- Lista de ítems:
* Ítem 1
* Ítem 2
- Tabla:
|===
|c1|c2|c3|c4|c5
|fila1|fila1|fila1|fila1|fila1
|fila2|fila2|fila2|fila2|fila2
|=== -->

</xsl:stylesheet>

<xsl:output indent="yes"/>
<xsl:template match="/">

</tr>
</thead>
<tbody>
<xsl:apply-templates/>
</tbody>
</table>
</body>
</html>
</xsl:template>
<xsl:template match="universidad/alumno"/>
<xsl:template name="ImprimirAlumno">
<xsl:param name="aCour"/>
<xsl:param name="anID"/>
<xsl:param name="aProm"/>
<tr>
<td>
<xsl:value-of select="$aCour"/>
</td>
<td>
<xsl:value-of select="/universidad/alumno[@ID = $anID]/name"/>
</td>
<td>
<xsl:value-of select="$aProm"/>
</td>
</tr>
</xsl:template>
<xsl:template match="universidad/curso">
<tr>
<xsl:variable name="Course" select="@ID"/>
<xsl:for-each select="alumno">
<xsl:sort select="avg(nota)"/>
<xsl:call-template name="ImprimirAlumno">
<xsl:with-param name="aCour" select="$Course"/>
<xsl:with-param name="aProm" select="avg(nota)"/>
<xsl:with-param name="anID" select="@ID"/>
</xsl:call-template>
</xsl:for-each>
</tr>
</xsl:template>
