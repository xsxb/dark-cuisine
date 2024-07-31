extends Control

@export var stat_list : ItemList
@export var creature_spawn : Node2D

@export var description_field : RichTextLabel

var default_text = "I need to make some creatures"

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_text()


func clear_text() :
	description_field.text = default_text

func update(creature_node) :
	
	var descr = ""
	
	descr += "\"" + creature_node.title + "\""
	descr += "\n\n"
	descr += creature_node.description
	descr += "\n"
	
	for st in creature_node.stats.data:
		descr += "\n" + creature_node.stats.get_as_string(st)
	
	description_field.text = descr


func _on_summoning_script_node_creature_evolved():
	
	if creature_spawn.get_child_count() > 0:
		var cr_node = creature_spawn.get_child(0)
		update(cr_node)


func _on_summoning_script_node_creature_gone():
	clear_text()
