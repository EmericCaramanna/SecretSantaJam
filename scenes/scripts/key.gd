extends Node2D

var perfect := false
var good := false
var okay := false
var note = null
@export var key := ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(key):
		if note != null:
			if perfect:
				get_parent().increase_score(3)
			elif good:
				get_parent().increase_score(2)
			elif okay:
				get_parent().increase_score(1)
			note.kill()
		else:
			get_parent().increase_score(0)

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
	note = body

func _on_okay_area_body_exited(body):
	okay = false
	note = body
