@echo off
setlocal enabledelayedexpansion

echo =====================================================================
echo Academic LaTeX Template Suite - Strict Multi-Publisher Compiler
echo =====================================================================
echo Targets:
echo   1. Main (Root IEEE Trans Default) - Main.tex
echo   2. Cover_Letter (Root Default)   - Cover_Letter.tex
echo   3. Response (Root Default)       - Response.tex
echo   4. 01_Custom_Preprint            - templates/01_Custom_Preprint/Main.tex
echo   5. 02_IEEE_Transactions          - templates/02_IEEE_Transactions/Main_IEEE_Trans.tex
echo   6. 03_IEEE_Conference            - templates/03_IEEE_Conference/Main_IEEE_Conf.tex
echo   7. 04_Elsevier_ESWA              - templates/04_Elsevier_ESWA/Main_Elsevier.tex
echo   8. 05_ACM_Conference             - templates/05_ACM_Conference/Main_ACM.tex
echo   9. 06_Springer_LNCS              - templates/06_Springer_LNCS/Main_Springer.tex
echo  10. PUBLISHERS                    - Build official publisher templates only
echo  11. ALL                           - Build root, custom, and all publisher targets
echo =====================================================================

set "TARGET=%~1"
if "%TARGET%"=="" set /p TARGET="Please enter target number (1-11) or name [Default=1]: "
if "%TARGET%"=="" set "TARGET=1"

if "%TARGET%"=="1" goto BUILD_ROOT_MAIN
if /i "%TARGET%"=="Main" goto BUILD_ROOT_MAIN

if "%TARGET%"=="2" goto BUILD_ROOT_COVER
if /i "%TARGET%"=="Cover_Letter" goto BUILD_ROOT_COVER

if "%TARGET%"=="3" goto BUILD_ROOT_RESPONSE
if /i "%TARGET%"=="Response" goto BUILD_ROOT_RESPONSE

if "%TARGET%"=="4" goto BUILD_CUSTOM
if /i "%TARGET%"=="01_Custom_Preprint" goto BUILD_CUSTOM

if "%TARGET%"=="5" goto BUILD_IEEE_TRANS
if /i "%TARGET%"=="02_IEEE_Transactions" goto BUILD_IEEE_TRANS

if "%TARGET%"=="6" goto BUILD_IEEE_CONF
if /i "%TARGET%"=="03_IEEE_Conference" goto BUILD_IEEE_CONF

if "%TARGET%"=="7" goto BUILD_ELSEVIER
if /i "%TARGET%"=="04_Elsevier_ESWA" goto BUILD_ELSEVIER

if "%TARGET%"=="8" goto BUILD_ACM
if /i "%TARGET%"=="05_ACM_Conference" goto BUILD_ACM

if "%TARGET%"=="9" goto BUILD_SPRINGER
if /i "%TARGET%"=="06_Springer_LNCS" goto BUILD_SPRINGER

if "%TARGET%"=="10" goto BUILD_PUBLISHERS
if /i "%TARGET%"=="PUBLISHERS" goto BUILD_PUBLISHERS
if /i "%TARGET%"=="ALL_PUBLISHERS" goto BUILD_PUBLISHERS
if /i "%TARGET%"=="OFFICIAL" goto BUILD_PUBLISHERS

if "%TARGET%"=="11" goto BUILD_ALL
if /i "%TARGET%"=="ALL" goto BUILD_ALL

echo [ERROR] Invalid target selected: %TARGET%
exit /b 1

:BUILD_ROOT_MAIN
call :BUILD_PDFLATEX_BIBTEX "." "Main.tex" "Main" "Main.pdf" "Main.pdf" "Root Main (IEEE Transactions Default)"
exit /b %ERRORLEVEL%

:BUILD_ROOT_COVER
call :BUILD_XELATEX_ONLY "." "Cover_Letter.tex" "Cover_Letter.pdf" "Cover_Letter.pdf" "Root Cover Letter"
exit /b %ERRORLEVEL%

:BUILD_ROOT_RESPONSE
call :BUILD_XELATEX_TWOPASS "." "Response.tex" "Response.pdf" "Response.pdf" "Root Response Letter"
exit /b %ERRORLEVEL%

