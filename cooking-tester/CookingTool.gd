class_name CookingTool extends Node

@export var recipes : Dictionary

# returns the name of a matching recipe
# ingredient order matters!
# TODO: change to returning an ingredient
# this function is ugly as all hell, sorry
func resolve_recipe(composite : Composite):
	
	for rec_name in recipes:
		
		var still_needed = {}
		var available = composite.ingredients
		
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
