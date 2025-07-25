#!/bin/bash

score=0
mood=0

# === ROUND 1: GAY LIGHT / SEX LIGHT ===
round1() {
  clear
  echo "====================================="
  echo "     ROUND 1: GAY LIGHT / SEX LIGHT"
  echo "-------------------------------------"
  echo "Move ONLY when it's GREEN (GAY LIGHT)"
  echo "If it's SEX LIGHT, don't move or... you get virtually wrecked."
  echo
  position=0

  while [ $position -lt 5 ]; do
    light=$((RANDOM % 2))
    clear
    echo "Your current position: $position"
    echo
    if [ $light -eq 0 ]; then
      echo "SEX LIGHT!!! Don't move!!"
    else
      echo "GAY LIGHT! Move now!"
    fi
    echo
    read -n1 -p "[M]ove or [W]ait: " action
    echo

    if [[ $action == "M" || $action == "m" ]]; then
      if [ $light -eq 0 ]; then
        echo "Oh no! You moved on SEX LIGHT!"
        echo "You were virtually taken by surprise..."
        ((mood++))
        sleep 2
      else
        ((position++))
      fi
    else
      echo "You wait patiently."
      sleep 1
    fi
  done
  round2_twerkoff
}

# === ROUND 2: FEMBOY TWERK-OFF ===
round2_twerkoff() {
  clear
  echo "====================================="
  echo "        ROUND 2: FEMBOY TWERK-OFF"
  echo "-------------------------------------"
  echo "Mash T to twerk on beat! You have 10 seconds."
  twerks=0
  end=$((SECONDS + 10))

  while [ $SECONDS -lt $end ]; do
    read -n1 -t 1 input
    if [[ $input == "T" || $input == "t" ]]; then
      ((twerks++))
    fi
  done

  clear
  echo "==== TWERK-OFF COMPLETE ===="
  echo "You achieved $twerks twerks."
  if [ $twerks -ge 10 ]; then
    echo "YASSS. Dumptruck status."
    ((score+=2))
  elif [ $twerks -ge 5 ]; then
    echo "Decent bounce."
    ((score+=1))
  else
    echo "Flat as Ubuntu default wallpaper."
    ((score--))
  fi
  sleep 3
  sex_night
}

# === SEX NIGHT - PG-18 VIRTUAL HOOKUPS ===
sex_night() {
  clear
  ((mood++))
  echo "===================================="
  echo "             SEX NIGHT"
  echo "------------------------------------"
  echo "The dorm lights dim. Moans echo in the distance."
  echo "Choose your partner for the night:"
  echo "1) Aiden - Leather harness, dominant energy"
  echo "2) Luca  - Gamer brat, cheeky and fast"
  echo "3) Kieran - Silent menace, soft touch"
  echo "4) Jules - Chaos in fishnets"
  read -p "Choose (1-4): " pick

  case $pick in
    1) sex_aiden ;;
    2) sex_luca ;;
    3) sex_kieran ;;
    4) sex_jules ;;
    *) echo "Invalid."; sleep 2; sex_night ;;
  esac
}

sex_aiden() {
  clear
  echo "Aiden growls: 'No safe words tonight.'"
  echo "You wake up bruised, satisfied, and 10%% more gay."
  ((score+=2)); ((mood+=2)); sleep 3; round3_intro
}

sex_luca() {
  clear
  echo "Luca smirks: 'Loser gets topped.'"
  echo "You lose. He doesn't."
  ((score++)); ((mood++)); sleep 3; round3_intro
}

sex_kieran() {
  clear
  echo "Kieran is quiet... but intense."
  echo "The room smells like cologne and betrayal."
  ((score+=2)); ((mood+=3)); sleep 3; round3_intro
}

sex_jules() {
  clear
  echo "Jules throws glitter and chaos."
  echo "You wake up in a rave pit with bite marks."
  ((score+=3)); ((mood+=2)); sleep 3; round3_intro
}

# === FINAL ROUND ===
round3_intro() {
  clear
  ((mood++))
  echo "====================================="
  echo "           FINAL ROUND"
  echo "         BETRAYAL OR SLAYAL"
  echo "====================================="
  echo "The femboys surround you on the rooftop."
  echo "What do you do?"
  echo "S) Seduce them all"
  echo "A) Ally with one"
  echo "B) Betray all"
  read -n1 -p "Choose: " final_choice
  echo

  case $final_choice in
    [Ss]) seduce ;;
    [Aa]) ally ;;
    [Bb]) betray ;;
    *) round3_intro ;;
  esac
}

seduce() {
  clear
  echo "You unzip your hoodie slowly."
  echo "'There's enough of me for all of you,' you whisper."
  if [ $mood -ge 3 ]; then
    echo "They drop their weapons... and their guard."
    echo "Ending: Femboy Harem"
    ((score+=3))
  else
    echo "They laugh. 'You're not that hot.'"
    echo "Ending: Tried Too Hard"
  fi
  game_over
}

ally() {
  clear
  echo "You reach for Kieran's hand."
  if [ $score -ge 5 ]; then
    echo "He smirks. 'Let's get out of here.'"
    echo "Ending: Femboy Fugitive Lovers"
    ((score+=2))
  else
    echo "He throws you off the roof."
    echo "Ending: Not Him"
  fi
  game_over
}

betray() {
  clear
  echo "You press the red button hidden in your heel."
  echo "Glitter gas floods the rooftop."
  if [ $score -ge 4 ]; then
    echo "You survive alone."
    echo "Ending: Ruthless Power Twink"
    ((score+=3))
  else
    echo "You die choking on your own ego."
    echo "Ending: Self-Sabotage"
  fi
  game_over
}

game_over() {
  echo
  echo "========================"
  echo "      GAME OVER"
  echo "Score: $score   Mood: $mood"
  echo "========================"
  exit 0
}

# Start game
round1
