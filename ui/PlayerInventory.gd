extends Inventory


func _ready():
	init()
	
	inv_id = 1
	inv_data = {
		0 : [1,1],
		1 : [2,1]
	}
	
	#Manually filling inventory with test items:
	set_item(0,1,1)
	set_item(1,2,5)
	set_item(2,1,3)


func _process(delta):
	pass
