extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

var target: Node2D  # ✅ Necesario para evitar el error
var speed: float = 400.0

func _ready():
	animated_sprite.connect("animation_finished", _on_animation_finished)

func _physics_process(delta):
	_move_toward_target(delta)
	_player_actions(delta)

func _move_toward_target(delta):
	if target and is_instance_valid(target):
		var dir = (target.global_position - global_position).normalized()
		position += dir * speed * delta
		if position.distance_to(target.global_position) < 10:
			animated_sprite.play("default")
			queue_free()

func _player_actions(_delta):
	if Input.is_action_just_pressed("attack_player"):
		animated_sprite.play("default")
	if Input.is_action_just_pressed("receive_damage_player"):
		animated_sprite.play("receive-damage")

func _on_animation_finished():
	if animated_sprite.animation == "attack":
		animated_sprite.play("idle")
	if animated_sprite.animation == "receive-damage":
		animated_sprite.play("idle")
