extends Inventory

@export var spawn_timer : Timer
@export var spawn_animation_player : AnimationPlayer
@export var spawn_audio_stream : AudioStreamPlayer2D

var spawn_table = [1]
var rng : int


func _ready():
	init()
	
	#Added all items to spawn table for testing
	spawn_table = Global.item_table.keys()
	
	rng = randi()% spawn_table.size()


func _on_spawn_timer_timeout():
	add_item(spawn_table[rng])
	spawn_audio_stream.play()
	spawn_animation_player.play("spawn_animation")
	rng = randi()% spawn_table.size()
