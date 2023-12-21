extends Node2D

var speed = 0
var direction = Vector2.LEFT

func _physics_process(delta):
	var velocity = direction * speed * delta
	global_position = global_position + velocity
