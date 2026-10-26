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

	if buttons_pressed >= 4:
		done = true
		Global.minigame_won()
	elif timer_end:
		done = true
		Global.minigame_lost()
