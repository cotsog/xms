<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/client">
	<xsl:element name="html">
	    <xsl:copy-of select="./@*"></xsl:copy-of>
	    <xsl:apply-templates select="./node()"/>
	</xsl:element>
    </xsl:template>
    <xsl:template name="header" match="header">
	<xsl:element name="head">
	    <xsl:copy-of select="./@*"></xsl:copy-of>
	    <xsl:for-each select="./node()">
		<xsl:choose>
		    <xsl:when test="local-name()='metas'">
			<xsl:if test="not(./element/@disabled)">
			    <xsl:element name="meta">
				<xsl:copy-of select="./element/@*"></xsl:copy-of>
			    </xsl:element>
			</xsl:if>
		    </xsl:when>
		    <xsl:when test="local-name()='links'">
			<xsl:if test="not(./element/@disabled)">
			    <xsl:element name="link">
				<xsl:copy-of select="./element/@*"></xsl:copy-of>
			    </xsl:element>
			</xsl:if>
		    </xsl:when>
		    <xsl:when test="local-name()='load'">
			<xsl:if test="not(./@disabled)">
			    <xsl:element name="script">
				<xsl:copy-of select="./@*"></xsl:copy-of>
			    </xsl:element>
			</xsl:if>
		    </xsl:when>
		    <xsl:when test="local-name()='run'">
			<xsl:if test="not(./@disabled)">
			    <xsl:element name="script">
				<xsl:copy-of select="./@*"></xsl:copy-of>
				<xsl:copy-of select="./node()"></xsl:copy-of>
			    </xsl:element>
			</xsl:if>
		    </xsl:when>
		    <xsl:when test="local-name()='style'">
			<xsl:if test="not(./@disabled)">
			    <xsl:if test="not(./@href)">
				<xsl:element name="style">
				    <xsl:copy-of select="./@*"></xsl:copy-of>
				    <xsl:copy-of select="./node()"></xsl:copy-of>
				</xsl:element>
			    </xsl:if>
			    <xsl:if test="./@href">
				<xsl:element name="link">
				    <xsl:copy-of select="./@*"></xsl:copy-of>
				</xsl:element>
			    </xsl:if>
			</xsl:if>
		    </xsl:when>
		    <xsl:otherwise>
			<xsl:copy-of select="."></xsl:copy-of>
		    </xsl:otherwise>
		</xsl:choose>
	    </xsl:for-each>
	</xsl:element>
    </xsl:template>
    <xsl:template name="content" match="content">
	<xsl:element name="body">
	    <xsl:copy-of select="./@*"></xsl:copy-of>
                        <xsl:copy-of select="./node()"></xsl:copy-of>
	</xsl:element>
    </xsl:template>
    <xsl:output
    indent="yes"
    method="html"
    version="4.0"
    encoding="UTF-8"/>

</xsl:stylesheet>