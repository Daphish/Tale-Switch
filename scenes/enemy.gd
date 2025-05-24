extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var health_bar = $HealthBar
var hp = 10

func _ready():
	animated_sprite.connect("animation_finished", _on_animation_finished)
	health_bar.value = hp

func _physics_process(_delta):
	pass

func take_damage():
	hp -= 5
	if hp <= 0:
		get_tree().call_deferred("change_scene_to_file", "res://scenes/win_screen.tscn")
	health_bar.value = hp
	if animated_sprite.animation != "receive-damage":
		animated_sprite.play("receive-damage")

func attack():
	if animated_sprite.animation != "attack":
		animated_sprite.play("attack")

func _on_animation_finished():
	if animated_sprite.animation == "attack" or animated_sprite.animation == "receive-damage":
		animated_sprite.play("idle")
