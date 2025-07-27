#!/bin/bash

score=0
mood=0
lust=0

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
        ((lust++))
        sleep 2
      else
        ((position++))
      fi
    else
      echo "You wait patiently."
      sleep 1
    fi
  done
  femboy_fight_club
}

# === FEMBOY FIGHT CLUB ===
femboy_fight_club() {
  clear
  echo "==============================="
  echo "       FEMBOY FIGHT CLUB"
  echo "==============================="
  echo "Your opponent: Glitter Goth Twink"
  echo "Battle begins!"
  echo

  player_hp=10
  enemy_hp=10
  enemy_lust=0

  while [ $player_hp -gt 0 ] && [ $enemy_hp -gt 0 ]; do
    echo "Your HP: $player_hp   Enemy HP: $enemy_hp   Enemy Lust: $enemy_lust"
    echo "[1] Slap"
    echo "[2] Taunt"
    echo "[3] Seduce"
    read -p "Choose your move: " move
    clear

    case $move in
      1)
        echo "You SLAP the twink. Hard."
        ((enemy_hp-=2))
        ;;
      2)
        echo "You TAUNT them. 'Your eyeliner's uneven.'"
        ((enemy_lust+=1)); ((enemy_hp-=1))
        ;;
      3)
        echo "You SEDUCE. You arch your back and lick your lips."
        ((enemy_lust+=3))
        ;;
      *)
        echo "You hesitate. Big mistake."
        ((player_hp--))
        ;;
    esac

    attack=$((RANDOM % 3))
    case $attack in
      0)
        echo "They slap you with a rhinestone glove!"
        ((player_hp-=2))
        ;;
      1)
        echo "They wink and blow glitter in your face."
        ((player_hp--)); ((lust+=1))
        ;;
      2)
        echo "They grind on you aggressively. Your will weakens."
        ((lust+=2)); ((enemy_lust+=1))
        ;;
    esac
    echo
    sleep 2
  done

  if [ $enemy_hp -le 0 ]; then
    echo "You win! You assert dominance with sparkle damage."
    ((score+=2)); ((lust+=2))
  else
    echo "You fall to your knees. He straddles you in victory."
    ((mood+=2)); ((lust+=3))
  fi
  sleep 4
  obedience_trainer
}

# === OBEY OR GET SPANKED ===
obedience_trainer() {
  clear
  echo "==============================="
  echo "       OBEY OR GET SPANKED"
  echo "==============================="
  echo "Respond fast. Or else."
  sleep 2

  commands=("Bark" "Beg" "Whimper" "Crawl" "Stay")
  points=0

  for i in {1..5}; do
    cmd=${commands[$RANDOM % ${#commands[@]}]}
    clear
    echo "Command: $cmd"
    read -n4 -t 2 response
    echo
    if [[ ${response,,} == ${cmd,,:1}* ]]; then
      echo "Good pet."
      ((points++)); ((lust++))
    else
      echo "Wrong. That’s a spanking."
      ((mood++))
    fi
    sleep 1
  done

  echo "Final obedience score: $points"
  if [ $points -ge 3 ]; then
    echo "You’re ready for your reward."
    ((score++))
  else
    echo "Disobedient little thing."
    ((mood++))
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
  echo
  echo "You're on your knees before he even finishes locking the door."
  echo "The harness creaks as he kneels behind you, breath hot, fingers rough."
  echo "He doesn't ask — he *commands* — and your body listens before your brain does."
  echo "Every thrust feels like a punishment and a promise."
  echo "By the time he finishes, you’re gasping, soaked, bruised, and more alive than ever."
  ((score+=2)); ((mood+=3)); ((lust+=3))
  sleep 5
  round3_intro
}

sex_luca() {
  clear
  echo "Luca smirks: 'Loser gets topped.'"
  echo
  echo "You challenge him. Big mistake."
  echo "Within minutes, he's got you pinned under him, tongue teasing your ear as he grinds slow, cruel."
  echo "'Told you. You lose,' he whispers."
  echo "He teases until you beg, then laughs when you break."
  ((score+=2)); ((mood+=2)); ((lust+=3))
  sleep 5
  round3_intro
}

sex_kieran() {
  clear
  echo "Kieran says nothing. Just a slow look that melts you."
  echo
  echo "He touches like he’s reading a book — every sigh, twitch, gasp… another page turned."
  echo "He whispers, 'You’re safe,' as he makes you moan like you’ve never moaned before."
  echo "When it’s over, he holds you. You don't know if you're loved or owned."
  ((score+=3)); ((mood+=3)); ((lust+=3))
  sleep 5
  round3_intro
}

sex_jules() {
  clear
  echo "Jules spins you into their glitter storm."
  echo
  echo "One second you're dancing, the next you're pressed to a wall."
  echo "'You want chaos?' they hiss. 'Say please.'"
  echo "They ride you like a song with no chorus — highs, lows, sudden drop into madness."
  echo "There's laughter, teeth, neon, and too many orgasms to count."
  ((score+=3)); ((mood+=2)); ((lust+=4))
  sleep 5
  round3_intro
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
  if [ $lust -ge 8 ] && [ $score -ge 6 ]; then
    echo "O) Orgy Mode (Unlocked)"
  fi
  read -n1 -p "Choose: " final_choice
  echo

  case $final_choice in
    [Ss]) seduce ;;
    [Aa]) ally ;;
    [Bb]) betray ;;
    [Oo])
      if [ $lust -ge 8 ] && [ $score -ge 6 ]; then
        femboy_orgy
      else
        round3_intro
      fi
      ;;
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

femboy_orgy() {
  clear
  echo "You drop your pants. No words. Just heat."
  echo "Aiden grabs your throat. Luca's biting your ear. Jules is riding your thigh while Kieran wraps around you like a fog."
  echo "It’s sweat, lipstick, glitter, and overstimulation."
  echo "You're not sure who finishes first — or how many times."
  echo "Ending: Ultimate Twink Convergence"
  ((score+=5)); ((mood+=5)); ((lust+=5))
  game_over
}

game_over() {
  echo
  echo "========================"
  echo "      GAME OVER"
  echo "Score: $score   Mood: $mood   Lust: $lust"
  echo "========================"
  exit 0
}

# Start game
round1

