extends Node

##Moved node to bottom of scene tree to change initialisation order

var inventories #: Array of inventory nodes

func _ready():
	get_inventories()

func _process(delta):
	pass

#---------------------------------
func get_inventories():
	inventories = get_tree().get_nodes_in_group("inventories")

func _on_item_pressed():
	pass

func drag_item(item_instance_id):
	pass
	
func drop_item(item_instance_id):
	pass

