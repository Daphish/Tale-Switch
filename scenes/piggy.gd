extends Area2D

@export var speed = 300
@export var is_cerdito := false  # Configurar esto en el inspector para cada escena

func _ready():
	# Añade automáticamente al grupo correspondiente
	if is_cerdito:
		add_to_group("cerdito")
	else:
		add_to_group("obstaculo")

func _process(delta):
	position.x -= speed * delta
	if position.x < -1000:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.has_method("piggy_collition"):
		area.take_damage()
	queue_free()
