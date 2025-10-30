
chcp 65001
@echo off
title Gerador de README - Projeto Java 2025
color 1F

REM === Configurações ===
set "project_name=Projeto Java 2025"
set "author=Josimar Ribeiro"
set "description=Este projeto foi iniciado automaticamente com um script em Windows CMD."
set "save_path=%CD%"
set "date_time=%DATE% %TIME%"
set "logo_url=https://uxwing.com/wp-content/themes/uxwing/download/file-and-folder-type/java-icon.png"
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
echo. >> %filename%
echo ## Descrição >> %filename%
echo %description% >> %filename%
echo. >> %filename%
echo ## Autor >> %filename%
echo %author% >> %filename%
echo. >> %filename%
echo Salvo de %save_path% em %date_time% >> %filename%

REM === Verifica e configura Git ===
if not exist ".git" (
    echo Criando repositório Git local...
    git init
)

git branch -M main
git add . -v
git commit -m "Updated at %date% %time%"
git push -u origin main

REM === Log e finalização ===
echo Script executado em %date_time% >> log_execucao.txt






goto fim 

@echo off
REM Defina as variáveis que você quer usar
set "project_name=Projeto Delphi 2025"
set "author=Josimar Ribeiro"
set "description=Este projeto foi iniciado automaticamente com um script em Windows CMD."
set "save_path=%CD%"
set "date_time=%DATE% %TIME%"

set "logo_url=https://uxwing.com/wp-content/themes/uxwing/download/file-and-folder-type/java-icon.png"

REM Nome do arquivo
set "filename=README.md"

REM Cria/reescreve o README.md

echo # %project_name%  > %filename%
echo. >> %filename%
echo ## Informações do sistema >> %filename%
echo. >> %filename%
echo - Data e hora: %date_time% >> %filename%
echo. >> %filename%
echo ![Logo do Projeto](%logo_url%) >> %filename%
echo. >> %filename%

echo ## Descrição >> %filename%
echo %description% >> %filename%
echo. >> %filename%
echo ## Autor >> %filename%
echo %author% >> %filename%
echo. >> %filename%
echo Salvo de %save_path% em %date_time% >> %filename%
git branch -M main
git add . -v
git commit -m "Updated at %date% %time%"
git push -u origin main








:fim



echo.
echo ===============================
echo  ✅ ATUALIZAÇÃO CONCLUÍDA
echo ===============================
echo.

start https://github.com/Prof-Josimar/diarioescolar

