extends Inventory


func _ready():
	init()
	
	inv_id = 1
	inv_data = {
		0 : [1,1],
		1 : [2,1]
	}

	#set_item(0,1)


func _process(delta):
	pass
