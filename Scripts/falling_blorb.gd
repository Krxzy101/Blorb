extends Area2D

var speed := 250.0

signal collected

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		collected.emit()
		queue_free()
		
func _process (delta: float) -> void:
	position.y += speed * delta
	if position.y > get_viewport_rect().size.y + 50:
			queue_free()
