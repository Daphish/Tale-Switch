extends Node2D

signal word_missed(word: String)
signal word_guessed(word: String)

var word = ""
var speed = 100

func _ready():
	if has_node("WordText"):
		$WordText.text = word
	else:
		print("❌ ERROR: No se encontró 'WordText'")


func _process(delta):
	position.x -= speed * delta
	if position.x < 0:
		emit_signal("word_missed", word)
		queue_free()
