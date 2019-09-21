<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Portfolio</title>
            </head>
            <body>
                <div class="portfolio">
                    <xsl:apply-templates select="portfolio/list/item" />
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="item">
        <div>
            <b><xsl:apply-templates select ="title" /></b>
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="image" />
                </xsl:attribute>
            </img>
        </div>
    </xsl:template>

</xsl:stylesheet>