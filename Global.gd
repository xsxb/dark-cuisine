extends Node

##Global script
##All predefined data goes in here

enum REQ {EQUAL, GREATER_EQUAL, LESS_EQUAL, GREATER, LESS}
var creature_table = {
	
	1 : {
		"title" : "The General",
		"description" : "Louder than the students upstairs.",
		"requirements" : {"inspire" : [REQ.GREATER, 0], "smash" : [REQ.GREATER, 0], "big" : [REQ.GREATER_EQUAL, 3], "smart" : [REQ.GREATER_EQUAL, 2], "healthy" : [REQ.GREATER_EQUAL, 2], "strong" : [REQ.GREATER_EQUAL, 2], "repulsive" : [REQ.LESS_EQUAL, 0]}
	},
	
	2 : {
		"title" : "The Wizard",
		"description" : "Keeps setting things on fire.",
		"requirements" : {"magic" : [REQ.GREATER, 0], "smart" : [REQ.GREATER_EQUAL, 3]}
	},
	
	3 : {
		"title" : "The Rogue",
		"description" : "Somehow makes cardboard boxes appear.",
		"requirements" : {"healthy" : [REQ.GREATER_EQUAL, 1], "sneak" : [REQ.GREATER, 0], "smart" : [REQ.GREATER_EQUAL, 2],
		"big" : [REQ.LESS_EQUAL, 0], "inspiring" : [REQ.LESS_EQUAL, 0], "repulsive" : [REQ.LESS_EQUAL, 0]}
	},
	
	4 : {
		"title" : "The Barbarian",
		"description" : "Mindlessly swings those big meat fists around.",
		"requirements" : {"healthy" : [REQ.GREATER_EQUAL, 3], "big" : [REQ.GREATER_EQUAL, 2], "smash" : [REQ.GREATER, 0]}
	},
	
	5 : {
		"title" : "The Cannonfodder",
		"description" : "Can walk in a straight line and doesn't smell too awful.",
		"requirements" : {"healthy" : [REQ.GREATER, 0], "repulsive" : [REQ.LESS_EQUAL, 0]}
	},
	
	0 : {
		"title" : "The Blob",
		"description" : "Not useful for anything...",
		"requirements" : {}
	}
}

var item_table = {
	
	
	1 : {
		"name" : "Apple",
		"description" : "Crunchy",
		"types" : ["fruit", "solid"],
		"stats" : {"healthy" : 2, "smart" : 1},
		"icon" : "res://assets/art/Icons/veg/shadow/1.png",
		"max_stack" : 20
	},
	
	2 : {
		"name" : "Pine Cone",
		"description" : "Very crunchy",
		"types" : ["solid", "inedible"],
		"stats" : {"healthy" : -1, "sneak" : -1},
		"icon" : "res://assets/art/Icons/veg/shadow/2.png",
		"max_stack" : 20
	},
	
	3 : {
		"name" : "Pineapple",
		"description" : "Crunchy at first",
		"types" : ["solid", "fruit"],
		"stats" : {"healthy" : 1},
		"icon" : "res://assets/art/Icons/veg/shadow/3.png",
		"max_stack" : 20
	}
	
}







