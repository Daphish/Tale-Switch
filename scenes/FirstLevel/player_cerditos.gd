extends CharacterBody2D

@onready var health_bar = get_node("../HealthBar")
var hp = 100

func _ready():
	health_bar.value = hp
	

func _physics_process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 400
	elif Input.is_action_pressed("move_down"):
		velocity.y += 400
	
	# Límite de movimiento vertical (ajusta los valores según tu escena)
	var new_position = position + velocity * delta
	new_position.y = clamp(new_position.y, -200, 160) # Cambia 50 y 400 según tu escenario
	
	position = new_position
