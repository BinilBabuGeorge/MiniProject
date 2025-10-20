@echo off
echo CLEANING UP ALL REGISTRY ENTRIES...
echo.

:: Remove all existing converter entries
reg delete "HKCR\.pdf\shell\ConvertPDFtoText" /f 2>nul
reg delete "HKCR\.pdf\shell\ConvertPDFtoDOCX" /f 2>nul
reg delete "HKCR\.txt\shell\ConvertTexttoPDF" /f 2>nul
reg delete "HKCR\.txt\shell\ConvertTexttoDOCX" /f 2>nul
reg delete "HKCR\.txt\shell\ConvertTexttoPPTX" /f 2>nul
reg delete "HKCR\.jpg\shell\ConvertImagetoPDF" /f 2>nul
reg delete "HKCR\.png\shell\ConvertImagetoPDF" /f 2>nul
reg delete "HKCR\.jpeg\shell\ConvertImagetoPDF" /f 2>nul
reg delete "HKCR\.docx\shell\ConvertDOCXtoPDF" /f 2>nul
reg delete "HKCR\.docx\shell\ConvertDOCXtoText" /f 2>nul
reg delete "HKCR\.pptx\shell\ConvertPPTXtoText" /f 2>nul

:: Remove SystemFileAssociations entries
reg delete "HKCR\SystemFileAssociations\.pdf\shell\ConvertPDFtoText" /f 2>nul
reg delete "HKCR\SystemFileAssociations\.pdf\shell\ConvertPDFtoDOCX" /f 2>nul
reg delete "HKCR\SystemFileAssociations\.txt\shell\ConvertTexttoPDF" /f 2>nul
reg delete "HKCR\SystemFileAssociations\.txt\shell\ConvertTexttoDOCX" /f 2>nul
reg delete "HKCR\SystemFileAssociations\.txt\shell\ConvertTexttoPPTX" /f 2>nul
reg delete "HKCR\SystemFileAssociations\.jpg\shell\ConvertImagetoPDF" /f 2>nul
reg delete "HKCR\SystemFileAssociations\.png\shell\ConvertImagetoPDF" /f 2>nul
reg delete "HKCR\SystemFileAssociations\.jpeg\shell\ConvertImagetoPDF" /f 2>nul
reg delete "HKCR\SystemFileAssociations\.docx\shell\ConvertDOCXtoPDF" /f 2>nul
reg delete "HKCR\SystemFileAssociations\.docx\shell\ConvertDOCXtoText" /f 2>nul
reg delete "HKCR\SystemFileAssociations\.pptx\shell\ConvertPPTXtoText" /f 2>nul

echo Restarting Explorer...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 3 >nul
start explorer.exe

echo ✅ All registry entries cleaned up!
echo You can now remove the .bat file and use the installer.
pause