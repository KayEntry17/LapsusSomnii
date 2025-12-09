extends TextureRect
func _ready() -> void:
	var viewp=get_viewport().size
	material.set_shader_parameter("resolution", viewp/2)
	material.get_shader_parameter("screen_texturedither").width=viewp.x/2
	material.get_shader_parameter("screen_texturedither").height=viewp.y/2
	material.get_shader_parameter("screen_texturedither2").width=viewp.x/2
	material.get_shader_parameter("screen_texturedither2").height=viewp.y/2
func _process(delta: float) -> void:
	_ready()
		
