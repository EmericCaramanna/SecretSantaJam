extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !animated_sprite_2d.is_playing():
		animated_sprite_2d.play("idle")
	if Input.is_action_just_pressed("attack"):
		animated_sprite_2d.play("attack")
