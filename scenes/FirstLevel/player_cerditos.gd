func _on_body_entered(body):
	if body.is_in_group("cerdito"):
		print("🐷 atrapaste un cerdito")
		body.queue_free()
	elif body.is_in_group("obstaculo"):
		print("💥 chocaste con un obstáculo")
		body.queue_free()
