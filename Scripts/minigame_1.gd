extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer
@onready var finish_point: Area2D = get_node_or_null("FinishPoint")

var blorbball_collected = 0
var timer_end = false
var finished = false
var reached_finish = false

func _ready() -> void:
	if finish_point:
		finish_point.body_entered.connect(_on_finish_body_entered)
	else:
		print("FinishPoint not found, check the node name")
	themed_timer.start_timer(15.0)
	await get_tree().create_timer(15.0).timeout
	timer_end = true

func _on_finish_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		reached_finish = true

func _process(_delta: float) -> void:
	if finished:
		return

	if reached_finish:
		finished = true
		Global.minigame_won()
	elif timer_end:
		finished = true
		Global.minigame_lost()

func blorbball_collect() -> void:
	blorbball_collected += 1
	print("collected: ", blorbball_collected)
