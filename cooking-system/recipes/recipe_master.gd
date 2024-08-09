extends Node

#TODO: handle recipe ids per global enums to make int constants readable

var rec_scene = load("res://cooking-system/recipes/Recipe.tscn")

var recipes = {}

func _init():
	add_recipe_root(-1, "root", "uh, how did this turn up here?")

# Called when the node enters the scene tree for the first time.
func _ready():
	var path = "res://cooking-system/recipes/test.json"
	var json_string = FileAccess.get_file_as_string(path)
	load_from_json(json_string)


func get_recipe(rec_id) :
	return recipes.get(rec_id)

func get_children_ids(rec_id):
	pass
	


func add_recipe_root(id, name, description):
	add_recipe(id, name, description, null)

# reads in recipe and sorts into search tree
func add_recipe(id, name, description, base):
	
	if base == null && id != -1:
		base = -1
	
	recipes[id] = rec_scene.instantiate()
	recipes[id].id = id
	recipes[id].name = name
	recipes[id].description = description
	recipes[id].base = base
	
	if base != null:
		recipes.get(base).add_derived(id)


func load_from_json(json_string : String):
	
	var json = JSON.new()
	var error = json.parse(json_string)
	if error == OK:
		var rec_array = json.data
		if typeof(rec_array) == TYPE_ARRAY:
			print(rec_array) # Prints array
			
			for rec_object in rec_array:
				var id = rec_object.get("ID")
				var name = rec_object.get("name")
				var description = rec_object.get("description")
				var base = rec_object.get("base")
				add_recipe(id, name, description, base)
			
			print(recipes)
			
		else:
			print("Unexpected data")
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		pass

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


