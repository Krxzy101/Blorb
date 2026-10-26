extends Node

const LEVEL_SCREEN := "res://scenes/level_scene.tscn"
const DONE_SCREEN := "res://scenes/done_screen.tscn"
const TITLE_SCREEN := "res://scenes/title_screen.tscn"
const MINIGAMES := [
	"res://scenes/minigame_1.tscn",
	"res://scenes/minigame_2.tscn",
]
const GOAL := 4
const START_LIVES := 5

var lives := START_LIVES
var minigames_done := 0

func start_game() -> void:
	lives = START_LIVES
	minigames_done = 0
	get_tree().change_scene_to_file(LEVEL_SCREEN)

func play_next_minigame() -> void:
	get_tree().change_scene_to_file(MINIGAMES.pick_random())

func minigame_won() -> void:
	minigames_done += 1
	if minigames_done >= GOAL:
		get_tree().change_scene_to_file(DONE_SCREEN)
	else:
		get_tree().change_scene_to_file(LEVEL_SCREEN)

func minigame_lost() -> void:
	lives -= 1
	if lives <= 0:
		get_tree().change_scene_to_file(TITLE_SCREEN)
	else:
		get_tree().change_scene_to_file(LEVEL_SCREEN)
