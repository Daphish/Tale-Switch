extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InterfacePlayer._play_music_interface()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/story_screen2.tscn")
