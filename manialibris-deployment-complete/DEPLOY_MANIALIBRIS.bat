@echo off
REM ============================================================================
REM Script de Deploiement Automatique - Mania Libris
REM Mise a jour des liens Amazon corriges - 12 fichiers HTML
REM ============================================================================

echo ======================================================================
echo DEPLOIEMENT AUTOMATIQUE - SITE MANIA LIBRIS
echo Mise a jour des liens Amazon - Version 2.0
echo ======================================================================
echo.

REM Configuration des chemins
set "DOWNLOAD_FOLDER=%~dp0"
set "REPO_FOLDER=%USERPROFILE%\Documents\manialibris-website"

echo Dossier source : %DOWNLOAD_FOLDER%
echo Dossier repository : %REPO_FOLDER%
echo.

REM Verifier que le repo existe
if not exist "%REPO_FOLDER%" (
    echo Le repository n'existe pas localement
    echo Clonage du repository GitHub...
    echo.
    
    cd "%USERPROFILE%\Documents"
    git clone https://github.com/global-opera/manialibris-website.git
    
    if not exist "%REPO_FOLDER%" (
        echo ERREUR : Le clonage a echoue
        echo Verifiez votre connexion internet et Git
        pause
        exit /b 1
    )
    
    echo Repository clone avec succes
    echo.
) else (
    echo Repository local trouve
    echo Mise a jour...
    cd "%REPO_FOLDER%"
    git pull origin main
    echo.
)

REM ============================================================================
REM ETAPE 1 : COPIE DES 12 FICHIERS HTML
REM ============================================================================

echo ======================================================================
echo ETAPE 1 : COPIE DES 12 FICHIERS HTML
echo ======================================================================
echo.

cd "%REPO_FOLDER%"

REM Pages des livres en portugais
if exist "%DOWNLOAD_FOLDER%tua-vontade.html" (
    copy /Y "%DOWNLOAD_FOLDER%tua-vontade.html" "%REPO_FOLDER%\tua-vontade.html"
    echo [OK] tua-vontade.html
) else (
    echo [SKIP] tua-vontade.html non trouve
)

if exist "%DOWNLOAD_FOLDER%o-lado-de-adao.html" (
    copy /Y "%DOWNLOAD_FOLDER%o-lado-de-adao.html" "%REPO_FOLDER%\o-lado-de-adao.html"
    echo [OK] o-lado-de-adao.html
) else (
    echo [SKIP] o-lado-de-adao.html non trouve
)

if exist "%DOWNLOAD_FOLDER%aprendi-a-estar-contente.html" (
    copy /Y "%DOWNLOAD_FOLDER%aprendi-a-estar-contente.html" "%REPO_FOLDER%\aprendi-a-estar-contente.html"
    echo [OK] aprendi-a-estar-contente.html
) else (
    echo [SKIP] aprendi-a-estar-contente.html non trouve
)

REM Pages des livres en francais
if exist "%DOWNLOAD_FOLDER%ta-volonte.html" (
    copy /Y "%DOWNLOAD_FOLDER%ta-volonte.html" "%REPO_FOLDER%\ta-volonte.html"
    echo [OK] ta-volonte.html
) else (
    echo [SKIP] ta-volonte.html non trouve
)

if exist "%DOWNLOAD_FOLDER%le-cote-d-adam.html" (
    copy /Y "%DOWNLOAD_FOLDER%le-cote-d-adam.html" "%REPO_FOLDER%\le-cote-d-adam.html"
    echo [OK] le-cote-d-adam.html
) else (
    echo [SKIP] le-cote-d-adam.html non trouve
)

if exist "%DOWNLOAD_FOLDER%jai-appris-a-etre-content.html" (
    copy /Y "%DOWNLOAD_FOLDER%jai-appris-a-etre-content.html" "%REPO_FOLDER%\jai-appris-a-etre-content.html"
    echo [OK] jai-appris-a-etre-content.html
) else (
    echo [SKIP] jai-appris-a-etre-content.html non trouve
)

REM Pages d'index
if exist "%DOWNLOAD_FOLDER%index.html" (
    copy /Y "%DOWNLOAD_FOLDER%index.html" "%REPO_FOLDER%\index.html"
    echo [OK] index.html
) else (
    echo [SKIP] index.html non trouve
)

if exist "%DOWNLOAD_FOLDER%index-fr.html" (
    copy /Y "%DOWNLOAD_FOLDER%index-fr.html" "%REPO_FOLDER%\index-fr.html"
    echo [OK] index-fr.html
) else (
    echo [SKIP] index-fr.html non trouve
)

REM Pages de catalogue
if exist "%DOWNLOAD_FOLDER%catalogo.html" (
    copy /Y "%DOWNLOAD_FOLDER%catalogo.html" "%REPO_FOLDER%\catalogo.html"
    echo [OK] catalogo.html
) else (
    echo [SKIP] catalogo.html non trouve
)

