extends Control

##This script controls general UI behaviour

@export var script_node : Node

var composite

func _ready():
	pass

func _process(delta):
	pass

func _on_exit_button_pressed():
	hide()

func _on_cook_button_pressed():
	script_node.resolve_recipe(composite)
