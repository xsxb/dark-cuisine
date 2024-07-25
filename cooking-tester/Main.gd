extends Node2D

@export var text_output : Label
@export var text_ingredients : Label

@export var result : Ingredient

var ingredients : Array
var tools : Array

var apple_scene = load("res://cooking-tester/ingredient-scenes/Apple.tscn")
var pinecone_scene = load("res://cooking-tester/ingredient-scenes/Pinecone.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	ingredients = []
	tools = []


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var itext = "What I have lying here on the table is...\n"
	
	for ing in ingredients:
		itext += ing.print_block()
		
	$Text_Ingredients.text = itext



func _on_button_cauldron_pressed():
	var stats =  $Cauldron.resolve_stats(ingredients)
	var recipe = $Cauldron.resolve_recipe(ingredients)
	
	var types = $Cauldron.resolve_types(ingredients)
	
	var res_text = "I created...\n"
	res_text += recipe + "!\n"
	
	res_text += "It's...\n"
	for t in types:
		res_text += t + " "
	res_text += "\n"
	
	res_text += "It makes you...\n"
	for s in stats:
		res_text += s + " "
		
	$Text_Output.text = res_text
	ingredients.clear()
	
	


func _on_button_clear_pressed():
	ingredients.clear()
	$Text_Output.text = ""


func _on_button_apple_pressed():
	for ing in ingredients:
		if(ing.ing_name == "Apple"):
			return
	
	var newapple = apple_scene.instantiate()
	add_child(newapple)
	ingredients.push_back(newapple)


func _on_button_pinecone_pressed():
	for ing in ingredients:
		if(ing.ing_name == "Pine Cone"):
			return
	
	var newpc = pinecone_scene.instantiate()
	add_child(newpc)
	ingredients.push_back(newpc)
