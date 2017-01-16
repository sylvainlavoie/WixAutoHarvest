<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:wix="http://schemas.microsoft.com/wix/2006/wi"> 

    <!-- strip all extraneous whitespace --> 
    <xsl:strip-space  elements="*"/> 

    <!-- Copy all attributes and elements to the output. --> 
    <xsl:template match="@*|*"> 
        <xsl:copy> 
            <xsl:apply-templates select="@*" /> 
            <xsl:apply-templates select="*" /> 
        </xsl:copy> 
    </xsl:template> 

    <!-- Exclude all File elements that are .pdb files --> 
    <xsl:key name="pdb-search" match="wix:Component[contains(wix:File/@Source, '.pdb')]" use="@Id" />
    <xsl:template match="wix:Component[key('pdb-search', @Id)]" />
    <xsl:template match="wix:ComponentRef[key('pdb-search', @Id)]" />

</xsl:stylesheet>
