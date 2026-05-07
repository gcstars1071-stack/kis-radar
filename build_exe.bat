@echo off
chcp 65001 >nul
echo.
echo ============================================
echo   KIS 스마트머니 레이더 — Windows EXE 빌드
echo ============================================
echo.

echo [1/3] 패키지 설치 중...
pip install flask flask-cors requests pyinstaller --quiet
if errorlevel 1 (
    echo 패키지 설치 실패. Python이 설치되어 있는지 확인하세요.
    pause & exit /b 1
)

echo [2/3] EXE 빌드 중 (1-2분 소요)...
pyinstaller --onefile --name "KIS_SmartMoney_Radar" --hidden-import flask --hidden-import flask_cors --hidden-import requests --hidden-import werkzeug --hidden-import jinja2 --hidden-import itsdangerous --hidden-import click --noconsole KIS_SmartMoney_Radar.py

if errorlevel 1 (
    echo 빌드 실패.
    pause & exit /b 1
)

echo.
echo [3/3] 완료!
echo.
echo ============================================
echo   dist\KIS_SmartMoney_Radar.exe 생성됨
echo   이 파일만 USB에 넣어서 사용하세요
echo ============================================
echo.
pause
