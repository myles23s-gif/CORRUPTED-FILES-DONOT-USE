extends CharacterBody2D


const SPEED = 200.0
# Save the starting position when the game loads
@onready var spawn_position: Vector2 = global_position

func respawn():
	# Reset the player's position back to the spawn
	global_position = spawn_position
	# Optional: Reset velocity to zero so the player doesn't keep falling/sliding
	velocity = Vector2.ZERO 


func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction = Input.get_vector("player_left","player_right","player_up","player_down")
	velocity = direction * SPEED
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		# Check if the object we hit is the specific CharacterBody2D
		if collider is CharacterBody2D and collider.name == "enemy":
			respawn()
