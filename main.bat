@echo off
setlocal EnableDelayedExpansion

:: 🌈 FEMBOY SQUID GAMES 3 — Windows Batch Edition (Simplified) 🌈

:: ----------------------------------------
:: GAME 1: STRUT OR DIE (5 Steps)
:: ----------------------------------------
for /L %%i in (1,1,5) do (
  cls
  echo ✨ GAME 1: STRUT OR DIE (Step %%i of 5) ✨
  echo Press A within 2 seconds to strut forward!
  choice /n /c A /t 2 /d N >nul
  if errorlevel 2 (
    echo.
    echo 💀 You hesitated. Eliminated.
    timeout /t 2 >nul
    goto :cleanup
  )
)
echo.
echo 🏆 You survived Game 1!
timeout /t 2 >nul

:: ----------------------------------------
:: GAME 2: ASS‑EATING CONTEST
:: ----------------------------------------
cls
echo 🍑 GAME 2: ASS‑EATING CONTEST 🍑
echo Mash A or S rapidly for 7 seconds!
set /a score=0
for /L %%t in (1,1,7) do (
  for /L %%j in (1,1,5) do (
    choice /n /c AS /t 0 /d S >nul
    if errorlevel 1 set /a score+=1
  )
)
cls
echo Score: %score% out of 25
if %score% lss 25 (
  echo 💀 Not enough stamina. You lose.
  timeout /t 2 >nul
  goto :cleanup
) else (
  echo 💦 You dominated! You win Game 2.
  timeout /t 2 >nul
)

:: ----------------------------------------
:: GAME 3: SUCKING DICK CONTEST
:: ----------------------------------------
cls
echo 🍆 GAME 3: SUCKING DICK CONTEST 🍆
echo Mash D or K rapidly for 8 seconds!
set /a score=0
for /L %%t in (1,1,8) do (
  for /L %%j in (1,1,5) do (
    choice /n /c DK /t 0 /d K >nul
    if errorlevel 1 set /a score+=1
  )
)
cls
echo Score: %score% out of 30
if %score% lss 30 (
  echo 💀 You didn't go deep enough. You lose.
  timeout /t 2 >nul
  goto :cleanup
) else (
  echo 💦 Stellar performance! You win Game 3.
  timeout /t 2 >nul
)

:: ----------------------------------------
:: FINAL ROUND: ULTRA‑REALISTIC SEX
:: ----------------------------------------
:sex_round
cls
echo 🍒 FINAL ROUND: ULTRA‑REALISTIC SEX 🍒
echo.

:: Foreplay
echo 1) 5 min awkward kisses
echo 2) 15 min steamy build-up
echo 3) 30 min full seduction
choice /n /c 123 /p "Choose foreplay (1-3): " >nul
if errorlevel 3 (
  echo 💋 Long massage & playful exploration.
) else if errorlevel 2 (
  echo 💋 Breathy moans & gentle teasing.
) else (
  echo 💋 Quick pecks & nervous giggles.
)
timeout /t 1 >nul
echo.

:: Position
echo 1) Missionary
echo 2) Spooning
echo 3) Doggy style
choice /n /c 123 /p "Choose position (1-3): " >nul
if errorlevel 3 (
  echo 🔥 Wild, vulnerable energy.
) else if errorlevel 2 (
  echo 🔥 Soft alignment & shared warmth.
) else (
  echo 🔥 Intimate eye-contact thrusts.
)
timeout /t 1 >nul
echo.

:: Aftercare
echo 1) Cuddle & reassure
echo 2) Silent hug
echo 3) Text memes later
choice /n /c 123 /p "Choose aftercare (1-3): " >nul
if errorlevel 3 (
  echo 📱 Hours later, comedic relief.
) else if errorlevel 2 (
  echo 🛋️ Warm embrace & quiet smiles.
) else (
  echo 🛋️ Whisper sweet nothings.
)
timeout /t 2 >nul

:: ----------------------------------------
:: YOU WIN
:: ----------------------------------------
cls
echo 🏳️‍⚧️ FEMBOY SQUID GAMES COMPLETE 🏳️‍⚧️
echo ✨ You are now: messy, horny, and very genderful.
timeout /t 3 >nul

:cleanup
endlocal
exit /b
