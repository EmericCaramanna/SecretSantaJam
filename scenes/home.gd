extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_quit_pressed():
	get_tree().quit()
