extends TextureButton

@export var menu : Control
@export var sfx : AudioStreamPlayer2D

var open_sound = preload("res://assets/sfx/doors/sfx100v2_misc_04.ogg")
var close_sound = preload("res://assets/sfx/doors/sfx100v2_misc_13.ogg")

# Called when the node enters the scene tree for the first time.
func _ready():
	menu.hide()


func _on_pressed():
	pass
	#sfx.stream = open_sound
	#sfx.play()
	#menu.show()


func _on_close_button_pressed():
	pass
	#sfx.stream = close_sound
	#sfx.play()
	#menu.hide()
