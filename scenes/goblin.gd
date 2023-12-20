extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var conductor = $Conductor
var projectile = preload("res://scenes/note.tscn")
@onready var spawning = $spawning

# Called when the node enters the scene tree for the first time.
func _ready():
	conductor.play_with_beat_offset(8)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_conductor_beat_signal(position):
	animated_sprite_2d.play("attack", 2.0)
	var projectile_instance = projectile.instantiate()
	projectile_instance.position = spawning.position
	projectile_instance.speed = 1000
	add_child(projectile_instance)


func _on_animated_sprite_2d_animation_finished():
	animated_sprite_2d.play("idle")
