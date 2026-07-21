extends CharacterBody2D


const SPEED = 200.0
const DASHSPEED = 600.0

var dash_time: bool = false
var is_dashing: bool = false
var dash_direction: Vector2 = Vector2.ZERO

@onready var dash_timer: Timer = $DashTimer
@onready var dash_cooldown: Timer = $DashCooldownTimer


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
