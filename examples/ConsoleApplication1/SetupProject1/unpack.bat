
set MSIFILE=bin\Debug\SetupProject1.msi

msiexec /a %MSIFILE% /q TARGETDIR=%CD%\MSI_unpacked

pause
