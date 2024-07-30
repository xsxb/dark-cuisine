extends Node2D

@export var menu_container : VBoxContainer

var spawn_scene = preload("res://ui/menu_sprite_node.tscn")
var room_scene = preload("res://room/room.tscn")

func _ready():
	
	#Menücontainer zentrieren an Fenstergröße angepasst:
	menu_container.position = get_viewport_rect().size/2 - menu_container.size/2

func _on_start_button_pressed():
	get_tree().change_scene_to_packed(room_scene)

func _on_spawn_timer_timeout():
	var new_spawn = spawn_scene.instantiate()
	get_parent().add_child(new_spawn)
	new_spawn.global_position = Vector2(randi_range(50, get_viewport_rect().size.x), randi_range(50, get_viewport_rect().size.y))
	
	
