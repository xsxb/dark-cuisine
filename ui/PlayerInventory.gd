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
	set_item(2,16,3)
	set_item(3,17,3)
	set_item(4,20,15)
	remove_item_from_slot(0)


func _process(delta):
	pass

#Because Godot loading stuff is strange
func _on_inventory_management_ready():
	#Update inventories
	inventory_management.get_inventories()