if exist "%DOWNLOAD_FOLDER%catalogue-fr.html" (
    copy /Y "%DOWNLOAD_FOLDER%catalogue-fr.html" "%REPO_FOLDER%\catalogue-fr.html"
    echo [OK] catalogue-fr.html
) else (
    echo [SKIP] catalogue-fr.html non trouve
)

REM Pages de ressources
if exist "%DOWNLOAD_FOLDER%recursos.html" (
    copy /Y "%DOWNLOAD_FOLDER%recursos.html" "%REPO_FOLDER%\recursos.html"
    echo [OK] recursos.html
) else (
    echo [SKIP] recursos.html non trouve
)

if exist "%DOWNLOAD_FOLDER%ressources.html" (
    copy /Y "%DOWNLOAD_FOLDER%ressources.html" "%REPO_FOLDER%\ressources.html"
    echo [OK] ressources.html
) else (
    echo [SKIP] ressources.html non trouve
)

echo.

REM ============================================================================
REM ETAPE 2 : BACKUP
REM ============================================================================

echo ======================================================================
echo ETAPE 2 : CREATION DU BACKUP
echo ======================================================================
echo.

set "timestamp=%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "timestamp=%timestamp: =0%"
set "BACKUP_FOLDER=%REPO_FOLDER%\backup_%timestamp%"

mkdir "%BACKUP_FOLDER%"
copy *.html "%BACKUP_FOLDER%\" >nul 2>&1
echo Backup cree : %BACKUP_FOLDER%
echo.

REM ============================================================================
REM ETAPE 3 : VERIFICATION
REM ============================================================================

echo ======================================================================
echo ETAPE 3 : VERIFICATION DES MODIFICATIONS
echo ======================================================================
echo.

git status

echo.
echo ======================================================================
echo RESUME DES MODIFICATIONS
echo ======================================================================
echo.

git diff --stat

echo.
echo Voulez-vous voir les details ? (O/N)
set /p SHOW_DIFF="> "

if /i "%SHOW_DIFF%"=="O" (
    echo.
    git diff
    echo.
)

REM ============================================================================
REM ETAPE 4 : DEPLOIEMENT
REM ============================================================================

echo ======================================================================
echo ETAPE 4 : DEPLOIEMENT SUR GITHUB
echo ======================================================================
echo.

echo ATTENTION : Vous allez deployer sur GitHub
echo.
echo CE QUI SERA MIS A JOUR :
echo   - 12 fichiers HTML avec liens Amazon corriges
echo   - Amazon BR (Portugais) : B0FY3TR5MD, B0G1HNZQKH, B0G1L1VTW5
echo   - Amazon FR (Francais)  : B0FY3ZT7P5, B0G1HP942H, B0G1L1VTW5
echo.
echo Voulez-vous continuer ? (O/N)
set /p CONFIRM="> "

if /i not "%CONFIRM%"=="O" (
    echo.
    echo Deploiement annule
    echo Les fichiers modifies sont dans : %REPO_FOLDER%
    echo Backup disponible dans : %BACKUP_FOLDER%
    pause
    exit /b 0
)

echo.
echo Deploiement en cours...
echo.

git add .

git commit -m "Correction des liens Amazon - Tous les ASIN corriges pour BR et FR"

if errorlevel 1 (
    echo.
    echo Rien a committer ou erreur
    pause
    exit /b 0
)

git push origin main

if errorlevel 1 (
    echo.
    echo ERREUR : Le push a echoue
    echo Verifiez votre authentification GitHub
    pause
    exit /b 1
)

echo.
echo ======================================================================
echo DEPLOIEMENT REUSSI !
echo ======================================================================
echo.
echo Modifications envoyees sur GitHub
echo Netlify va deployer en 1-2 minutes
echo.
echo VERIFIEZ VOS LIVRES SUR AMAZON :
echo.
echo Amazon BR (Portugais) :
echo   - Tua Vontade : https://www.amazon.com.br/dp/B0FY3TR5MD
echo   - O Lado de Adao : https://www.amazon.com.br/dp/B0G1HNZQKH
echo   - Aprendi a Estar Contente : https://www.amazon.com.br/dp/B0G1L1VTW5
echo.
echo Amazon FR (Francais) :
echo   - Ta Volonte : https://www.amazon.fr/dp/B0FY3ZT7P5
echo   - Le Cote d'Adam : https://www.amazon.fr/dp/B0G1HP942H
echo   - J'ai Appris a Etre Content : https://www.amazon.fr/dp/B0G1L1VTW5
echo.
echo Site mis a jour : https://manialibris.com/
echo.
echo Backup : %BACKUP_FOLDER%
echo.

pause
