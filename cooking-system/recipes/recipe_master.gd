extends Node

const name_prefix = "RECIPE_"

#TODO: handle recipe ids per global enums to make int constants readable

var rec_scene = load("res://cooking-system/recipes/Recipe.tscn")

var recipes = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	add_recipe(-1, "root", "uh, how did this turn up here?", null)
	add_recipe(0, "Failure", "What have I done??", -1)
	var path = "res://cooking-system/recipes/test.json"
	var json_string = FileAccess.get_file_as_string(path)
	load_from_json(json_string)
	
	#print_recipes()


func get_recipe(rec_id : int) :
	return recipes[rec_id]

func get_children_ids(rec_id):
	pass
	

func print_recipes():
	for child in get_children():
		print("Recipe: " + child.name + "\n")
		child.print_recipe()
		print("\n")

# reads in recipe and sorts into search tree
func add_recipe(id, name, description, base, ingredients = [], stat_strings = []):
	
	if base == null && id != -1:
		base = 0
	
	var new_recipe = rec_scene.instantiate()
	new_recipe.init_values(id, name, description, base, ingredients, stat_strings)
	
	new_recipe.name = name_prefix + str(id)
	
	recipes[id] = new_recipe
	add_child(new_recipe)
	
	
	#print (recipes)
	#print(base)
	
	if base != null:
		var test = get_recipe(base)
		test.add_derived(id)


func load_from_json(json_string : String):
	
	var json = JSON.new()
	var error = json.parse(json_string)
	if error == OK:
		var rec_array = json.data
		if typeof(rec_array) == TYPE_ARRAY:
			
			for rec_object in rec_array:
				var id = rec_object.get("ID")
				var name = rec_object.get("name")
				var description = rec_object.get("description")
				var base = rec_object.get("base")
				var ingredients = rec_object.get("ingredients")
				var stat_strings = rec_object.get("effects")
				
				add_recipe(id, name, description, base, ingredients, stat_strings)
			
			
			#print(recipes)
			for rec in recipes:
				recipes[rec].print_recipe()
			
		else:
			print("Unexpected data")
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
	

# builds a tree of recipe references to check in order


#func match_recipe_sub(recipe_id : Recipe, depth : int) :
#	results = []
#	for get_derived_recipes(recipe):
#		if !recipe.	
#	for get

#if matches this:
  #call on ?each? child
  #collect returns
  #return deepest result or -1


# i am a serious programmer hire me pls
#func match_recipe_dom():
#	match_recipe_sub(root, 0)


