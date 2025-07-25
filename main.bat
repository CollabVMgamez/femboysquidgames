@echo off
setlocal EnableDelayedExpansion

:: FEMBOY SQUID GAMES - SAFE ASCII VERSION

:: ROUND 1 - STRUT OR DIE
for /L %%i in (1,1,5) do (
  cls
  echo GAME 1 - STEP %%i OF 5
  echo Press A within 2 seconds to strut forward
  choice /n /c A /t 2 /d N >nul
  if errorlevel 2 (
    echo You hesitated. Eliminated.
    timeout /t 2 >nul
    goto :eof
  )
)
echo You survived Round 1!
timeout /t 2 >nul

:: ROUND 2 - ASS EATING
cls
echo GAME 2 - ASS EATING CONTEST
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
  echo Not enough stamina. You lose.
  timeout /t 2 >nul
  goto :eof
) else (
  echo You dominated. You win Round 2.
  timeout /t 2 >nul
)

:: ROUND 3 - SUCKING
cls
echo GAME 3 - SUCKING D CONTEST
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
  echo You didn't go deep enough. You lose.
  timeout /t 2 >nul
  goto :eof
) else (
  echo Solid work. You win Round 3.
  timeout /t 2 >nul
)

:: ENDING
cls
echo ALL ROUNDS COMPLETE
echo You are now: messy, victorious, and legendary.
pause
exit /b
