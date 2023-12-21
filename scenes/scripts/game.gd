extends Node

var enemy = preload("res://scenes/goblin.tscn")
@onready var top = $top
@onready var mid = $mid
@onready var down = $down
var rng = RandomNumberGenerator.new()

signal finished()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_conductor_beat_signal(position):
	print(position)
	var lane = rng.randi_range(0, 2)
	var enemy_instance = enemy.instantiate()
	if lane == 0:
		enemy_instance.global_position = top.global_position
	elif lane == 1:
		enemy_instance.global_position = mid.global_position
	elif lane == 2:
		enemy_instance.global_position = down.global_position
	enemy_instance.speed = (enemy_instance.global_position.x - 85) /3
	add_child(enemy_instance)

func _on_conductor_finished():
	emit_signal("finished")
