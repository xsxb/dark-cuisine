extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


var recipes = {}

func get_recipe(rec_id) :
	return recipes.get(rec_id)

func get_children_ids(rec_id):
	pass

# reads in recipe and sorts into search tree
func load_recipe():
	pass

func load_from_json():
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


