extends Node

var score := 0
@onready var rich_text_label = $RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func increase_score(value):
	score += value
	rich_text_label.text = str("Score: ", score)