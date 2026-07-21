extends CharacterBody2D


const SPEED = 100.0
@export var player : Node2D

func _physics_process(delta: float) -> void:
	#Where is the player
	var direction = (player.position - position).normalized()
	velocity = direction * SPEED
	move_and_slide()
