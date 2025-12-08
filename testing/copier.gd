extends Camera3D
@export var camcopy: Camera3D
func _process(delta: float) -> void:
	global_transform=camcopy.global_transform
