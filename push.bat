@echo off

(
	for /d %%i in (*) do (
		cd "%%i"
		echo Pushing %%i...
		@echo on
		 start /b "+++push_batch+++" git push origin
		@echo off
		cd ..
	)
)

:loop
  timeout /t 1 >nul
  tasklist /fi "windowtitle eq git*" |find "cmd.exe" >nul && goto :loop

echo .
echo -------------------------------------------------------------
echo       Initiated PUSH TO remote/origin. Please wait...
echo -------------------------------------------------------------
echo .

cmd k