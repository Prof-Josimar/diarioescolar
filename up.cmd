
chcp 65001
@echo off
title Gerador de README - Projeto Java 2025
::color 1F

REM === Configurações ===
set "project_name=Projeto Java 2025"
set "author=Josimar Ribeiro"
set "save_path=%CD%"
set "date_time=%DATE% %TIME%"
set "logo_url=https://github.com/Prof-Josimar/diarioescolar/blob/main/web/images/logo.png"
set "logo_url2=https://qnax.sh/blog/wp-content/uploads/2024/04/d7b04738-bc60-48a8-bc99-d73a71ba998e-1024x640.webp"

set "filename=README.md"

REM === Cria o README.md ===
echo # %project_name% > %filename%
echo. >> %filename%
echo ## Informações do sistema >> %filename%
echo - Data e hora: %date_time% >> %filename%
echo - Usuário: %USERNAME% >> %filename%
echo - Computador: %COMPUTERNAME% >> %filename%
echo - Diretório atual: %CD% >> %filename%
for /f "tokens=* delims=" %%g in ('git --version') do echo - %%g >> %filename%
echo. >> %filename%
echo ![Logo do Projeto](%logo_url%) >> %filename%

echo ^<img src="%logo_url2%" width="300"^> >> %filename%

echo. >> %filename%
echo. >> %filename%
echo ## Autor >> %filename%
echo %author% >> %filename%
echo. >> %filename%
echo. >> %filename%
echo. OBS : oupl atalho para out.println(""); >> %filename%
echo. >> %filename%

REM === Verifica e configura Git ===
if not exist ".git" (
    echo Criando repositório Git local...
    git init
)

git branch -M main
git add . -v
git commit -m "Updated at %date% %time%"
git push -u origin main



:fim


start https://github.com/Prof-Josimar/diarioescolar

