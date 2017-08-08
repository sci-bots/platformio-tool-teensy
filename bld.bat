set NAME=tool-teensy
set PLATFORM=windows
set FILENAME=%NAME%-%PLATFORM%-%PKG_VERSION%.tar.gz
set PKG_URL=https://dl.bintray.com/platformio/dl-packages/%FILENAME%
REM Download Windows binary.
"%PYTHON%" -m wget "%PKG_URL%"
if errorlevel 1 exit 1
REM Extract files from from tar.gz archive.
mkdir "%NAME%"
tar xvf %FILENAME% -C "%NAME%"
if errorlevel 1 exit 1
REM Copy contents to ${PREFIX}\Library\bin
xcopy /S /Y /I /Q %NAME% "%PREFIX%"\share\platformio\packages\%NAME%
if errorlevel 1 exit 1
