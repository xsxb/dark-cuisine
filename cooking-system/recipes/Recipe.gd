class_name Recipe extends Node

var id : int
var recipe_name : String
var description : String
var base_recipe : int
var derived_recipes : Array[int]

func _init():
	id = -2
	recipe_name = ""
	description = "uninitiated"
	base_recipe = -1
	derived_recipes = []

func init_values(id_, recipe_name_, description_, base_recipe_):
	id = int(id_)
	recipe_name = recipe_name_
	description = description_
	base_recipe = 0
	derived_recipes = []

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
