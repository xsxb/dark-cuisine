extends Node2D

class_name Item

#Icon:
@export var button : TextureButton
@export var stack_label : Label
var icon_path : String
var icon_size : Vector2 = Vector2(64,64)

#Item data:
var item_data
var item_id : int = 0
var max_stack_size : int

#Item instanced data:
var item_stack : int
var item_instance_id : int

##Below instanced data will be stored in respective inventory
#var inventory_id : int # ID of inventory where item is located at
#var inventory_slot : int # Slot number in inventory


func _ready():
	##DEBUG
	pass
	

func update_stack():
	stack_label.text = str(item_stack)

func set_icon():
	button.size = icon_size
	
	#Get icon from path and assign it button
	icon_path = item_data["icon"]
	button.texture_normal = load(icon_path)
	button.texture_disabled = load(icon_path)
	button.texture_hover = load(icon_path)
	button.texture_pressed = load(icon_path)
	
	update_stack()
	
	##Old code using Sprite2D
	#sprite.texture = load(icon_path)
	#Scale image size to icon size:
	#orig_icon_size = sprite.texture.get_size()
	#icon_scale = scaled_icon_size/orig_icon_size
	#sprite.scale = icon_scale

func set_tooltip():
	
	#Ugly tooltip style from tutorial:
	var style_box = StyleBoxFlat.new()
	style_box.set_bg_color(Color(0, 0, 0))
	style_box.set_border_width_all(2)
	button.theme.set_stylebox("panel", "TooltipPanel", style_box)
	button.theme.set_color("font_color", "TooltipLabel", Color(1, 1, 1))
	
	#Tooltip data
	button.tooltip_text = item_data["name"] + "\n" + item_data["description"]
	
	pass 

#For custom tooltip, to be implemented later
func showtooltip():
	pass

#For custom tooltip, to be implemented later
func _on_texture_button_mouse_entered():
	showtooltip()
