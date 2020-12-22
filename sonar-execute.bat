@echo off
setlocal enabledelayedexpansion

echo ^@echo off > result.bat
echo ^rem %cd% >> result.bat
for /r %cd% /d %%i in (.) do (
    dir %%i 2>nul | find /i "sonarscanner.bat" | find /v "目录"
    if !errorlevel! equ 0 (
        echo  上述文件位置 %%i
        echo -------------------------------------------
        echo ^cd %%i >> result.bat
		echo ^start /b sonarscanner.bat >> result.bat
    )
)

echo ^cd %cd% >> result.bat

start /b result.bat

echo.
echo 处理完成！回车可退出。
