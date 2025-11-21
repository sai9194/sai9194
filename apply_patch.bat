@echo off
REM Git repo 기준 경로 (너 프로젝트 최상위 폴더)
cd /d "C:\Users\CODERUN\Documents\GitHub\sai9194\DongHwa_Server"

REM 패치 적용
git apply --3way "C:\Users\CODERUN\Documents\GitHub\sai9194\server_patch.diff"

REM 결과 보여주기
if %errorlevel% neq 0 (
    echo.
    echo *** 패치 적용 실패 ***
    pause
    exit /b 1
)

echo.
echo *** 패치 적용 완료 ***
pause
