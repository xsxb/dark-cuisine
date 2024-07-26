extends Node

var inventories #: Array #array of nodes

func _ready():
	get_inventories()

func _process(delta):
	pass

#---------------------------------
func get_inventories():
	inventories = get_tree().get_nodes_in_group("inventories")

func drag_item(item_instance_id):
	pass
	
func drop_item(item_instance_id):
	pass

