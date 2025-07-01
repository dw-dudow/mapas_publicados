@echo off
echo Iniciando processo de commit e push dos mapas...

REM Adiciona todos os arquivos modificados e novos
git add .

REM Pede mensagem de commit via input
set /p msg="Digite a mensagem do commit: "

REM Se mensagem vazia, define padrão
if "%msg%"=="" set msg=Atualizacao dos mapas

REM Commit com a mensagem
git commit -m "%msg%"

REM Push para a branch master
git push -u origin master

echo Processo concluido!
pause
