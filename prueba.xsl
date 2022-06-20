<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:template match="/artist_data/artist">
= <xsl:value-of select="name"/>
<xsl:if test="disambiguation">
* Disambiguation: <xsl:value-of select="disambiguation"/>
</xsl:if>
* Type: <xsl:value-of select="type"/>
* Birth Place: <xsl:value-of select="area/origin"/>,<xsl:value-of select="area/name"/>
* Life-Span:<xsl:value-of select="life-span/begin"/>-<xsl:if test="string(life-span/ended)='true'"><xsl:value-of select="life-span/end"/></xsl:if>
=== Recordings
<xsl:for-each select="recordings/recording"/>
==== <xsl:value-of select"title"/>.Length: <xsl:value-of select="lenght"/>.<xsl:if test="first-release-date"> First release date: <xsl:value-of select="first-release-date"></xsl:if>
====== Releases
|===
|Title|Date|Country|Type|Track number
<xsl:for-each select="release">
|<xsl:value-of select="title"/>|<xsl:value-of select="Date"/>|<xsl:value-of select="Country"/>|<xsl:value-of select="Type"/>|<xsl:value-of select="Track Number"/>
|===
</xsl:for-each>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>