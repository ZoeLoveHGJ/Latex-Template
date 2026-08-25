@echo off
setlocal enabledelayedexpansion

echo =====================================================================
echo Academic LaTeX Template Suite - Centralized Multi-Publisher Compiler
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
echo   9. ALL                           - Build Root and All Templates
echo =====================================================================

set TARGET=%1
if "%TARGET%"=="" set /p TARGET="Please enter target number (1-9) or name [Default=1]: "
if "%TARGET%"=="" set TARGET=1

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

if "%TARGET%"=="9" goto BUILD_ALL
if /i "%TARGET%"=="ALL" goto BUILD_ALL

echo Invalid target selected.
exit /b 1

:BUILD_ROOT_MAIN
echo [Root] Compiling Main.tex (IEEE Transactions Default)...
pdflatex -interaction=nonstopmode Main.tex
bibtex Main
pdflatex -interaction=nonstopmode Main.tex
pdflatex -interaction=nonstopmode Main.tex
echo Root Main.pdf built successfully!
exit /b 0

:BUILD_ROOT_COVER
echo [Root] Compiling Cover_Letter.tex...
xelatex -interaction=nonstopmode Cover_Letter.tex
echo Root Cover_Letter.pdf built successfully!
exit /b 0

:BUILD_ROOT_RESPONSE
echo [Root] Compiling Response.tex (2 passes for TOC)...
xelatex -interaction=nonstopmode Response.tex
xelatex -interaction=nonstopmode Response.tex
echo Root Response.pdf built successfully!
exit /b 0

:BUILD_CUSTOM
echo Compiling Custom Preprint (XeLaTeX + Biber)...
pushd templates\01_Custom_Preprint
xelatex -interaction=nonstopmode Main.tex
biber Main
xelatex -interaction=nonstopmode Main.tex
xelatex -interaction=nonstopmode Main.tex
popd
echo Built: templates/01_Custom_Preprint/Main.pdf
exit /b 0

:BUILD_IEEE_TRANS
echo Compiling IEEE Transactions (pdfLaTeX + BibTeX)...
pushd templates\02_IEEE_Transactions
pdflatex -interaction=nonstopmode Main_IEEE_Trans.tex
bibtex Main_IEEE_Trans
pdflatex -interaction=nonstopmode Main_IEEE_Trans.tex
pdflatex -interaction=nonstopmode Main_IEEE_Trans.tex
popd
echo Built: templates/02_IEEE_Transactions/Main_IEEE_Trans.pdf
exit /b 0

:BUILD_IEEE_CONF
echo Compiling IEEE Conference (pdfLaTeX + BibTeX)...
pushd templates\03_IEEE_Conference
pdflatex -interaction=nonstopmode Main_IEEE_Conf.tex
bibtex Main_IEEE_Conf
pdflatex -interaction=nonstopmode Main_IEEE_Conf.tex
pdflatex -interaction=nonstopmode Main_IEEE_Conf.tex
popd
echo Built: templates/03_IEEE_Conference/Main_IEEE_Conf.pdf
exit /b 0

:BUILD_ELSEVIER
echo Compiling Elsevier ESWA CAS (pdfLaTeX + BibTeX)...
pushd templates\04_Elsevier_ESWA
pdflatex -interaction=nonstopmode Main_Elsevier.tex
bibtex Main_Elsevier
pdflatex -interaction=nonstopmode Main_Elsevier.tex
pdflatex -interaction=nonstopmode Main_Elsevier.tex
popd
echo Built: templates/04_Elsevier_ESWA/Main_Elsevier.pdf
exit /b 0

:BUILD_ACM
echo Compiling ACM Conference (pdfLaTeX + BibTeX)...
pushd templates\05_ACM_Conference
pdflatex -interaction=nonstopmode Main_ACM.tex
bibtex Main_ACM
pdflatex -interaction=nonstopmode Main_ACM.tex
pdflatex -interaction=nonstopmode Main_ACM.tex
popd
echo Built: templates/05_ACM_Conference/Main_ACM.pdf
exit /b 0

:BUILD_ALL
echo ========================================
echo Building Root and All Template Targets...
echo ========================================
call :BUILD_ROOT_MAIN
call :BUILD_ROOT_COVER
call :BUILD_ROOT_RESPONSE
call :BUILD_CUSTOM
call :BUILD_IEEE_TRANS
call :BUILD_IEEE_CONF
call :BUILD_ELSEVIER
call :BUILD_ACM
echo ========================================
echo All publication targets built successfully!
echo ========================================
exit /b 0
