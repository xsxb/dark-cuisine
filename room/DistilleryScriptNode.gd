extends CookingTool

@export var inventory : Control
@export var player_inventory : Control

func _ready():
	recipes = { 
		19 : ["Moldy Sock"],
		999 : ["Cold Pizza Slice"], #special case: 2 returns
		9 : ["Cold Coffee"],
		24 : ["Shadow Creature"]
		}

#Resolve recipe on button click
func _on_distill_button_pressed():
	var ingredients = inventory.get_item_nodes()
	var result = resolve_recipe(ingredients)
	
	if !result:
		return
	
	elif result == 999: #TODO eliminate workaround
		inventory.remove_items(ingredients)
		player_inventory.add_item(13) #Ketchup
		player_inventory.add_item(15) #Wheaty Goop
		
	elif result:
		inventory.remove_items(ingredients)
		player_inventory.add_item(result)
