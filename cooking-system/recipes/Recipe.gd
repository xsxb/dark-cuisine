class_name Recipe extends Node

var stat_scene = load("res://cooking-system/Stats.tscn")

var id : int
var recipe_name : String
var description : String
var base_recipe : int
var derived_recipes : Array
var ingredients : Array
var stats : Stats

func _init():
	id = -2
	recipe_name = "uninitiated"
	description = "uninitiated"
	base_recipe = -1
	derived_recipes = []
	ingredients = []
	stats = stat_scene.instantiate()

func init_values(id_, recipe_name_, description_, base_recipe_, ingredients_, stat_strings_):
	id = int(id_)
	recipe_name = recipe_name_
	description = description_
	base_recipe = 0
	derived_recipes = []
	ingredients = ingredients_
	stats.set_data_from_string(stat_strings_)

func add_derived(derived_id : int):
	if !derived_recipes.has(id):
		derived_recipes.push_back(derived_id)

func print_recipe():
	print("ID: " + str(id) + "\n")
	print("Name: " + recipe_name + "\n")
	print("Description: " + description + "\n")
	print("Base recipe: " + str(base_recipe)  + "\n")
	print("Derived recipes:\n")
	print(derived_recipes)
	print("\n")
