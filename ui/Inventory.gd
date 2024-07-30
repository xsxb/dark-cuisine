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

signal item_pressed(item_node)
signal empty_slot_clicked(slot_clicked)

func _ready():
	##Script will be attached to node after node is ready
	##_ready function will therefore not be called
	pass


#-----------------------------------------------------
func init():
	
	background_panel = get_child(0)
	container = background_panel.get_child(0)
	
	add_to_group("inventories")

	
	#Adjust menu size
	var container_seperation = Vector2()
	container.columns = columns
	container.position = Vector2(border,border)
	container_seperation = Vector2(4 * columns, 4 * rows) 	#GridContainer seperation is a constant set to 4px
	
	
	#Initiate slots:
	for x in rows:
		for y in columns:
			var inv_slot = inv_slot_scene.instantiate()
			container.add_child(inv_slot)
			inv_slot.inventory = self
			inv_slot.slot_clicked.connect(inventory_management.on_empty_slot_click)
			
	#Initiate inventory data:
	var slot_id = 0
	for x in rows:
		for y in columns:
			inv_data[slot_id] = [0,0]


#Returns item data from table [icon, name, description]
func get_item_data(id):
	if id < 1 || id > Global.item_table.size():
		return Global.item_table[-1]
		
	var item = Global.item_table[id]
	return item

func set_item_data(item_data, item):
	item.set_icon()

#Put item into inventory slot:
func set_item(slot_id : int, item_id : int, stack = 1):
	#Get relevant inventory slot:
	var slot = container.get_child(slot_id)
	
	#Instantiate item:
	var item_instance = item_scene.instantiate()
	slot.add_child(item_instance)
	item_instance.add_to_group("items")
	item_instance.inventory = self
	item_instance.inv_slot = slot_id
	
	#Fill with item data
	var item_data = get_item_data(item_id)
	item_instance.item_id = item_id
	item_instance.item_data = item_data
	item_instance.item_stack = stack
	item_instance.initialize_stats()
	
	item_instance.set_icon()
	item_instance.set_tooltip()
	
	
	#Update inventory data:
	inv_data[slot_id] = Vector2i(item_id,stack)
	
	#Connects button signal to inventory
	item_instance.item_pressed.connect(inventory_management._on_item_pressed)
#Add item to first free inventory slot
#Code will break on tree structure change in Item
func add_item(item_id : int, stack = 1):
	for slot in container.get_children():
		if slot.get_child(1):
			pass
		else:
			set_item(slot.get_index(),item_id, stack)
			break
		#print(inv_data[slot])

#Removes item from inventory by slot number
func remove_item_from_slot(slot_id : int, stack = 1):
	for child in container.get_child(slot_id).get_children():
			if child.is_in_group("items"):
				inv_data.erase(slot_id)
				child.queue_free()

#Removes item from inventory by item_id (first one it finds)
func remove_item(item_id : int, stack = 1):
	var item_nodes = get_item_nodes()
	for item in item_nodes:
		if item.item_id == item_id:
			inv_data.erase(item.get_index())
			item.queue_free()
			break

#Removes array of item objects
func remove_items(item_nodes : Array):
	for item in item_nodes:
		inv_data.erase(item.get_index())
		item.queue_free()
		

#Get item data from inventory slot:
func get_item(slot_id):
	return inv_data[slot_id]

#Returns array with all items nodes in inventory
func get_item_nodes():
	var item_array = []
	for slot in container.get_children():
		for child in slot.get_children():
			if child.is_in_group("items"):
				item_array.append(child)
	return item_array
	
	#var item_array = []
	#for x in inv_data:
		#item_array.append(inv_data[x])
	#return item_array
	
#Passes the pressed button on to inventory management
func _on_item_pressed(item):
	item_pressed.emit(item)
	
	#Update inventories
	inventory_management.get_inventories()
