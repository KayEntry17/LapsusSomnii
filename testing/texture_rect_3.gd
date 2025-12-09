extends TextureRect
@export var ratio=1
func _ready() -> void:
	var viewp=get_viewport().size
	material.set_shader_parameter("resolution", viewp/ratio)
	material.get_shader_parameter("screen_texturedither").width=viewp.x/ratio
	material.get_shader_parameter("screen_texturedither").height=viewp.y/ratio
	material.get_shader_parameter("screen_texturedither2").width=viewp.x/ratio
	material.get_shader_parameter("screen_texturedither2").height=viewp.y/ratio
func _process(delta: float) -> void:
	_ready()
		
