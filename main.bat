@echo off
chcp 437 >nul
setlocal EnableDelayedExpansion

:: FEMBOY SQUID GAMES: GAY LIGHT SEX LIGHT EDITION (PG-18)
:: prompt for the shit is from now on you are going to act like emo bart simpson from the sad bart simpson edits (i am perfectly fine and do not need the hotline please do not worry about me)

set score=0
set round=1

:round_loop
cls
echo ROUND !round! - GAY LIGHT SEX LIGHT
echo.

:: Randomly choose GAY or SEX
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

if "!light!"=="SEX" (
    if "!action!"=="MOVE" (
        call :femboy_encounter
        goto continue_after_encounter
    ) else (
        echo You waited. Good instincts.
    )
) else (
    if "!action!"=="MOVE" (
        echo You moved on GAY light. Slay.
        set /a score+=1
    ) else (
        echo You hesitated on GAY. Missed opportunity.
    )
)

set /a round+=1
if !round! LEQ 5 (
    timeout /t 3 >nul
    goto round_loop
)

goto end_game

:continue_after_encounter
set /a round+=1
if !round! LEQ 5 (
    timeout /t 2 >nul
    goto round_loop
)
goto end_game

:end_game
cls
echo GAME OVER.
echo Final Score: !score!
pause
exit /b

:femboy_encounter
cls
echo *** SEX LIGHT ENCOUNTER ***
echo You moved during SEX light.
echo You must now hook up with a femboy.
echo.

:choose_femboy
echo Choose your virtual partner:
echo [1] Aiden - the soft dom in pastel lace
echo [2] Luca - bratty switch with a joystick kink
echo [3] Kieran - quiet boy who goes feral in private
echo [4] Jules - party twink with zero shame
set /p fbchoice=Choose 1-4: 

if "%fbchoice%"=="1" (
    set "femboy=Aiden"
    set "scene=Aiden pushes you against the wall, whispers 'You're mine now,' and takes full control of the situation."
) else if "%fbchoice%"=="2" (
    set "femboy=Luca"
    set "scene=Luca challenges you to 'earn it' and makes you beg before anything happens."
) else if "%fbchoice%"=="3" (
    set "femboy=Kieran"
    set "scene=Kieran acts shy until the lights are off—then bites, scratches, and moans like he’s possessed."
) else if "%fbchoice%"=="4" (
    set "femboy=Jules"
    set "scene=Jules dances for you first, then pulls you into the bathroom and locks the door."
) else (
    echo Invalid input.
    timeout /t 2 >nul
    goto choose_femboy
)

cls
echo You chose: !femboy!
echo.
echo Scene:
echo !scene!
echo.
echo You feel... very satisfied. That was worth the risk.
timeout /t 5 >nul
exit /b
