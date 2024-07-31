extends CookingTool

##Game mechanics go in this script
@export var inventory : Control
@export var player_inventory : Control

# should maybe be ids
func _ready():
	recipes = { 
		3 : ["Apple", "Pine Cone"], #pineapple
		5 : ["Pineapple", "Instant Noodles"], #poodles
		7 : ["Instant Noodles", "Tome"], #alphabet soup
		10 : ["Alphabet Soup", "Caffeine"], #energy potion blue
		25 : ["Energy Potion Blue", "Energy Potion Red", "Shadow Essence"], #ultimate shadow potion 
		12 : ["Caffeine", "Ketchup", "Super Hot Chili"],
		17 : ["Wheaty Goop", "Eye Thing??"],
		18 : ["Mushrooms", "Toast", "Ketchup"],
		22 : ["Toast", "Crisps"]
		}


func _process(delta):
	pass


func _on_cook_button_pressed():
	var ingredients = inventory.get_item_nodes()
	var result = resolve_recipe(ingredients)
	
	if result:
		inventory.remove_items(ingredients)
		player_inventory.add_item(result)


func _on_test_button_pressed():
	inventory.add_item(5)
