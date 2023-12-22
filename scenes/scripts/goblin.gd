extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var speed = 100
var direction = Vector2.LEFT
var dead = false

func _physics_process(delta):
	if dead == false:
		var velocity = direction * speed * delta
		global_position = global_position + velocity
	if global_position.x < -100:
		queue_free()

func kill():
	dead = true
	animated_sprite_2d.play("death")

func _on_animated_sprite_2d_animation_finished():
	queue_free()
