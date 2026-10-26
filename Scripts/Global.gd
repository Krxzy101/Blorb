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

func _ready() -> void:
	print("Global ready")
	for p in [LEVEL_SCREEN, DONE_SCREEN, TITLE_SCREEN] + MINIGAMES:
		print(p, " exists: ", ResourceLoader.exists(p))

func _go(path: String) -> void:
	print("Changing scene to: ", path)
	if not ResourceLoader.exists(path):
		push_error("Scene not found (casing or export settings?): " + path)
		return
	var err := get_tree().change_scene_to_file(path)
	if err != OK:
		push_error("change_scene_to_file failed with error: %d" % err)

func start_game() -> void:
	lives = START_LIVES
	minigames_done = 0
	_go(LEVEL_SCREEN)

func play_next_minigame() -> void:
	_go(MINIGAMES.pick_random())

func minigame_won() -> void:
	minigames_done += 1
	if minigames_done >= GOAL:
		_go(DONE_SCREEN)
	else:
		_go(LEVEL_SCREEN)

func minigame_lost() -> void:
	lives -= 1
	if lives <= 0:
		_go(TITLE_SCREEN)
	else:
		_go(LEVEL_SCREEN)
