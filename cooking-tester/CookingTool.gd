class_name CookingTool extends Node

@export var recipes : Dictionary

func resolve_recipe(composite : Composite):
	
	for rec_name in recipes:
		
		var still_needed = recipes[rec_name]
		var available = composite.ingredients

		#first eliminate direct matches
		for needed in still_needed:
			
			for ing in available:
				
				if(ing.ing_name == needed):
					available.erase(ing)
					still_needed.erase(needed)	#TODO: does this break iteration?
					break
		
		#then eliminate type matches
		for needed in still_needed:
			
			for ing in available:
				var found_type = false
				for type in ing.types:
					if(!found_type && type == needed):
						available.erase(ing)
						still_needed.erase(needed)	#TODO: does this break iteration?
						break

		if still_needed.empty():
			return rec_name

	return "a failure"
