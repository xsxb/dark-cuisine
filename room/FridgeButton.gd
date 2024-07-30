extends TextureButton

@export var menu : Control
# Called when the node enters the scene tree for the first time.
func _ready():
	menu.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	menu.show()


func _on_close_button_pressed():
	menu.hide()
