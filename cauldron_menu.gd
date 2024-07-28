extends Control

##This script controls general UI behaviour

@export var script_node : Node
@export var background_panel : Panel
var inventory_id : int

var composite

func _ready():
	size = background_panel.size

func _process(delta):
	pass

func _on_exit_button_pressed():
	background_panel.hide()

func _on_cauldron_button_pressed():
	background_panel.show()

