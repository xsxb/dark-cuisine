extends Control

@export var slot_panel : Panel

@export var panel_size = Vector2 (64,64)
@export var slot_size = Vector2(64,64)


func _ready():
	custom_minimum_size = slot_size
	slot_panel.size = slot_size
