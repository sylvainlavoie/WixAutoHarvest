
set NUGET_SOURCE=https://api.nuget.org/v3/index.json

nuget pack

nuget push *.nupkg -Source %NUGET_SOURCE%
rem Push will require API key to be stored once by: nuget setApiKey %API_KEY% -Source https://www.nuget.org/api/v2/package

pause
