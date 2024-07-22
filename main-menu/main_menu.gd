extends Node2D

@export var menu_container : VBoxContainer

var room_scene

func _ready():
	#Szenen vorladen:
	room_scene = preload("res://room/room.tscn")
	
	#Menücontainer zentrieren an Fenstergröße angepasst:
	menu_container.position = get_viewport_rect().size/2 - menu_container.size/2



func _on_start_button_pressed():
	get_tree().change_scene_to_packed(room_scene)
