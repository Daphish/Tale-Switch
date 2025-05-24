extends Area2D

@onready var health_bar = get_node("../../HealthBar")  # Asegúrate de tener un Control llamado HealthBar arriba en el árbol
@onready var detector = get_node("../Detector")   # Area2D hijo del Player

var hp = 100
var cerditos = 0

func _ready():
	health_bar.value = hp

	# Conectar la señal del Detector solo si no está conectada
	#if not detector.is_connected("area_entered", Callable(self, "_on_detector_area_entered")):
	#	detector.connect("area_entered", Callable(self, "_on_detector_area_entered"))
func _physics_process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 300
	elif Input.is_action_pressed("move_down"):
		velocity.y += 300
	
	var new_position = position + velocity * delta
	new_position.y = clamp(new_position.y, -200, 160)  # Ajusta límites según el diseño de tu juego
	
	position = new_position


func _on_detector_area_entered(area: Area2D) -> void:
	print("🎯 Colisión con:", area.name)
	if area.is_in_group("cerdito"):
		cerditos += 1
		print("🐷 atrapaste cerdito:", cerditos)
		area.queue_free()
		if cerditos == 10:
			get_tree().change_scene_to_file("res://scenes/second_instruction.tscn")
	elif area.is_in_group("obstaculo"):
		hp -= 5
		health_bar.value = hp
		print("💥 tocaste obstáculo, vida restante:", hp)
		area.queue_free()
		if hp <= 0:
			get_tree().change_scene_to_file("res://scenes/game_over1.tscn")


func _on_piggy_area_entered(area: Area2D) -> void:
	cerditos += 1
	print("🐷 atrapaste cerdito:", cerditos)
	area.queue_free()

func piggy_collition():
	cerditos += 1
	print("🐷 atrapaste cerdito:", cerditos)
