# Minigame Game

A little minigame game I made in Godot 4. You get thrown into random minigames one after another. Win 4 and you beat the game. You've got 5 lives, and every loss takes one.

## Screenshots
<img width="797" height="452" alt="Screenshot 2026-10-25 215900" src="https://github.com/user-attachments/assets/34c18b5e-b11d-4785-a383-b9616ea27fb2" />
<img width="1152" height="647" alt="Screenshot 2026-10-25 210323" src="https://github.com/user-attachments/assets/ac8853e9-1ae8-4749-81f4-a6ba549b9795" />



## How to play

1. Open the game on itch.io (https://krxzy101.itch.io/blorb) and click Run game. It plays right in your browser, nothing to install.
2. Hit Start.
3. You get a 3 second countdown showing your level and lives (the stars).
4. A random minigame starts. Win it and you go up a level. Lose it and you lose a life.
5. Win 4 minigames to beat the game. Lose all 5 lives and you're back at the title screen.

Controls: (Left & Right Arrow & Space)

Tip: if it won't load or the buttons do nothing, try a different browser (Chrome or Firefox work best) and refresh the page.

## How I made it

I used Godot 4 and GDScript. Every screen is its own scene (title, countdown, each minigame, win screen). One autoload script called Global keeps track of lives and progress and switches between scenes. After the countdown it picks a random minigame from a list, and the minigame tells Global if you won or lost.
