extends TextureButton

class_name Item

var stat_scene = preload("res://cooking-system/Stats.tscn")

signal item_pressed(item_node)

#Icon:
@export var stack_label : Label
@export var highlight : Panel
var icon_path : String
var icon_size : Vector2 = Vector2(64,64)

#Item data:
var item_data : Dictionary
var item_id : int
var max_stack_size : int

#Item instanced data:
var item_stack : int
var inventory : Inventory
var inv_slot : int

##Below instanced data will be stored in respective inventory
#var inventory_id : int # ID of inventory where item is located at
#var inventory_slot : int # Slot number in inventory


func _ready():
	##DEBUG
	pass
	

func update_stack():
	stack_label.text = str(item_stack)

func set_icon():
	size = icon_size
	
	#Get icon from path and assign it button
	icon_path = item_data["icon"]
	texture_normal = load(icon_path)
	
	update_stack()


func set_tooltip():
	
	#Ugly tooltip style from tutorial:
	var style_box = StyleBoxFlat.new()
	style_box.set_bg_color(Color(0, 0, 0))
	style_box.set_border_width_all(2)
	theme.set_stylebox("panel", "TooltipPanel", style_box)
	theme.set_color("font_color", "TooltipLabel", Color(1, 1, 1))
	
	#Tooltip data
	tooltip_text = item_data["name"] + "\n" + item_data["description"]


##Modulation colours:
#Dark red disabled:
#button.modulate = Color(0.5, 0.1, 0.2, 1.0)
#Dark disabled:
#button.modulate = Color(0.5, 0.5, 0.5, 1.0)


#Custom signal needed, because pressed signal doesn't pass parameter
func _on_pressed():
	item_pressed.emit(self)

## ingredient functionality ##
# TODO make this two seperate nodes with a Item root object

func get_data(key : String):
	if item_data.has(key):
		return item_data[key]
	else:
		return false

# Hilfsfunktion um Kerneigenschaften in einer Zeile zu nutzen
func print_line(): 
	var str = get_data("stats") + ":"

	str += get_data("stats").print_list()
	
	for type in get_data("types"):
		str += " " + type
	
	return str + "\n"
	

# Hilfsfunktion um alle Eigenschaften in einem
# übersichtlichen Block zu drucken
func print_block():
	
	var str = get_data("ing_name") + ": " + "\n"
	
	for type in get_data("types"):
		str += "It's a " + type + "\n"
	
	str += get_data("stats").print_list()
		
	str += get_data("description") + "\n"
	
	return str + "\n"
