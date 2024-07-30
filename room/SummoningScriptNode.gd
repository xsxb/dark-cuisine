extends CookingTool

@export var inventory : Control

var current_creature : Creature

var creature_table = Global.creature_table

var creature_scene = preload("res://cooking-system/Creature.tscn")

func initiate_creature(creature_node):
	creature_node.type = 0
	creature_node.name = creature_table[0]["title"]
	creature_node.description = creature_table[0]["description"]
	creature_node.stats.set_to({})

func remove_creature(creature_node):
	remove_child(creature_node)
	current_creature = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Resolve recipe here
func _on_summon_button_pressed():
	
	var ingredients = inventory.get_item_nodes()
	
	if current_creature == null:
		current_creature = creature_scene.instantiate()
		initiate_creature(current_creature)
	
	for ing in ingredients:
		evolve_creature(current_creature, ing)
	
	inventory.remove_items(ingredients)



func evolve_creature(creature_node, ingredient):
	
	if ingredient == null:
		return
	
	creature_node.stats.resolve_with(ingredient.get_stats())
	
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
			return entry_id
	
	return -1 #indication that Something Went Wrong


# dict: "name":int
# array: 
func meets_requirements(stats : Dictionary, requirements : Dictionary):
	
	for req in requirements:
		
		var req_name = req
		var req_type = requirements[req][0]
		var req_value = requirements[req][1]
		
		var stat_value = 0
		
		if stats.has(req_name):
			stat_value = stats[req_name]
		
		match req_type:
			
			Global.REQ.EQUAL:
				if stat_value != req_value:
					return false
			
			Global.REQ.GREATER_EQUAL:
				if stat_value < req_value:
					return false
			
			Global.REQ.LESS_EQUAL:
				if stat_value > req_value:
					return false
		
			Global.REQ.GREATER:
				if stat_value <= req_value:
					return false
		
			Global.REQ.LESS:
				if stat_value >= req_value:
					return false
	

	return true
