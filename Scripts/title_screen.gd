extends Node2D

const LEVEL_SCENE := "res://scenes/level_scene.tscn"

func _ready() -> void:
	print("Menu ready")
	print("Global lives: ", Global.lives)
	print("Level scene exists: ", ResourceLoader.exists(LEVEL_SCENE))

func _on_start_pressed() -> void:
	print("Start pressed")

	if not ResourceLoader.exists(LEVEL_SCENE):
		push_error("Level scene missing (check casing / export settings): " + LEVEL_SCENE)
		return

	Global.lives = Global.START_LIVES
	Global.minigames_done = 0

	var error := get_tree().change_scene_to_file(LEVEL_SCENE)
	if error != OK:
		push_error("Failed to load level scene. Error: %d" % error)

func _on_settings_pressed() -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()
