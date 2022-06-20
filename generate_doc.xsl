<?xml version="1.0"?>
<xsl:Transform>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:template match="/artist_data/artist">
=<xsl:value-of select="name"/>
<xsl:if test="disambiguation">
*Disambiguation:<xsl:value-of select="disambiguation"/>
</xsl:if>
*Type:<xsl:value-of select="type">
*Birth Place:<xsl:value-of select="area/origin">,<xsl:value-of select="area/name">
*Life-Span:<xsl:value-of select="life-span/begin">-<xsl:if test="life-span/ended" match="true"><xsl:value-of select="life-span/end"></xsl:if><xsl:if test="life-span/ended" match="false">present</xsl:if>
===Recordings
<xsl:for-each select="recordings/recording">
====<xsl:value-of select"title"/>.Length: <xsl:value-of select="lenght"/>.<xsl:if test="first-release-date"> First release date: <xsl:value-of select="first-release-date"></xsl:if>
======Releases
<xsl:for-each select="release">
|===
|Title|Date|Country|Type|Track number
|<xsl:value-of select="title"/>|<xsl:value-of select="Date"/>|<xsl:value-of select="Country"/>|<xsl:value-of select="Type"/>|<xsl:value-of select="Track Number"/>
|===
</xsl:for-each>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
</xsl:Transform>
