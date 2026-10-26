extends Node2D

const PRESSES_NEEDED := 20
const TIME_LIMIT := 5.0

@onready var themed_timer: Node2D = $ThemedTimer
@onready var counter_label: Label = $CounterLabel

var presses := 0
var timer_end := false
var done := false

func _ready() -> void:
	update_counter()
	themed_timer.start_timer(TIME_LIMIT)
	await get_tree().create_timer(TIME_LIMIT).timeout
	timer_end = true
func update_counter() -> void:
	counter_label.text = str(max(PRESSES_NEEDED - presses, 0)) + "left"

func _process(_delta: float) -> void:
	if done:
		return

	if Input.is_action_just_pressed("ui_accept"):
		presses +=1
		update_counter()
		
	if presses >= PRESSES_NEEDED:
		done = true 
		Global.minigame_won()
	elif timer_end:
		done = true
		Global.minigame_lost()
		
	
