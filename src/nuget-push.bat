
set NUGET_SOURCE=https://api.nuget.org/v3/index.json

nuget push *.nupkg -Source %NUGET_SOURCE%
pause
