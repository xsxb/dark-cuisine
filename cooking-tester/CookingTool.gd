class_name CookingTool extends Node

# in tool instances: define recipes in the ready() function
var recipes : Dictionary

# a tool can pass back the ingredient type/id
# + optionally an array of additional effects
# who's responsible for creating the new
# ingredient -> the main scene? the inventory?

# TODO: what are tool effects and how do we implement them?

# IN: a composite of ingredients
# OUT: name of a recipe that 
# ingredient order matters!
# this function is ugly as all hell, sorry
func resolve_recipe(ingredients : Array):
	
	for rec_name in recipes:
		
		var still_needed = {}
		
		var available = ingredients.duplicate()
		
		for needed_ingredient in recipes[rec_name]:
			still_needed[needed_ingredient] = null
		
		#first eliminate direct name matches
		for needed in still_needed:
			
			#print("Needed: " + needed + "\n")
			
			for ing in available:
				if(ing.ing_name == needed):
					#print("Found: " + ing.ing_name + "\n")
					still_needed[needed] = ing
					available.erase(ing)
					break
		
			if still_needed[needed] != null:
				continue
		#print("Name matches checked")
		#print(still_needed)
		#if no name match found, look for type match
		for needed in still_needed:
			
			if still_needed[needed] != null:
				continue
			
			if available.is_empty():
				return "a failure"
			
			var found_type = false
			for ing in available:
				
				for type in ing.types:
					if type == needed:
						#print("type match found")
						found_type = true
						still_needed[needed] = ing
						available.erase(ing)
						break
				
				if found_type:
					break
				
				#if this point is reached, no match was found
				#print("not found")
				return "a failure"

		# if this point is reached, all ingredients for one
		# recipe could be assigned
		return rec_name 


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
