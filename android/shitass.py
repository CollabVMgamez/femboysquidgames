from kivy.app import App
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.boxlayout import BoxLayout
from kivy.clock import Clock
import random

class FemboyGame(App):
    def build(self):
        self.score = 0
        self.mood = 0
        self.position = 0
        self.layout = BoxLayout(orientation='vertical')

        self.text = Label(text="Welcome to FEMBOY.EXE\nTap to start round 1", font_size=24)
        self.layout.add_widget(self.text)

        self.button = Button(text="Start", font_size=24, on_press=self.round1)
        self.layout.add_widget(self.button)

        return self.layout

    def round1(self, instance):
        self.position = 0
        self.next_light()

    def next_light(self):
        self.light = random.choice(['GAY', 'SEX'])
        self.text.text = f"Light: {self.light}\nPosition: {self.position}"
        self.button.text = "Move"
        self.button.on_press = self.move_or_wait

    def move_or_wait(self, instance):
        if self.light == 'SEX':
            self.text.text = "Oh no! You moved on SEX LIGHT!!"
            self.mood += 1
        else:
            self.position += 1
            self.text.text = f"Moved! Position: {self.position}"

        if self.position >= 5:
            self.text.text = "Round 1 complete. You survived."
            self.button.text = "Continue"
            self.button.on_press = self.end_game
        else:
            Clock.schedule_once(lambda dt: self.next_light(), 1)

    def end_game(self, instance):
        self.text.text = f"Game over\nScore: {self.score}\nMood: {self.mood}"
        self.button.text = "Exit"
        self.button.on_press = exit

FemboyGame().run()
