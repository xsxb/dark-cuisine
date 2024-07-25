class_name Ingredient
extends Node

@export var ing_name : String
@export var description : String
@export var stats : Array #should be a dictionary but editor causes problems
@export var types : Array

func _init(p_name = "", p_description = "", p_stats = [], p_types = []):
	ing_name = p_name
	stats = p_stats
	description = p_description
	types = p_types
	


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

	for st in stats:
		str += " " + st
	
	for type in types:
		str += " " + type
	
	return str + "\n"
	

# Hilfsfunktion um alle Eigenschaften in einem
# übersichtlichen Block zu drucken
func print_block():
	
	var str = ing_name + ": " + "\n"
	
	for type in types:
		str += "It's a " + type + "\n"
	
	for st in stats:
		str += "Makes you " + st + "\n"
		
	str += description + "\n"
	
	return str + "\n"

#Hilffunktion: "stat++" -> ["stat", 2], "stat-" -> ["stat", -1]
func stat_to_pair(stat_string):
	# this implementation means we cant use - in a name!!
	#currently stats formated as name++++ name-- etc
	var name = ""
	var value = 0
	
	for ch in stat_string:
		if(ch == '+'):
			value += 1
		elif(ch == '-'):
			value -= 1
		else: 
			name += ch
			
	return [name, value]


# Hilfsfunktion
# ["stat", 2] -> "stat++", ["stat", -1] -> "stat-"
func stat_pair_to_string(pair : Array):
	var str = pair[0]
	var mod = pair[1]
	
	if(mod > 0):
		for n in range(mod):
			str += "+"
	else:
		for n in range(-mod):
			str += "-"
	return str