:BUILD_CUSTOM
call :BUILD_XELATEX_BIBER "templates\01_Custom_Preprint" "Main.tex" "Main" "Main.pdf" "templates/01_Custom_Preprint/Main.pdf" "Custom Preprint"
exit /b %ERRORLEVEL%

:BUILD_IEEE_TRANS
call :BUILD_PDFLATEX_BIBTEX "templates\02_IEEE_Transactions" "Main_IEEE_Trans.tex" "Main_IEEE_Trans" "Main_IEEE_Trans.pdf" "templates/02_IEEE_Transactions/Main_IEEE_Trans.pdf" "IEEE Transactions"
exit /b %ERRORLEVEL%

:BUILD_IEEE_CONF
call :BUILD_PDFLATEX_BIBTEX "templates\03_IEEE_Conference" "Main_IEEE_Conf.tex" "Main_IEEE_Conf" "Main_IEEE_Conf.pdf" "templates/03_IEEE_Conference/Main_IEEE_Conf.pdf" "IEEE Conference"
exit /b %ERRORLEVEL%

:BUILD_ELSEVIER
call :BUILD_PDFLATEX_BIBTEX "templates\04_Elsevier_ESWA" "Main_Elsevier.tex" "Main_Elsevier" "Main_Elsevier.pdf" "templates/04_Elsevier_ESWA/Main_Elsevier.pdf" "Elsevier ESWA CAS"
exit /b %ERRORLEVEL%

:BUILD_ACM
call :BUILD_PDFLATEX_BIBTEX "templates\05_ACM_Conference" "Main_ACM.tex" "Main_ACM" "Main_ACM.pdf" "templates/05_ACM_Conference/Main_ACM.pdf" "ACM Conference"
exit /b %ERRORLEVEL%

:BUILD_SPRINGER
call :BUILD_PDFLATEX_BIBTEX "templates\06_Springer_LNCS" "Main_Springer.tex" "Main_Springer" "Main_Springer.pdf" "templates/06_Springer_LNCS/Main_Springer.pdf" "Springer LNCS"
exit /b %ERRORLEVEL%

:BUILD_PUBLISHERS
echo ========================================
echo Building official publisher templates...
echo ========================================
call :BUILD_IEEE_TRANS
if errorlevel 1 exit /b 1
call :BUILD_IEEE_CONF
if errorlevel 1 exit /b 1
call :BUILD_ELSEVIER
if errorlevel 1 exit /b 1
call :BUILD_ACM
if errorlevel 1 exit /b 1
call :BUILD_SPRINGER
if errorlevel 1 exit /b 1
echo ========================================
echo All official publisher templates built successfully.
echo ========================================
exit /b 0

:BUILD_ALL
echo ========================================
echo Building root, custom, and publisher targets...
echo ========================================
call :BUILD_ROOT_MAIN
if errorlevel 1 exit /b 1
call :BUILD_PUBLISHERS
if errorlevel 1 exit /b 1
call :BUILD_ROOT_COVER
if errorlevel 1 exit /b 1
call :BUILD_ROOT_RESPONSE
if errorlevel 1 exit /b 1
call :BUILD_CUSTOM
if errorlevel 1 exit /b 1
echo ========================================
echo All configured targets built successfully.
echo ========================================
exit /b 0

:BUILD_PDFLATEX_BIBTEX
set "BUILD_DIR=%~1"
set "TEX_FILE=%~2"
set "JOB_NAME=%~3"
set "PDF_FILE=%~4"
set "DISPLAY_PATH=%~5"
set "DISPLAY_NAME=%~6"
call :REQUIRE_TOOL pdflatex
if errorlevel 1 exit /b 1
call :REQUIRE_TOOL bibtex
if errorlevel 1 exit /b 1
echo [%DISPLAY_NAME%] Compiling with pdfLaTeX + BibTeX...
call :ENTER_BUILD_DIR "%BUILD_DIR%"
if errorlevel 1 exit /b 1
call :RUN_CMD pdflatex -interaction=nonstopmode -halt-on-error "%TEX_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :RUN_CMD bibtex "%JOB_NAME%"
if errorlevel 1 goto BUILD_FAIL
call :RUN_CMD pdflatex -interaction=nonstopmode -halt-on-error "%TEX_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :RUN_CMD pdflatex -interaction=nonstopmode -halt-on-error "%TEX_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :CHECK_PDF "%PDF_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :LEAVE_BUILD_DIR
echo [OK] Built: %DISPLAY_PATH%
exit /b 0

