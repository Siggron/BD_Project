@echo off
setlocal

REM Definição das informações de acesso à base de dados MySQL
set MYSQL_HOST=localhost
set MYSQL_USER=clamideo
set MYSQL_PASSWORD=clamideo
set DATABASE=loja

REM Definição do caminho para a diretoria onde o backup será guardado
set BACKUP_DIR=C:\Users\simao\OneDrive\BDBackup

REM Definição do nome do ficheiro de backup
set BACKUP_FILENAME=%BACKUP_DIR%\backup_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~-11,2%%time:~-8,2%%time:~-5,2%.sql

REM Comando para executar o backup
mysqldump --host=%MYSQL_HOST% --user=%MYSQL_USER% --password=%MYSQL_PASSWORD% --databases=%DATABASE% --skip-triggers > %BACKUP_FILENAME%

REM Verificação do sucesso na execução do comando
if %errorlevel% neq 0 (
    echo Erro ao fazer o backup da base de dados.
    exit /b
)

echo Backup da base de dados realizado com sucesso.
exit /b