class_name Creature extends Node2D

var type : int
var stats : Stats
var title : String
var description : String

#var creature_name : String # for randomly generated names
var stat_scene = preload("res://cooking-tester/Stats.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	type = 0
	stats = stat_scene.instantiate()

func print_block():
	var text = "This beautiful abomination is...\n"
	text += title + "!\n"
	text += description + "\n"
	text += "It's...\n"
	text += stats.print_list()
	return text
