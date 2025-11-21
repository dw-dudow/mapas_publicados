@echo off
echo Iniciando processo de commit e push dos mapas...
echo.

REM Vai para a pasta correta onde está o repositório publico
cd /d K:\OneDrive\analise_dados\mapas-estudos\mapas_publicados

REM Confirma que esta pasta é um repositório Git
IF NOT EXIST ".git" (
    echo ❌ ERRO: Esta pasta nao é um repositório Git.
    pause
    exit /b
)

REM Adiciona todos os arquivos modificados
git add .

REM Solicita mensagem de commit
set /p msg="Digite a mensagem do commit (pressione ENTER para usar padrão): "

REM Mensagem padrão caso vazia
if "%msg%"=="" set msg=Atualizacao dos mapas

REM Verifica se há mudanças a serem commitadas
git diff --cached --quiet
if %errorlevel%==0 (
    echo Nenhuma alteracao encontrada. Nada para commit.
    echo Processo concluido!
    pause
    exit /b
)

REM Realiza commit
git commit -m "%msg%"

REM Faz push para a branch atual automaticamente
git push -u origin HEAD

echo.
echo Push realizado com sucesso!
echo Processo concluido!
pause
