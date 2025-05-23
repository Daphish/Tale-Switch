extends Node2D

func spawn_projectile(target: String):
	var proj = preload("res://scenes/Projectile.tscn").instantiate()

	if target == "enemy":
		proj.target = $"../Enemy"
		proj.global_position = $"../Player".global_position

	else:
		proj.target = $"../Player"
		proj.global_position = $"../Enemy".global_position

	add_child(proj)
