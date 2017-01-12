
# Description
This is a simple example of console application packaged to MSI by Wix with auto-harvesting done by **WixAutoHarvest.ConsoleApp** NuGet package.

This example has been:
- created in VS 2015 Enterprise Update 3 with Wix Toolset 3.10
- tested in VSTS build

See the history of this folder to understand more.

# Steps to reproduce

## Prepare solution with vanilla Wix project

Steps:

1. In VS do File > New > Project....
2. Choose type: Templates > Visual C# > Windows > Console Application
3. Right-click on the solution in Solution Explorer and do Add > New Project...
4. Choose type: Windows Installer XML > Setup Project
5. Right-click on the solution in Solution Explorer and choose Configuration Manager...
6. Enable Wix project build for both Debug and Release configurations.
7. Right-click on the Wix (Setup) project and choose Properties. On the Tool Settings tab enable "Suppress ICE validation" for Release configuration - otherwise VSTS build fails
8. Make sure build produces MSI with no files inside (e.g. use SuperOrca)

## Implement auto-harvesting

Steps:

1. Right-click on the Wix project and choose Manage NuGet Packages...
2. Browse nuget.org and find **WixAutoHarvest.ConsoleApp**
3. Install it
4. Right-click on the References node under Wix project and choose Add Reference...
5. On Projects tab select ConsoleApplication1 and click Add
6. In **Product.wxs** add ComponentGroup **include_cg** to a Feature
7. Make sure that build now produces MSI with auto-harvested files inside
