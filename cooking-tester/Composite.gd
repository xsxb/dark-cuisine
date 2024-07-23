class_name Composite extends Ingredient

@export var ingredients: Array[Ingredient]


func reset():
	ingredients.clear()
	types.clear()
	stats.clear()


#simply combines all ingredient types, no doubles
#TODO: resolve contradicting types (e.g. solid+liquid)
func resolve_types():
	
	for ing in ingredients:
		for type in ing.types:
			if(!types.has(type)):
				types.push_back(type)


func resolve_stats():
	
	var new_stats = []
	
	for ingr in ingredients:
	
		for st in ingr.stats:
			var stat_pair = stat_to_pair(st)
			var stat_name = stat_pair[0]
			var stat_mod = stat_pair[1]
			
			var found = false
	
			#assuming statname first and modifiers second in block
			for added in new_stats:
				var added_pair = stat_to_pair(added)
				var added_name = added_pair[0]
				var added_mod = added_pair[1]
				
				
				if added_name == stat_name:
					var new_str = stat_pair_to_string([added_name, added_mod + stat_mod])
					new_stats.erase(added)
					new_stats.push_back(new_str)
					found = true
					break
				
			if !found:
				new_stats.push_back(st)
	
	stats = new_stats


func stat_to_pair(stat_string):
	# this implementation means we cant use - in a name!!
	#currently stats formated as name++++ name-- etc
	var name = ""
	var value = 0
	
	for ch in stat_string:
		if(ch == '+'):
			value += 1
		elif(ch == '-'):
			value -= 1
		else: 
			name += ch
			
	return [name, value]


func stat_pair_to_string(pair : Array):
	var str = pair[0]
	var mod = pair[1]
	
	if(mod > 0):
		for n in range(mod):
			str += "+"
	else:
		for n in range(-mod):
			str += "-"
	return str
