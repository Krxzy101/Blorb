
extends Node2D

const SHUFFLES := 6
const SHUFFLE_TIME := 0.25
const LIFT := 60.0

@onready var themed_timer: Node2D = $ThemedTimer
@onready var ball: Node2D = $Ball
@onready var info_label: Label = $InfoLabel
@onready var cups: Array = [$Cup1, $Cup2, $Cup3]

var ball_cup := 0
var can_pick := false
var done := false

func _ready() -> void:
	randomize()

	for cup in cups:
		cup.pressed.connect(_on_cup_pressed.bind(cup))

	ball_cup = randi() % cups.size()
	info_label.text = ""

	var first: Control = cups[ball_cup]
	ball.position = first.position + first.size / 2.0
	ball.show()
	first.position.y -= LIFT

	await get_tree().create_timer(1.0).timeout
	first.position.y += LIFT

	await get_tree().create_timer(0.3).timeout
	ball.hide()

	await shuffle()

	info_label.text = ""
	can_pick = true
	themed_timer.start_timer(5.0)

	await get_tree().create_timer(5.0).timeout

	if not done:
		finish(false, "")

func shuffle() -> void:
	for i in SHUFFLES:
		var a := randi() % cups.size()
		var b := (a + 1 + randi() % (cups.size() - 1)) % cups.size()

		var pos_a: Vector2 = cups[a].position
		var pos_b: Vector2 = cups[b].position

		var tween := create_tween().set_parallel(true)
		tween.tween_property(cups[a], "position", pos_b, SHUFFLE_TIME)
		tween.tween_property(cups[b], "position", pos_a, SHUFFLE_TIME)

		await tween.finished

func _on_cup_pressed(cup: Control) -> void:
	if not can_pick or done:
		return

	if cup == cups[ball_cup]:
		finish(true, "")
	else:
		finish(false, "")

func finish(won: bool, message: String) -> void:
	done = true
	can_pick = false
	info_label.text = message

	var winner: Control = cups[ball_cup]
	ball.position = winner.position + winner.size / 2.0
	ball.show()
	winner.position.y -= LIFT

	await get_tree().create_timer(1.0).timeout

	if won:
		Global.minigame_won()
	else:
		Global.minigame_lost()
