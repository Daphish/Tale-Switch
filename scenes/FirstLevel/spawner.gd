extends Node2D

@export var piggy_scene: PackedScene = preload("res://scenes/piggy.tscn")
@export var obstacle_scene: PackedScene = preload("res://scenes/FirstLevel/area_2d.tscn")

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
		print("Cerdito instanciado, tiene script?: ", objeto.get_script() != null)
	elif tipo == 1 or tipo == 2:
		objeto = obstacle_scene.instantiate()
		objeto.add_to_group("obstaculo")
		print("Obstáculo instanciado, tiene script?: ", objeto.get_script() != null)

	objeto.position = Vector2(300, randf_range(-200, 160))
	get_parent().get_node("ItemContainer").add_child(objeto)
