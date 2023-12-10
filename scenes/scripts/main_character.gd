extends CharacterBody2D

const SPEED = 100.0
const WEAPON_RADIUS = 2

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var weapon = $weapon

func _ready():
	animation_player.connect("animation_finished",_on_weapon_attack_done,CONNECT_PERSIST)

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
	if Input.is_action_just_pressed("attack"):
		var mouse_position = get_global_mouse_position()
		var direction_to_mouse = mouse_position - global_position
		weapon.global_position = global_position + direction_to_mouse.normalized() * 10
		weapon.global_position.y += 2
		weapon.visible = true
		var angle = rad_to_deg(atan2(direction_to_mouse.y, direction_to_mouse.x))
		if angle > -45 && angle < 45:
			animation_player.play("attack_right")
		else : if angle >= 45 && angle < 135:
			animation_player.play("attack_down")
		else : if angle >= 135 || angle < -135:
			animation_player.play("attack_left")
		else : if angle >= -135 && angle <= -45:
			animation_player.play("attack_top")


func _on_weapon_attack_done(anmiation_name):
	weapon.visible = false
