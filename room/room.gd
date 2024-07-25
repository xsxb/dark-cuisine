extends Node2D

var cauldron_menu_scene = preload("res://cauldron_menu.tscn")
var cauldron_menu

@export var cauldron_button : TextureButton	

var active_menu : Node

func _ready():
	
	##Initiate child nodes
	cauldron_menu = cauldron_menu_scene.instantiate()
	cauldron_button.add_child(cauldron_menu)
	cauldron_menu.hide()
	#cauldron_menu.global_position = cauldron_button.global_position


func _process(delta):
	pass

func _on_cauldron_button_pressed():
	cauldron_menu.show()
