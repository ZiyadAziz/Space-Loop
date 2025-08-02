extends CharacterBody2D
var pos:Vector2
var rota:float
var dir:float
var SPEED = 210

#This script moves the bullet in the direction its rotated

#This sets the position and rotation
func _ready():
	global_position=pos
	global_rotation=rota

#I believe this moves the bullet
func _physics_process(delta):
	velocity=Vector2(SPEED,0).rotated(dir)
	move_and_slide()
	screen_wrap()

func screen_wrap(): 
	var zoom = $"../Camera2D".zoom
	var screen_size = get_viewport_rect().size
	position.x = wrapf(position.x, 0, screen_size.x / zoom.x)
	position.y = wrapf(position.y, 0, screen_size.y / zoom.y)
