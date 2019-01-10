<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:output method="xml" indent="yes" />
	
	<xsl:template match="/">
	<website>
		<xsl:apply-templates select="site" />
		<xsl:apply-templates select="site/views/view" />
	</website>
	</xsl:template>

	<xsl:template match="site">
			<xsl:attribute name="id"><xsl:value-of select="@id" />
			</xsl:attribute>
			<xsl:attribute name="name"><xsl:value-of select="@name" />
			</xsl:attribute>
	</xsl:template>
	
	
	<xsl:template match="site/views/view">
		<page>
			<xsl:attribute name="id"><xsl:value-of select="@id" />
			</xsl:attribute>
			<xsl:attribute name="name"><xsl:value-of select="@name" />
			</xsl:attribute>
			
			<description>
				<xsl:value-of select="description" />
			</description>
			
			<xsl:for-each select="component">
				<widget>
					<xsl:attribute name="id"><xsl:value-of
						select="@ref" />
						</xsl:attribute>
					<xsl:apply-templates select="//components">
						<xsl:with-param name="websiteId" select="@ref">
						</xsl:with-param>
					</xsl:apply-templates>
				</widget>
			</xsl:for-each>
			
		</page>

		</xsl:template>
		
		
		
		<xsl:template match="//components">
			<xsl:param name="websiteId"></xsl:param>
			<xsl:for-each select="component">
				<xsl:if test="@id=$websiteId">
					
					<xsl:attribute name="type">
			 			<xsl:value-of select="@type">
			 			</xsl:value-of>
			 		</xsl:attribute>
			 		
					<xsl:choose>
						<xsl:when test="@type='TEXT'">
							<text>
								<xsl:value-of select="text"></xsl:value-of>
							</text>
						</xsl:when>
						<xsl:when test="@type='IMG'">
						
						<xsl:attribute name="src">
			 			<xsl:value-of select="@src">
			 			</xsl:value-of>
			 		    </xsl:attribute>
						</xsl:when>
						
						
						<xsl:when test="@type='YOUTUBE'">
						<xsl:attribute name="url">
			 			<xsl:value-of select="@url"></xsl:value-of>
			 		    </xsl:attribute>
						</xsl:when>
						
						
						<xsl:when test="@type='BUTTON'">
						<xsl:attribute name="label">
			 			<xsl:value-of select="@label">
			 			</xsl:value-of>
			 		    </xsl:attribute>
						</xsl:when>
						
					</xsl:choose>
				</xsl:if>
			</xsl:for-each>
		</xsl:template>
</xsl:stylesheet>