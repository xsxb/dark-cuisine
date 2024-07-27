extends Control

class_name Inventory

#Inventory data:
@export var inv_id : int
var inv_data = {}	#slot_id : [item_id, stack]

#Define inventory size:
@export var columns : int = 8
@export var rows : int = 1
@export var border : int = 10
@export var slot_size = Vector2(64,64)

#Nodes:
@export var inventory_management : Node
var container : GridContainer
var background_panel : Panel
var inv_slot_scene = preload("res://ui/inventory_slot.tscn")
var item_scene = preload ("res://item.tscn")
var item_script = preload("res://Item.gd")

func _ready():
	##Script will be attached to node after node is ready
	##_ready function will therefore not be called
	pass


#-----------------------------------------------------
func init():
	
	background_panel = get_child(0)
	container = background_panel.get_child(0)
	
	add_to_group("inventories")
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

	#Update inventories
	inventory_management.get_inventories()


#Returns item data from table [icon, name, description]
func get_item_data(id):
	var item = Global.item_table[id]
	return item

func set_item_data(item_data, item):
	item.set_icon()

#Put item into inventory slot:
func set_item(slot_id, item_id, stack):
	#Get relevant inventory slot:
	var slot = container.get_child(slot_id)
	
	#Instantiate item:
	var item_instance = item_scene.instantiate()
	slot.add_child(item_instance)
	#item_instance.script = item_script.new()
	
	#Fill with item data
	var item_data = get_item_data(item_id)
	item_instance.item_data = item_data
	item_instance.item_stack = stack
	item_instance.set_icon()
	item_instance.set_tooltip()

#Get item data from inventory slot:
func get_item(slot_id):
	return inv_data[slot_id]
