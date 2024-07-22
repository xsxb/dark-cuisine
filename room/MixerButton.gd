extends TextureButton

@export var menu : Panel

func _ready():
	menu.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	menu.show()
