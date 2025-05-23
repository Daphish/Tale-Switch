extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	animated_sprite.connect("animation_finished", _on_animation_finished)

func _physics_process(delta):
	_player_actions(delta)

func _player_actions(_delta):
	if Input.is_action_just_pressed("attack_player"):
		animated_sprite.play("attack")
	if Input.is_action_just_pressed("receive_damage_player"):
		animated_sprite.play("receive-damage")

func _on_animation_finished():
	if animated_sprite.animation == "attack":
		animated_sprite.play("idle")
	if animated_sprite.animation == "receive-damage":
		animated_sprite.play("idle")
