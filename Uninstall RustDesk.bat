@echo off
color a
chcp 65001
cls
"C:\Program Files\RustDesk\Uninstall RustDesk.lnk"
cd C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\RustDesk\config\
del *.* /s/q
cd %APPDATA%\RustDesk\config\
del *.* /s/q
cd %LOCALAPPDATA%\rustdesk\
del *.* /s/q
cd \
echo.
echo Desinstalação Concluída!