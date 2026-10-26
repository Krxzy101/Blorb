extends Node2D

const ITEM_SCENE := preload("res://scenes/falling_blorb.tscn")
const GOAL := 5
const TIME_LIMIT := 10.0

@onready var themed_timer: Node2D = $ThemedTimer
@onready var counter_label: Label = $CounterLabel

var caught := 0
var timer_end := false
var done := false
var spawn_cooldown := 0.0

func _ready() -> void:
	update_counter()
	themed_timer.start_timer(TIME_LIMIT)
	await get_tree().create_timer(TIME_LIMIT).timeout
	timer_end = true

func update_counter() -> void:
	counter_label.text = "Left: " + str(max(GOAL - caught, 0))

func _on_item_collected() -> void:
	caught += 1
	update_counter()

func _process(delta: float) -> void:
	if done:
		return

	spawn_cooldown -= delta
	if spawn_cooldown <= 0.0:
		spawn_cooldown = 0.7
		var item := ITEM_SCENE.instantiate()
		item.position = Vector2(randf_range(50.0, get_viewport_rect().size.x - 50.0), -20.0)
		item.collected.connect(_on_item_collected)
		add_child(item)

	if caught >= GOAL:
		done = true
		Global.minigame_won()
	elif timer_end:
		done = true
		Global.minigame_lost()
