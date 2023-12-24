extends Node

var score := 0
@onready var rich_text_label = $ScoreLabel
@onready var conductor = $Conductor
var enemy = preload("res://scenes/goblin.tscn")
var rng = RandomNumberGenerator.new()
@onready var top = $top
@onready var down = $down
@onready var mid = $mid
var combo = 1
var maxCombo = 1
@onready var combo_label = $ComboLabel
@onready var game_over = $GameOver

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	game_over.hide()
	conductor.play_with_beat_offset(8)
	print(conductor.secPerBeat * 8) 

func increase_score(value):
	if value == 0:
		combo = 1
	else:
		combo += 1
	score = score + value * combo
	rich_text_label.text = str("Score: ", score)
	combo_label.text = str("Combo x", combo)
	if combo > maxCombo:
		maxCombo = combo

func _on_conductor_beat_signal(position):
	var lane = rng.randi_range(0, 2)
	var enemy_instance = enemy.instantiate()
	if lane == 0:
		enemy_instance.global_position = top.global_position
	elif lane == 1:
		enemy_instance.global_position = mid.global_position
	elif lane == 2:
		enemy_instance.global_position = down.global_position
	enemy_instance.global_position.x = 1000
	enemy_instance.global_position.y -= 10
	enemy_instance.speed = (enemy_instance.global_position.x - 85) / 3.60902255639098
	add_child(enemy_instance)

func _on_conductor_finished():
	get_tree().paused = true
	game_over.show()
	game_over.scoreLabel.text = str("Score: ", score, "\n", "Max Combo: ", maxCombo)
