extends Area2D

@onready var game_manager = get_node("/root/Game/GameManager")

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	print("bullet hit asteroid")
	body.queue_free()
	queue_free()
	get_parent().queue_free()
	
	#Need to give a point for destroying the asteroid
