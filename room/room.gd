extends Node2D

var cauldron_menu_scene = preload("res://cauldron_menu.tscn")
var cauldron_menu

@export var cauldron_button : TextureButton	

func _ready():
	##Initiate child nodes
	cauldron_menu = cauldron_menu_scene.instantiate()
	cauldron_button.add_child(cauldron_menu)
	cauldron_menu.global_position = get_viewport_rect().size/2 - cauldron_menu.size/2
	cauldron_menu.hide()
	#cauldron_menu.global_position = cauldron_button.global_position


func _process(delta):
	pass
			
