
extends CharacterBody2D

var speed = 200.0
var run_speed = 400.0

var gravity = 500.0
var jump_speed = 500.0
var jump_cut = 0.5


var respawn_position = Vector2(100, 50)


var fall_limit = 800.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var direccion = Input.get_axis("Izquierda", "Derecha")

	if Input.is_key_pressed(KEY_SHIFT):
		velocity.x = direccion * run_speed
	else:
		velocity.x = direccion * speed

	if Input.is_action_just_pressed("Salta") and is_on_floor():
		velocity.y = -jump_speed

	if Input.is_action_just_released("Salta") and velocity.y < 0:
		velocity.y *= jump_cut

	move_and_slide()

  
	if global_position.y > fall_limit:
		global_position = respawn_position
		velocity = Vector2.ZERO

	
	 
