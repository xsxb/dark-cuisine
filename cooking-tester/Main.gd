extends Node2D

@export var text_output : Label
@export var text_ingredients : Label

var result : Ingredient
var creature : Creature

var ingredients : Array
var tools : Array

var ingredient_scene = load("res://cooking-tester/ingredient.tscn")
var creature_scene = load("res://cooking-tester/Creature.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	ingredients = []
	tools = []
	creature = creature_scene.instantiate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var itext = "What I have lying here on the table is...\n"
	
	for ing in ingredients:
		itext += ing.print_block()
		
	$Text_Ingredients.text = itext
	
	$Text_Creature.text = creature.print_block()



func _on_button_cauldron_pressed():
	
	var recipe = $Cauldron.resolve_recipe(ingredients)

	
	var res_text = "I created...\n"
	
	if recipe:
		res_text += recipe.print_block()
	else:
		res_text += "a failue!"
	
	$Text_Output.text = res_text
	ingredients.clear()
	
	


func _on_button_clear_pressed():
	ingredients.clear()
	$Text_Output.text = ""


func _on_button_apple_pressed():
	for ing in ingredients:
		if(ing.ing_name == "Apple"):
			return
			
	ingredients.push_back($Apple)


func _on_button_pinecone_pressed():
	for ing in ingredients:
		if(ing.ing_name == "Pine Cone"):
			return
	
	ingredients.push_back($PineCone)


func _on_button_summon_pressed():
	$Summoner.initiate_creature(creature)
	



func _on_button_evolve_pressed():
	$Summoner.evolve_creature(creature, result)
