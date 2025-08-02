extends CharacterBody2D

var bullet_path=preload("res://scenes/bullet.tscn")
const SPEED = 200.0

var fire_rate = 0.2  # seconds between shots
var time_since_last_shot = 0.0

#@onready var screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("shoot"):
		time_since_last_shot += delta
		if time_since_last_shot >= fire_rate:
			fire()
			time_since_last_shot = 0
	else:
		time_since_last_shot = fire_rate  # Reset to allow immediate fire on next press
	
	#move up and down
	#i think this is inverse since the x y axis are inverse
	var vertical := Input.get_axis("move_up", "move_down")
	if vertical:
		velocity.y = vertical * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	# Get the input direction and handle the movement/deceleration.
	# move left and right
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	screen_wrap()

func fire():
	var projectile = bullet_path.instantiate()
	projectile.dir = rotation
	projectile.pos = $"Shooting Position".global_position
	projectile.rota=global_rotation
	get_parent().add_child(projectile)

func screen_wrap(): 
	var zoom = $"../Camera2D".zoom
	var screen_size = get_viewport_rect().size
	position.x = wrapf(position.x, 0, screen_size.x / zoom.x)
	position.y = wrapf(position.y, 0, screen_size.y / zoom.y)
