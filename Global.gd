extends Node

##Global script
##All predefined data goes in here

#Item definitions:
var item_table = {
	1 : {
	"name" : "Brucola", 
	"icon" : "res://assets/art/Icons/veg/shadow/1.png", 
	"description" : "just a test item",
	"max_stack" : 20

	}
	,
	2 : {
	"name" : "White Cabbaged", 
	"icon" : "res://assets/art/Icons/veg/shadow/2.png", 
	"description" : "just a test item",
	"max_stack" : 20

	}
	,
	3 : {
	"name" : "Chi Leaves", 
	"icon" : "res://assets/art/Icons/veg/shadow/3.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	4 : {
	"name" : "Cauli Plower", 
	"icon" : "res://assets/art/Icons/veg/shadow/4.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	5 : {
	"name" : "Carrot Bust", 
	"icon" : "res://assets/art/Icons/veg/shadow/5.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	6 : {
	"name" : "Egg Plant", 
	"icon" : "res://assets/art/Icons/veg/shadow/6.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	7 : {
	"name" : "Cucumba Rumba", 
	"icon" : "res://assets/art/Icons/veg/without_shadow/7.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	8 : {
	"name" : "Tomato Nut", 
	"icon" : "res://assets/art/Icons/veg/shadow/8.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	9 : {
	"name" : "Potato Starch", 
	"icon" : "res://assets/art/Icons/veg/shadow/9.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	10 : {
	"name" : "Bloody Beetroot", 
	"icon" : "res://assets/art/Icons/veg/shadow/10.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	11 : {
	"name" : "Reddish Radical", 
	"icon" : "res://assets/art/Icons/veg/shadow/11.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	12 : {
	"name" : "???", 
	"icon" : "res://assets/art/Icons/veg/shadow/12.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	13 : {
	"name" : "Brussels", 
	"icon" : "res://assets/art/Icons/veg/shadow/13.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	14 : {
	"name" : "Sparta Sparagus", 
	"icon" : "res://assets/art/Icons/veg/shadow/13.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	15 : {
	"name" : "On Ion", 
	"icon" : "res://assets/art/Icons/veg/shadow/15.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	16 : {
	"name" : "Green Unions", 
	"icon" : "res://assets/art/Icons/veg/shadow/16.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	17 : {
	"name" : "Garlectics", 
	"icon" : "res://assets/art/Icons/veg/shadow/17.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	18 : {
	"name" : "A-chives", 
	"icon" : "res://assets/art/Icons/veg/shadow/18.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	19 : {
	"name" : "B-chives", 
	"icon" : "res://assets/art/Icons/veg/shadow/19.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	20 : {
	"name" : "Chili Dilliya", 
	"icon" : "res://assets/art/Icons/veg/shadow/20.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	21 : {
	"name" : "Chili Dosmas", 
	"icon" : "res://assets/art/Icons/veg/shadow/21.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	22 : {
	"name" : "Pepper Shepper", 
	"icon" : "res://assets/art/Icons/veg/shadow/22.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	23 : {
	"name" : "Onethumb", 
	"icon" : "res://assets/art/Icons/veg/shadow/23.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	24 : {
	"name" : "Parasley", 
	"icon" : "res://assets/art/Icons/veg/shadow/24.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	25 : {
	"name" : "Vine Leaves", 
	"icon" : "res://assets/art/Icons/veg/shadow/25.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	26 : {
	"name" : "Sunners", 
	"icon" : "res://assets/art/Icons/veg/shadow/26.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	27 : {
	"name" : "Corners", 
	"icon" : "res://assets/art/Icons/veg/shadow/27.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	28 : {
	"name" : "IPTurn", 
	"icon" : "res://assets/art/Icons/veg/shadow/28.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	29 : {
	"name" : "X Garlictec", 
	"icon" : "res://assets/art/Icons/veg/shadow/29.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	30 : {
	"name" : "Cour Gette", 
	"icon" : "res://assets/art/Icons/veg/shadow/30.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	31 : {
	"name" : "Brownveg", 
	"icon" : "res://assets/art/Icons/veg/shadow/31.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	32 : {
	"name" : "Aloha Vera", 
	"icon" : "res://assets/art/Icons/veg/shadow/32.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	33 : {
	"name" : "Mystecell", 
	"icon" : "res://assets/art/Icons/veg/shadow/33.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	34 : {
	"name" : "Tomato Berries", 
	"icon" : "res://assets/art/Icons/veg/shadow/34.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	35 : {
	"name" : "Velvet Beams", 
	"icon" : "res://assets/art/Icons/veg/shadow/35.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	36 : {
	"name" : "Insalato", 
	"icon" : "res://assets/art/Icons/veg/shadow/36.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	37 : {
	"name" : "Sweet Earthapple", 
	"icon" : "res://assets/art/Icons/veg/shadow/37.png ", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	38 : {
	"name" : "Magic Olives", 
	"icon" : "res://assets/art/Icons/veg/shadow/37.png ", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}

}

var monster_table = {}


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
