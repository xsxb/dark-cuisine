extends CookingTool

@export var inventory : Control
@export var spawnpoint : Node2D

signal creature_evolved
signal creature_gone

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
	
	if ingredients.is_empty():
		return
	
	if current_creature == null:
		current_creature = creature_scene.instantiate()
		spawnpoint.add_child(current_creature)
		initiate_creature(current_creature)
	
	for ing in ingredients:
		evolve_creature(current_creature, ing)
	
	var sprite_texture_path = "res://assets/art/lukas-monster.png"
	
	match current_creature.type:
		1: sprite_texture_path = "res://assets/art/Monster/PNG Monsters/24.png" #general
		2: sprite_texture_path = "res://assets/art/Monster/PNG Monsters/17.png" #wizard
		3: sprite_texture_path = "res://assets/art/Monster/PNG Monsters/27.png" #rogue
		4: sprite_texture_path = "res://assets/art/Monster/PNG Monsters/7.png" #barbarian
		5: sprite_texture_path = "res://assets/art/Monster/PNG Monsters/23.png" #cannonfodder
	
	current_creature.sprite.texture = load(sprite_texture_path)
	
	inventory.remove_items(ingredients)
	
	emit_signal("creature_evolved") 



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


func _on_submit_button_pressed():
	if current_creature == null:
		return
	
	current_creature.animation_player.animation_finished.connect(_on_creature_animation_finished)
	current_creature.animation_player.play("dance")
	
func _on_creature_animation_finished():
	
	spawnpoint.remove_child(current_creature)
	current_creature = null
	emit_signal("creature_gone")
