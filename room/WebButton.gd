extends TextureButton

@export var menu : Control
@export var sfx : AudioStreamPlayer2D

func _ready():
	menu.hide()

func _on_pressed():
	sfx.play()
	menu.show()

func _on_button_pressed():
	menu.hide()
