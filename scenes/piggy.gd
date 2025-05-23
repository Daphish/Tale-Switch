extends Area2D

@export var speed = 200

func _process(delta):
	position.x += speed * delta
	if position.x > 1000:
		queue_free()
