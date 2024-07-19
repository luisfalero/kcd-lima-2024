@echo off

if "%~2"=="" (
    echo Cantidad de parametros incorrecta
    echo Ejecutar de la siguiente forma:
    echo %~0 ^<Namespace^> ^<User Git^>
    exit /b 1
)

set NAMESPACE=%1
set USER_GIT=%2

powershell -Command "(Get-Content ./03-route-github-event-listener.yaml) -replace '<namespace>', '%NAMESPACE%' | Set-Content ./03-route-github-event-listener.yaml"

powershell -Command "(Get-Content ./06-trigger-template.yaml) -replace '<username>', '%USER_GIT%' | Set-Content ./06-trigger-template.yaml"

oc.exe -n %NAMESPACE% apply -f .

REM trigger.bat "kcd40" "luisfalero"