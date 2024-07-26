extends Control

@export var animation_player : AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_minimize_button_toggled(toggled_on):
	if toggled_on:
		animation_player.play("minimize")
	if !toggled_on:
		animation_player.play_backwards("minimize")
