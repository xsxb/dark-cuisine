class_name Ingredient
extends Node

@export var ing_name : String
@export var description : String
@export var stats : Dictionary
@export var types : Array

func _init(p_name = "", p_description = "", p_stats = {}, p_types = []):
	ing_name = p_name
	stats = p_stats
	description = p_description
	types = p_types

func print_line(): 
	var str = ing_name + ": "
	str += "it's"
	for st in stats:
		" " + st
		if(stats[st] > 0):
			for n in range(stats[st]):
				str += "+"
		else:
			for n in range(-stats[st]):
				str += "-"
	
	#for type in types:
	#	str += " a" + type
	
	return str
	
#func print_block():	
