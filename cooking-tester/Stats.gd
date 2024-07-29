class_name Stats extends Node

var data : Dictionary

# Called when the node enters the scene tree for the first time.
func _init():
	data = {}

func get_dict():
	return data.duplicate()

func set_to(dict : Dictionary):
	data = dict

func set_stat(key : String, value : int):
	data[key] = value

func set_from_string(stat_string : String):
	var pair = string_to_pair(stat_string)
	set_stat(pair[0], pair[1])

func get_stat(key : String) -> int:
	
	if data.has(key):
		return data[key]
	else:
		return 0	# if stat isn't registered it's neutral

func get_as_string(key : String) -> String:
	var str = key
	var mod = data[key]
	
	if(mod > 0):
		for n in range(mod):
			str += "+"
	else:
		for n in range(-mod):
			str += "-"
			
	
	return str


func string_to_pair(stat_string):
	
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

func print_list():
	var str = ""
	
	#print("print list check")
	#print("data:")
	#print(data)
	
	for key in data:
		str += get_as_string(key)
		str += ", "
	
	#print("print list str:")
	#print(str)
	if str.length() >= 2:
		str.erase(str.length()-2, 2)
	
	return str

func resolve_with(stats : Stats):
	resolve_with_dict(stats.data)

func resolve_with_dict(stat_dict : Dictionary):
	
	for stat in stat_dict:
		
		if data.has(stat):
			data[stat] = data[stat] + stat_dict[stat]
			if data[stat] == 0:
				data.erase(stat)
		else:
			data[stat] = stat_dict[stat]


func resolve_with_strings(stat_strings : Array):
	
	var dict = {}
	for str in stat_strings:
		var pair = string_to_pair(str)
		dict[pair[0]] = dict[pair[1]]
	
	resolve_with_dict(dict)
