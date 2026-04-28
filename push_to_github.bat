@echo off
REM Audit Intelligence - GitHub Push Script
REM Run this script to push the project to GitHub

setlocal enabledelayedexpansion

echo.
echo ========================================
echo  Audit Intelligence - GitHub Push
echo ========================================
echo.

REM Step 1: Configure Git
echo [1/6] Configuring Git...
git config --global user.name "Jay Solanki"
git config --global user.email "your.email@gmail.com"
echo ✓ Git configured

REM Step 2: Initialize Repository
echo.
echo [2/6] Initializing Git repository...
git init
echo ✓ Repository initialized

REM Step 3: Add all files
echo.
echo [3/6] Adding all files to staging area...
git add .
echo ✓ All files added

REM Step 4: Create initial commit
echo.
echo [4/6] Creating initial commit...
git commit -m "Initial commit: Audit Intelligence v3.0.0 - AI-powered financial audit platform with GSTIN validation, anomaly detection, and comprehensive reporting"
echo ✓ Commit created

REM Step 5: Set main branch
echo.
echo [5/6] Setting main branch...
git branch -M main
echo ✓ Branch renamed to main

REM Step 6: Add remote and push
echo.
echo [6/6] Adding remote and pushing to GitHub...
git remote add origin https://github.com/12solankijay-dot/Audit-Intelligence.git
git push -u origin main

echo.
echo ========================================
echo  ✓ SUCCESS! Project pushed to GitHub
echo ========================================
echo.
echo Repository: https://github.com/12solankijay-dot/Audit-Intelligence
echo.
pause
