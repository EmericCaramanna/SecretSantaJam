extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@export var action := ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed(action):
		animated_sprite_2d.play("attack")

func _on_animated_sprite_2d_animation_finished():
	animated_sprite_2d.play("idle")
