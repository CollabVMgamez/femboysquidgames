@echo off
chcp 437 >nul
setlocal EnableDelayedExpansion

:: GAY LIGHT SEX LIGHT GAME - CMD-SAFE

set score=0
set round=1

:round_loop
cls
echo ROUND !round! - GAY LIGHT SEX LIGHT
echo.

:: Randomly decide if it's GAY or SEX light
set /a r=%random% %% 2
if !r! EQU 0 (
    set light=GAY
) else (
    set light=SEX
)

echo The light is: !light!
echo What do you do?
echo [M] Move
echo [W] Wait
choice /n /c MW >nul
if errorlevel 2 (
    set action=WAIT
) else (
    set action=MOVE
)

:: Evaluate outcome
if "!light!"=="SEX" (
    if "!action!"=="MOVE" (
        call :sex_penalty
        goto end_game
    ) else (
        echo Good choice. You waited during SEX light.
    )
) else (
    if "!action!"=="MOVE" (
        echo You moved correctly on GAY light.
        set /a score+=1
    ) else (
        echo You waited unnecessarily.
    )
)

set /a round+=1
if !round! LEQ 5 (
    timeout /t 3 >nul
    goto round_loop
)

:end_game
echo.
echo Final Score: !score!
pause
exit /b

:sex_penalty
cls
echo YOU MOVED DURING SEX LIGHT...
echo Initiating mandatory sex scene...
echo.

:: Random sex partner
setlocal
set partners[0]=Twink Bouncer
set partners[1]=Furry DJ
set partners[2]=Buff Lube Dealer
set partners[3]=Mysterious Otter in Latex
set /a pick=%random% %% 4
for /l %%i in (0,1,3) do (
    set "name=!partners[%%i]!"
    if %%i==!pick! (
        set "partner=!name!"
    )
)
echo You now must engage with: !partner!
timeout /t 4 >nul
echo That was... a lot.
echo Game over.
endlocal
exit /b
