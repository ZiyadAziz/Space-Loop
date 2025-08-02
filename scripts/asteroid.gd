extends CharacterBody2D

var target_pos: Vector2  # Player's position at spawn
var SPEED := 50.0

func _ready():
	# Calculate direction to target once at spawn
	var direction = (target_pos - global_position).normalized()
	velocity = direction * SPEED

	# Rotate to face direction of movement
	rotation = velocity.angle()

func _physics_process(delta):
	# Move the character using built-in movement function
	velocity = velocity.normalized() * SPEED  # Ensure consistent speed
	move_and_slide()
