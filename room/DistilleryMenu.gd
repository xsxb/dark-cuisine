extends Control

##This script controls general UI behaviour

@export var script_node : Node
@export var background_panel : Panel

func _ready():
	size = background_panel.size
	global_position = get_viewport_rect().size/2 - size/2
	hide()

func _on_exit_button_pressed():
	hide()


