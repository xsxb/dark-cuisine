extends Node

##Moved node to bottom of scene tree to change initialisation order

var inventories #: Array of inventory nodes

#Item pickup stuff
@export var picked_up_sprite : Sprite2D
@export var scaled_icon_size : Vector2 = Vector2(64,64)
var picked_up_item : Node
var picked_item : bool = false
var orig_icon_size
var icon_scale

signal item_pickup_cancel

func _ready():
	get_inventories()
	item_pickup_cancel.connect(on_item_pickup_canceled)

func _process(delta):
	if picked_item:
		picked_up_sprite.global_position = get_viewport().get_mouse_position()
	else:
		pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		picked_item = false
		item_pickup_cancel.emit()

#---------------------------------
func get_inventories():
	inventories = get_tree().get_nodes_in_group("inventories")

func _on_item_pressed(item_node):
	##Pickup:
	if !picked_item:
		picked_item = true
		print("picked up item:" , item_node.item_data["name"])
		picked_up_sprite.show()
		picked_up_item = item_node
		picked_up_sprite.texture = load(picked_up_item.item_data["icon"])
		picked_up_sprite.global_position = get_viewport().get_mouse_position()
	
		#Scale image size to icon size:
		orig_icon_size = picked_up_sprite.texture.get_size()
		icon_scale = scaled_icon_size/orig_icon_size
		picked_up_sprite.scale = icon_scale

	##Drop item:
	if picked_item:
		pass
	#	print(picked_up_item)
	#	picked_up_sprite.hide()
	#	picked_up_sprite.texture = null

func on_item_pickup_canceled():
	picked_item = false
	picked_up_sprite.hide()
