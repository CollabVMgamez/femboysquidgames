@echo off
setlocal EnableDelayedExpansion

:: ============================================
:: 🌈 FEMBOY SQUID GAMES 3 — Windows Batch Edition
:: ============================================

:: -- CONFIG ------------------------------------------------
set /a START_POS=5
set /a GOAL_POS=30
set /a POS=%START_POS%

set /a TARGET2=25
set /a TARGET3=30

:: -- GAME 1: RED LIGHT, GREEN LIGHT -----------------------
:game1
cls
echo ✨ GAME 1: RED LIGHT, GREEN LIGHT ✨
:rl_loop
cls
set "bar="
for /L %%i in (1,1,%GOAL_POS%) do (
  if %%i==%POS% (set "bar=!bar!💃") else if %%i==%GOAL_POS% (set "bar=!bar!🎯") else (set "bar=!bar!—")
)
echo Runway: !bar!
echo.
echo Green Light — mash A to move forward (%POS%/%GOAL_POS%)
echo.

:: GREEN LIGHT: 5 seconds, each second 1-byte window
for /L %%s in (1,1,5) do (
  choice /n /c AN /t 1 /d N >nul
  if errorlevel 2 (
    rem no key pressed — stay
  ) else (
    set /a POS+=1
    if !POS! geq %GOAL_POS% goto game2
  )
)

echo.
echo Red Light — DO NOT press A!
echo.

:: RED LIGHT: 3 seconds, any press = elimination
for /L %%s in (1,1,3) do (
  choice /n /c AN /t 1 /d N >nul
  if errorlevel 2 (
    rem no key — good
  ) else (
    cls
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
for /L %%t in (1,1,7) do (
  for /L %%i in (1,1,5) do (
    choice /n /c AS /t 0 /d S >nul
    if errorlevel 2 (
      rem S or timeout — nothing
    ) else (
      set /a score+=1
    )
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
for /L %%t in (1,1,8) do (
  for /L %%i in (1,1,5) do (
    choice /n /c DK /t 0 /d K >nul
    if errorlevel 2 (
      rem K or timeout
    ) else (
      set /a score+=1
    )
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
echo 🍒 FINAL ROUND: ULTRA‑REALISTIC SEX 🍒
echo.

:: Foreplay
echo How long foreplay?
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
echo Position?
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
endlocal
exit /b
