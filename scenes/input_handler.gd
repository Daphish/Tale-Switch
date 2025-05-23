extends Node

@onready var input = $"../UI/WordInput"
@onready var spawner = $"../WordSpawner"
@onready var projectiles = $"../ProjectileContainer"

func _ready():
	input.grab_focus()



func _process(delta):
	if not input.has_focus():
		input.grab_focus()

	if Input.is_action_just_pressed("ui_accept"):
		var typed = input.text.strip_edges()
		input.text = ""
		
		if spawner.current_word_node and spawner.current_word_node.word == typed:
			spawner.current_word_node.emit_signal("word_guessed", typed)
			spawner.current_word_node.queue_free()
			projectiles.spawn_projectile("enemy")
		else:
			projectiles.spawn_projectile("player")
			
	call_deferred("_restore_focus")
	
func _restore_focus():
	input.grab_focus()
