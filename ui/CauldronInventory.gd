extends Inventory


func _ready():
	pass

#Because Godot loading stuff is strange
func _on_inventory_management_ready():
	inventory_management.get_inventories()


#Fucking ridiculous load order workaround
func _on_timer_timeout():
	init()
	
	#Fill with test data
	set_item(0,7,1)
	set_item(1,6,1)
	set_item(2,5,1)
	set_item(3,22,6)
