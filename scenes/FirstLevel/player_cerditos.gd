extends CharacterBody2D

@onready var health_bar = get_node("../HealthBar")
var hp = 100
var cerditos = 0

func _ready():
	health_bar.value = hp
	

func _physics_process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 300
	elif Input.is_action_pressed("move_down"):
		velocity.y += 300
	
	# Límite de movimiento vertical (ajusta los valores según tu escena)
	var new_position = position + velocity * delta
	new_position.y = clamp(new_position.y, -200, 160) # Cambia 50 y 400 según tu escenario
	
	position = new_position

func _on_brick_area_entered(area: Area2D) -> void:
	if area.is_in_group("obstaculo"):
		hp -= 5
		health_bar.value = hp
		if hp <= 0:
			get_tree().change_scene_to_file("res://scenes/game_over1.tscn")
		area.queue_free()


func _on_piggy_area_entered(area: Area2D) -> void:
	if area.is_in_group("cerdito"):
		cerditos += 1
		if cerditos == 10:
			get_tree().change_scene_to_file("res://scenes/second_instruction.tscn")
		area.queue_free()
