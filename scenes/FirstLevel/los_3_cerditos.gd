extends Node2D

var screen_size : Vector2i
var piggy_scene = preload("res://scenes/FirstLevel/piggy.tscn")
var brick_scene = preload("res://scenes/FirstLevel/brick.tscn")
var obstacle_types := [piggy_scene, brick_scene]
var obstacles : Array
var last_obs
var cerditos = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InterfacePlayer._stop_music_interface()
	screen_size = get_window().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	generate_obs()
	
	for obs in obstacles:
		if obs.position.x < ($Camera2D.position.x - screen_size.x):
			remove_obs(obs)
	$Contador.text = "Cerditos atrapados: %d" % cerditos

func generate_obs():
	if obstacles.is_empty() or last_obs.position.x < randi_range(-800, 200):
		var obs_type = obstacle_types[randi() % obstacle_types.size()]
		var obs = obs_type.instantiate()
		last_obs = obs
		var obs_height = randi_range(-200, 160)
		obs.position = Vector2i(600, obs_height)
		obs.body_entered.connect(hit_obs.bind(obs))
		add_child(obs)
		obstacles.append(obs)

func remove_obs(obs):
	obs.queue_free()
	obstacles.erase(obs)

func hit_obs(body, obstacle):
	if body.name == 'Player':
		if obstacle.type == "brick":
			body.hp -= 10
			body.health_bar.value = body.hp
			if body.hp <= 0:
				get_tree().call_deferred("change_scene_to_file", "res://scenes/game_over1.tscn")
			else:
				$Wrong.play()
		elif obstacle.type == "piggy":
			cerditos += 1
			if cerditos >= 1:
				get_tree().call_deferred("change_scene_to_file", "res://scenes/second_instruction.tscn")
			else:
				$Bell.play()
		
		remove_obs(obstacle)
