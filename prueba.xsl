<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">


<xsl:template match="artist">
= <xsl:value-of select="name"/>

<xsl:if test="disambiguation">
* Disambiguation: <xsl:value-of select="disambiguation"/>
</xsl:if>
* Type: <xsl:value-of select="type"/>
* Birth Place: <xsl:value-of select="area/origin"/>, <xsl:value-of select="area/name"/>
* Life-Span: <xsl:value-of select="life-span/begin"/> - <xsl:choose><xsl:when test="life-span/ended[text() = 'true']"><xsl:value-of select="life-span/end"/></xsl:when><xsl:otherwise>present</xsl:otherwise></xsl:choose>
=== Recordings
<xsl:for-each select="recordings/recording">
==== <xsl:value-of select="title"></xsl:value-of>. <xsl:if test="length">Length: <xsl:value-of select="length"></xsl:value-of>. </xsl:if> <xsl:if test="first-release-date">First Release date: <xsl:value-of select="first-release-date"></xsl:value-of>. </xsl:if>
====== Releases
|===
|Title|Date|Country|Type|Track number<xsl:for-each select="release">
|<xsl:value-of select="title"></xsl:value-of> |<xsl:value-of select="date"></xsl:value-of> |<xsl:value-of select="country"></xsl:value-of> |<xsl:value-of select="type"></xsl:value-of>  |<xsl:value-of select="track-number"></xsl:value-of>
</xsl:for-each>
|===

</xsl:for-each>
</xsl:template>

</xsl:stylesheet> 