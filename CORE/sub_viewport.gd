extends SubViewport

@export var ratio=1
func _ready() -> void:
	var viewp=DisplayServer.window_get_size()
	
	size=viewp/ratio
func _process(delta: float) -> void:
	_ready()
	print(self.size)
		
