extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
var perfect := false
var good := false
var okay := false
var note = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("top"):
		global_position.y = 100
		animated_sprite_2d.play("attack")
	if Input.is_action_just_pressed("mid"):
		global_position.y = 300
		animated_sprite_2d.play("attack")
	if Input.is_action_just_pressed("down"):
		global_position.y = 500
		animated_sprite_2d.play("attack")

func _on_animated_sprite_2d_animation_finished():
	animated_sprite_2d.play("idle")
