extends Node2D

@export var sprite : Sprite2D

var rng : int
var scaled_size = Vector2(128,128)

var direction = Vector2(0.5, 0.7)
var speed = 150.0
var rotation_speed = PI

var textures = [
	"res://assets/art/Monster/PNG Monsters/1.png",
	"res://assets/art/Monster/PNG Monsters/2.png",
	"res://assets/art/Monster/PNG Monsters/3.png",
	"res://assets/art/Monster/PNG Monsters/4.png"
]

func _ready():
	rng = randi() % textures.size()
	sprite.texture = load(textures[rng])
	
	#scale to size
	scale = scaled_size/sprite.texture.get_size()
	#print(sprite.texture.get_size())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position += direction * delta * speed
