import random
import time
import sys

score = 0
mood = 0

def print_slow(text, delay=0.03):
    for c in text:
        print(c, end='', flush=True)
        time.sleep(delay)
    print()

def round1():
    global mood, score
    position = 0
    print("=== ROUND 1: GAY LIGHT / SEX LIGHT ===")
    print("Get to 5 steps. GAY = Move. SEX = Don't move.")
    time.sleep(2)

    while position < 5:
        light = random.randint(0, 1)
        print(f"\nCurrent Position: {position}")
        if light == 0:
            print("SEX LIGHT!!! Don't move!!")
        else:
            print("GAY LIGHT! Move now!")

        choice = input("[M]ove or [W]ait: ").strip().lower()
        if choice == 'm':
            if light == 0:
                print("You moved on SEX LIGHT... they got you.")
                mood += 1
            else:
                position += 1
        elif choice == 'w':
            print("You wait. Your thighs are trembling.")
            time.sleep(1)
        else:
            print("Confused behavior... very you.")
            mood += 1
    round2()

def round2():
    global score, mood
    print("\n=== ROUND 2: FEMBOY TWERK-OFF ===")
    print("Mash [T] in 10 seconds to TWERK!!")
    twerks = 0
    start = time.time()

    while time.time() - start < 10:
        move = input("🔥 Beat drop! [T]=Twerk: ")
        if move.lower() == 't':
            twerks += 1

    print(f"\nYou achieved {twerks} twerks.")
    if twerks >= 10:
        print("YASSS. Dumptruck status.")
        score += 2
    elif twerks >= 5:
        print("Decent bounce.")
        score += 1
    else:
        print("Flat as Windows XP.")
        score -= 1
    mood += 1
    sex_night()

def sex_night():
    global mood, score
    print("\n=== SEX NIGHT ===")
    mood += 1
    print("The dorm lights dim. Tension thickens.")
    time.sleep(2)

    print("Choose your partner:")
    print("[1] Aiden - Leather harness, dominant")
    print("[2] Luca - Gamer brat")
    print("[3] Kieran - Silent menace")
    print("[4] Jules - Chaos in fishnets")
    pick = input("Your pick (1-4): ")

    if pick == '1':
        print("Aiden says: 'No safe words tonight.'")
        score += 2
        mood += 2
    elif pick == '2':
        print("Luca: 'Loser gets topped.' He unplugs your controller.")
        score += 1
        mood += 1
    elif pick == '3':
        print("Kieran touches you like a sad indie song.")
        score += 2
        mood += 3
    elif pick == '4':
        print("Jules laughs. You wake up in glitter hell.")
        score += 3
        mood += 2
    else:
        print("You stayed home. Respectable. Lonely.")
        mood += 1
    time.sleep(2)
    final_round()

def final_round():
    global mood, score
    mood += 1
    print("\n=== FINAL ROUND: BETRAYAL OR SLAYAL ===")
    print("Femboys surround you on a rooftop.")
    print("[S] Seduce them all\n[A] Ally with one\n[B] Betray all")
    choice = input("Choose your fate: ").strip().lower()

    if choice == 's':
        if mood >= 3:
            print("They drop their guard... and their pants.")
            print("Ending: Femboy Harem")
            score += 3
        else:
            print("They laugh. 'You're mid.' You fall dramatically.")
            print("Ending: Tried Too Hard")
    elif choice == 'a':
        if score >= 5:
            print("You escape into the night with Kieran.")
            print("Ending: Fugitive Lovers")
            score += 2
        else:
            print("Kieran pushes you off the roof.")
            print("Ending: Not Him.")
    elif choice == 'b':
        if score >= 4:
            print("You poison the air with glitter gas and survive.")
            print("Ending: Ruthless Power Twink")
            score += 3
        else:
            print("You choke on your own toxic era.")
            print("Ending: Self-Sabotage")
    else:
        print("You do nothing. They do not forgive.")
        print("Ending: Irrelevant.")

    print("\n=== GAME OVER ===")
    print(f"Final Score: {score}")
    print(f"Mood: {mood}")
    if mood > 5:
        print("Bart voice: 'It’s fine. Everything hurts.'")
    elif score > 5:
        print("Bart voice: 'I guess... I won? Whatever.'")
    else:
        print("Bart voice: 'I’m not crying, you are.'")

if __name__ == "__main__":
    round1()
