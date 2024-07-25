extends Node2D

#Icon:
@export var sprite : Sprite2D
@export var icon : Texture2D
@export var scaled_icon_size : Vector2 = Vector2(40,40)

var orig_icon_size : Vector2
var icon_scale : Vector2

#Item data:
var item_id : int
var stack_count : int
var inventory_id : int # ID of inventory where item is located at
var inventory_slot : int # Slot number in inventory

func _ready():
	
	sprite.texture = icon
	
	#Scale image size to icon size:
	orig_icon_size = sprite.texture.get_size()
	icon_scale = scaled_icon_size/orig_icon_size
	sprite.scale = icon_scale


func _process(delta):
	pass
