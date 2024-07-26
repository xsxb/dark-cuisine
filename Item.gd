extends Node2D

class_name Item

#Icon:
var sprite : Sprite2D
var icon : Texture2D
var scaled_icon_size : Vector2 = Vector2(64,64)

var orig_icon_size : Vector2
var icon_scale : Vector2

#Item data:
var item_data
var item_id : int
var max_stack_size : int

##Below instanced data will be stored in Global.gd
#var item_instance_id : int
#var inventory_id : int # ID of inventory where item is located at
#var inventory_slot : int # Slot number in inventory

func _ready():
	
	icon = item_data["icon"]
	sprite.texture = icon
	
	#Scale image size to icon size:
	orig_icon_size = sprite.texture.get_size()
	icon_scale = scaled_icon_size/orig_icon_size
	sprite.scale = icon_scale

