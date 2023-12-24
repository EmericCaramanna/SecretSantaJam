extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var rich_text_label = $Node2D/RichTextLabel
@onready var animation_player = $AnimationPlayer

var speed = 100
var direction = Vector2.LEFT
var dead = false

func _physics_process(delta):
	if dead == false:
		var velocity = direction * speed * delta
		global_position = global_position + velocity
	if global_position.x < -100:
		queue_free()

func kill():
	dead = true
	animated_sprite_2d.play("death")
	animation_player.play("TextAnimation")

func _on_animation_player_animation_finished(anim_name):
	queue_free()
