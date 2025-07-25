#!/bin/bash

# 🌈 FEMBOY SQUID GAMES 3 — Degenerate Bash Edition 🌈

trap "tput cnorm; stty echo; clear; exit" INT
stty -echo
tput civis
clear

# Terminal dimensions & positions
cols=$(tput cols)
rows=$(tput lines)
player_x=5
player_y=$((rows / 2))
goal_x=$((player_x + 25))  # short distance

# Utility: read one key with timeout
function wait_keypress() {
    read -rsn1 -t "$1" key
}

### GAME 1: RED LIGHT, GREEN LIGHT ###
function draw_redlight() {
    clear
    tput cup 1 2; echo "✨ GAME 1: RED LIGHT, GREEN LIGHT ✨"
    tput cup 3 2; printf 'Runway: '
    for ((i=0; i<cols-6; i++)); do
        if (( i == player_x )); then printf '💃'
        elif (( i == goal_x )); then printf '🎯'
        else printf '—'; fi
    done
    echo
    tput cup $((rows-3)) 2; echo "Use ← → or A/D to move"
    tput cup $((rows-2)) 2; echo "Green lasts 5s. Don't move on RED!"
}

function game_redlight() {
    while (( player_x < goal_x )); do
        draw_redlight
        # GREEN LIGHT 5s
        tput cup 5 2; echo "🟢 GREEN LIGHT — MOVE! (5s)"
        end=$((SECONDS + 5))
        while [ $SECONDS -lt $end ]; do
            wait_keypress 0.5
            case "$key" in
                D|d|$'\x1b[C') ((player_x++));;
                A|a|$'\x1b[D') ((player_x--));;
            esac
            (( player_x >= goal_x )) && return 0
            draw_redlight
        done
        # RED LIGHT 3s
        draw_redlight
        tput cup 5 2; echo "🔴 RED LIGHT — FREEZE! (3s)"
        end=$((SECONDS + 3))
        while [ $SECONDS -lt $end ]; do
            wait_keypress 0.2
            if [[ -n "$key" ]]; then
                clear
                echo -e "💀 You moved on RED LIGHT. Eliminated.\n"
                sleep 2
                tput cnorm; stty echo; clear; exit 1
            fi
        done
    done
    clear
    echo "🏆 You survived Game 1. Gender ✔ Thriving ✔"
    sleep 2
}

### GAME 2: ASS‑EATING CONTEST ###
function game_ass_eating() {
    clear
    echo "🍑 GAME 2: ASS‑EATING CONTEST 🍑"
    echo "Mash [A] & [S] like your life depends on it."
    echo
    bar=""
    score=0
    target=25
    end=$((SECONDS + 7))
    printf "Progress: [%*s]\n" $target ""
    while [ $SECONDS -lt $end ] && (( score < target )); do
        wait_keypress 0.1
        if [[ "$key" =~ [aAsS] ]]; then
            ((score++))
            bar+="🥵"
        fi
        printf "\rProgress: [%s%-*s]" "$bar" $((target - ${#bar})) ""
    done
    echo
    if (( score < target )); then
        clear
        echo "💀 You lacked stamina. Contest lost."
        sleep 2
        tput cnorm; stty echo; clear; exit 1
    else
        echo "💦 You dominated. You win."
        sleep 2
    fi
}

### GAME 3: SUCKING DICK CONTEST ###
function game_suck_dick() {
    clear
    echo "🍆 GAME 3: SUCKING DICK CONTEST 🍆"
    echo "Rapidly press [D] & [K] to prove your dedication."
    echo
    bar=""
    score=0
    target=30
    end=$((SECONDS + 8))
    printf "Suck Meter: [%*s]\n" $target ""
    while [ $SECONDS -lt $end ] && (( score < target )); do
        wait_keypress 0.1
        if [[ "$key" =~ [dDkK] ]]; then
            ((score++))
            bar+="💦"
        fi
        printf "\rSuck Meter: [%s%-*s]" "$bar" $((target - ${#bar})) ""
    done
    echo
    if (( score < target )); then
        clear
        echo "💀 You didn’t go deep enough. Contest lost."
        sleep 2
        tput cnorm; stty echo; clear; exit 1
    else
        echo "💦 You gave a stellar performance. You win."
        sleep 2
    fi
}

### FINAL ROUND: ULTRA‑REALISTIC SEX ###
function sex_round() {
    clear
    echo "🍒 FINAL ROUND: ULTRA-REALISTIC SEX 🍒"
    echo
    sleep 1
    echo "Felix: “Foreplay length?”"
    PS3="Choose foreplay (1–3): "
    select fp in "5 min awkward kisses" "15 min steamy build-up" "30 min full seduction"; do
        case $REPLY in
            1) echo "💋 Quick pecks, nervous giggles." ;;
            2) echo "💋 Breathy moans, gentle teasing." ;;
            3) echo "💋 Long massage, playful exploration." ;;
            *) echo "Pick 1–3." && continue ;;
        esac; break
    done; sleep 1

    echo; echo "Felix: “Position?”"
    PS3="Choose position (1–3): "
    select pos in "Missionary" "Spooning" "Doggy style"; do
        case $REPLY in
            1) echo "🔥 Intimate eye-contact thrusts." ;;
            2) echo "🔥 Soft alignment, shared warmth." ;;
            3) echo "🔥 Wild, vulnerable energy." ;;
            *) echo "Pick 1–3." && continue ;;
        esac; break
    done; sleep 1

    echo; echo "Felix: “Aftercare?”"
    PS3="Choose aftercare (1–3): "
    select ac in "Cuddle & reassure" "Silent hug" "Text memes later"; do
        case $REPLY in
            1) echo "🛋️ You whisper sweet nothings." ;;
            2) echo "🛋️ Warm embrace, quiet smiles." ;;
            3) echo "📱 Hours later, comedic relief." ;;
            *) echo "Pick 1–3." && continue ;;
        esac; break
    done
    echo; echo "🖤 Emotional baggage: +1"; sleep 2
}

### RUN THEM ALL ###
game_redlight
game_ass_eating
game_suck_dick
sex_round

clear
echo "🏳️‍⚧️ FEMBOY SQUID GAMES COMPLETE 🏳️‍⚧️"
echo "✨ You are now: messy, horny, and very genderful."
tput cnorm; stty echo
