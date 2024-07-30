class_name Ingredient
extends Node

@export var ing_name : String
@export var description : String
@export var stats : Stats
@export var types : Array

var stat_scene = preload("res://cooking-system/Stats.tscn")


func _init(p_name = "", p_description = "", p_types = []):
	ing_name = p_name
	description = p_description
	types = p_types
	stats = stat_scene.instantiate()
	add_child(stats)


#func format_stat(st):
#	var str = st
#	str += "(" + stats[st] + ")"
#	if(stats[st] > 0):
#		for n in range(stats[st]):
#			str += "+"
#	else:
#		for n in range(-stats[st]):
#			str += "-"
#	return str

# Hilfsfunktion um Kerneigenschaften in einer Zeile zu nutzen
func print_line(): 
	var str = ing_name + ":"

	str += stats.print_list()
	
	for type in types:
		str += " " + type
	
	return str + "\n"
	

# Hilfsfunktion um alle Eigenschaften in einem
# übersichtlichen Block zu drucken
func print_block():
	
	var str = ing_name + ": " + "\n"
	
	for type in types:
		str += "It's a " + type + "\n"
	
	str += stats.print_list()
		
	str += description + "\n"
	
	return str + "\n"



