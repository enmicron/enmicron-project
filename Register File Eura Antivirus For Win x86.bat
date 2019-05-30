@echo off

if exist "%windir%\system32\MSCOMCTL.OCX" del "%windir%\system32\MSCOMCTL.OCX"
if exist "%windir%\system32\EuraScnEngine.dll" del "%windir%\system32\EuraScnEngine.dll"
if exist "%windir%\system32\EuRT.dll" del "%windir%\system32\EuRT.dll"
if exist "%windir%\system32\eCleanLib.dll" del "%windir%\system32\eCleanLib.dll"


:copy
echo.
echo Sedang Mengcopy file pendukung Eura Antivirus...
echo Mengcopy file EuraScnEngine.dll...
copy "EuraScnEngine.dll", "%windir%\system32\EuraScnEngine.dll"
echo Mengcopy file eSrvcLib.dll...
copy "eSrvcLib.dll", "%windir%\system32\eSrvcLib.dll"
echo Mengcopy file eCleanLib.dll...
copy "eCleanLib.dll", "%windir%\system32\eCleanLib.dll"
echo Mengcopy file EuRT.dll...
copy "EuRT.dll", "%windir%\system32\EuRT.dll"
echo Mengcopy file gmod.gml...
copy "gmod.gml", "%windir%\system32\Gif89.dll"
echo Mengcopy file eSem.dll...
copy "eSem.dll", "%windir%\system32\eSem.dll"
if errorlevel 1 goto ErrorHandlerCopyEura
echo File pendukung berhasil di copy...

:copy
echo.
echo Sedang Mengcopy file pendukung Windows...
echo Mengcopy file COMDLG32.OCX...
copy "COMDLG32.OCX", "%windir%\system32\COMDLG32.OCX"
echo Mengcopy file COMCTL32.OCX...
copy "COMCTL32.OCX", "%windir%\system32\COMCTL32.OCX"
echo Mengcopy file MSCOMCTL.OCX...
copy "MSCOMCTL.OCX", "%windir%\system32\MSCOMCTL.OCX"
echo Mengcopy file msinet.ocx...
copy "msinet.ocx", "%windir%\system32\msinet.ocx"
echo Mengcopy file MSWINSCK.OCX...
copy "MSWINSCK.OCX", "%windir%\MSWINSCK.OCX"
if errorlevel 1 goto ErrorHandlerCopy
echo File pendukung Windows berhasil di copy...
echo .
echo .


:registerEura
echo.
echo Sedang Meregister file pendukung Eura Antivirus...
Regsvr32 /s "%windir%\system32\EuraScnEngine.dll"
Regsvr32 /s "%windir%\system32\eSrvcLib.dll"
Regsvr32 /s "%windir%\system32\eCleanLib.dll"
Regsvr32 /s "%windir%\system32\Gif89.dll"
Regsvr32 /s "%windir%\system32\EuRT.dll"
Regsvr32 /s "%windir%\system32\eSem.dll"
if errorlevel 1 goto ErrorHandlerRegisterEura
echo File Berhasil Di Register...
echo.

:register
echo.
echo Sedang Meregister file pendukung Windows...
Regsvr32 /s "%windir%\system32\COMDLG32.OCX"
Regsvr32 /s "%windir%\system32\MSCOMCTL.OCX"
Regsvr32 /s "%windir%\system32\COMCTL32.OCX"
Regsvr32 /s "%windir%\system32\MSCOMCTL.OCX"
Regsvr32 /s "%windir%\system32\msinet.ocx"
Regsvr32 /s "%windir%\MSWINSCK.OCX"
if errorlevel 1 goto ErrorHandlerRegister
echo File Berhasil Di Register...
echo.


pause.
exit


:ErrorHandlerCopyEura
echo.
echo File pendukung Eura Antivirus tidak dapat di copy.
echo Kemungkinan DRIVE %windir% Anda di write protected.
pause
goto registerEura

:ErrorHandlerCopy
echo.
echo File pendukung Windows tidak dapat di copy.
echo Kemungkinan DRIVE %windir% Anda di write protected.
pause
goto register

:ErrorHandlerRegisterEura
echo.
echo File pendukung Eura Antivirus tidak dapat di register.
echo Mungkin DRIVE %windir% Anda di proteksi.
pause

:ErrorHandlerRegister
echo.
echo File pendukung Windows tidak dapat di register.
echo Mungkin DRIVE %windir% Anda di proteksi.
pause

pause