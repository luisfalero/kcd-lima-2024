@echo off

if "%~4"=="" (
    echo Cantidad de parametros incorrecta
    echo Ejecutar de la siguiente forma:
    echo %~0 ^<Namespace^> ^<User Git^> ^<Password Git^> ^<Email Git^>
    exit /b 1
)

set NAMESPACE=%1
set USER_GIT=%2
set PASSWORD_GIT=%3
set EMAIL_GIT=%4

powershell -Command "(Get-Content ./04-task-build-image.yaml) -replace '<namespace>', '%NAMESPACE%' | Set-Content ./04-task-build-image.yaml"

powershell -Command "(Get-Content ./05-secret-github.yaml) -replace '<username>', '%USER_GIT%' | Set-Content ./05-secret-github.yaml"

powershell -Command "(Get-Content ./05-secret-github.yaml) -replace '<password>', '%PASSWORD_GIT%' | Set-Content ./05-secret-github.yaml"

powershell -Command "(Get-Content ./05-secret-github.yaml) -replace '<email>', '%EMAIL_GIT%' | Set-Content ./05-secret-github.yaml"

powershell -Command "(Get-Content ./09-pipeline-quarkus-native.yaml) -replace '<username>', '%USER_GIT%' | Set-Content ./09-pipeline-quarkus-native.yaml"

oc.exe -n %NAMESPACE% apply -f .

REM tekton.bat "kcd40" "luisfalero" "ghp_VMDv8GdDP...." "lufao1427@gmail.com"


