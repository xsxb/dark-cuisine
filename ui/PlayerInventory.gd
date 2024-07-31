extends Inventory


func _ready():
	init()
	
	inv_id = 1
	inv_data = {
		0 : [1,1],
		1 : [2,1]
	}
	
	#Manually filling inventory with test items:
	add_item(14)
	add_item(21)
	add_item(20)
	add_item(8)


func _process(delta):
	pass

#Because Godot loading stuff is strange
func _on_inventory_management_ready():
	#Update inventories
	inventory_management.get_inventories()
