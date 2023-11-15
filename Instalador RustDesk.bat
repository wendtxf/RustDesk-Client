@echo off
color a
chcp 65001
cls

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
set alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789

set rustdesk_pw=
FOR /L %%b IN (1, 1, 12) DO (
    SET /A rnd_num=!RANDOM! %% 62
    for %%c in (!rnd_num!) do set rustdesk_pw=!rustdesk_pw!!alfanum:~%%c,1!
)

rem Informe abaixo a string de configuração.
set rustdesk_cfg=""

if not exist C:\Temp\ md C:\Temp\
cd C:\Temp\

curl -L "https://github.com/rustdesk/rustdesk/releases/download/1.2.2/rustdesk-1.2.2-x86_64.exe" -o rustdesk.exe

cls
echo Instalando RustDesk. Aguarde...
echo.
echo Versão: 1.2.2 
rustdesk.exe --silent-install
timeout /t 15 /nobreak

cls
echo Iniciando Serviços. Aguarde...
cd "C:\Program Files\RustDesk\"
rustdesk.exe --install-service
net stop RustDesk
del "C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\RustDesk\config\RustDesk.toml"
net start RustDesk
timeout /t 5 /nobreak

for /f "delims=" %%i IN ('rustdesk.exe --get-id ^| more') DO set rustdesk_id=%%i
RustDesk.exe --config %rustdesk_cfg%
RustDesk.exe --password %rustdesk_pw%

cls
echo Instalação Concluída...
echo.
echo #######################################################
echo.
echo                 PARÂMETROS DE CONEXÃO                            
echo.
hostname                                                 
echo RustDesk ID:    %rustdesk_id%
echo RustDesk Senha: %rustdesk_pw%                                              
echo.
echo #######################################################
echo ID: %rustdesk_id% - Password: %rustdesk_pw% > "C:\Program Files\RustDesk\data\conect_param.dat