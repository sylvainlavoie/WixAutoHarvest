
set NUGET_SOURCE=https://api.nuget.org/v3/index.json

nuget pack WixAutoHarvest.ConsoleApp.nuspec
nuget pack WixAutoHarvest.WebApp.nuspec
pause

REM nuget push *.nupkg -Source %NUGET_SOURCE%
REM pause
