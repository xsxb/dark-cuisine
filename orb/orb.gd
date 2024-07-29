extends Sprite2D

@export var text_label : RichTextLabel
@export var fisheye_shader_node : Node2D
@export var curve_texture_sprite : Sprite2D

var time_passed = 0.0


func _physics_process(delta):
	time_passed += delta
	
	#print(curve_texture_sprite.texture.get_curve().sample(second))
	material.set_shader_parameter("direction", Vector2(sin(time_passed)/2,sin(time_passed)/2))
	#print(material.get_shader_parameter("direction"))
	#print(material.get_shader_parameter("speed"))
