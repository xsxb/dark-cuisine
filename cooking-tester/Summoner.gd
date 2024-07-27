extends Node2D

enum REQ {E, GE, LE, G, L}

var creature_table = {
	
	1 : {
		"name" : "Test",
		"description" : "Does strange things sometimes.",
		"requirements" : [["healthy+", REQ.GE],["big+", REQ.L],["big-", REQ.G]]
	}
}

func evolve_creature():
	

func resolve_creature():
