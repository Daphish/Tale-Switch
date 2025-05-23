extends Node2D

@export var piggy_scene: PackedScene
@export var obstacle_scene: PackedScene

func _ready():
	spawn_timer()

func spawn_timer():
	spawn_object()
	await get_tree().create_timer(1.5).timeout
	spawn_timer()

func spawn_object():
	var tipo = randi() % 3
	var objeto

	if tipo == 0:
		objeto = piggy_scene.instantiate()
		objeto.add_to_group("cerdito")
	elif tipo == 1 or tipo == 2:
		objeto = obstacle_scene.instantiate()
		objeto.add_to_group("obstaculo")

	objeto.position = Vector2(-50, randf_range(100, 500))
	get_parent().get_node("ItemContainer").add_child(objeto)
