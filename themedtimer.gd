extends Node2D

signal finished

@onready var label: RichTextLabel = $timer

var time := 0.0
var running := false

func start_timer(start_time: float) -> void:
	time = start_time
	running = true
	await finished

func _process(delta: float) -> void:
	if not running:
		return
	time = max(time - delta, 0.0)
	label.text = "%.1f" % time
	if time <= 0.0:
		running = false
		finished.emit()
