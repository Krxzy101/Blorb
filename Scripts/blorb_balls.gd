extends Node2D
@onready var player: CharacterBody2D = $"../Player"
@onready var self_area = $Area2D
@onready var player_area = $"../Player/Area2D"

signal blorbballs_collected

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:

		if player_area.overlaps_area(self_area):
			if self.visible:
					emit_signal("blorbballs_collected")
					self.hide()
