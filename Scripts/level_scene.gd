
extends Node2D

const COUNTDOWN := 3.0

var time_left: float = COUNTDOWN
var started: bool = false

func _ready() -> void:
	var stars = $StarContainer.get_children()

	for i in range(stars.size()):
		stars[i].modulate.a = 1.0 if i < Global.lives else 0.0

	$Level.text = "Level " + str(Global.minigames_done + 1)
	$Timer.text = "%.2f" % time_left

func _process(delta: float) -> void:
	if started:
		return

	time_left = maxf(time_left - delta, 0.0)
	$Timer.text = "%.2f" % time_left

	if time_left <= 0.0:
		started = true
		Global.play_next_minigame()
