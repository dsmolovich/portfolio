<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="yes" />

    <xsl:template match="a|b|strong|i|pre|p|div|ul|ol|li|table|tbody|th|tr|td|h1|h2|h3|h4|h5|sub|sup">
        <xsl:element name="{name()}">
            <xsl:for-each select="@*">
                <xsl:attribute name="{name()}">
                    <xsl:value-of select="." />
                </xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>


    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
            <head>
                <title>Portfolio</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
                <link rel="stylesheet" type="text/css" href="style.css" />
                <!-- Global site tag (gtag.js) - Google Analytics -->
                <script async="async" src="https://www.googletagmanager.com/gtag/js?id=UA-8494354-5"></script>
                <script>
                    window.dataLayer = window.dataLayer || [];
                    function gtag(){dataLayer.push(arguments);}
                    gtag('js', new Date());

                    gtag('config', 'UA-8494354-5');
                </script>
            </head>
            <body>
                <div class="portfolio">
                    <div align="center" class="header">
                        <b>Linked<span class="linkedIN">in</span></b>
                        <xsl:text> </xsl:text>
                        <a href="http://www.linkedin.com/in/dsmolovich"><b>Dmitry Smolovich</b></a>
                    </div>
                    <br />
                    <xsl:apply-templates select="portfolio/list/item[not(link/@dead)]" />
                    <xsl:apply-templates select="portfolio/list/item[link/@dead='true']" />
                    <div align="center" class="footer">
                        <img src="https://github.githubassets.com/favicon.ico" width="18" />
                        <xsl:text> </xsl:text>
                        <a href="https://github.com/dsmolovich/portfolio">https://github.com/dsmolovich/portfolio</a>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="item">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 left">
                    <xsl:apply-templates select="link" />
                    <div>
                        <xsl:apply-templates select="description" />
                    </div>
                </div>

                <div class="col-sm-4 right" align="right">
                    <xsl:apply-templates select ="image" />
                </div>
            </div>
        </div>
        <xsl:apply-templates select="." mode="hr" />
    </xsl:template>

    <xsl:template match="item" mode="hr">
        <hr />
    </xsl:template>

    <xsl:template match="item[last()]" mode="hr" />

    <xsl:template match="link">
       <a href="{original}">
            <b>
                <xsl:apply-templates select="../title" />
            </b>
        </a>  &#128279;
    </xsl:template>

    <xsl:template match="link[archived/text()]">
        <a href="{archived}">
            <b>
                <xsl:apply-templates select="../title" />
            </b>

        </a>
        <xsl:text> </xsl:text>
        <span class="archived">@</span>
        <xsl:text> </xsl:text>
        <img src="img/waybackmachine.jpg" height="16" />
        <br />
        <span class="archived">[ &#10014; <xsl:value-of select="original"/> ]</span>
    </xsl:template>

    <xsl:template match="link[@dead]">
        <b>
            <xsl:apply-templates select="../title" />
        </b>
        <br />
        <span class="dead">[ &#10014; <xsl:value-of select="original"/> ]</span>
    </xsl:template>

    <xsl:template match="item/image">
        <a href="{../link/original}">
            <img src="img/{.}" width="150" />
        </a>
    </xsl:template>

    <xsl:template match="item/image[../link/archived/text()]">
        <a href="{../link/archived}">
            <img src="img/{.}" width="150" />
        </a>
    </xsl:template>

    <xsl:template match="item/image[../link/@dead]">
        <img src="img/{.}" width="150" />
    </xsl:template>

</xsl:stylesheet>