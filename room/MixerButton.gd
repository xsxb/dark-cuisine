extends TextureButton

@export var menu : Panel

func _ready():
	menu.hide()

>>>>>>> eb1ab0f6592cc1f39a04a58ff5d236416ae1298c
=======
func _ready():
	menu.hide()

>>>>>>> eb1ab0f6592cc1f39a04a58ff5d236416ae1298c
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	menu.show()
