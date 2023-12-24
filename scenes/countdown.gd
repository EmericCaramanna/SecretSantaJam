extends Node2D

@onready var rich_text_label = $RichTextLabel
@onready var timer = $Timer
var secs := 50
var min := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = 3.6
	timer.start()

func _on_timer_timeout():
	secs -= 1
	if secs < 0:
		min = 0
		secs = 59
	if secs > 9:
		rich_text_label.text = str("0", min, ":", secs)
	else :
		rich_text_label.text = str("0", min, ":", "0", secs)
	timer.wait_time = 1
	timer.start()