:BUILD_XELATEX_ONLY
set "BUILD_DIR=%~1"
set "TEX_FILE=%~2"
set "PDF_FILE=%~3"
set "DISPLAY_PATH=%~4"
set "DISPLAY_NAME=%~5"
call :REQUIRE_TOOL xelatex
if errorlevel 1 exit /b 1
echo [%DISPLAY_NAME%] Compiling with XeLaTeX...
call :ENTER_BUILD_DIR "%BUILD_DIR%"
if errorlevel 1 exit /b 1
call :RUN_CMD xelatex -interaction=nonstopmode -halt-on-error "%TEX_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :CHECK_PDF "%PDF_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :LEAVE_BUILD_DIR
echo [OK] Built: %DISPLAY_PATH%
exit /b 0

:BUILD_XELATEX_TWOPASS
set "BUILD_DIR=%~1"
set "TEX_FILE=%~2"
set "PDF_FILE=%~3"
set "DISPLAY_PATH=%~4"
set "DISPLAY_NAME=%~5"
call :REQUIRE_TOOL xelatex
if errorlevel 1 exit /b 1
echo [%DISPLAY_NAME%] Compiling with XeLaTeX x2...
call :ENTER_BUILD_DIR "%BUILD_DIR%"
if errorlevel 1 exit /b 1
call :RUN_CMD xelatex -interaction=nonstopmode -halt-on-error "%TEX_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :RUN_CMD xelatex -interaction=nonstopmode -halt-on-error "%TEX_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :CHECK_PDF "%PDF_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :LEAVE_BUILD_DIR
echo [OK] Built: %DISPLAY_PATH%
exit /b 0

:BUILD_XELATEX_BIBER
set "BUILD_DIR=%~1"
set "TEX_FILE=%~2"
set "JOB_NAME=%~3"
set "PDF_FILE=%~4"
set "DISPLAY_PATH=%~5"
set "DISPLAY_NAME=%~6"
call :REQUIRE_TOOL xelatex
if errorlevel 1 exit /b 1
call :REQUIRE_TOOL biber
if errorlevel 1 exit /b 1
echo [%DISPLAY_NAME%] Compiling with XeLaTeX + Biber...
call :ENTER_BUILD_DIR "%BUILD_DIR%"
if errorlevel 1 exit /b 1
call :RUN_CMD xelatex -interaction=nonstopmode -halt-on-error "%TEX_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :RUN_CMD biber "%JOB_NAME%"
if errorlevel 1 goto BUILD_FAIL
call :RUN_CMD xelatex -interaction=nonstopmode -halt-on-error "%TEX_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :RUN_CMD xelatex -interaction=nonstopmode -halt-on-error "%TEX_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :CHECK_PDF "%PDF_FILE%"
if errorlevel 1 goto BUILD_FAIL
call :LEAVE_BUILD_DIR
echo [OK] Built: %DISPLAY_PATH%
exit /b 0

:BUILD_FAIL
call :LEAVE_BUILD_DIR
echo [FAILED] %DISPLAY_NAME%
exit /b 1

:ENTER_BUILD_DIR
set "PUSHED_DIR=0"
if /i "%~1"=="." exit /b 0
pushd "%~1"
if errorlevel 1 (
  echo [ERROR] Cannot enter build directory: %~1
  exit /b 1
)
set "PUSHED_DIR=1"
exit /b 0

:LEAVE_BUILD_DIR
if "%PUSHED_DIR%"=="1" popd
set "PUSHED_DIR=0"
exit /b 0

:REQUIRE_TOOL
where "%~1" >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Required tool not found in PATH: %~1
  exit /b 1
)
exit /b 0

:RUN_CMD
echo [RUN] %*
%*
if errorlevel 1 (
  echo [ERROR] Command failed with exit code %ERRORLEVEL%: %*
  exit /b %ERRORLEVEL%
)
exit /b 0

:CHECK_PDF
if not exist "%~1" (
  echo [ERROR] Expected PDF was not generated: %~1
  exit /b 1
)
exit /b 0
