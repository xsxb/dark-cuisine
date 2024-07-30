extends TextureButton

@export var menu : Node

func _ready():
	menu.hide()

func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		menu.hide()

func _on_pressed():
	menu.show()


func _on_button_pressed():
	menu.hide()
