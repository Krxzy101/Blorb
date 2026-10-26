
extends Node2D

func _on_start_pressed() -> void:
	Global.lives = Global.START_LIVES
	Global.minigames_done = 0

	var error = get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	if error != OK:
		print("Failed to load level scene. Error: ", error)

func _on_settings_pressed() -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()
