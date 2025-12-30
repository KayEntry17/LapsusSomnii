extends SubViewport

@export var ratio=1
func _ready() -> void:
	var viewp=get_viewport().size
	size=viewp/ratio
func _process(delta: float) -> void:
	_ready()
		
