extends Node2D

@export var sprite : Sprite2D

var rng : int
var scaled_size = Vector2(128,128)

var direction = Vector2(0.5, 0.7)
var speed = 100.0
var rotation_speed = 1

var textures = [
	"res://assets/art/Monster/PNG Monsters/1.png",
	"res://assets/art/Monster/PNG Monsters/2.png",
	"res://assets/art/Monster/PNG Monsters/3.png",
	"res://assets/art/Monster/PNG Monsters/4.png",
	"res://assets/art/Monster/PNG Monsters/5.png",
	"res://assets/art/Monster/PNG Monsters/6.png",
	"res://assets/art/Monster/PNG Monsters/7.png",
	"res://assets/art/Monster/PNG Monsters/8.png",
	"res://assets/art/Monster/PNG Monsters/9.png",
	"res://assets/art/Monster/PNG Monsters/10.png",
	"res://assets/art/Monster/PNG Monsters/11.png",
	"res://assets/art/Monster/PNG Monsters/12.png",
	"res://assets/art/Monster/PNG Monsters/13.png",
	"res://assets/art/Monster/PNG Monsters/14.png",
	"res://assets/art/Icons/alchemical/without background/1.png",
	"res://assets/art/Icons/alchemical/without background/2.png",
	"res://assets/art/Icons/alchemical/without background/3.png",
	"res://assets/art/Icons/alchemical/without background/4.png",
	"res://assets/art/Icons/alchemical/without background/5.png",
	"res://assets/art/Icons/alchemical/without background/6.png",
	"res://assets/art/Icons/alchemical/without background/7.png",
	"res://assets/art/Icons/alchemical/without background/8.png",
	"res://assets/art/Icons/alchemical/without background/9.png",
	"res://assets/art/Icons/alchemical/without background/10.png",
	"res://assets/art/Icons/alchemical/without background/11.png",
	"res://assets/art/Icons/alchemical/without background/12.png",
	"res://assets/art/Icons/bottles/without background/1.png",
	"res://assets/art/Icons/bottles/without background/2.png",
	"res://assets/art/Icons/bottles/without background/3.png",
	"res://assets/art/Icons/bottles/without background/4.png",
	"res://assets/art/Icons/bottles/without background/5.png",
	"res://assets/art/Icons/bottles/without background/6.png",
	"res://assets/art/Icons/bottles/without background/7.png",
	"res://assets/art/Icons/bottles/without background/8.png",
	"res://assets/art/Icons/crystals/Assets_shadow/Black_crystal1.png",
	"res://assets/art/Icons/crystals/Assets_shadow/Blue_crystal1.png",
	"res://assets/art/Icons/crystals/Assets_shadow/Dark_red_ crystal1.png",
	"res://assets/art/Icons/crystals/Assets_shadow/Pink_crystal1.png",
	"res://assets/art/Icons/herbs/shadow/48.png",
	"res://assets/art/Icons/herbs/shadow/46.png",
	"res://assets/art/Icons/veg/shadow/1.png",
	"res://assets/art/Icons/veg/shadow/37.png",
	"res://assets/art/Icons/veg/shadow/40.png",
	"res://assets/art/Icons/veg/shadow/34.png",
	"res://assets/art/Icons/veg/shadow/20.png",
	"res://assets/art/lukas-monster.png"
]

func _ready():
	rng = randi() % textures.size()
	sprite.texture = load(textures[rng])
	direction = Vector2(randf_range(-1.0,1.0),randf_range(-1.0,1.0))
	rotation_speed = randf_range(-1.0, 1.0)
	
	#scale to size
	scale = scaled_size/sprite.texture.get_size()
	#print(sprite.texture.get_size())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position += direction * delta * speed
	rotation += rotation_speed * delta
