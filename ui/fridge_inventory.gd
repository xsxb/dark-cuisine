extends Inventory


func refresh_items():
	set_item(0, 1)
	set_item(1, 2)
	set_item(2, 4)
	set_item(3, 6)
	set_item(4, 8)
	set_item(5, 11)
	set_item(6, 14)
	set_item(7, 16)
	set_item(8, 20)
	set_item(9, 21)
	set_item(10, 23)
	set_item(11, 24)

func _ready():
	init()
	refresh_items()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
