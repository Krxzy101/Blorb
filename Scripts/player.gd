extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const BALL_RADIUS = 20.0
const ACCELERATION = 600.0
const FRICTION = 200.0
const AIR_SPIN_SLOWDOWN = 9.0
const LAND_SPIN_CATCHUP = 20.0  
var spin := 0.0
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION * delta)
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
	move_and_slide()
	if is_on_floor():
		spin = move_toward(spin, velocity.x / BALL_RADIUS, LAND_SPIN_CATCHUP * delta)
		spin = move_toward(spin, 0, AIR_SPIN_SLOWDOWN * delta)
	rotation += spin * delta
