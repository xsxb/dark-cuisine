class_name CookingTool extends Node

var apple_scene = preload("res://cooking-tester/ingredient.tscn")
var pinecone_scene

# in tool instances: define recipes in the ready() function
var recipes : Dictionary

# overwrite in subclass to apply specific effects to the returned ingredient
func apply_tool_effect(ingredient_node):
	pass #TODO


# INPUT: a composite of ingredients
# OUTPUT: name of a recipe that 
# INTEDED SIDE EFFECTS: none
# POTENTIAL ERROR SOURCES: ingredients are passed by value - they should not be
# modified in this function, ingredient order may change result
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
			if given_ingredient.name == needed_string:
				sorted_ingredients[needed_string] = given_ingredient

	# add ingredients that match type requirements
	for needed_string in sorted_ingredients:
		
		for given_ingredient in available_ingredients:
			if given_ingredient.type == needed_string:
				sorted_ingredients[needed_string] = given_ingredient
	
	# if there's a needed ingredient with no potential match
	for needed_string in sorted_ingredients:
		if sorted_ingredients[needed_string].is_empty():
			return false
	
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
	
	if remaining.size == 0:
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


# combines stats of all ingredients
# eg turn healthy++ und healthy- into healthy+
# if values equal out to 0 effect, stat is removed
func resolve_stats(ingredients : Array):
	
	var new_stats = []
	
	for ingr in ingredients:
	
		for st in ingr.stats:
			var stat_pair = ingr.stat_to_pair(st)
			var stat_name = stat_pair[0]
			var stat_mod = stat_pair[1]
			
			var found = false
	
			#assuming statname first and modifiers second in block
			for added in new_stats:
				var added_pair = ingr.stat_to_pair(added)
				var added_name = added_pair[0]
				var added_mod = added_pair[1]
				
				
				if added_name == stat_name:
					added_mod += stat_mod
					var new_str = ingr.stat_pair_to_string([added_name, added_mod])
					new_stats.erase(added)
					
					# new entry only gets added if the modifier
					# didn't add up to 0
					if(added_mod != 0):	
						new_stats.push_back(new_str)
					
					found = true
					break
				
			if !found:
				new_stats.push_back(st)
	
	return new_stats

func create_ingredient(found_recipe):
	# get ingredient stats
	# TODO
	var ing_node = ingredient_scene.instantiate()
	pass

func add_ingredient_stats(result_node, ingredients):
	# TODO
	pass
