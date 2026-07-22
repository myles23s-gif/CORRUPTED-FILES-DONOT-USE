extends CharacterBody2D


const SPEED = 200.0
# Save the starting position when the game loads
@onready var spawn_position: Vector2 = global_position

func respawn():
	# Reset the player's position back to the spawn
	global_position = spawn_position
	# Optional: Reset velocity to zero so the player doesn't keep falling/sliding
	velocity = Vector2.ZERO 


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemies"):
		respawn()
		
