extends CharacterBody2D


const SPEED = 200.0
const DASHSPEED = 400.0

# seeing if you are dashing
var dash_time: bool = false
var is_dashing: bool = false
var dash_direction: Vector2 = Vector2.ZERO

# Save the starting position when the game loads
@onready var spawn_position: Vector2 = global_position
# dash cooldown timer and the dash time
@onready var dash_timer: Timer = $DashTimer
@onready var dash_cooldown: Timer = $DashCooldownTimer


func respawn():
	# Reset the player's position back to the spawn
	global_position = spawn_position
	# Optional: Reset velocity to zero so the player doesn't keep falling/sliding
	velocity = Vector2.ZERO 


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemies"):
		respawn()
		
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	var direction = Input.get_vector("player_left","player_right","player_up","player_down")

	if dash_time == false:
		if Input.is_action_just_pressed("player_dash") and not is_dashing:
			if direction == Vector2.ZERO:
				dash_direction = Vector2.RIGHT
			else:
				dash_direction = direction.normalized()
				
				is_dashing = true
				dash_time = true
				dash_timer.start()
				dash_cooldown.start()
	if is_dashing:
		velocity = dash_direction * DASHSPEED
	else:
		if direction != Vector2.ZERO:
			velocity = direction * SPEED
		else:
			velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	move_and_slide()



func _on_dash_timer_timeout() -> void:
	is_dashing = false
	



func _on_dash_cooldown_timer_timeout() -> void:
	dash_time = false
