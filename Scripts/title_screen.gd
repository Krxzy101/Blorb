extends Node2D

func _on_start_pressed() -> void:
	Global.start_game()

func _on_settings_pressed() -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()
