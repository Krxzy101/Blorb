extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer

var buttons_pressed := 0
var timer_end := false
var done := false

func _ready() -> void:
	await themed_timer.start_timer(7.0)
	timer_end = true

func _process(_delta: float) -> void:
	if done:
		return

	if buttons_pressed == 4:
		done = true
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
	elif timer_end:
		done = true
		Global.lives -= 1
		Global.minigames_done -= 1
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
