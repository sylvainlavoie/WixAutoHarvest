<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:wix="http://schemas.microsoft.com/wix/2006/wi"
xmlns:ms="urn:schemas-microsoft-com:xslt" xmlns:ff="urn:WixAutoHarvest:setup">

  <ms:script implements-prefix="ff" language="C#">
    <![CDATA[
public bool endsWith(string str, string end)
{
  if (string.IsNullOrEmpty(str))
    return false;

  if (string.IsNullOrEmpty(end))
    return false;

  return str.EndsWith(end, StringComparison.InvariantCultureIgnoreCase);
}
]]>
  </ms:script>
  
  
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>


  <!-- Identity transform. -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <!-- Search for component to remove -->
  <!-- In case Web.Config need to be updated it need to be in its own component -->
  <!--<xsl:key name="service-search" match="wix:Component[ff:endsWith(wix:File/@Source, 'web.config')]" use="@Id" />-->
  
  <!-- exclude all auxiliary files that aren't part of the product but located in harvesting folders -->
  <xsl:key name="service-search" match="wix:Component[ff:endsWith(wix:File/@Source, '.pdb')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[ff:endsWith(wix:File/@Source, '.wixpdb')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[ff:endsWith(wix:File/@Source, '.map')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[ff:endsWith(wix:File/@Source, '.scss')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[ff:endsWith(wix:File/@Source, 'BuildInfo.config')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[ff:endsWith(wix:File/@Source, 'packages.config')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[ff:endsWith(wix:File/@Source, 'gulpfile.js')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[ff:endsWith(wix:File/@Source, 'JSLintNet.json')]" use="@Id" />

  <xsl:key name="service-search" match="wix:Component[ff:endsWith(wix:File/@Source, '.CodeAnalysisLog.xml')]" use="@Id" />
 
  <xsl:key name="service-search" match="wix:Component[ff:endsWith(wix:File/@Source, '.metagen')]" use="@Id" />

  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.lastcodeanalysis')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, 'packages.config')]" use="@Id" />
  
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.vshost.exe')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '\Content\kendo\')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '\Content\site-scss\')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '\Content\libs\')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '\obj\')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '\Tests\')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '\Scripts\angular-ui\')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '\Scripts\i18n\')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '\Scripts\ie-support\')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '\Scripts\libs\')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '\Scripts\site-js\')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '\Scripts\sources\')]" use="@Id" />

 

  <!-- the .XmlSerializers.dll are created temporarilly by VS at compile and deleted after the harvesting -->
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.XmlSerializers.dll')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.nupkg')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.nuspec')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.targets')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.UnitTestFramework.dll')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.readme.txt')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.Readme.txt')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.readme.html')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.license.txt')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.info.txt')]" use="@Id" />
  <xsl:key name="service-search" match="wix:Component[contains(wix:File/@Source, '.App.config')]" use="@Id" />

  
 



  <xsl:template match="wix:Component[key('service-search', @Id)]" />
  <xsl:template match="wix:ComponentRef[key('service-search', @Id)]" />

</xsl:stylesheet>
