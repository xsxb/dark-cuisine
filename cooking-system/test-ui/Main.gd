extends Node2D

@export var text_output : Label
@export var text_ingredients : Label

var result : Ingredient
var creature : Creature

var ingredients : Array
var tools : Array

var ingredient_scene = load("res://cooking-system/ingredient.tscn")
var creature_scene = load("res://cooking-system/Creature.tscn")

#TODO where should this function go?
func create_ingredient(id):
	var data = Global.item_table[id]
	var new_ing = ingredient_scene.instantiate()
	new_ing.ing_name = data["name"]
	new_ing.description = data["description"]
	new_ing.types = data["types"]

	new_ing.stats.set_to(data["stats"])

	return new_ing



# Called when the node enters the scene tree for the first time.
func _init():
	ingredients = []
	tools = []
	creature = creature_scene.instantiate()
	add_child(creature)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var itext = "What I have lying here on the table is...\n"
	
	for ing in ingredients:
		itext += ing.print_block()
		
	$Text_Ingredients.text = itext
	
	$Text_Creature.text = creature.print_block()





func _on_button_cauldron_pressed():
	
	result = $Cauldron.resolve_recipe(ingredients)
	
	var res_text = "I created...\n"
	
	if result:
		res_text += result.print_block()
	else:
		res_text += "a failure!"
	
	$Text_Output.text = res_text
	ingredients.clear()



func _on_button_clear_pressed():
	ingredients.clear()
	$Text_Output.text = ""


func _on_button_ingr_pressed():
	var id = int($TextEdit_ID.text)
	$TextEdit_ID.text = ""

	if id < 1 || id > Global.item_table.size():
		return
	
	var node = create_ingredient(id)
	ingredients.push_back(node)

	add_child(node)


func _on_button_summon_pressed():
	$Summoner.initiate_creature(creature)

func _on_button_evolve_pressed():
	if result == null:
		return
	$Summoner.evolve_creature(creature, result.stats.get_dict())
