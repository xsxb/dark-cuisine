extends Node2D

@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D
var monster_texture_path : String = "res://assets/art/lukas-monster.png"

func _ready():
	animation_player.play("dance")
	sprite.texture = load(monster_texture_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
