extends TextureButton

@export var sprite : Sprite2D
@export var audio : AudioStreamPlayer2D

var open_sound = preload("res://assets/sfx/book/book_04.ogg")
var close_sound = preload("res://assets/sfx/book/book_02.ogg")


func _ready():
	sprite.hide()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		audio.stream = close_sound
		audio.play()
		sprite.hide()

func _on_pressed():
	sprite.show()
	audio.stream = open_sound
	audio.pitch_scale = 1
	audio.play()
