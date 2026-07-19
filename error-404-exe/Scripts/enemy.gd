extends CharacterBody2D


const SPEED = 100.0
@export var player : Node2D


func _physics_process(delta: float) -> void:
	#Where is the player
	var direction = (player.position - position).normalized()
	velocity = direction * SPEED
	move_and_slide()



func _on_area_2d_area_entered(area: Area2D) -> void:
	player.respawn()
