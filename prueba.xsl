<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:template match="/artist_data/artist">
= <xsl:value-of select="name"/>
<xsl:if test="disambiguation">
* Disambiguation: <xsl:value-of select="disambiguation"/>
</xsl:if>
* Type: <xsl:value-of select="type"/>
* Birth Place: <xsl:value-of select="area/origin"/>, <xsl:value-of select="area/name"/>
* Life-Span:<xsl:value-of select="life-span/begin"/>-

====== Releases
<xsl:template name="life">
<xsl:choose>
<xsl:when test="life-span/ended[text() = 'true']">
<xsl:value-of select="life-span/end"/>
</xsl:when>
<xsl:otherwise>present</xsl:otherwise>
<xsl:choose>
</xsl:template>
</xsl:template>
</xsl:stylesheet>