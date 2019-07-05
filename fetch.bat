@echo off

(
	for /d %%i in (*) do (
		cd "%%i"
		echo Initiating %%i...
		@echo on
		 start /b "+++fetch_batch+++" git fetch --all
		@echo off
		cd ..
	)
)

:loop
  timeout /t 1 >nul
  tasklist /fi "windowtitle eq fetch" |find "cmd.exe" >nul && goto :loop

echo .
echo ------------------------------------------------------------
echo     Initiated FETCH from OFFICIAL repos. Please wait...
echo ------------------------------------------------------------
echo .

cmd k