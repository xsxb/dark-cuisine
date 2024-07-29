extends CookingTool

enum REQ {EQUAL, GREATER_EQUAL, LESS_EQUAL, GREATER, LESS}

var creature_table = {
	
	1 : {
		"title" : "The General",
		"description" : "Louder than the students upstairs.",
		"requirements" : {"inspire" : [REQ.GREATER, 0], "smash" : [REQ.GREATER, 0], "big" : [REQ.GREATER_EQUAL, 3], "smart" : [REQ.GREATER_EQUAL, 2], "healthy" : [REQ.GREATER_EQUAL, 2], "strong" : [REQ.GREATER_EQUAL, 2], "repulsive" : [REQ.LESS_EQUAL, 0]}
	},
	
	2 : {
		"title" : "The Wizard",
		"description" : "Keeps setting things on fire.",
		"requirements" : {"magic" : [REQ.GREATER, 0], "smart" : [REQ.GREATER_EQUAL, 3]}
	},
	
	3 : {
		"title" : "The Rogue",
		"description" : "Somehow makes cardboard boxes appear.",
		"requirements" : {"healthy" : [REQ.GREATER_EQUAL, 1], "sneak" : [REQ.GREATER, 0], "smart" : [REQ.GREATER_EQUAL, 2],
		"big" : [REQ.LESS_EQUAL, 0], "inspiring" : [REQ.LESS_EQUAL, 0], "repulsive" : [REQ.LESS_EQUAL, 0]}
	},
	
	4 : {
		"title" : "The Barbarian",
		"description" : "Mindlessly swings those big meat fists around.",
		"requirements" : {"healthy" : [REQ.GREATER_EQUAL, 3], "big" : [REQ.GREATER_EQUAL, 2], "smash" : [REQ.GREATER, 0]}
	},
	
	5 : {
		"title" : "The Cannonfodder",
		"description" : "Can walk in a straight line and doesn't smell too awful.",
		"requirements" : {"healthy" : [REQ.GREATER, 0], "repulsive" : [REQ.LESS_EQUAL, 0]}
	},
	
	0 : {
		"title" : "The Blob",
		"description" : "Not useful for anything...",
		"requirements" : {}
	}
}

func initiate_creature(creature_node):
	creature_node.type = 0
	creature_node.name = creature_table[0]["title"]
	creature_node.description = creature_table[0]["description"]
	creature_node.stats.set_to({})

func evolve_creature(creature_node, ingredient_stats):
	
	if ingredient_stats == null:
		return
	
	creature_node.stats.resolve_with_dict(ingredient_stats)
	
	var new_type = resolve_creature_type(creature_node.stats)
	
	creature_node.type = new_type
	creature_node.title = creature_table[new_type]["title"]
	creature_node.description = creature_table[new_type]["description"] 


# takes stat array
# returns id of creature that is the best match
func resolve_creature_type(stats):
	
	for entry_id in creature_table: 
		
		var requirements = creature_table[entry_id]["requirements"]
		if meets_requirements(stats.get_dict(), requirements):
			print("requirements met: ")
			print(entry_id)
			return entry_id
	
	return -1 #indication that Something Went Wrong


# dict: "name":int
# array: 
func meets_requirements(stats : Dictionary, requirements : Dictionary):
	
	for req in requirements:
		
		print("requirement: ")
		print(req)
		
		var req_name = req
		var req_type = requirements[req][0]
		var req_value = requirements[req][1]
		
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
		
			REQ.GREATER:
				if stat_value <= req_value:
					return false
		
			REQ.LESS:
				if stat_value >= req_value:
					return false
	
	print("requirements met: ")

	return true
