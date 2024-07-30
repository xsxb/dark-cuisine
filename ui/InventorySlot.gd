extends Control

@export var slot_panel : Panel

@export var panel_size = Vector2 (64,64)
@export var slot_size = Vector2(64,64)

var inventory : Inventory
var slot_id : int

signal slot_clicked(slot_node)

func _ready():
	custom_minimum_size = slot_size
	slot_panel.size = slot_size
	size = Vector2(64,64)
	mouse_filter = 0


func _on_slot_panel_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			slot_clicked.emit(self)
