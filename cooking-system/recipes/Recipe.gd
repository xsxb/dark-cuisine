class_name Recipe extends Node

var id : int
var recipe_name : String
var description : String
var base_recipe : int
var derived_recipes : Array[int]


func _init(id_, recipe_name_, description_, base_recipe_):
	id = id_
	recipe_name = recipe_name_
	description = description_
	base_recipe = 0
	derived_recipes = []
