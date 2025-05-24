extends Node2D

@export var word_scene: PackedScene
@export var word_list: Array[String] = [
	"cuento", "libreria", "estante", "principe", "princesa",
	"castillo", "dragon", "hechizo", "bosque", "aventura",
	"hada", "espada", "bruja", "autor", "poesia",
	"letras", "lectura", "pagina", "sabio", "pergamino", "lobo",
	"caperuza", "fantasia", "caldero", "magia", "novela"
]

var current_word_node: Node2D = null

func _ready():
	randomize()
	spawn_word()

func spawn_word():
	if current_word_node and current_word_node.is_inside_tree():
		current_word_node.queue_free()

	current_word_node = word_scene.instantiate()
	var new_word = word_list[randi() % word_list.size()]
	current_word_node.word = new_word
	var y_pos = randf_range(650.0, 780.0)
	current_word_node.position = Vector2(1000, y_pos)
	




	current_word_node.connect("word_missed", Callable(self, "_on_word_missed"))
	current_word_node.connect("word_guessed", Callable(self, "_on_word_guessed"))

	add_child(current_word_node)

func _on_word_missed(_word):
	$"/root/lvl1/wrong".play()
	get_tree().call_group("projectiles", "launch_at_player")
	spawn_word()
	

func _on_word_guessed(_word):
	$"/root/lvl1/bell".play()
	get_tree().call_group("projectiles", "launch_at_enemy")
	call_deferred("spawn_word")
