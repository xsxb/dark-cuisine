extends Control

##This script controls general UI behaviour

@export var script_node : Node
@export var background_panel : Panel

func _ready():
	size = background_panel.size
	global_position = get_viewport_rect().size/2 - size/2
	hide()

func _on_close_button_pressed():
	hide()

#Resolve recipe here
func _on_summon_button_pressed():
	#script_node.resolve_recipe()
	pass 
