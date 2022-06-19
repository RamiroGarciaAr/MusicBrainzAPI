<?xml version="1.0"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="@*">
	<xsl:copy/>
</xsl:template>

<xsl:template match="*">
	<xsl:element name="{local-name()}">
		<xsl:apply-templates select="@*|node()"/>
	</xsl:element>
</xsl:template>

</xsl:transform>