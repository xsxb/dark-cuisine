extends CookingTool

##Game mechanics go in this script
@export var inventory : Control
@export var player_inventory : Control

func _ready():
	recipes = { 
	"Pineapple" : ["Apple", "Pine Cone"]
	}


func _process(delta):
	pass


func _on_cook_button_pressed():
	var item_array = inventory.get_item_nodes()
	#print(item_array)
	#for item in item_array:
		#print(item.item_id)
		#print(item.item_data["name"])
	#print(item_array[0].stack)
	resolve_recipe(item_array)
