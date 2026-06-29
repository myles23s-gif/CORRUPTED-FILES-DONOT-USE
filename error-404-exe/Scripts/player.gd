extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("player_down"):
		position.y += 3
	
	if Input.is_action_pressed("player_up"):
		position.y -= 3
	
	if Input.is_action_pressed("player_left"):
		position.x -= 3
	
	if Input.is_action_pressed("player_right"):
		position.x += 3

	if Input.is_action_just_pressed("player_dash") and Input.is_action_pressed("player_down"):
		position.y += 50
		
	if Input.is_action_just_pressed("player_dash") and Input.is_action_pressed("player_up"):
		position.y -= 50
		
	if Input.is_action_just_pressed("player_dash") and Input.is_action_pressed("player_left"):
		position.x -= 50
		
	if Input.is_action_just_pressed("player_dash") and Input.is_action_pressed("player_right"):
		position.x += 50
