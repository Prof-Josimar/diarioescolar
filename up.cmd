chcp 65001
@echo off
setlocal

:: ===============================
:: CONFIGURAÇÕES DO PROJETO
:: ===============================
set REPO_URL=git@github.com:Prof-Josimar/diarioescolar.git
set BRANCH=main

echo ===============================
echo  ATUALIZANDO REPOSITÓRIO GIT
echo ===============================
echo.

:: Verifica se já existe um repositório Git
if exist ".git" (
    echo Repositório Git encontrado.
) else (
    echo Inicializando novo repositório Git...
    git init
    git remote add origin %REPO_URL%
    git branch -M %BRANCH%
)

echo.
echo === Atualizando repositório remoto (%BRANCH%) ===
git pull origin %BRANCH% --rebase

echo.
echo === Gerando README.md ===
(
    echo # Projeto Java 2025
    echo.
    echo ## Informações do sistema
    echo - Nome do computador: %COMPUTERNAME%
    echo - Usuário: %USERNAME%
    echo - Diretório atual: %cd%
    echo - Data e hora: %date% %time%
    echo.
    echo ![Logo do Projeto](https://uxwing.com/wp-content/themes/uxwing/download/file-and-folder-type/java-icon.png)
    echo.
    echo ## Descrição
    echo Este projeto foi atualizado automaticamente via script CMD no Windows.
    echo.
    echo ## Autor
    echo Josimar Ribeiro
) > README.md

echo.
echo === Adicionando mudanças ===
git add .

:: Verifica se há algo para commitar
git diff --cached --quiet
if %errorlevel%==0 (
    echo Nenhuma alteração detectada.
) else (
    git commit -m "Atualização automática via script CMD"
)

echo.
echo === Enviando para o GitHub ===
git push origin %BRANCH%

echo.
echo ===============================
echo  ✅ ATUALIZAÇÃO CONCLUÍDA
echo ===============================
echo.

start https://github.com/Prof-Josimar/diarioescolar

