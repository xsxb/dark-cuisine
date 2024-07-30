extends CookingTool

##Game mechanics go in this script
@export var inventory : Control
@export var player_inventory : Control

func _ready():
	recipes = { 
		3 : ["Apple", "Pine Cone"],
		#"Energy Potion Red" : ["caffeine", "liquid", "fruit"]
		}


func _process(delta):
	pass


func _on_cook_button_pressed():
	var result = resolve_recipe(inventory.get_item_nodes())
	
	if result:
		player_inventory.add_item(result)


func _on_test_button_pressed():
	inventory.add_item(5)
