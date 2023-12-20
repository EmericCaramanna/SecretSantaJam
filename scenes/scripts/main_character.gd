extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
var perfect := false
var good := false
var okay := false
var notes := []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("attack"):
		animated_sprite_2d.play("attack")

func _on_animated_sprite_2d_animation_finished():
	animated_sprite_2d.play("idle")


func _on_perfect_area_body_entered(body):
	perfect = true

func _on_perfect_area_body_exited(body):
	perfect = false

func _on_good_area_body_entered(body):
	good = true

func _on_good_area_body_exited(body):
	good = false

func _on_okay_area_body_entered(body):
	okay = true
	notes.push_back(body)

func _on_okay_area_body_exited(body):
	okay = false
	notes.pop_front()
