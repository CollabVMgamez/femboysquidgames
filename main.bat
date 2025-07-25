@echo off
setlocal EnableDelayedExpansion

:: Initialize stats
set /a score=0
set /a mood=0

:: === ROUND 1: GAY LIGHT / SEX LIGHT ===
:round1
cls
echo =====================================
echo      ROUND 1: GAY LIGHT / SEX LIGHT
echo -------------------------------------
echo Move forward ONLY when it's GREEN ("GAY LIGHT")
echo If it's SEX LIGHT, DO NOT MOVE or... you get virtually wrecked.
echo.
echo Get to 5 steps to pass.
set /a position=0

:round1_loop
set /a light=%random%%%2
cls
echo Your current position: !position!
echo.
if !light! EQU 0 (
    echo SEX LIGHT!!! Don't move!!
) else (
    echo GAY LIGHT! Move now!
)
echo.
choice /c MW /n /m "[M]ove or [W]ait: "
if errorlevel 2 goto round1_wait
if errorlevel 1 goto round1_move

:round1_move
if !light! EQU 0 (
    echo Oh no! You moved on SEX LIGHT!!
    echo You were virtually taken by surprise...
    set /a mood+=1
    timeout /t 2 >nul
    goto round1_loop
) else (
    set /a position+=1
    if !position! GEQ 5 goto round2_twerkoff
    goto round1_loop
)

:round1_wait
echo You wait patiently.
timeout /t 1 >nul
goto round1_loop

:: === ROUND 2: FEMBOY TWERK-OFF ===
:round2_twerkoff
cls
echo =====================================
echo         ROUND 2: FEMBOY TWERK-OFF
echo -------------------------------------
echo Mash [T] to twerk on beat! You have 10 seconds.
set /a twerks=0
set /a timer=10

:twerk_countdown
set /a timer-=1
if !timer! LSS 0 goto twerk_results
set /p input=🔥 Beat drop! [T]=Twerk: 
if /i "!input!"=="T" set /a twerks+=1
goto twerk_countdown

:twerk_results
cls
echo ==== TWERK-OFF COMPLETE ====
echo You achieved !twerks! twerks.
if !twerks! GEQ 10 (
    echo YASSS. Dumptruck status.
    set /a score+=2
) else if !twerks! GEQ 5 (
    echo Decent bounce. More cheek next time.
    set /a score+=1
) else (
    echo Flat as Windows XP.
    set /a score-=1
)
timeout /t 3 >nul
goto sex_night

:: === SEX NIGHT - PG-18 VIRTUAL HOOKUPS (SPICY) ===
:sex_night
cls
echo ====================================
echo           SEX NIGHT
set /a mood+=1
echo ------------------------------------
echo Tonight... the rules are suspended.
echo The dorm lights dim. Moans echo in the distance.
echo Everyone is feeling... bold.
pause

:choose_partner
cls
echo Choose your partner for the night:
echo [1] Aiden - Leather harness, dominant energy
set /a aiden_mood=2
echo [2] Luca - Gamer brat, cheeky and fast
set /a luca_mood=1
echo [3] Kieran - Silent menace, soft touch
set /a kieran_mood=3
echo [4] Jules - Chaos in fishnets
set /a jules_mood=2
set /p pick=Choose your partner (1-4): 

if "%pick%"=="1" (
    set partner=Aiden
    goto sex_aiden
) else if "%pick%"=="2" (
    set partner=Luca
    goto sex_luca
) else if "%pick%"=="3" (
    set partner=Kieran
    goto sex_kieran
) else if "%pick%"=="4" (
    set partner=Jules
    goto sex_jules
) else (
    echo Invalid. Try again.
    timeout /t 2 >nul
    goto choose_partner
)

:sex_aiden
cls
echo Aiden grins and pushes you onto the bed.
echo "No safe words tonight," he growls.
echo You wake up bruised, satisfied, and 10% more gay.
set /a score+=2
set /a mood+=2
timeout /t 4 >nul
goto round3_intro

:sex_luca
cls
echo Luca pulls you into his gaming chair.
echo "Loser gets topped," he says — then unplugs your controller.
echo You lose. He doesn’t.
set /a score+=1
set /a mood+=1
timeout /t 4 >nul
goto round3_intro

:sex_kieran
cls
echo Kieran says nothing, but his hands say everything.
echo You lose track of time, and clothes.
echo The room smells like cologne and betrayal.
set /a score+=2
set /a mood+=3
timeout /t 4 >nul
goto round3_intro

:sex_jules
cls
echo Jules throws glitter in your eyes and laughs.
echo "Survive me," he whispers.
echo You wake up in a rave pit with claw marks.
set /a score+=3
set /a mood+=2
timeout /t 4 >nul
goto round3_intro

:: === FINAL ROUND - BETRAYAL OR SLAYAL ===
:round3_intro
cls
echo =====================================
echo           FINAL ROUND
set /a mood+=1
echo         BETRAYAL OR SLAYAL
pause
cls
echo The femboys surround you on the rooftop.
echo What do you do?
echo [S] Seduce them all
echo [A] Ally with one
echo [B] Betray all
choice /n /c SAB /m "Choose: "
if errorlevel 3 set choice=BETRAY
if errorlevel 2 set choice=ALLY
if errorlevel 1 set choice=SEDUCE
goto !choice!

:SEDUCE
cls
echo You unzip your hoodie slowly.
echo "There's enough of me for all of you," you whisper.
if !mood! GEQ 3 (
    echo They drop their weapons... and their guard.
    echo Ending: Femboy Harem
    set /a score+=3
) else (
    echo They laugh. "You're not that hot."
    echo You fall to your doom... in style.
    echo Ending: Tried Too Hard
)
goto game_over

:ALLY
cls
echo You reach for Kieran's hand.
echo He stares. A long pause.
if !score! GEQ 5 (
    echo He smirks. "Let’s get out of here."
    echo You vanish into the city lights together.
    echo Ending: Femboy Fugitive Lovers
    set /a score+=2
) else (
    echo Kieran pushes you off the roof.
    echo Ending: Not Him
)
goto game_over

:BETRAY
cls
echo You hit the red button under your shoe.
echo A fog of glitter poison fills the air.
if !score! GEQ 4 (
    echo You survive... barely.
    echo Ending: Ruthless Power Twink
    set /a score+=3
) else (
    echo You choke on your own evil.
    echo Ending: Self-Sabotage
)
goto game_over

:game_over
echo.
echo ========================
echo     GAME OVER
echo Final Score: !score!
echo Mood: !mood!
echo ========================
pause
exit /b
