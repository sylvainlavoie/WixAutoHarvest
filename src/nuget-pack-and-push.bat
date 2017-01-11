
set NUGET_SOURCE=https://api.nuget.org/v3/index.json

nuget pack WixAutoHarvest.ConsoleApp.nuspec
pause

nuget pack WixAutoHarvest.WebApp.nuspec
pause

nuget push *.nupkg -Source %NUGET_SOURCE%
pause
