extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

var target: Node2D  # ✅ Necesario para evitar el error
var speed: float = 400.0

func _physics_process(delta):
	_move_toward_target(delta)

func _move_toward_target(delta):
	if target and is_instance_valid(target):
		var dir = (target.global_position - global_position).normalized()
		position += dir * speed * delta	
	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()
