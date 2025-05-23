extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	animated_sprite.connect("animation_finished", _on_animation_finished)

func _physics_process(delta):
	pass

func take_damage():
	if animated_sprite.animation != "receive-damage":
		animated_sprite.play("receive-damage")

func attack():
	if animated_sprite.animation != "attack":
		animated_sprite.play("attack")

func _on_animation_finished():
	if animated_sprite.animation == "attack" or animated_sprite.animation == "receive-damage":
		animated_sprite.play("idle")
