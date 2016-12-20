<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns="http://www.tei-c.org/ns/1.0" version="1.0"
    exclude-result-prefixes="ns">
    <xsl:output indent="no" method="html"/>
    
    <xsl:template match="ns:TEI">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <link rel="stylesheet" type="text/css" href="../includes/kae.css" media="all"/>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <title>
                    <xsl:value-of select="ns:teiHeader/ns:fileDesc/ns:titleStmt/ns:title"/>
                </title>
            </head>
            <body>
                <div id="header">
                    <div id="home">
                        <a href="../index.html"><img id="logo" src="../scans/KAE_A_HB_6-0350.jpg" alt="HOME" title="HOME"/></a>
                    </div>
                    <div id="title">
                        <h1>
                            Einsiedler Klostertagebuch
                        </h1>
                    </div>
                </div>
                <div class="clear"></div>
                <div>
                    <div id="transcription">
                        <xsl:apply-templates select="ns:text/ns:body"/>
                    </div>
                    <div id="facsimile">
                        <div>
                            <img id="scan">
                                <xsl:attribute name="src">
                                     ../scans/<xsl:value-of select="ns:text/ns:body/ns:div/ns:div/ns:pb/@facs"/>
                                </xsl:attribute>
                            </img>
                        </div>
                        <div>
                            <a href="http://creativecommons.org/licenses/by-nc-sa/2.5/ch/">
                                <img src="http://i.creativecommons.org/l/by-nc-sa/2.5/ch/80x15.png"></img>
                            </a> 
                            Einsiedler Klostertagebuch von Pater Joseph Dietrich: <a href="http://www.klosterarchiv.ch/e-archiv_archivalien_detail.php?signatur=KAE,%20A.HB.6&amp;start=350">KAE, A.HB.6,  S. 339</a>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="ns:div/ns:head">
        <!-- fuer das Jahr -->
    </xsl:template>
    
    <xsl:template match="ns:div/ns:div/ns:head">
        <!-- fuer den Monat -->
    </xsl:template>
    
    <xsl:template match="ns:div/ns:div/ns:div/ns:head">
        <span style="font-weight:bold">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="ns:body">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="ns:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- line and page breaks -->
    <xsl:template match="ns:lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="ns:div/ns:lb[1]|ns:label/ns:lb[1]|ns:item/ns:lb[1]|ns:head/ns:lb[1]|ns:p/ns:lb[1]|ns:fw/ns:lb[1]">
        <!-- now new line immediately in a new div|label|item|head|p|fw|cell -->
    </xsl:template>
    
    <xsl:template match="ns:table/ns:lb">
        <!-- now new line in a table -->
    </xsl:template>
    
    <xsl:template match="ns:pb">
        <br/>
    </xsl:template>
    
    <!-- highlighting -->
    <xsl:template match="ns:hi[@rend='italic']">
        <span style="font-style: italic">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="ns:hi[@rend='underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    
    <xsl:template match="ns:hi[@rend='superscript']">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    
    <xsl:template match="ns:del">
        <span style="text-decoration: line-through;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="ns:add">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ns:foreign">
        <span style="font-style:italic">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="ns:term">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ns:gloss"/>

<!--
        This is a try to add titles to foreign words, without luck.
        
    <xsl:template match="ns:gloss[preceding::ns:term]">
        <span style="text-decoration-line: underline; text-decoration-style: dotted;">
            <xsl:apply-templates select="preceding-sibling::ns:term[1]"/>
            
            <xsl:attribute name="title">
                <xsl:apply-templates/>
            </xsl:attribute>
        </span> 
    </xsl:template>
    
    <xsl:template match="ns:gloss[preceding::ns:foreign]">
        <span style="text-decoration-line: underline; text-decoration-style: dotted;">
            <xsl:apply-templates select="preceding-sibling::ns:foreign[1]"/>
            
            <xsl:attribute name="title">
                <xsl:apply-templates/>
            </xsl:attribute>
        </span> 
    </xsl:template>
-->
    
    <xsl:template match="ns:choice">
        <span style="text-decoration-line: underline; text-decoration-style: dotted;">
            <xsl:attribute name="title">
                <xsl:apply-templates select="ns:expan"/>
            </xsl:attribute>
            
            <xsl:apply-templates select="ns:abbr"/>
        </span> 
    </xsl:template>
    
    <!-- rand und titel -->
    <xsl:template match="ns:label[@type='margin']">
        <div style="float:right; width: 12.5em;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ns:label[@type='head']">
        <div style="width: 100%; font-weight: bold; text-align: center;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ns:fw[@type='catch']">
        <div style="width: 100%; text-align: right;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ns:fw[@type='pageNum']">
        <div style="width: 100%; text-align: right;">
            <span style="color:gray">
                <xsl:apply-templates/>
            </span>
        </div>
    </xsl:template>
    
    <xsl:template match="ns:fw[@type='header']">
        <div style="width: 100%; text-align: right;">
            <span style="font-weight: bold">
                <xsl:apply-templates/>
            </span>
        </div>
    </xsl:template>
    
    <!-- tabellen -->
    <xsl:template match="ns:table">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="ns:row">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="ns:cell">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="ns:cell[@rows]">
        <td>
            <xsl:attribute name="rowspan">
                <xsl:value-of select="@rows"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="ns:cell[@cols]">
        <td>
            <xsl:attribute name="colspan">
                <xsl:value-of select="@cols"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <!-- listen -->
    <xsl:template match="ns:list[@rend='braced']">
        <div>
            <div style="display: inline-block; vertical-align:middle;">
                <table>
                    <xsl:apply-templates select="ns:item"/>
                </table>
            </div>
            <div style="display: inline-block; padding: 5px; vertical-align:middle;">
                }
            </div>
            <div style="display: inline-block;">
                <xsl:apply-templates select="ns:head"/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="ns:list">
        <div>
            <div style="display: inline-block;">
                <table>
                    <xsl:apply-templates select="ns:item"/>
                </table>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="ns:list/ns:label[following::item]">
        <!-- to be done at ns:list/ns:item -->
    </xsl:template>
    
    <xsl:template match="ns:list/ns:item">
        <tr>
            <td>
                <xsl:apply-templates select="preceding-sibling::ns:label[1]"/>
            </td>
            <td>
                <xsl:apply-templates/>
            </td> 
        </tr> 
    </xsl:template>
    
</xsl:stylesheet>