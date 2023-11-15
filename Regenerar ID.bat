@echo off
chcp 65001
cls
echo Gerando Novos Parâmetros...
net stop RustDesk
timeout /t 3 /nobreak
echo.
del "C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\RustDesk\config\RustDesk.toml"
del "%ProgramFiles%\RustDesk\data\conect_param.dat"
net start RustDesk