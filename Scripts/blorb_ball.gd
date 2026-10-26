extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if not (body is CharacterBody2D):
		return

	var game := get_tree().current_scene
	if game.has_method("blorbball_collect"):
		game.blorbball_collect()
	else:
		print("blorbball_collect not found on: ", game)

	set_deferred("monitoring", false)
	queue_free()
