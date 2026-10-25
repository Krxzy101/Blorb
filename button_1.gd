extends TextureButton

@onready var parent = $".."

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	hide()
	parent.buttons_pressed += 1
