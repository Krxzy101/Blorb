extends Node2D

const BALLS_NEEDED := 1

@onready var themed_timer: Node2D = $ThemedTimer
@onready var finish_point: Area2D = get_node_or_null("FinishPoint")

var blorbball_collected := 0
var timer_end := false
var finished := false
var on_finish := false

func _ready() -> void:
	if finish_point:
		finish_point.body_entered.connect(_on_finish_body_entered)
		finish_point.body_exited.connect(_on_finish_body_exited)
	else:
		print("FinishPoint not found, check the node name")
	themed_timer.start_timer(15.0)
	await get_tree().create_timer(15.0).timeout
	timer_end = true

func _on_finish_body_entered(body: Node2D) -> void:
	print("finish touched by: ", body)
	if body is CharacterBody2D:
		on_finish = true

func _on_finish_body_exited(body: Node2D) -> void:
	print("left finish: ", body)
	if body is CharacterBody2D:
		on_finish = false

func _process(_delta: float) -> void:
	if finished:
		return

	if on_finish and blorbball_collected >= BALLS_NEEDED:
		finished = true
		Global.minigame_won()
	elif timer_end:
		finished = true
		Global.minigame_lost()

func blorbball_collect() -> void:
	blorbball_collected += 1
	print("collected: ", blorbball_collected, " / ", BALLS_NEEDED)
func blorb_ball_collect() -> void:
	blorbball_collect()
	
