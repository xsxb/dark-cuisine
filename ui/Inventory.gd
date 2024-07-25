extends Control

#Inventory data:
var inv_id : int
var inv_data = {}	#slot_id : [item_id, stack]

#Define inventory size:
@export var columns : int
@export var rows : int
@export var border : int
@export var slot_size = Vector2(64,64)

#Nodes:
@export var container : GridContainer
@export var background_panel : Panel
var inv_slot_scene = preload("res://ui/inventory_slot.tscn")

func _ready():
	#Initiate inventory data:
	var slot_id = 0
	for x in rows:
		for y in columns:
			inv_data[slot_id] = [0,0]
	
	#Adjust menu size
	var container_seperation = Vector2()
	container.columns = columns
	container.position = Vector2(border,border)
	container_seperation = Vector2(4 * columns, 4 * rows) 	#GridContainer seperation is a constant set to 4px
	
	background_panel.size.x = rows * slot_size.x + 2*border + container_seperation.x
	background_panel.size.y = columns * slot_size.y + 2*border + container_seperation.y
	
	#Initiate slots:
	for x in rows:
		for y in columns:
			var inv_slot = inv_slot_scene.instantiate()
			container.add_child(inv_slot)

	#DEBUG:
	#for child in container.get_children():
	#	print(child.global_position)

#-----------------------------------------------------

#TODO: Put item into inventory slot:
func put_item(slot_id):
	var slot
	slot = container.get_child(slot_id)

#Get item data from inventory slot:
func get_item(slot_id):
	return inv_data[slot_id]