#Item definitions:
var item_table_test = {
	1 : {
	"name" : "Brucola", 
	"icon" : "res://assets/art/Icons/veg/shadow/1.png", 
	"description" : "just a test item",
	"max_stack" : 20,
	"stats" : {"healthy" : 1},
	"types" : ["vegetable", "raw"]

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
	"icon" : "res://assets/art/Icons/veg/shadow/7.png", 
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
	"icon" : "res://assets/art/Icons/veg/shadow/37.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	38 : {
	"name" : "Magic Olives", 
	"icon" : "res://assets/art/Icons/veg/shadow/38.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	39 : {
	"name" : "Hazel V", 
	"icon" : "res://assets/art/Icons/veg/shadow/39.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	40 : {
	"name" : "Prickle X", 
	"icon" : "res://assets/art/Icons/veg/shadow/40.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	41 : {
	"name" : "Smashin Pumpkin", 
	"icon" : "res://assets/art/Icons/veg/shadow/41.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	42 : {
	"name" : "Wonder Y", 
	"icon" : "res://assets/art/Icons/veg/shadow/42.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	43 : {
	"name" : "Super Alga", 
	"icon" : "res://assets/art/Icons/veg/shadow/43.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	44 : {
	"name" : "Rough Barb", 
	"icon" : "res://assets/art/Icons/veg/shadow/44.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	45 : {
	"name" : "Sugar Patota", 
	"icon" : "res://assets/art/Icons/veg/shadow/45.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	46 : {
	"name" : "Celery Vie", 
	"icon" : "res://assets/art/Icons/veg/shadow/46.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	47 : {
	"name" : "Art´i Shock", 
	"icon" : "res://assets/art/Icons/veg/shadow/47.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	48 : {
	"name" : "Killah Beans", 
	"icon" : "res://assets/art/Icons/veg/shadow/48.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	},
	
	49: {
		"name" : "Apple",
		"description" : "Crunchy",
		"types" : ["fruit", "solid"],
		"stats" : {"healthy" : 2, "smart" : 1}
	},
	
	50: {
		"name" : "Pine Cone",
		"description" : "Very crunchy",
		"types" : ["solid", "inedible"],
		"stats" : {"healthy" : -1, "sneak" : -1}
	},
	
	51: {
		"name" : "Pineapple",
		"description" : "Crunchy at first",
		"types" : ["solid", "fruit"],
		"stats" : {"healthy" : 1}
	}


}

var herbs_table = {
	1 : {
	"name" : "Herp A", 
	"icon" : "res://assets/art/Icons/herbs/shadow/1.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	2 : {
	"name" : "Herp B", 
	"icon" : "res://assets/art/Icons/herbs/shadow/2.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	3 : {
	"name" : "Herp C", 
	"icon" : "res://assets/art/Icons/herbs/shadow/3.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	4 : {
	"name" : "Herps A", 
	"icon" : "res://assets/art/Icons/herbs/shadow/4.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	5 : {
	"name" : "Herps B", 
	"icon" : "res://assets/art/Icons/herbs/shadow/5.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	6 : {
	"name" : "Herp D", 
	"icon" : "res://assets/art/Icons/herbs/shadow/6.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	7 : {
	"name" : "Herp E", 
	"icon" : "res://assets/art/Icons/herbs/shadow/7.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	8 : {
	"name" : "Herps C", 
	"icon" : "res://assets/art/Icons/herbs/shadow/8.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	9 : {
	"name" : "Herp F", 
	"icon" : "res://assets/art/Icons/herbs/shadow/9.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	10 : {
	"name" : "Herps D", 
	"icon" : "res://assets/art/Icons/herbs/shadow/10.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	11 : {
	"name" : "Herps E", 
	"icon" : "res://assets/art/Icons/herbs/shadow/11.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	12 : {
	"name" : "Herp G", 
	"icon" : "res://assets/art/Icons/herbs/shadow/12.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	13 : {
	"name" : "Herp H", 
	"icon" : "res://assets/art/Icons/herbs/shadow/13.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	14 : {
	"name" : "Herps F", 
	"icon" : "res://assets/art/Icons/herbs/shadow/14.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	15 : {
	"name" : "Herp I", 
	"icon" : "res://assets/art/Icons/herbs/shadow/15.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	16 : {
	"name" : "Herps G", 
	"icon" : "res://assets/art/Icons/herbs/shadow/16.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	17 : {
	"name" : "Herp J", 
	"icon" : "res://assets/art/Icons/herbs/shadow/17.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	18 : {
	"name" : "Herp K", 
	"icon" : "res://assets/art/Icons/herbs/shadow/18.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	19 : {
	"name" : "Herps H", 
	"icon" : "res://assets/art/Icons/herbs/shadow/19.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	20 : {
	"name" : "Herps I", 
	"icon" : "res://assets/art/Icons/herbs/shadow/20.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	21 : {
	"name" : "Herp L", 
	"icon" : "res://assets/art/Icons/herbs/shadow/21.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	22 : {
	"name" : "Herps J", 
	"icon" : "res://assets/art/Icons/herbs/shadow/22.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	23 : {
	"name" : "Herp M", 
	"icon" : "res://assets/art/Icons/herbs/shadow/23.png", 
	"description" : "just a test item",
	"max_stack" : 20
	
	}
	,
	24 : {
	"name" : "Herp N", 
	"icon" : "res://assets/art/Icons/herbs/shadow/24.png", 
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
