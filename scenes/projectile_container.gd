extends Node2D

func spawn_projectile(target: String):
	var proj = preload("res://scenes/projectile.tscn").instantiate()
	var offset = Vector2(100, 0)

	if target == "enemy":
		$"../Player".attack()
		proj.target = $"../Enemy"
		proj.global_position = $"../Player".global_position + offset

	else:
		$"../Enemy".attack()
		proj.target = $"../Player"
		proj.global_position = $"../Enemy".global_position - offset

	add_child(proj)
