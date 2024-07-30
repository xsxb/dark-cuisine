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
	
	##Function testing:
	inventory.remove_item(6)
	
	resolve_recipe(item_array)


func _on_test_button_pressed():
	inventory.add_item(5)
