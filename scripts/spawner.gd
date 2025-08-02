extends Node2D

@onready var player: CharacterBody2D = $"../Player"
@onready var game = get_node("/root/Game")
var asteroid_scene := preload("res://scenes/asteroid.tscn")
var spawn_points:= []

# Called when the node enters the scene tree for the first time.
func _ready():
	#adds all the spawn points to an array
	for i in get_children(): 
		if i is Marker2D:
			spawn_points.append(i)

func _on_timer_timeout():
	#pick a random spawn point
	var spawn = spawn_points[randi() % spawn_points.size()]
	
	#spawn asteroid
	var asteroid = asteroid_scene.instantiate()
	asteroid.position = spawn.position
	asteroid.target_pos = player.global_position
	game.add_child(asteroid)
