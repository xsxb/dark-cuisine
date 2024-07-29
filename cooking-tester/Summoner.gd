extends CookingTool

enum REQ {EQUAL, GREATER_EQUAL, LESS_EQUAL, IS_POSITIVE, IS_NEGATIVE, IS_ZERO, ZERO_OR_POSITIVE, ZERO_OR_NEGATIVE}

var creature_table = {
	
	1 : {
		"title" : "The General",
		"description" : "Louder than the students upstairs.",
		"requirements" : [["inspire", REQ.IS_POSITIVE], ["smash", REQ.IS_POSITIVE], ["big+++", REQ.GREATER_EQUAL], ["smart++", REQ.GREATER_EQUAL], ["healthy++", REQ.GREATER_EQUAL], ["strong++", REQ.GREATER_EQUAL], ["repulsive", REQ.ZERO_OR_NEGATIVE]]
	},
	
	2 : {
		"title" : "The Wizard",
		"description" : "Keeps setting things on fire.",
		"requirements" : [["magic", REQ.IS_POSITIVE],["smart+++", REQ.GREATER_EQUAL]]
	},
	
	3 : {
		"title" : "The Rogue",
		"description" : "Somehow makes cardboard boxes appear.",
		"requirements" : [["healthy+", REQ.GREATER_EQUAL], ["sneak", REQ.IS_POSITIVE], ["smart+", REQ.GREATER_EQUAL],
		["big", REQ.ZERO_OR_NEGATIVE], ["inspiring", REQ.ZERO_OR_NEGATIVE],["repulsive", REQ.ZERO_OR_NEGATIVE]]
	},
	
	4 : {
		"title" : "The Barbarian",
		"description" : "Mindlessly swings those big meat fists around.",
		"requirements" : [["healthy+++", REQ.GREATER_EQUAL], ["big++", REQ.GREATER_EQUAL], ["smash", REQ.IS_POSITIVE]]
	},
	
	5 : {
		"title" : "The Cannonfodder",
		"description" : "Can walk in a straight line and doesn't smell too awful.",
		"requirements" : [["healthy", REQ.IS_POSITIVE], ["smash", REQ.IS_POSITIVE], ["repulsive", REQ.ZERO_OR_NEGATIVE]]
	},
	
	0 : {
		"name" : "The Blob",
		"description" : "Not useful for anything...",
		"requirements" : []
	}
}

func initiate_creature(creature_node):
	creature_node.type = 0
	creature_node.stats = {}
	creature_node.name = creature_table[0]["name"]
	creature_node.description = creature_table[0]["description"]

func evolve_creature(creature_node, ingredient):
	
	var stat_heap = creature_node.stats.duplicate()
	stat_heap.push_back(ingredient)
	
	var new_stats = resolve_with_strings(stat_heap)
	
	var new_type = resolve_creature_type(new_stats)
	
	creature_node.set_stats(new_stats)
	creature_node.set_type(new_type)


# takes stat array
# returns id of creature that is the best match
func resolve_creature_type(stats):
	
	for entry_id in creature_table: 
		
		var requirements = creature_table[entry_id]["requirements"]
		if meets_requirements(stats, requirements):
			return entry_id


# dict: "name":int
# array: 
func meets_requirements(stats : Dictionary, requirements : Dictionary):
	
	for req in requirements:
		
		var req_name = $Ingredient.stat_to_pair(req)[0]
		var req_value = $Ingredient.stat_to_pair(req)[1]
		var req_type = requirements[req_name]
		
		var stat_value = 0
		
		if stats.has(req_name):
			stat_value = stats[req_name]
		
		match req_type:
			
			REQ.EQUAL:
				if stat_value != req_value:
					return false
			
			REQ.GREATER_EQUAL:
				if stat_value < req_value:
					return false
			
			REQ.LESS_EQUAL:
				if stat_value > req_value:
					return false
		
			REQ.IS_POSITIVE:
				if stat_value < 0:
					return false
		
			REQ.IS_ZERO:
				if stat_value != 0:
					return false
			
			REQ.ZERO_OR_POSITIVE:
				if stat_value < 0:
					return false
		
			REQ.ZERO_OR_NEGATIVE:
				if stat_value > 0:
					return false
					
	return true
