class_name Creature extends Node2D

var type : int
var stats : Stats
var title : String
var description : String

#var creature_name : String # for randomly generated names
var stat_scene = preload("res://cooking-system/Stats.tscn")

#Nick's visual stuff
@export var sprite : Sprite2D
@export var animation_player : AnimationPlayer

var sprite_texture_path : String = "res://assets/art/lukas-monster.png"

# Called when the node enters the scene tree for the first time.
func _init():
	type = -1
	title = "undefined"
	description = "hey look, missingno's cousin showed up"
	stats = stat_scene.instantiate()
	add_child(stats)

func _ready():
	#Nick:
	#sprite_texture_path = stats.data["sprite_path"]
	sprite.texture = load(sprite_texture_path)
	sprite.show()

func print_block():
	var text = "This beautiful abomination is...\n"
	text += title + "!\n"
	text += description + "\n"
	text += "It's...\n"
	text += stats.print_list()
	return text
