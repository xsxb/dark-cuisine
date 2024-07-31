extends Inventory


func _ready():
	pass

#Because Godot loading stuff is strange
func _on_inventory_management_ready():
	inventory_management.get_inventories()


#Fucking ridiculous load order workaround
func _on_timer_timeout():
	init()
	
