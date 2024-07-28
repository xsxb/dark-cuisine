extends CookingTool

##Game mechanics go in this script
@export var inventory : Control

func _ready():
	recipes = { 
	"Pineapple" : ["Apple", "Pine Cone"]
	}


func _process(delta):
	pass


func _on_cook_button_pressed():
	var item_array = inventory.get_item_nodes()
	#print(item_array[0].item_data)
	resolve_recipe(item_array)
