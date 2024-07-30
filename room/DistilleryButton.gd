extends TextureButton

@export var menu : Control

func _ready():
	menu.hide()


func _on_pressed():
	menu.show()


func _on_close_button_pressed():
	menu.hide()
