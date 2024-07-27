extends Node2D

class_name Item

##TODO: Tooltip

#Icon:
@export var sprite : Sprite2D
var icon_path : String
var scaled_icon_size : Vector2 = Vector2(64,64)

var orig_icon_size : Vector2
var icon_scale : Vector2

#Item data:
var item_data
var item_id : int = 0
var max_stack_size : int

#Item instanced data:
var item_stack : int
var item_instance_id : int

##Below instanced data MIGHT be stored in respective inventory
#var item_instance_id : int
#var inventory_id : int # ID of inventory where item is located at
#var inventory_slot : int # Slot number in inventory


func _ready():
	##Script will be attached to node after node is ready
	##_ready function will therefore not be called
	pass
	
	
func set_icon():
	#Get icon from path and assign it to sprite
	icon_path = item_data["icon"]
	sprite.texture = load(icon_path)
	
	#Scale image size to icon size:
	orig_icon_size = sprite.texture.get_size()
	icon_scale = scaled_icon_size/orig_icon_size
	sprite.scale = icon_scale
