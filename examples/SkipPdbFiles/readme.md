
This is a simple XSLT to filter out .pdb files from the result of heat.exe harvesting, so that they are excluded from MSI package.

Usage:

1. Copy **skip_pdb.xslt** file to your Wix project.
2. Define property in your **.wixproj** file: ```<TransformFile>skip_pdb.xslt</TransformFile>```
