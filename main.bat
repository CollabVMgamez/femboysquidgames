@echo off
setlocal EnableDelayedExpansion

:: ============================================
:: 🌈 FEMBOY SQUID GAMES 3 — Windows Batch Edition
:: ============================================

:: -- CONFIG ------------------------------------------------
set /a START_POS=5
set /a GOAL_POS=30
set /a POS=%START_POS%
set /a TARGET1=%GOAL_POS%

set /a TARGET2=25
set /a TARGET3=30

:: -- UTILITIES ------------------------------------------------
:timeout_loop
rem %1 = seconds, %2 = key allowed (e.g. A), %3 = violation_allowed (0/1)
set "end=%time%"
for /L %%i in (1,1,%1) do (
  choice /n /c %2 /t 1 /d N >nul
  if errorlevel 2 (
    if "%3%"=="0" (
      echo(
      echo 💀 You moved on RED LIGHT. Eliminated.
      timeout /t 2 >nul
      goto :cleanup
    )
  ) else (
    exit /b 1
  )
)
exit /b 0

:: -- GAME 1: RED LIGHT, GREEN LIGHT -----------------------
:game1
cls
echo ✨ GAME 1: RED LIGHT, GREEN LIGHT ✨
:rl_loop
cls
set "bar="
for /L %%i in (1,1,%TARGET1%) do (
  if %%i==%POS% (set "bar=!bar!💃") else if %%i==%TARGET1% (set "bar=!bar!🎯") else set "bar=!bar!—"
)
echo Runway: !bar!
echo.
echo Green Light — press A to move forward (%POS%/%TARGET1%)
echo.

rem GREEN LIGHT 5s: allow A, no violation
for /L %%i in (1,1,5) do (
  choice /n /c A /t 1 /d N >nul
  if errorlevel 2 (
    rem no key pressed — continue
  ) else (
    set /a POS+=1
    if %POS% geq %TARGET1% goto game2
  )
)
echo.
echo Red Light — DO NOT press A!
rem RED LIGHT 3s: violation if A
for /L %%i in (1,1,3) do (
  choice /n /c A /t 1 /d N >nul
  if errorlevel 1 (
    echo.
    echo 💀 You moved on RED LIGHT. Eliminated.
    timeout /t 2 >nul
    goto :cleanup
  )
)
goto rl_loop

:: -- GAME 2: ASS‑EATING CONTEST ----------------------------
:game2
cls
echo 🍑 GAME 2: ASS‑EATING CONTEST 🍑
echo Mash A or S rapidly for 7 seconds!
set /a score=0
for /L %%i in (1,1,7) do (
  rem each second, 5 sub-intervals:
  for /L %%j in (1,1,5) do (
    choice /n /c AS /t 0 /d N >nul
    if errorlevel 1 (
      set /a score+=1
    )
    timeout /t 0 >nul
  )
)
echo.
if %score% lss %TARGET2% (
  echo 💀 You lacked stamina (%score%/%TARGET2%). Contest lost.
  timeout /t 2 >nul
  goto :cleanup
) else (
  echo 💦 You dominated! (%score%/%TARGET2%) You win.
  timeout /t 2 >nul
)

:: -- GAME 3: SUCKING DICK CONTEST -------------------------
:game3
cls
echo 🍆 GAME 3: SUCKING DICK CONTEST 🍆
echo Mash D or K rapidly for 8 seconds!
set /a score=0
for /L %%i in (1,1,8) do (
  for /L %%j in (1,1,5) do (
    choice /n /c DK /t 0 /d N >nul
    if errorlevel 1 (
      set /a score+=1
    )
    timeout /t 0 >nul
  )
)
echo.
if %score% lss %TARGET3% (
  echo 💀 You didn’t go deep enough (%score%/%TARGET3%). Contest lost.
  timeout /t 2 >nul
  goto :cleanup
) else (
  echo 💦 Stellar performance! (%score%/%TARGET3%) You win.
  timeout /t 2 >nul
)

:: -- FINAL ROUND: ULTRA‑REALISTIC SEX --------------------
:sex_round
cls
echo 🍒 FINAL ROUND: ULTRA-REALISTIC SEX 🍒
echo.

:: Foreplay
echo How long do you want foreplay?
echo 1) 5 min awkward kisses
echo 2) 15 min steamy build-up
echo 3) 30 min full seduction
choice /n /c 123 /p "Select 1-3: " >nul
if errorlevel 3 (
  echo 💋 Long massage, playful exploration.
) else if errorlevel 2 (
  echo 💋 Breathy moans, gentle teasing.
) else (
  echo 💋 Quick pecks, nervous giggles.
)
timeout /t 1 >nul

:: Position
echo.
echo Pick a position:
echo 1) Missionary
echo 2) Spooning
echo 3) Doggy style
choice /n /c 123 /p "Select 1-3: " >nul
if errorlevel 3 (
  echo 🔥 Wild, vulnerable energy.
) else if errorlevel 2 (
  echo 🔥 Soft alignment, shared warmth.
) else (
  echo 🔥 Intimate eye-contact thrusts.
)
timeout /t 1 >nul

:: Aftercare
echo.
echo Aftercare?
echo 1) Cuddle & reassure
echo 2) Silent hug
echo 3) Text memes later
choice /n /c 123 /p "Select 1-3: " >nul
if errorlevel 3 (
  echo 📱 Hours later, comedic relief.
) else if errorlevel 2 (
  echo 🛋️ Warm embrace, quiet smiles.
) else (
  echo 🛋️ Whisper sweet nothings, safe space.
)
timeout /t 2 >nul

:win
cls
echo 🏳️‍⚧️ FEMBOY SQUID GAMES COMPLETE 🏳️‍⚧️
echo ✨ You are now: messy, horny, and very genderful.
timeout /t 3 >nul

:cleanup
tput cnorm 2>nul
endlocal
exit /b
