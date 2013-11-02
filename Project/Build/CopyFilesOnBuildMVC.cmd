@setlocal enableextensions
@cd /d "%~dp0"
call "%VS100COMNTOOLS%..\..\VC\vcvarsall.bat"

robocopy "%CD%\..\Platform\EM.Platform.MVC" "%CD%\..\..\..\FrontendWebSite" /XD "obj" "Properties" "Installers" /XF "*.example" "*.cs" "*.csproj.user" "packages.config" /S
del "%CD%\..\..\..\FrontendWebSite\App_Config\Include\Euromoney.Sites.*.config"
del "%CD%\..\..\..\FrontendWebSite\App_Config\Include\PlatformSettings.*.config"
del "%CD%\..\..\..\FrontendWebSite\App_Config\Include\EM.Platform.*.config"

IF ERRORLEVEL=1 GOTO END

:END
SET ERRORLEVEL=0
