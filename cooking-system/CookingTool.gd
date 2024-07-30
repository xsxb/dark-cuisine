class_name CookingTool extends Node

var item_scene = preload("res://item.tscn")

# in tool instances: define recipes in the ready() function
var recipes : Dictionary

# overwrite in subclass to apply specific effects to the returned ingredient
func apply_tool_effect(ingredient_node):
	pass #TODO


# returns true or false
# modifies input array
func resolve_recipe(ingredients : Array):
	
	var found_recipe = null
	
	for rec_name in recipes:
		
		if check_recipe(rec_name, ingredients):
			found_recipe = rec_name
			break

	if found_recipe == null:
		return false

	else:
		var result_node = create_ingredient(found_recipe)
		add_ingredient_stats(result_node, ingredients)
		apply_tool_effect(result_node)
		return result_node


#########################################################
#                 below this it's all                   #
#                  HELPER FUNCTIONS                     #
#               (don't call from outside)               #
#########################################################

#OUT: true or false
func check_recipe(rec_name, ingredients):
	
	# number of ingredients doesn't match number required exactly
	# => can't find a 1 to 1 mapping
	if recipes[rec_name].size() != ingredients.size():
		return false
	
	#print("Check 1")
	
	# initialize data structures
	# copy to avoid modifying the original array
	var available_ingredients = ingredients.duplicate()
	
	# for each required ingredient, all potential matches
	# are saved in an array
	var sorted_ingredients = {}
	for ingredient in recipes[rec_name]:
		sorted_ingredients[ingredient] = []
	
	# sort available ingredients to requirements
	# sort ingredients that add name requirements
	for needed_string in sorted_ingredients:
		
		for given_ingredient in available_ingredients:
			if given_ingredient.get_data("name") == needed_string:
			#if given_ingredient.ing_name == needed_string:
				sorted_ingredients[needed_string].push_back(given_ingredient)

	#print("After name match: ")
	#print("Available: ")
	#print(available_ingredients)
	#print("Sorted: ")
	#print(sorted_ingredients)

	# add ingredients that match type requirements
	for needed_string in sorted_ingredients:
		
		for given_ingredient in available_ingredients:
			if given_ingredient.get_data("types").has(needed_string):
				sorted_ingredients[needed_string].push_back(given_ingredient)
	
	#print(sorted_ingredients)
	
	# if there's a needed ingredient with no potential match
	for needed_string in sorted_ingredients:
		if sorted_ingredients[needed_string].is_empty():
			return false
	
	#print("Check 2")
	# check if there is a fulfilling permutation
	return find_permutation(sorted_ingredients) != null
	

# returns either null or an array of used ingredients
func find_permutation(sorted_ingredients):
	
	var picked = []
	var remaining = []
	
	# [[req1 matches],[req2 matches],[req3 matches],...]
	for key in sorted_ingredients:
		remaining.push_back(sorted_ingredients[key])
	
	return base_find_permutation(picked, remaining)

# cursed recursion
# ill figure out if this actually does whats intended
# later. TODO
func base_find_permutation(picked, remaining):
	
	if remaining.size() == 0:
		return picked
	
	var current_list = remaining[0]
	
	if current_list.is_empty():
		return null
	
	var rest = []
	
	if remaining.size() > 1: 
		rest = remaining.slice(1,remaining.size())
	
	# fix next value
	for potential in current_list:
		
		var already_used = false
		
		for used in picked:
			if used == potential:
				already_used = true
		
		if already_used:
			continue
			
		else:
			picked.push_back(potential)
			var result = base_find_permutation(picked, rest)
			if result != null:
				return result
		
	return null


#simply combines all ingredient types without doubles
#TODO: resolve contradicting types (e.g. solid+liquid)
func resolve_types(ingredients : Array):
	
	var combined_types = []
	
	for ing in ingredients:
		for type in ing.types:
			if(!combined_types.has(type)):
				combined_types.push_back(type)
	
	return combined_types




func create_ingredient(found_recipe_id):
	var ing_node = item_scene.instantiate()
	var attribute_dict = Global.item_table[found_recipe_id]
	
	ing_node.ing_name = attribute_dict["name"]
	ing_node.description = attribute_dict["description"]
	ing_node.stats.data = attribute_dict["stats"]
	ing_node.types = attribute_dict["types"]
	
	return ing_node

func add_ingredient_stats(result_node, ingredients):
	
	for ing in ingredients:
		result_node.get_data("stats").resolve_with(ing.get_data("stats"))
