extends CharacterBody2D


const SPEED = 200.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("player_left","player_right","player_up","player_down")
	velocity = direction * SPEED
	move_and_slide()
