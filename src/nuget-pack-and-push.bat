
set NUGET_SOURCE=https://api.nuget.org/v3/index.json

nuget pack WixAutoHarvest.ClickOnce.nuspec
nuget pack WixAutoHarvest.WebDeploy.nuspec
nuget pack WixAutoHarvest.ResolveReferences.nuspec
pause

REM nuget push *.nupkg -Source %NUGET_SOURCE%
REM pause
