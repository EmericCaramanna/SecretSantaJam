extends CanvasLayer

@onready var scoreLabel = $PanelContainer/MarginContainer/VBoxContainer/Score

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_home_pressed():
	get_tree().paused = true
	get_tree().change_scene_to_file("res://scenes/home.tscn")
