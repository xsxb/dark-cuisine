extends Node2D

@export var text_output : Label
@export var text_composite : Label
@export var text_ingredients : Label

@export var composite : Composite
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
	
	var ctext = "The sludge on this table is \n"
	
	for type in composite.types:
		ctext += " " + type
	
	for stat in composite.stats:
		ctext += " " + stat
	
	ctext += "\n"
	ctext += "It's made of:"
	
	for ing in composite.ingredients:
		ctext += " " + ing.ing_name
	
	#for ing in composite.ingredients:
	#	ctext += ing.print_line()
	
	#ctext += composite.print_block()
			
	$Text_Composite.text = ctext
	


func _on_button_blend_pressed():
	composite.reset()
	composite.ingredients.append_array(ingredients)
	composite.resolve_types()
	composite.resolve_stats()
	ingredients.clear()


func _on_button_cauldron_pressed():
	var recipe = $Cauldron.resolve_recipe(composite)
	var res_text = "I created...\n"
	res_text += recipe + "!"
	$Text_Output.text = res_text


func _on_button_grill_pressed():
	pass # Replace with function body.


func _on_button_clear_pressed():
	ingredients.clear()
	composite.reset()
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
