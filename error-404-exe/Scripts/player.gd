extends CharacterBody2D

var start_position = Vector2(581,327)

const SPEED = 200.0

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction = Input.get_vector("player_left","player_right","player_up","player_down")
	velocity = direction * SPEED
	move_and_slide()

func respawn():
	position = start_position
