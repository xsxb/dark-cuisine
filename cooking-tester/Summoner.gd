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
		"title" : "The Barbarian",
		"description" : "Mindlessly swings those big meat fists around.",
		"requirements" : [["healthy+++", REQ.GREATER_EQUAL], ["big++", REQ.GREATER_EQUAL], ["smash", REQ.IS_POSITIVE]]
	},
	
	4 : {
		"title" : "The Rogue",
		"description" : "Somehow makes cardboard boxes appear.",
		"requirements" : [["healthy+", REQ.GREATER_EQUAL], ["sneak", REQ.IS_POSITIVE],
		["big", REQ.ZERO_OR_NEGATIVE], ["inspiring", REQ.ZERO_OR_NEGATIVE],["repulsive", REQ.ZERO_OR_NEGATIVE]]
	},
	
	5 : {
		"title" : "The Cannonfodder",
		"description" : "Can walk in a straight line and doesn't smell too awful.",
		"requirements" : [["healthy", REQ.HAS_POSITIVE], ["smart--", REQ.GREATER_EQUAL], ["repulsive+", REQ.LESS]]
	},
	
	6 : {
		"name" : "The Blob",
		"description" : "Not useful for anything...",
		"requirements" : []
	}
}

func evolve_creature(creature_node, ingredient):
	
	var stat_heap = creature_node.stats.duplicate()
	stat_heap.push_back(ingredient)
	
	var new_stats = resolve_stats(stat_heap)
	
	var new_type = resolve_creature(new_stats)
	


# takes stat array
# returns id of creature that is the best match
func resolve_creature(stats):
	
	for entry_id in creature_table: 
		
		var requirements = creature_table[entry_id]["requirements"]
		if meets_requirements(stats, requirements):
			return entry_id


func meets_requirements(stats, requirements):
	
	stats_to_dict(stats)
	
	for req in requirements:
		

# In: list of strings
# Out: dict with statname:modifier pairs
func stats_to_dict(stats):
	
