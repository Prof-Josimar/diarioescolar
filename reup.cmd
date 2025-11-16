@echo off
echo ============================================
echo ===  FORCAR GIT A REINDEXAR TUDO (.CMD)  ===
echo ============================================
echo.

REM ---> 1. Ajustar datas (opcional)
REM remove REM caso queira atualizar datas
REM for /r %%f in (*) do (
REM    echo tocando %%f
REM    copy /b "%%f" +,, "%%f" >nul
REM )

REM ---> 2. Remover arquivos do index (sem apagar fisicamente)
echo Limpando index do Git...
git rm -r --cached . >nul

REM ---> 3. Adiciona tudo novamente
echo Adicionando arquivos...
git add .

REM ---> 4. Commit
echo Realizando commit...
git commit -m "Reindex by CMD"

echo.
echo ==== PRONTO! Git vai tratar tudo como novo. ====
pause
