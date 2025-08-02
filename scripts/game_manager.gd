extends Node

var score = 0
@onready var score_label: Label = $ScoreLabel
@onready var timer = get_node("/root/Game/AsteroidSpawner/Timer")
var half = true
var quarter = true

func add_point():
	score += 1
	score_label.text = "Score: " + str(score)
	if score > 10 and half:
		half = false
		timer.wait_time = .5
	if score > 20 and quarter:
		quarter = false
		timer.wait_time = .25
