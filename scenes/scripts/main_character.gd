extends CharacterBody2D

const SPEED = 100.0
const WEAPON_RADIUS = 2

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animations = $animations
@onready var weapon = $weapon

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "top", "down")
	if direction:
		velocity = direction * SPEED
		animated_sprite_2d.animation = "walking"
		if velocity.x > 0:
			animated_sprite_2d.flip_h = false
		else :
			animated_sprite_2d.flip_h = true
	else:
		velocity = Vector2.ZERO
		animated_sprite_2d.animation = "default"
	move_and_slide()

	var mouse_position = get_global_mouse_position()
	weapon.look_at(mouse_position)
	if Input.is_action_just_pressed("attack"):
		animations.play("attack")
