class_name Composite extends Node

@export var ingredients: Array[Ingredient]
@export var types : Array[String]
@export var stats : Array


func reset():
	ingredients.clear()
	types.clear()
	stats.clear()


#simply combines all ingredient types, no doubles
#TODO: resolve contradicting types (e.g. solid+liquid)
func resolve_types():
	
	var types : Array
	
	for ing in ingredients:
		if(!types.has(ing)):
			types.push_back(ing)
			
	return			


# TODO:
func resolve_stats():
	
	var new_stats
	
	# for now..
	# assumption that every stat consists of
	# a name and an amount of + or -
	# can only have + or -!
	
	#resolution steps:
	#strip modifiers to compare base names
	#if not found, add as is and continue with next
	#if same direction, add modifiers, continue
	#if opposite, eliminate modifiers 
	#check if stat has no modifiers left -> remove
	for stat in stats:
		var found = false
		for existing_stat in new_stats:
			if existing_stat.x == stat.x:
				
				var y_modifiers = existing_stat.y
				var x_modifiers = stat.x
				
				#both + or both -
				if y_modifiers[0] == x_modifiers[0]:
					existing_stat.y += stat.y
					continue
					
				else:
					#compare length
					if y_modifiers.length() == x_modifiers.length():
						new_stats.erase(existing_stat)
						continue
					
					elif y_modifiers.length() > x_modifiers.length():
						var difference = y_modifiers.length() - x_modifiers.length()
						existing_stat.resize(difference)
						continue
						
					elif y_modifiers.length() < x_modifiers.lenth():
						var difference = x_modifiers.length() - y_modifiers.length()
						var new_mod = x_modifiers.resize(difference)
						existing_stat.y = new_mod
						continue
		if !found:
			new_stats.push_back(stat)
				
	stats = new_stats
